package com.shine.ysl.controller;


import com.shine.dao.YshtDao;
import com.shine.model.ysl.*;
import com.shine.repository.front.*;
import com.shine.repository.manage.KfsRepository;
import com.shine.service.DictService;
import com.shine.service.SQRService;
import com.shine.service.XmgxService;
import com.shine.util.util.DesUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 房地登记
 * laiqd 201708007
 */
@Controller
@RequestMapping("front/fddj")
public class FddjController {
    @Resource
    private PubUserRepository pubUserRepository;
    @Resource
    private DictService dictService;
    @Resource
    private XMGXRepository xmgxRepository;
    @Resource
    private SQRRepository sqrRepository;
    @Resource
    private SLSQRepository slsqRepository;
    @Resource
    private XmgxService xmgxService;
    @Resource
    private HRepository hRepository;
    @Resource
    private SQRService sqrService;
    @Resource
    private YshtDao yshtDao;
    @Resource
    private KfsRepository kfsRepository;

    /**
     * 首次登记 step1
     */
    @RequestMapping("scdjStep1")
    public String scdjStep1(String yslywh, Model model, HttpServletRequest request) {
        Integer userId = (Integer) request.getSession().getAttribute("userId");
        PubUser pubUser = pubUserRepository.findOne(userId);
        Long kfsbsm = pubUser.getKfsbsm();
        if (kfsbsm == null || kfsbsm == 0) {
            model.addAttribute("msg", "很抱歉，您不是开发商，无法办理该业务");
            return "error/error";
        }
        model.addAttribute("kfsbsm", kfsbsm);
        if (StringUtils.isBlank(yslywh)) {
            model.addAttribute("msg", "预受理业务号为空");
            return "error/error";
        }
        return "front/fddj/scdj_step1";
    }

    @RequestMapping("scdjStep2")
    public String scdjStep2(String yslywh, Model model) {
        if (StringUtils.isBlank(yslywh)) {
            model.addAttribute("msg", "预受理业务号为空");
            return "error/error";
        }
        return "front/fddj/scdj_step2";
    }

    @RequestMapping("scdjStep3")
    public String yzxStep3(Model model, String dybsms, String yslywh, String lcdm) {
        if (StringUtils.isBlank(yslywh)) {
            model.addAttribute("msg", "预受理业务号为空");
            return "error/error";
        }
        List<Dict> qlrlbs = dictService.findList("QLRLB");
        List<Dict> qlrlxs = dictService.findList("QLRLX");
        List<Dict> zjzls = dictService.findList("ZJZL");
        List<Dict> gyfss = dictService.findList("GYFS");
        List<Dict> qdfss = dictService.findList("QDFS");
        List<Dict> fkfss = dictService.findList("FKFS");
        List<Dict> dyfss = dictService.findList("DYFS");
        List<Dict> dklxs = dictService.findList("DKLX");
        model.addAttribute("qlrlbs", qlrlbs);
        model.addAttribute("qlrlxs", qlrlxs);
        model.addAttribute("zjzls", zjzls);
        model.addAttribute("gyfss", gyfss);
        model.addAttribute("qdfss", qdfss);
        model.addAttribute("fkfss", fkfss);
        model.addAttribute("dyfss", dyfss);
        model.addAttribute("dklxs", dklxs);
        model.addAttribute("qdfss", qdfss);
        model.addAttribute("fkfss", fkfss);
        model.addAttribute("dyfss", dyfss);
        return "front/fddj/scdj_step3";
    }

    @RequestMapping(value = "getSlsqMsg", method = RequestMethod.GET)
    @ResponseBody
    public Object getSlsqMsg(HttpServletRequest request, String yslywh, String dybsms, String lcdm) {
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
        boolean xmgxChanged = false;//项目关系是否发生改变
        List<XMGX> xmgxes = xmgxRepository.findByYslywh(yslywh);
        List<H> houseList = new ArrayList<>();
        List<Long> zfbsms = new ArrayList<>();
        if (StringUtils.isNoneBlank(dybsms)) {
            String[] dybsmArray = dybsms.split(",");
            int flag = 0;
            for (XMGX xmgx : xmgxes) {
                if (dybsms.contains(String.valueOf(xmgx.getDybsm()))) {
                    flag++;
                }
            }
            if (flag != xmgxes.size() || xmgxes.size() == 0) {
                xmgxChanged = true;
                xmgxService.deleteByYslywh(yslywh);
                for (String dybsm : dybsmArray) {
                    H h = hRepository.findOne(Long.valueOf(dybsm));
                    if (h.getFflb() == null) {
                        h.setFflb(0);
                    }
                    XMGX xmgx = new XMGX();
                    xmgx.setYslywh(yslywh);
                    xmgx.setDybsm(h.getBsm());
                    xmgx.setBdcdyh(h.getBdcdyh());
                    xmgx.setGxsj(new Date());
                    xmgxRepository.save(xmgx);
                }
            }
        }
        xmgxes = xmgxRepository.findByYslywh(yslywh);
        for (XMGX xmgx : xmgxes) {
            H h = hRepository.findOne(xmgx.getDybsm());
            if (h.getFflb() == null) {
                h.setFflb(0);
            }
            if (h.getFflb() != 2 && !zfbsms.contains(h.getBsm())) {
                zfbsms.add(h.getBsm());
            }
            houseList.add(h);
        }
        List<SQR> sqrList = sqrRepository.findByYslywh(yslywh);
        if (xmgxChanged || sqrList.size() == 0) {
            sqrService.deleteByYslywh(yslywh);
            sqrList = sqrRepository.findByYslywh(yslywh);
            List<Ysht> yshts = yshtDao.findByDybsm(zfbsms.get(0).toString());

        } else {
            for (SQR sqr : sqrList) {
                sqr.setSqrmc(DesUtil.decryptBasedDes(sqr.getSqrmc()));
                sqr.setSqrzjh(DesUtil.decryptBasedDes(sqr.getSqrzjh()));
                sqr.setSqryddh(DesUtil.decryptBasedDes(sqr.getSqryddh()));
                sqr.setSqrgddh(DesUtil.decryptBasedDes(sqr.getSqrgddh()));
                sqr.setSqrtxdz(DesUtil.decryptBasedDes(sqr.getSqrtxdz()));
            }
        }
        map.put("ret", 1);
        map.put("houseList", houseList);
        map.put("sqrs", sqrList);
        map.put("slsq", slsq);
        return map;
    }
}
