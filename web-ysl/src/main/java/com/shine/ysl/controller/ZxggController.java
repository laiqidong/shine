package com.shine.ysl.controller;


import com.shine.model.ysl.InfoType;
import com.shine.service.InformationService;
import com.shine.ysl.constants.DescribableEnum;
import com.shine.ysl.constants.JsonResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ffdn on 2017-6-21.
 */
@Controller
@RequestMapping(value = "/zxgg")
public class ZxggController extends ActionCommon {

    @Resource
    private InformationService informationService;

    @RequestMapping("getZxggList/{id}")
    @ResponseBody
    public Object getZxggList(HttpServletRequest request,
                                   HttpServletResponse response, @PathVariable Integer id) {

        JsonResult json = new JsonResult(DescribableEnum.SUCCESS);
        json.addData("t",informationService.getInformationId(id));
//        json.addData("title", informationService.getInformationType(tid));
        return json;
//        return createModel( "/front/zxgg/zxgg").addObject("zxgg",informationService.getInformationId(id)));
    }

    @RequestMapping(value = "list/{id}", method = RequestMethod.GET)
    public Object Page( @PathVariable Integer id) {
        InfoType t = informationService.getInfoTypeType("最新公告");
        int tid = 0;
        if (t != null && t.getId() != null) {
            tid = t.getId();
        }
        return createModel("/front/zxgg/zxgg").addObject("title", informationService.getInformationType(tid)).addObject("t",informationService.getInformationId(id));
    }
}
