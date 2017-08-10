<%--
  Created by IntelliJ IDEA.
  User: luoxuan
  Date: 2017/5/17
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="overflow: visible; height: initial;">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <%--<%@include file="../../layout/front/common_front.jsp" %>--%>

    <script type="text/ecmascript" src="data:,_data_uri_useable=1" urite-agent="1"></script>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/ysl_front/css/login.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/ysl_front/css/drag.css">
    <link rel="stylesheet" href="${contextPath}/resources/artDialog/skins/default.css">
    <script type="text/javascript" src="${contextPath}/resources/ysl_front/resource/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/drag.js"></script>
    <script src="${contextPath}/resources/artDialog/artDialog.js"></script>
    <script src="${contextPath}/resources/artDialog/artWindowTools.js"></script>
    <script src="${contextPath}/resources/artDialog/artDialog.iframeTools.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/login/idcardValidity.js"></script>

    <title>龙岩市不动产外网预受理</title>

    <style type="text/css">
        .changePsw-main {
            height: 570px;
            background: #F2F2F2;
            position: relative;
            z-index: 99;
            padding-top: 20px;
        }

        .changePsw-wrap {
            height: 460px;
            background: #ffffff;
            width: 1000px;
            margin: 0 auto;
            padding: 20px;
            padding-top: 40px;
        }

        .mmzh_tit_main {
            width: 756px;
            height: 45px;
            margin: 0 auto;
            overflow: hidden;
            position: relative;
        }

        .mmzh_tit {
            width: 170px;
            height: 45px;
            position: absolute;
            top: 0px;
            font-size: 17px;
            line-height: 45px;
            color: #fff;
            cursor: pointer;
            text-align: center;
        }

        /*.mmzh_tit:hover, .mmzh_tit.On{background: url(images/mmzh_tit_bg1.png) right no-repeat;}*/
        .tit1 {
            padding-left: 20px;
            left: 0px;
            z-index: 4;
            background: url(${contextPath}/resources/ysl_front/images/mmzh_tit_bg1.png) right no-repeat;
        }

        .tit1:hover, .tit1.On {
            background: url(${contextPath}/resources/ysl_front/images/mmzh_tit_bg1_1.png) right no-repeat;
        }

        .tit2 {
            padding-left: 40px;
            left: 163px;
            z-index: 3;
            background: url(${contextPath}/resources/ysl_front/images/mmzh_tit_bg2.png) right no-repeat;
        }

        .tit2:hover, .tit2.On {
            background: url(${contextPath}/resources/ysl_front/images/mmzh_tit_bg2_1.png) right no-repeat;
        }

        .tit3 {
            padding-left: 35px;
            left: 350px;
            z-index: 2;
            background: url(${contextPath}/resources/ysl_front/images/mmzh_tit_bg2.png) right no-repeat;
        }

        .tit3:hover, .tit3.On {
            background: url(${contextPath}/resources/ysl_front/images/mmzh_tit_bg2_1.png) right no-repeat;
        }

        .tit4 {
            padding-left: 50px;
            left: 500px;
            z-index: 1;
            background: url(${contextPath}/resources/ysl_front/images/mmzh_tit_bg4.png) right no-repeat;
        }

        .tit4:hover, .tit4.On {
            background: url(${contextPath}/resources/ysl_front/images/mmzh_tit_bg4_1.png) right no-repeat;
        }

        .mmzh_form {
            width: 756px;
            height: auto;
            margin: 30px auto;
            overflow: hidden;
            position: relative;
        }

        .mmzh_list_cell {
            border: 0px solid red;
            height: 44px;
            margin-bottom: 20px;
            overflow: hidden;
            position: relative;
        }

        .mmzh_list_cell .cell_tit {
            width: 120px;
            height: 44px;
            padding-right: 10px;
            position: absolute;
            top: 0px;
            left: 0px;
            font-size: 17px;
            line-height: 44px;
            text-align: right;
        }

        .cell_list {
            width: 450px;
            height: 40px;
            position: absolute;
            top: 0px;
            left: 120px;
        }

        .mmzh_input {
            display: block;
            width: 450px;
            height: 40px;
            padding: 0px 10px;
            background: none;
            border: 1px solid #e0e0e0;
            font-size: 15px;
            line-height: 38px;
        }

        .user {
            width: 370px
        }

        .checkcode {
            float: left;
            width: 225px;
            margin-right: 20px;
        }

        .mmzh_btn_main1 {
            width: 600px;
            height: 50px;
            padding-left: 125px;
        }

        .mmzh_btn {
            width: 180px;
            height: 44px;
            line-height: 44px;
            text-align: center;
            color: #fff;
            display: block;
            float: left;
            margin-right: 20px;
            border-radius: 3px;
            cursor: pointer;
            border-top: 0;
            border-left: 0;
            border-right: 0;
            border-bottom: 0;
        }

        .mmzh_btn.next {
            background-color: #37bd9c;
        }

        .mmzh_btn.next:hover {
            background-color: #32a589
        }

        .mmzh_btn.back {
            background-color: #3499da;
        }

        .mmzh_btn.back:hover {
            background-color: #2b85bf;
        }

        .validate-btn {
            height: 40px;
            line-height: 40px;
            text-align: center;
            color: #ffffff;
            border-radius: 3px;
            padding: 0px 10px;
            cursor: pointer;
        }

        .validate-btn-bg {
            background: #31B573;
        }

        .complete-tip {
            display: inline-block;
            margin-top: 20px;
            margin-left: 40px;
            font-family: "微软雅黑";
            font-size: 18px;
        }
    </style>
</head>
<body>
<!--登录头部部分-->
<div class="login-head">
    <div class="login-head-center">
        <a class="top_logo_a" href="#">
            <img src="${contextPath}/resources/ysl_front/images/logo.png">
            <span>龙岩市不动产登记网上申请系统<br><strong>Longyan Real Estate Registration Online Application System</strong></span>
            <p class="welcome fr">重置密码</p>
        </a>
        <%--<div class="search-form fr">--%>
        <%--<img src="${contextPath}/resources/ysl_front/images/search.png"/>--%>
        <%--<input type="text" name="" id="" placeholder="输入您要的服务"/>--%>
        <%--</div>--%>
    </div>
</div>
<!--主题部分-->
<div class="changePsw-main">
    <div class="changePsw-wrap">
        <div class="mmzh_tit_main">
            <a class="mmzh_tit tit1 On">1、填写登录账号</a> <a class="mmzh_tit tit2">2、验证身份</a>
            <a class="mmzh_tit tit3">3、设置新密码</a> <a class="mmzh_tit tit4">4、完成</a>
        </div>

        <form class="mmzh_form" action="${contextPath}/forgetPassword" method="post" id="form">
            <!--填写用户名-->
            <div class="mmzh_list list1" style="display: block;">
                <div class="mmzh_list_cell" id="mobile_div">
                    <div class="cell_tit">
                        登录账号：<font color="#fe4242">*</font>
                    </div>
                    <div class="cell_list">
                        <input class="mmzh_input user" type="text" value="" placeholder="填写您注册的用户名（手机号）" id="account"
                               name="account" onblur="checkAccount()">
                    </div>
                    <span class="message" id="AccountMsg" style="font-size: 13px;"></span>
                </div>

                <div class="mmzh_list_cell">
                    <div class="cell_tit">
                        验证码：<font color="#fe4242">*</font>
                    </div>
                    <div class="cell_list">
                        <input class="mmzh_input checkcode" type="text" value="" id="randCode" name="randCode"> <span
                            class="mmzh_img checkimg" id="verifycode" style="cursor: pointer;">
                        <img
                                id="imgcode" class="img-code" src="${contextPath}/imgcode" alt="网络错误"
                                width='120' height='40' onclick="resetcode()"/>
                    </span>
                    </div>
                </div>

                <div class="mmzh_btn_main1">
                    <input class="mmzh_btn next" value="下一步" onclick="next1()">
                    <input class="mmzh_btn back" type="" onclick="javascript:history.go(-1)" value="返回">
                </div>
            </div>


            <div class="mmzh_list list2" style="display: none;">
                <div class="mmzh_list_cell">
                    <div class="cell_tit">
                        身份证号码：<font color="#fe4242">*</font>
                    </div>
                    <div class="cell_list">
                        <input class="mmzh_input user" type="text" value="" placeholder="填写您的个人身份证号码" id="idCard"
                               name="idCard" onblur="checkIdCard()">
                    </div>
                    <span class="message" style="font-size: 13px;"></span>
                </div>

                <div class="mmzh_list_cell">
                    <div class="cell_tit">
                        手机号码：<font color="#fe4242">*</font>
                    </div>
                    <div class="cell_list">
                        <input class="mmzh_input user" id="list2_account" type="text" value="" placeholder="填写您的个人手机号码"
                               readonly>
                    </div>
                    <span class="message" style="font-size: 13px;"></span>
                </div>

                <div class="mmzh_list_cell">
                    <div class="cell_tit">
                        验证码：<font color="#fe4242">*</font>
                    </div>
                    <div class="cell_list">

                        <input class="mmzh_input checkcode" type="text" value="" id="smsCode" name="smsCode">
                        <div class="validate-btn validate-btn-bg fl" onclick="getCode(this)">获取验证码</div>
                    </div>
                </div>

                <div class="mmzh_btn_main1">
                    <input class="mmzh_btn next" value="下一步" onclick="next2()">
                    <input class="mmzh_btn back" type="" onclick="back2()" value="返回">
                </div>
            </div>

            <div class="mmzh_list list3" style="display: none;">
                <div class="mmzh_list_cell">
                    <div class="cell_tit">
                        重置密码：<font color="#fe4242">*</font>
                    </div>
                    <div class="cell_list">
                        <input class="mmzh_input user" type="password" value="" placeholder="新密码" id="newPwd"
                               name="newPwd" onblur="checkNewPwd()">
                    </div>
                    <span class="message" style="font-size: 13px;"></span>
                </div>
                <div class="mmzh_list_cell">
                    <div class="cell_tit">
                        再次输入：<font color="#fe4242">*</font>
                    </div>
                    <div class="cell_list">
                        <input class="mmzh_input user" type="password" value="" placeholder="再次输入新密码" id="newPwd2"
                               name="newPwd2" onblur="checkNewPwd2()">
                    </div>
                    <span class="message" style="font-size: 13px;"></span>
                </div>

                <div class="mmzh_btn_main1">
                    <input class="mmzh_btn next" type="" value="下一步" onclick="next3()">
                    <input class="mmzh_btn back" type="" value="返回" onclick="back3()">
                </div>
            </div>

            <div class="mmzh_list list4" style="display: none;">
                <div class="mmzh_list_cell" style="height: 90px;padding-left:200px;padding-top: 40px;">
                    <img class="fl" src="${contextPath}/resources/ysl_front/images/complete.png"/>
                    <span class="complete-tip">恭喜您,完成修改密码</span>
                </div>

                <div class="mmzh_btn_main1" style="padding-left: 286px;">
                    <input class="mmzh_btn next" type="" value="返回重新登录" onclick="window.location.href='${contextPath}'">
                </div>
            </div>
        </form>
    </div>
</div>
<!--底部-->

<%@include file="../../layout/front/footer.jsp" %>


</div>

<!--<script language="javascript" src="./resource/pagecontrol.js"></script><noscript>&lt;iframe src="*.html"&gt;&lt;/iframe&gt;</noscript>
<script language="javascript" src="./resource/web_front.js"></script>-->
<!--foot-->


</body>
<script src="${contextPath}/resources/common/common.js"></script>
<script type="text/javascript">
    $('#drag').drag();
    var ok = false;
    function checkAccount() {
        var account = $("#account");
        if (account.val() == '') {
            _tips("请输入手机号", 1);
            ok = false;
        } else {
            $.ajax({
                type: 'get',
                url: '${contextPath}/forgetPassword/checkUser',
                data: {"account": account.val()},
                dataType: 'json',
                success: function (result) {
                    if (result.ret == 1) {
                        ok = true;
                    } else {
                        _tips("该账号未注册!", 1);
                        ok = false;
                    }
                }
            });
        }
    }
    function checkIdCard() {
        var account = $("#idCard");
        if (account.val().trim() == '' || !IdCardValidate(account.val().trim())) {
            _tips("请输入该账号注册时用的身份证", 2);
            ok = false;
        } else {
            $.ajax({
                type: 'get',
                url: '${contextPath}/forgetPassword/checkIdCard',
                data: {"idCard": account.val()},
                dataType: 'json',
                success: function (result) {
                    if (result.ret == 1) {
                        ok = true;
                    } else {
                        _tips("输入的身份证号码与注册时不符，请重新输入!", 1);
                        ok = false;
                    }
                }
            });
        }
    }
    function checkNewPwd() {
        if ($("#newPwd").val().trim().length < 6 || $("#newPwd").val().trim().length > 18) {
            _tips("请输入6~18位的新密码", 1);
            ok = false;
        } else {
            ok = true;
        }
    }
    function checkNewPwd2() {
        if ($("#newPwd").val().trim() == $("#newPwd2").val().trim()) {
            ok = true;
        } else {
            _tips("两次密码不一致", 1);
            ok = false;
        }
    }
    function next1() {
        checkAccount();
        if (ok) {
            if ($("#randCode").val().trim() == '')
                _tips("请输入验证码", 1);
            else
                $.ajax({
                    type: 'get',
                    url: '${contextPath}/valCode',
                    data: {"code": $("#randCode").val()},
                    dataType: 'json',
                    success: function (result) {
                        if (result.ret != 1) {
                            _tips("请输入正确的验证码!", 1);
                            resetcode();
                        } else {
                            $(".tit2").addClass("On");
                            $(".list1").css("display", "none");
                            $(".list2").css("display", "block");
                            $("#list2_account").val($("#account").val());
                        }
                    }
                });
        }
        else {
            _tips("此号码未注册，请填写注册时的手机号!", 1);
        }
    }

    function next2() {
        checkIdCard();
        if (ok) {
            if ($("#smsCode").val().trim() == '')
                _tips("请输入验证码", 1);
            else {
                $.ajax({
                    type: 'get',
                    url: '${contextPath}/forgetPassword/valSmsCode',
                    data: {"code": $("#smsCode").val(), "account": $("#account").val()},
                    dataType: 'json',
                    success: function (result) {
                        if (result.ret != 1) {
                            _tips("请输入正确的验证码!", 1);
                        } else {
                            $(".tit3").addClass("On");
                            $(".list2").css("display", "none");
                            $(".list3").css("display", "block");
                        }
                    }
                });
            }
        }
        else {
            _tips("请填写您注册时的身份证号!", 1);
        }
    }
    function next3() {
        checkNewPwd();
        checkNewPwd2();
        if (ok) {
            $.ajax({
                type: 'POST',
                url: '${contextPath}/forgetPassword/resetPassword',
                data: {"newPwd": $("#newPwd").val()},
                dataType: 'json',
                success: function (result) {
                    if (result.ret == 1) {
                        $(".tit4").addClass("On");
                        $(".list3").css("display", "none");
                        $(".list4").css("display", "block");
                    } else {
                        _tips(result.msg, 2);
                        <%--window.location.href="${contextPath}/forgetPassword";--%>
                    }
                }
            });
        }
        else {
            _tips("输入的密码不符要求!", 1);
        }
    }

    function back2() {
        $(".tit2").removeClass("On");
        $(".list1").css("display", "block");
        $(".list2").css("display", "none");
    }

    function back3() {
        $(".tit3").removeClass("On");
        $(".list2").css("display", "block");
        $(".list3").css("display", "none");

    }
    function resetcode() {
        $("#imgcode").attr(
            "src",
            "${contextPath}/imgcode?r="
            + new Date().getTime());

    }
    var s = 60;
    function getCode(obj) {
        $.ajax({
            type: 'get',
            url: '${contextPath}/sendSmsCode',
            data: {"account": $("#list2_account").val()},
            dataType: 'json',
            success: function (result) {
                if (result.ret == 1) {
                    resetSmsCode(obj);
                    _tips("验证码发送成功，请注意查收", 2);
                } else {
                    _tips(result.msg, 2);
                }
            }
        });
    }

    function resetSmsCode(obj) {
        var $this = $(obj);
        if (s == 0) {
            $this.attr("onclick", "getCode(this)");
            $this.html("获取验证码");
            s = 60;
        } else {
            $this.removeAttr("onclick");
            $this.html("重新发送(" + s + ")");
            s--;
            setTimeout(function () {
                resetSmsCode(obj);
            }, 1000);
        }

    }
</script>
</html>