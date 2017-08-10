package com.shine.ysl.controller;

import com.shine.model.message.Sms;
import com.shine.model.ysl.PubUser;
import com.shine.model.ysl.PubUserLoginLog;
import com.shine.service.DictService;
import com.shine.service.MessageService;
import com.shine.service.PubUserService;
import com.shine.util.pub.MD5;
import com.shine.util.pub.PubUtil;
import com.shine.util.util.ConfigConstants;
import com.shine.util.util.SmsUtil;
import com.shine.ysl.constants.DescribableEnum;
import com.shine.ysl.constants.JsonResult;
import com.shine.ysl.constants.SystemConstants;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.text.MessageFormat;
import java.util.Date;
import java.util.Random;

/**
 * Created by luoxuan on 2017/1/13.
 * Description:用户登录
 */
@Controller
@RequestMapping("/")
public class PubUserController extends ActionCommon {

    @Resource
    private PubUserService pubUserService;
    @Resource
    private MessageService messageService;
    @Resource
    private DictService dictService;

    /**
     * 接口平台公众用户登录接口。成功返回token
     *
     * @param
     * @return the object
     */
    @RequestMapping(value = "/userLogin", method = RequestMethod.POST)
    public Object userLogin(HttpServletRequest request, String account, String password) {
        JsonResult json = new JsonResult(DescribableEnum.SUCCESS);
        PubUser t = pubUserService.getUserByAccount(account);
        if (t != null && t.getPassword().equals(MD5.getInstance().getMD5(password))) {
            Date date = new Date();
            t.setActionTime(date);
            t.setToken(MD5.getInstance().getMD5(t.getAccount() + date.getTime() + SystemConstants.ZSKJ));
            pubUserService.savePubUser(t);
            HttpSession session = request.getSession();
            session.setAttribute("user", t);
            session.setAttribute("token", t.getToken());
            session.setAttribute("userId", t.getId());
            session.setAttribute("staffname", t.getName());
            session.setAttribute("userType", t.getType());
            session.setAttribute("account", t.getAccount());
            PubUserLoginLog loginLog = new PubUserLoginLog(t.getId(), date, request.getRemoteAddr(), "", t.getToken());
            pubUserService.savePubUserLoginLog(loginLog);
            session.setAttribute("lastLoginTime", PubUtil.dateTimeToString(pubUserService.getLastLogin(t.getId()).getLoginTime()));
            session.setAttribute("qxdm",dictService.findQxdm());
            Object url = request.getSession(false).getAttribute("servletPath");
            if (url != null && !"front/logout".equals(url)) {
                return createModel("redirect:" + url.toString());
            }
            return createModel("redirect:index");
        } else {
            request.getSession().setAttribute("error", "账号或密码有误,请重新输入!");
            return createModel("redirect:front/loginPage");
        }
    }

    /**
     * 获取用户对象，以判断是否存在
     *
     * @param account
     * @return
     */
    @RequestMapping(value = "getUser", method = RequestMethod.GET)
    @ResponseBody
    public Object getUser(String account) {
        PubUser pubUser = pubUserService.getUserByAccountForReg(account);
        if (pubUser == null) {
            return new JsonResult(DescribableEnum.FAIL);
        }
        return new JsonResult(DescribableEnum.SUCCESS);
    }

    /**
     * 注册公众用户
     *
     * @param t
     * @return
     */
    @RequestMapping(value = "/regPubUser", method = RequestMethod.POST)
    @ResponseBody
    public Object regPubUser(PubUser t,String code) {
        JsonResult json = new JsonResult(DescribableEnum.SUCCESS);
        Sms sms =messageService.getSmsByMobile(t.getAccount());
       // 验证验证码
        if(sms==null||!code.equals(sms.getCode())){
            return new JsonResult(DescribableEnum.SMS_CODE_ERROR);
        }
        PubUser pubUser = pubUserService.getUserByAccountForReg(t.getAccount());
        if (pubUser == null) {
            t.setPassword(MD5.getInstance().getMD5(t.getPassword()));
            t.setCreateTime(new Date());
            t.setStatus(1);
            t.setType(1);
//            t.setToken(MD5.getInstance().getMD5(t.getName() + t.getCreateTime().getTime() + SystemConstants.ZSKJ));
            pubUserService.savePubUser(t);
        } else {
            return new JsonResult(DescribableEnum.USER_IS_REG);
        }
        return json;
    }


    /**
     * 账户设置
     *
     * @return
     */
    @RequestMapping("front/user/account_set")
    public Object account_set(HttpServletRequest request) {
        String token = request.getSession(false).getAttribute("token").toString();
        PubUser t = pubUserService.getPubUserByToken(token);
        return createModel("front/user/index-account-set").addObject("user", t);
    }

    /**
     * 更新密码
     *
     * @param request
     * @param password_old
     * @param password_new
     * @return
     */
    @RequestMapping(value = "front/user/mergePassword", method = RequestMethod.POST)
    @ResponseBody
    public Object mergePassword(HttpServletRequest request, String password_old, String password_new) {
        JsonResult json = new JsonResult(DescribableEnum.SUCCESS);
        String token = request.getSession(false).getAttribute("token").toString();
        PubUser pubUser = pubUserService.getPubUserByToken(token);
        if (pubUser.getPassword().equals(MD5.getInstance().getMD5(password_old))) {
            pubUser.setPassword(MD5.getInstance().getMD5(password_new));
            pubUserService.savePubUser(pubUser);
        } else {
            return new JsonResult(DescribableEnum.OLD_PASSWORD_ERROR);
        }
        return json;
    }

    /**
     * 忘记密码
     */
    @RequestMapping("forgetPassword")
    public Object forgetPassword(HttpServletRequest request) {
        return createModel("front/user/change-pws");
    }


    /**
     * 重置密码-验证账号
     *
     * @param account
     * @return
     */
    @RequestMapping(value = "forgetPassword/checkUser", method = RequestMethod.GET)
    @ResponseBody
    public Object checkUser(HttpServletRequest request, String account) {
        PubUser pubUser = pubUserService.getUserByAccount(account);
        if (pubUser == null) {
            return new JsonResult(DescribableEnum.USER_IS_EXIST);
        }
//        request.getSession().setAttribute("userId",pubUser.getId());
        request.getSession().setAttribute("account", account);
        return new JsonResult(DescribableEnum.SUCCESS);
    }

    /**
     * 重置密码-验证身份证
     *
     * @param account
     * @return
     */
    @RequestMapping(value = "forgetPassword/checkIdCard", method = RequestMethod.GET)
    @ResponseBody
    public Object checkIdCard(HttpServletRequest request, String account, String idCard) {
        PubUser pubUser = pubUserService.getUserByAccount(request.getSession(false).getAttribute("account").toString());
        if (pubUser == null || !idCard.equals(pubUser.getIdCard())) {
            return new JsonResult(DescribableEnum.FAIL);
        }
        request.getSession(false).setAttribute("idCard", idCard);
        return new JsonResult(DescribableEnum.SUCCESS);
    }

    /**
     * 重置密码-验证短信
     *
     * @param account
     * @return
     */
    @RequestMapping(value = "forgetPassword/valSmsCode", method = RequestMethod.GET)
    @ResponseBody
    public Object valSmsCode(HttpServletRequest request, String account, String code) {
        Sms t =messageService.getSmsByMobile(account);
        if(t==null||!code.equals(t.getCode())){
            return new JsonResult(DescribableEnum.SMS_CODE_ERROR);
        }
        return new JsonResult(DescribableEnum.SUCCESS);
    }

    /**
     * 重置密码-重置
     *
     * @param newPwd
     * @return
     */
    @RequestMapping(value = "forgetPassword/resetPassword", method = RequestMethod.POST)
    @ResponseBody
    public Object resetPassword(HttpServletRequest request, String newPwd) {
        String account=request.getSession(false).getAttribute("account").toString();
        PubUser pubUser = pubUserService.getUserByAccount(account);
        if (pubUser == null || !request.getSession(false).getAttribute("idCard").toString().equals(pubUser.getIdCard())) {
            return new JsonResult(DescribableEnum.FAIL);
        } else {
            pubUser.setPassword(MD5.getInstance().getMD5(newPwd));
            pubUserService.savePubUser(pubUser);
        }
        return new JsonResult(DescribableEnum.SUCCESS);
    }

    /**
     * 验证输入的图片验证码
     *
     * @param code
     * @return
     */
    @RequestMapping(value = "valCode", method = RequestMethod.GET)
    @ResponseBody
    public Object valCode(HttpServletRequest request, String code) {
        if (code.trim().toUpperCase().equals(request.getSession(false).getAttribute("code")))
            return new JsonResult(DescribableEnum.SUCCESS);
        else
            return new JsonResult(DescribableEnum.FAIL);
    }

    /**
     * 发送短信验证码
     *
     * @param account
     * @return
     */
    @RequestMapping(value = "sendSmsCode", method = RequestMethod.GET)
    @ResponseBody
    public Object sendSmsCode(String account) {
        if(StringUtils.isBlank(account)){
            return new JsonResult(DescribableEnum.PARAMES_ERROR);
        }
        JsonResult json = new JsonResult(DescribableEnum.SUCCESS);
        Date date = new Date();
        Sms t = messageService.getSmsByMobile(account);
        //判断距上次发送短信时间，少于一分钟则不发送。
        if (t != null && t.getEffcetiveTime().after(new Date(date.getTime() + 1000 * 60 * 1))) {
            return new JsonResult(DescribableEnum.SMS_CODE_IS_SEND);
        }
        String code = ((int) (Math.random() * (9000)) + 1000) + "";
        try {
            String content = MessageFormat.format(ConfigConstants.getTextTemplate("sms.yzm.reg"), code);
            String result = SmsUtil.sendSms(account, content);//发送短信
            t = new Sms(account, content, date, 1, date, 2, code, new Date(date.getTime() + 1000 * 60 * 2), result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        messageService.saveSms(t);
//        json.addData("code", code);
        return json;
    }


    char[] codeSequence = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S',
            'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9'};

    /**
     * @param request
     * @param response
     * @param width     定义图片的width
     * @param height    定义图片的height
     * @param codeCount 定义图片上显示验证码的个数
     * @throws Exception
     */
    @RequestMapping("/imgcode")
    public void imgcode(HttpServletRequest request, HttpServletResponse response, @RequestParam(required = false, defaultValue = "70") Integer width,
                        @RequestParam(required = false, defaultValue = "22") Integer height, @RequestParam(required = false, defaultValue = "4") Integer codeCount) throws Exception {
        // 定义图像buffer
        int xx = 13;
        int fontHeight = 18;
        int codeY = 19;
        response.setHeader("Cache-Control", "no-cache");
        BufferedImage buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        // Graphics2D gd = buffImg.createGraphics();
        // Graphics2D gd = (Graphics2D) buffImg.getGraphics();
        Graphics gd = buffImg.getGraphics();
        // 创建一个随机数生成器类
        Random random = new Random();
        // 将图像填充为白色
        gd.setColor(Color.WHITE);
        gd.fillRect(0, 0, width, height);
        // 创建字体，字体的大小应该根据图片的高度来定。
        Font font = new Font("Fixedsys", Font.PLAIN, fontHeight);
        // 设置字体。
        gd.setFont(font);
        // 画边框。
        gd.setColor(new Color(43, 133, 191));
        gd.drawRect(0, 0, width - 1, height - 1);
        // 随机产生10条干扰线，使图象中的认证码不易被其它程序探测到。
        gd.setColor(new Color(43, 133, 191));
//        for (int i = 0; i < 10; i++) {
        for (int i = 0; i < 6; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int xl = random.nextInt(10);
            int yl = random.nextInt(10);
            gd.drawLine(x, y, x + xl, y + yl);
        }

        // randomCode用于保存随机产生的验证码，以便用户登录后进行验证。
        StringBuffer randomCode = new StringBuffer();
        int red = 0, green = 0, blue = 0;

        // 随机产生codeCount数字的验证码。
        for (int i = 0; i < codeCount; i++) {
            // 得到随机产生的验证码数字。
            String code = String.valueOf(codeSequence[random.nextInt(34)]);
            // 产生随机的颜色分量来构造颜色值，这样输出的每位数字的颜色值都将不同。
            red = random.nextInt(200);
            green = random.nextInt(200);
            blue = random.nextInt(200);

            // 用随机产生的颜色将验证码绘制到图像中。
            gd.setColor(new Color(43, 133, 191));
//            gd.setColor(new Color(red, green, blue));
            gd.drawString(code, (i + 1) * xx, codeY);

            // 将产生的四个随机数组合在一起。
            randomCode.append(code);
        }
        // 将四位数字的验证码保存到Session中。
        HttpSession session = request.getSession(false);
//        System.out.println(randomCode.toString());
        session.setAttribute("code", randomCode.toString());

        // 禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        response.setContentType("image/jpeg");

        // 将图像输出到Servlet输出流中。
//		ServletOutputStream sos = response.getOutputStream();
//		ImageIO.write(buffImg, "jpeg", sos);
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(response.getOutputStream());
        encoder.encode(buffImg);
//		sos.close();
    }
}
