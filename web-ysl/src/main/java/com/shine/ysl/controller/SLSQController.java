package com.shine.ysl.controller;


import com.shine.model.ysl.*;
import com.shine.repository.front.HRepository;
import com.shine.repository.front.SLSQRepository;
import com.shine.repository.front.SQRRepository;
import com.shine.repository.front.XMGXRepository;
import com.shine.service.DictService;
import com.shine.service.SLSQService;
import com.shine.service.SQRService;
import com.shine.service.XmgxService;
import com.shine.util.pub.StringUtil;
import com.shine.util.util.DesUtil;
import com.shine.ysl.constants.DescribableEnum;
import com.shine.ysl.constants.JsonResult;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

@RestController
@RequestMapping("front/slsq")
public class SLSQController {
    @Resource
    private SLSQService slsqService;
    @Resource
    private HRepository hRepository;
    @Resource
    private SLSQRepository slsqRepository;
    @Resource
    private XMGXRepository xmgxRepository;
    @Resource
    private SQRRepository sqrRepository;
    @Resource
    private DictService dictService;
    @Resource
    private SQRService sqrService;
    @Resource
    private XmgxService xmgxService;


    @RequestMapping("delete/{yslywh}")
    public Object deleteSlsq(@PathVariable String yslywh) {
        slsqService.delete(yslywh);
        return true;
    }

    @RequestMapping("saveSlsqDatum")
    public Object saveSlsqDatum(String yslywh, String datumsortName, String datumGuid) {
        SLSQ slsq = slsqRepository.findByYslywh(yslywh);
        slsq.setDatumGuid(datumGuid);
        slsq.setDatumsortName(datumsortName);
        slsqRepository.save(slsq);
        return true;
    }

    /**
     * 获取展示信息
     *
     * @param request
     * @param yslywh
     * @param lcdm
     * @return
     */
    @RequestMapping(value = "getShowMsg", method = RequestMethod.GET)
    @ResponseBody
    public Object getSlsqMsg(HttpServletRequest request, String yslywh, String lcdm) {
        Integer userId = (Integer) request.getSession().getAttribute("userId");
        Map<String, Object> map = new HashMap<>();
        //获取受理申请 start
        SLSQ slsq = slsqRepository.findByYslywh(yslywh);
        if (!slsq.getUser_id().equals(userId)) {
            map.put("ret", 0);
            map.put("msg", "您无权访问该办件");
            return map;
        }
        //获取受理申请 end
        //保存户信息 start
        List<H> houseList = new ArrayList<>();
        List<XMGX> xmgxes = xmgxRepository.findByYslywh(yslywh);
        for (XMGX xmgx : xmgxes) {
            H h = hRepository.findOne(xmgx.getDybsm());
            if (h.getFflb() == null) {
                h.setFflb(0);
            }
            houseList.add(h);
        }
        //保存户信息 end
        //获取权利人 start
        List<SQR> sqrList = sqrRepository.findByYslywh(yslywh);
        for (SQR sqr : sqrList) {
            sqr.setSqrlbmc(dictService.findQlrlb(sqr.getSqrlb()));
            sqr.setSqrlxmc(dictService.findQlrlx(sqr.getSqrlx()));
            sqr.setSqrzjzlmc(dictService.findZjzl(sqr.getSqrzjzl()));
            sqr.setGyfsmc(dictService.findGyfs(sqr.getGyfs()));

            sqr.setSqrmc(DesUtil.decryptBasedDes(sqr.getSqrmc()));
            sqr.setSqrzjh(DesUtil.decryptBasedDes(sqr.getSqrzjh()));
            sqr.setSqryddh(DesUtil.decryptBasedDes(sqr.getSqryddh()));
            sqr.setSqrgddh(DesUtil.decryptBasedDes(sqr.getSqrgddh()));
            sqr.setSqrtxdz(DesUtil.decryptBasedDes(sqr.getSqrtxdz()));
        }
        //获取权利人 end
        slsq.setQdfsmc(dictService.findQdfs(slsq.getQdfs()));
        slsq.setFkfsmc(dictService.findFkfs(slsq.getFkfs()));
        slsq.setDyfsmc(dictService.findDyfs(slsq.getDyfs()));
        slsq.setDklxmc(dictService.findDklx(slsq.getDklx()));
        map.put("ret", 1);
        map.put("sqrs", sqrList);
        map.put("slsq", slsq);
        map.put("houses", houseList);
        return map;
    }

    @RequestMapping("saveSQXXCommon")
    @ResponseBody
    public Object saveSQXXCommon(@RequestBody SQXX param, HttpServletRequest request) {
        Integer userId = (Integer) request.getSession().getAttribute("userId");
        JsonResult jsonResult = new JsonResult(DescribableEnum.SUCCESS);
        String dybsms = param.getDybsms();
        String yslywh = param.getYslywh();
        String lcdm = param.getLcdm();
        String djdl = "";
        if ("2102".equals(lcdm)) {
            djdl = "200";
        } else if ("9401".equals(lcdm)) {
            djdl = "700";
        }
        xmgxService.deleteByYslywh(yslywh);
        for (String dybsm : dybsms.split(",")) {
            H h = hRepository.findOne(Long.valueOf(dybsm));
            XMGX xmgx = new XMGX();
            xmgx.setYslywh(yslywh);
            xmgx.setDybsm(h.getBsm());
            xmgx.setQlbm("FDCQ");
            xmgx.setBdcdyh(h.getBdcdyh());
            xmgx.setGxsj(new Date());
            xmgxRepository.save(xmgx);
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
        slsq.setDjdl(djdl);
        slsq.setDjxl(lcdm);
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

    @RequestMapping("saveSQXX")
    @ResponseBody
    public Object saveSQXX(@RequestBody SQXX param, HttpServletRequest request) {
        Integer userId = (Integer) request.getSession().getAttribute("userId");
        String yslywh = param.getYslywh();
        sqrService.deleteByYslywh(yslywh);
        JsonResult jsonResult = new JsonResult(DescribableEnum.SUCCESS);
        SLSQ slsq = param.getSlsq();
        if (slsq == null) {
            jsonResult.setRet("0");
            jsonResult.setMsg("受理申请信息为空");
            return jsonResult;
        } else {
            if (!slsq.getUser_id().equals(userId)) {
                jsonResult.setRet("0");
                jsonResult.setMsg("您无权访问该办件");
                return jsonResult;
            }
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

        sqrRepository.save(sqrs);
        slsqRepository.save(slsq);
        return jsonResult;
    }

    @RequestMapping("finish")
    @ResponseBody
    public Object finish(String yslywh) {
        SLSQ slsq = slsqRepository.findByYslywh(yslywh);
        slsq.setZt(2);
        slsqRepository.save(slsq);
        return true;
    }
}
