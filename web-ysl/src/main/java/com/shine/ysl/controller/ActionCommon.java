package com.shine.ysl.controller;


import com.shine.dao.ManagePageDao;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;


/**
 * Created by luoxuan on 2017/3/3.
 * Description:
 */
@Component
public class ActionCommon {

    @Resource
    public ManagePageDao managePageDao;
    private static Logger log = LogManager.getLogger(ActionCommon.class);


    @ExceptionHandler
    public String exp(HttpServletRequest request, HttpServletResponse response,
                      Exception ex) {
        Map<String,Object> map = new HashMap<String,Object>();
        try {
//            if (ex instanceof LoginException) {//登录异常
//                map.put("ret", "-1");
//                map.put("msg", ex.getMessage());
//                write(response, JSONObject.fromObject(map).toString());
//                return null;
//            }
            map.put("ret", "0");
            map.put("msg", "系统异常!");
            map.put("exception",ex.getMessage());
            //非自定义异常转存去log文件,提供调试依据
//            ex.printStackTrace();
//            write(response, JSONObject.fromObject(map).toString());
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ex.printStackTrace(new PrintStream(baos));
            String exception = baos.toString();
            log.error("捕获到非自定义异常:"+ex.getClass().getName()+",msg:"+ex.getMessage()+"\r\n"+exception);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("msg","问题修复中......请稍后再试");
        return "/error/error";
    }






    public ModelAndView createModel(String view){
        return new ModelAndView(view);
    }
    public ModelAndView createIndexModel(String view, HttpServletRequest request){
        return new ModelAndView(view).addObject("staffname",request.getSession().getAttribute("staffname").toString())
                .addObject("userType",request.getSession().getAttribute("userType"));
    }


}
