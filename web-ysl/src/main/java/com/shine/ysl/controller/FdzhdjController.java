package com.shine.ysl.controller;


import com.shine.dao.QlxxDao;
import com.shine.model.ysl.*;
import com.shine.repository.front.*;
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
 * 房地组合登记控制类
 *
 * @author laiqd 20170428
 */
@Controller
@RequestMapping("front/fdzhdj")
public class FdzhdjController {
    @Resource
    private HRepository hRepository;
    @Resource
    private QLRRepository qlrRepository;
    @Resource
    private SLSQRepository slsqRepository;
    @Resource
    private XMGXRepository xmgxRepository;
    @Resource
    private SQRRepository sqrRepository;
    @Resource
    private PubUserRepository pubUserRepository;
    @Resource
    private XmgxService xmgxService;
    @Resource
    private DictService dictService;
    @Resource
    private SQRService sqrService;
    @Resource
    private QlxxDao qlxxDao;


    @RequestMapping("yzxStep1")
    public String yzxStep1(String yslywh, Model model, HttpServletRequest request) {
        /*PubUser pubUser = (PubUser) session.getAttribute("pubUser");
        Long kfsbsm = pubUser.getKfsbsm();*/
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
        return "front/fdzhdj/yzx_step1";
    }

    @RequestMapping("yzxStep2")
    public String yzxStep2(String yslywh, Model model) {
        if (StringUtils.isBlank(yslywh)) {
            model.addAttribute("msg", "预受理业务号为空");
            return "error/error";
        }
        return "front/fdzhdj/yzx_step2";
    }

    @RequestMapping("yzxStep3")
    public String yzxStep3(Model model, String dybsms, String yslywh, String lcdm) {
        if (StringUtils.isBlank(yslywh)) {
            model.addAttribute("msg", "预受理业务号为空");
            return "error/error";
        }

        List<Dict> qdfss = dictService.findList("QDFS");
        List<Dict> fkfss = dictService.findList("FKFS");
        List<Dict> dyfss = dictService.findList("DYFS");
        model.addAttribute("qdfss", qdfss);
        model.addAttribute("fkfss", fkfss);
        model.addAttribute("dyfss", dyfss);
        return "front/fdzhdj/yzx_step3";
    }

    @RequestMapping("yzxStep4")
    public String yzxStep4() {
        return "front/fdzhdj/yzx_step4";
    }

    @RequestMapping("yzxStep5")
    public String yzxStep5() {
        return "front/fdzhdj/yzx_step5";
    }


    /**
     * 获取并保存受理申请、项目关系、申请人信息
     *
     * @param yslywh
     * @param dybsms
     * @return
     */
    @RequestMapping(value = "getSlsqMsg", method = RequestMethod.GET)
    @ResponseBody
    public Object getSlsqMsg(HttpServletRequest request, String yslywh, String dybsms, String lcdm) {
        Integer userId = (Integer) request.getSession().getAttribute("userId");
        Map<String, Object> map = new HashMap<>();
        //获取受理申请 start
        SLSQ slsq = slsqRepository.findByYslywh(yslywh);
        if (slsq == null) {
            slsq = new SLSQ();
            slsq.setUser_id(userId);
            slsq.setYslywh(yslywh);
            slsq.setDjdl("200");
            slsq.setDjxl(lcdm);
            slsq.setZt(1);
            slsq.setSqsj(new Date());
            slsqRepository.save(slsq);
        } else {
            if (!slsq.getUser_id().equals(userId)) {
                map.put("ret", 0);
                map.put("msg", "您无权访问该办件");
                return map;
            }
        }
        //获取受理申请 end
        boolean xmgxChanged = false;//项目关系是否发生改变
        //保存户信息 start
        List<H> houseList = new ArrayList<>();
        List<XMGX> xmgxes = xmgxRepository.findByYslywh(yslywh);
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
//                    houseList.add(h);
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
//            bsms.add(h.getBsm());
            if (h.getFflb() != 2&& !zfbsms.contains(h.getBsm())) {
                zfbsms.add(h.getBsm());
            }
            houseList.add(h);
        }

        //保存户信息 end
        //获取权利人 start
        List<SQR> sqrList = sqrRepository.findByYslywh(yslywh);
        boolean isGetQlr = false;//判断是否要从数据库获取权利人
        boolean isGetQlxx = false;
        if ("2701".equals(lcdm) || "2705".equals(lcdm)) {
            isGetQlr = true;
            isGetQlxx = true;
        }
        if ((sqrList.size() == 0 || xmgxChanged) && isGetQlr) {
            sqrService.deleteByYslywh(yslywh);
            for (Long dybsm : zfbsms) {
                List<QLR> qlrList = new ArrayList<>();
                if ("2701".equals(lcdm)) {
                    qlrList = qlrRepository.findByDybsmAndQlbm(dybsm, "YGDJ");
                } else if ("2705".equals(lcdm)) {
                    List<QLR> temp1 = qlrRepository.findByDybsmAndQlbmAndDjzl(dybsm, "YGDJ", "1");
                    List<QLR> temp2 = qlrRepository.findByDybsmAndQlbmAndDjzl(dybsm, "YGDJ", "2");
                    qlrList.addAll(temp1);
                    qlrList.addAll(temp2);
                }
                for (QLR qlr : qlrList) {
                    SQR sqr = new SQR();
                    if ("2701".equals(lcdm) || "2705".equals(lcdm)) {
                        if ("9".equals(qlr.getQlrlb())) {
                            qlr.setQlrlb("1");
                        } else if("10".equals(qlr.getQlrlb())){
                            qlr.setQlrlb("2");
                        }
                    }
                    sqr.setYslywh(yslywh);
                    sqr.setSqrlb(qlr.getQlrlb());
                    sqr.setSqrlx(qlr.getQlrlx());
                    sqr.setSqrmc(qlr.getQlrmc());
                    sqr.setSqrzjzl(qlr.getZjzl());
                    sqr.setSqrzjh(qlr.getZjh());
                    sqr.setXb(sqr.getXb());
                    sqr.setSqryddh(qlr.getYddh());
                    sqr.setSqrgddh(qlr.getGddh());
                    sqr.setSqrtxdz(qlr.getDz());
                    sqr.setGyfs(qlr.getGyfs());
                    sqr.setQlbl(qlr.getQlbl());
                    sqr.setQlmj(qlr.getQlmj());
                    if (!sqrContains(sqrList,sqr)) {
                        sqrList.add(sqr);
                    }
                }
            }
        }
        for (SQR sqr : sqrList) {
            sqr.setSqrlbmc(dictService.findQlrlb(sqr.getSqrlb()));
            sqr.setSqrzjzlmc(dictService.findZjzl(sqr.getSqrzjzl()));
            sqr.setGyfsmc(dictService.findGyfs(sqr.getGyfs()));
            sqr.setSqrlxmc(dictService.findQlrlx(sqr.getSqrlx()));
            sqr.setSqrmc(DesUtil.decryptBasedDes(sqr.getSqrmc()));
            sqr.setSqrzjh(DesUtil.decryptBasedDes(sqr.getSqrzjh()));
            sqr.setSqryddh(DesUtil.decryptBasedDes(sqr.getSqryddh()));
            sqr.setSqrgddh(DesUtil.decryptBasedDes(sqr.getSqrgddh()));
            sqr.setSqrtxdz(DesUtil.decryptBasedDes(sqr.getSqrtxdz()));
        }
        //获取权利人 end
        if (isGetQlxx && xmgxChanged) {
            List<Qlxx> qlxxes = qlxxDao.findByDybsm(zfbsms.get(0));
            for (Qlxx qlxx : qlxxes) {
                if ("1".equals(qlxx.getYgdjzl()) || "2".equals(qlxx.getYgdjzl())) {
                    slsq.setJyje(qlxx.getQdjg());
                    slsq.setFkfs(qlxx.getFkfs());
                    slsq.setQdfs(qlxx.getQdfs());
                    slsq.setHtbh(qlxx.getHtbh());
                } else if ("3".equals(qlxx.getYgdjzl()) || "4".equals(qlxx.getYgdjzl())) {
                    slsq.setDyfs(qlxx.getDyfs());
                    slsq.setBdbzqse(qlxx.getQdjg());
                    slsq.setZqqssj(qlxx.getQlqssj());
                    slsq.setZqjssj(qlxx.getQljssj());
                }
            }
        }
        slsq.setQdfsmc(dictService.findQdfs(slsq.getQdfs()));
        slsq.setFkfsmc(dictService.findFkfs(slsq.getFkfs()));
        slsq.setDyfsmc(dictService.findDyfs(slsq.getDyfs()));
        slsqRepository.save(slsq);
        //获取受理申请 end
        map.put("ret", 1);
        map.put("sqrs", sqrList);
        map.put("slsq", slsq);
        map.put("houses", houseList);
        return map;
    }

    @RequestMapping("finish")
    @ResponseBody
    public Object finish(String yslywh) {
        SLSQ slsq = slsqRepository.findByYslywh(yslywh);
        slsq.setZt(2);
        slsqRepository.save(slsq);
        return true;
    }

    @RequestMapping("getXmgxHouses")
    @ResponseBody
    public Object getXmgxHouses(String yslywh) {
        List<H> houseList = new ArrayList<>();
        List<XMGX> xmgxes = xmgxRepository.findByYslywh(yslywh);
        for (XMGX xmgx : xmgxes) {
            H h = hRepository.findOne(xmgx.getDybsm());
            if (h != null) {
                houseList.add(h);
            }
        }
        return houseList;
    }

    private boolean sqrContains(List<SQR> sqrs, SQR temp) {
        for (SQR sqr : sqrs) {
            if (sqr.getSqrmc().equals(temp.getSqrmc()) &&
                    sqr.getSqrlb().equals(temp.getSqrlb()) &&
                    sqr.getSqrzjh().equals(temp.getSqrzjh())) {
                return true;
            }
        }
        return false;
    }

}
