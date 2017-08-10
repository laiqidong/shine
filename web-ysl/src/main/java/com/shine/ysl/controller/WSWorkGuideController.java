package com.shine.ysl.controller;


import com.shine.dao.ManagePageDao;
import com.shine.service.WorkGuideService;
import com.shine.ysl.constants.DescribableEnum;
import com.shine.ysl.constants.JsonResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 */
@Controller
@RequestMapping(value = "/work_guide1")
public class WSWorkGuideController extends ActionCommon {
    @Resource
    private ManagePageDao managePageDao;

    @Resource
    private WorkGuideService workGuideService;

    @RequestMapping("getWorkGuideList/{id}")
    @ResponseBody
    public Object getWorkGuideList(HttpServletRequest request,
                                   HttpServletResponse response, @PathVariable Integer id) {
        JsonResult json = new JsonResult(DescribableEnum.SUCCESS);
        json.addData("content",workGuideService.getWorkGuideId(id));
        return json;
    }


}
