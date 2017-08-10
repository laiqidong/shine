package com.shine.ysl.controller;


import com.shine.model.ysl.Dict;
import com.shine.model.ysl.H;
import com.shine.model.ysl.XMGX;
import com.shine.repository.front.*;
import com.shine.service.DictService;
import com.shine.service.XmgxService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("front/fdzhdjPl")
public class FdzhdjPlController {
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
    private DictService dictService;
    @Resource
    private XmgxService xmgxService;

    @RequestMapping("step3")
    public String step3(Model model, String dybsms, String yslywh, String lcdm) {
        if (StringUtils.isBlank(yslywh)) {
            model.addAttribute("msg", "预受理业务号为空");
            return "error/error";
        }
        List<H> houseList = new ArrayList<>();
        if (StringUtils.isNoneBlank(dybsms)) {
            String[] dybsmArray = dybsms.split(",");
            for (String dybsm : dybsmArray) {
                H h = hRepository.findOne(Long.valueOf(dybsm));
                if (h.getFflb() == null) {
                    h.setFflb(0);
                }
                houseList.add(h);
            }
        }else{
            List<XMGX> xmgxes = xmgxRepository.findByYslywhLike(yslywh);
            for (XMGX xmgx : xmgxes) {
                H h = hRepository.findOne(xmgx.getDybsm());
                if (h.getFflb() == null) {
                    h.setFflb(0);
                }
                if (h.getFflb() != 2) {
                    houseList.add(h);
                }
            }
        }
        model.addAttribute("houseList", houseList);
        return "front/fdzhdj/yzx_step3_pl";
    }

    /**
     * iframe
     * @param model
     * @param dybsms
     * @param yslywh
     * @param lcdm
     * @return
     */
    @RequestMapping("step3Iframe")
    public String step3Iframe(Model model, String dybsms, String yslywh, String lcdm) {
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
        return "front/fdzhdj/yzx_step3_iframe";
    }

    @RequestMapping("yzxStep5")
    public String yzxStep5(String yslywh,Model model) {
        List<String> yslywhs = slsqRepository.findYslywhs(yslywh);
        model.addAttribute("yslywhs", yslywhs);
        return "front/fdzhdj/yzx_step5_pl";
    }

    @RequestMapping("finish")
    @ResponseBody
    public Object finish(String yslywh) {
        /*List<SLSQ> slsqs = slsqRepository.findByYslywhLike(yslywh);
        for (SLSQ slsq : slsqs) {
            slsq.setZt(2);
            slsqRepository.save(slsq);
        }*/
        slsqRepository.updateSlsqZt(yslywh);
        return true;
    }
}
