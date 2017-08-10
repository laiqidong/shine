package com.shine.ysl.controller;


import com.shine.dao.RegisterDao;
import com.shine.model.ysl.*;
import com.shine.repository.front.HRepository;
import com.shine.repository.front.SLSQRepository;
import com.shine.repository.front.SQRRepository;
import com.shine.repository.front.XMGXRepository;
import com.shine.service.DictService;
import com.shine.service.XmgxService;
import com.shine.util.pub.StringUtil;
import com.shine.util.util.DesUtil;
import com.shine.ysl.constants.DescribableEnum;
import com.shine.ysl.constants.JsonResult;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 房屋买卖控制类
 */
@Controller
@RequestMapping("front/fwmm")
public class FWMMController {
    @Resource
    private HRepository hRepository;
    @Resource
    private RegisterDao registerDao;
    @Resource
    private SQRRepository sqrRepository;
    @Resource
    private SLSQRepository slsqRepository;
    @Resource
    private XMGXRepository xmgxRepository;
    @Resource
    private XmgxService xmgxService;
    @Resource
    private DictService dictService;

    @RequestMapping("step1")
    public String step1(Model model) {
//        List<Dict> dyfss = dictService.findList("DYFS");
        List<Dict> qlrlbs = dictService.findList("QLRLB");
        List<Dict> qlrlxs = dictService.findList("QLRLX");
        List<Dict> zjzls = dictService.findList("ZJZL");
        List<Dict> gyfss = dictService.findList("GYFS");
        List<Dict> qdfss = dictService.findList("QDFS");
        List<Dict> fkfss = dictService.findList("FKFS");
        model.addAttribute("qlrlbs",qlrlbs);
        model.addAttribute("qlrlxs",qlrlxs);
        model.addAttribute("zjzls",zjzls);
        model.addAttribute("gyfss",gyfss);
        model.addAttribute("qdfss",qdfss);
        model.addAttribute("fkfss",fkfss);
        return "front/fwmm/step1";
    }

    @RequestMapping("step2")
    public String step2() {
        return "front/fwmm/step2";
    }

    @RequestMapping("step3")
    public String step3() {
        return "front/fwmm/step3";
    }

    @RequestMapping("checkBdcdyh")
    @ResponseBody
    public Object checkBdcdyh(String bdcdyh) {
        Map<String, Object> map = new HashMap<>();
        H h = hRepository.findByBdcdyh(bdcdyh);
        if (h == null) {
            map.put("ret", 0);
            map.put("msg", "很抱歉，未找到单元");
            return map;
        } else {
            Map<String, Object> house = registerDao.getHouseDetail(String.valueOf(h.getBsm()));
            if (Long.valueOf(String.valueOf(house.get("CFZT"))) > 0) {
                map.put("ret", 0);
                map.put("msg", "很抱歉，该单元处于查封状态");
                return map;
            }
            if (h.getFflb() != null && h.getFflb() == 2) {
                map.put("ret", 0);
                map.put("msg", "很抱歉，该单元是辅房，请选择主房");
                return map;
            }
        }
        map.put("bdcdy", h);
        map.put("ret", 1);
        return map;
    }

    @RequestMapping(value = "getSlsqMsg", method = RequestMethod.GET)
    @ResponseBody
    public Object getSlsqMsg(HttpServletRequest request, String yslywh) {
        Integer userId = (Integer) request.getSession().getAttribute("userId");
        Map<String, Object> map = new HashMap<>();
        SLSQ slsq = slsqRepository.findByYslywh(yslywh);
        if (slsq == null) {
            slsq = new SLSQ();
        } else {
            if (!slsq.getUser_id().equals(userId)) {
                map.put("ret", 0);
                map.put("msg", "您无权访问该办件");
                return map;
            }
        }
        List<SQR> sqrList = sqrRepository.findByYslywh(yslywh);
        for (SQR sqr : sqrList) {
            sqr.setSqrmc(DesUtil.decryptBasedDes(sqr.getSqrmc()));
            sqr.setSqrzjh(DesUtil.decryptBasedDes(sqr.getSqrzjh()));
            sqr.setSqryddh(DesUtil.decryptBasedDes(sqr.getSqryddh()));
            sqr.setSqrgddh(DesUtil.decryptBasedDes(sqr.getSqrgddh()));
            sqr.setSqrtxdz(DesUtil.decryptBasedDes(sqr.getSqrtxdz()));
        }
        xmgxRepository.findByYslywh(yslywh);
        List<H> houseList = registerDao.getHousesByYslywh(yslywh);
        map.put("ret", 1);
        map.put("houseList", houseList);
        map.put("sqrs", sqrList);
        map.put("slsq", slsq);
        return map;
    }

    @RequestMapping("saveSQXX")
    @ResponseBody
    public Object saveSQXX(@RequestBody SQXX param, HttpServletRequest request) {
        Integer userId = (Integer) request.getSession().getAttribute("userId");
        JsonResult jsonResult = new JsonResult(DescribableEnum.SUCCESS);
        String dybsms = param.getDybsms();
        String yslywh = param.getYslywh();
        xmgxService.deleteByYslywh(yslywh);
        for (String dybsm : dybsms.split(",")) {
            H h = hRepository.findOne(Long.valueOf(dybsm));
//            if (h.getFflb() != 2) {//排除辅房
                XMGX xmgx = new XMGX();
                xmgx.setYslywh(yslywh);
                xmgx.setDybsm(h.getBsm());
                xmgx.setQlbm("FDCQ");
                xmgx.setBdcdyh(h.getBdcdyh());
                xmgx.setGxsj(new Date());
                xmgxRepository.save(xmgx);
//            }
        }
        List<SQR> sqrs = param.getSqrs();
        for (SQR sqr : sqrs) {
            if (StringUtils.isNoneBlank(sqr.getSqrmc())) {
                sqr.setSqrmc(DesUtil.encryptBasedDes(sqr.getSqrmc()));
            } else {
                jsonResult.setRet("0");
                jsonResult.setMsg("申请人名称不能为空");
                return jsonResult;
            }
            if (StringUtil.isBlank(sqr.getSqrzjh())) {
                sqr.setSqrzjh(DesUtil.encryptBasedDes(sqr.getSqrzjh()));
            } else {
                jsonResult.setRet("0");
                jsonResult.setMsg("申请人证件号不能为空");
                return jsonResult;
            }
            if (StringUtil.isBlank(sqr.getSqryddh())) {
                sqr.setSqryddh(DesUtil.encryptBasedDes(sqr.getSqryddh()));
            }
            if (StringUtil.isBlank(sqr.getSqrgddh())) {
                sqr.setSqrgddh(DesUtil.encryptBasedDes(sqr.getSqrgddh()));
            }
            if (StringUtil.isBlank(sqr.getSqrtxdz())) {
                sqr.setSqrtxdz(DesUtil.encryptBasedDes(sqr.getSqrtxdz()));
            }
            sqr.setYslywh(yslywh);
        }
        SLSQ slsq = param.getSlsq();
        slsq.setUser_id(userId);
        slsq.setYslywh(yslywh);
        slsq.setDjdl("200");
        slsq.setDjxl(param.getLcdm());
        slsq.setZt(1);
        slsq.setSqsj(new Date());
        if (slsq == null) {
            jsonResult.setRet("0");
            jsonResult.setMsg("受理申请信息为空");
            return jsonResult;
        }
        sqrRepository.save(sqrs);
        slsqRepository.save(slsq);
        return jsonResult;
    }
}
