package com.shine.ysl.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;import com.shine.dao.SLSQDao;
import com.shine.model.ysl.SLSQ;
import com.shine.model.ysl.SQR;
import com.shine.model.ysl.XMGX;
import com.shine.repository.front.SLSQRepository;
import com.shine.repository.front.SQRRepository;
import com.shine.repository.front.XMGXRepository;
import com.shine.service.DictService;
import com.shine.util.util.DesUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 办件进度
 */
@Controller
@RequestMapping("front/bjjd")
public class BjjdFrontController {
    @Resource
    private SLSQDao slsqDao;
    @Resource
    private SQRRepository sqrRepository;
    @Resource
    private DictService dictService;
    @Resource
    private SLSQRepository slsqRepository;
    @Resource
    private XMGXRepository xmgxRepository;

    @RequestMapping("getSlsqList")
    @ResponseBody
    public PageInfo getSlsqList(@RequestParam(required = true, defaultValue = "1") Integer page,
                                @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                                SLSQ slsq, HttpServletRequest request) {
        Integer userId = (Integer) request.getSession().getAttribute("userId");
        slsq.setUser_id(userId);
        PageHelper.startPage(page, pageSize);
        List<SLSQ> list = slsqDao.getSlsqList(slsq);
        for (SLSQ s : list) {
            List<SQR> sqrs = sqrRepository.findByYslywh(s.getYslywh());
            StringBuilder qlrmc = new StringBuilder();
            for (SQR sqr : sqrs) {
                if ("1".equals(sqr.getSqrlb()) || "7".equals(sqr.getSqrlb())
                        || "9".equals(sqr.getSqrlb()) || "14".equals(sqr.getSqrlb())
                        || "15".equals(sqr.getSqrlb())) {
                    String name = DesUtil.decryptBasedDes(sqr.getSqrmc());
                    qlrmc.append(name).append("、");
                }
            }
            if (qlrmc.length() > 0) {
                qlrmc.deleteCharAt(qlrmc.length() - 1);
            }
            s.setQlrs(qlrmc.toString());
        }
        return new PageInfo<>(list);
    }

    @RequestMapping("show")
    public String yzxShow(Model model, String dybsms, String yslywh, String lcdm) {
        if (StringUtils.isBlank(yslywh)) {
            return "error/error";
        }
        String title = dictService.findLcdm(lcdm);
        if (StringUtils.isNotBlank(title)) {
            model.addAttribute("title", title);
        } else {
            return "error/error";
        }
        return "front/bj/show";
    }

    @RequestMapping("redo")
    @ResponseBody
    public Object redo(String yslywh,String newywh) {
        SLSQ slsq = slsqRepository.findByYslywh(yslywh);
        slsq.setNewywh(newywh);
        slsqRepository.save(slsq);
        if (slsq.getZt() == 5) {
            slsq.setId(null);
            slsq.setZt(1);
            slsq.setYslywh(newywh);
            slsq.setNewywh(null);
            slsq.setDjbslyj("");
            slsqRepository.save(slsq);
            List<XMGX> xmgxes = xmgxRepository.findByYslywh(yslywh);
            for (XMGX xmgx : xmgxes) {
                xmgx.setBsm(null);
                xmgx.setYslywh(newywh);
                xmgxRepository.save(xmgx);
            }
            List<SQR> sqrs = sqrRepository.findByYslywh(yslywh);
            for (SQR sqr : sqrs) {
                sqr.setBsm(null);
                sqr.setYslywh(newywh);
                sqrRepository.save(sqr);
            }
        } else {
            return false;
        }
        return true;
    }
}
