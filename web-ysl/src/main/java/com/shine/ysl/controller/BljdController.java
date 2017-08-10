package com.shine.ysl.controller;


import com.shine.ysl.constants.DescribableEnum;
import com.shine.ysl.constants.JsonResult;
import com.shine.model.lchj.Bljd;
import com.shine.model.message.Sms;
import com.shine.service.MessageService;
import com.shine.service.PubUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by luoxuan on 2017/6/15.
 * Description:查询内网办件进度（数据源同微信）
 */
@Controller
@RequestMapping("/bljd")
public class BljdController extends ActionCommon {

    @Resource
    private MessageService messageService;
    @Resource
    private PubUserService pubUserService;
    /**
     * 办理进度-验证短信
     *
     * @param sjhm
     * @param sfzh
     * @param code
     * @return
     */
    @RequestMapping(value = "/valSmsCode", method = RequestMethod.GET)
    @ResponseBody
    public Object valSmsCode(HttpServletRequest request, String sfzh, String sjhm, String code) {
        Sms t = messageService.getSmsByMobile(sjhm);
        if (t == null || !code.equals(t.getCode())) {
            return new JsonResult(DescribableEnum.SMS_CODE_ERROR);
        }
        request.getSession().setAttribute("bljd_sfzh", sfzh);
        request.getSession().setAttribute("bljd_sjhm", sjhm);
        return new JsonResult(DescribableEnum.SUCCESS);
    }

    /**
     *  办理进度-列表
     * @param request
     * @return
     */
    @RequestMapping(value = "/bljd", method = RequestMethod.GET)
    public ModelAndView bljd_sfzh(HttpServletRequest request) {
        String sjhm = request.getSession(false).getAttribute("bljd_sjhm").toString();
        String sfzh = request.getSession(false).getAttribute("bljd_sfzh").toString();
        List<Bljd> bljdList = pubUserService.getBljdList(sjhm,sfzh);
        return createModel("/ggfw/bljd2").addObject("bljdList", bljdList);
    }

    /**
     *  办理进度-详情
     * @param ywh
     * @param sfzh
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/bljd_detail",method = RequestMethod.POST)
    public ModelAndView bljd_detail(String ywh, String sfzh) throws UnsupportedEncodingException {
        Bljd bljd = pubUserService.getBljd(sfzh, ywh);
        if (bljd.getDjlx().length() > 18) {
            String djlx = bljd.getDjlx().substring(bljd.getDjlx().indexOf("-") + 1, bljd.getDjlx().length());
            bljd.setDjlx(djlx);
        }
        System.out.println(bljd.toString());
        return createModel("/ggfw/bljd_detail").addObject("bljd", bljd);
    }
}
