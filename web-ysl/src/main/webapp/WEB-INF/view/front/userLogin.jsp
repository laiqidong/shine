<%--
  Created by IntelliJ IDEA.
  User: luoxuan
  Date: 2017/5/18
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/ysl_front/css/login.css"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/ysl_front/css/drag.css"/>
    <link rel="stylesheet" href="${contextPath}/resources/artDialog/skins/default.css">
    <script type="text/javascript" src="${contextPath}/resources/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/drag.js"></script>

    <script src="${contextPath}/resources/artDialog/artDialog.js"></script>
    <script src="${contextPath}/resources/artDialog/artWindowTools.js"></script>
    <script src="${contextPath}/resources/artDialog/artDialog.iframeTools.js"></script>
    <script src="${contextPath}/resources/common/common.js"></script>
    <style>
        .unselect{
            -webkit-user-select:none;
            -moz-user-select:none;
            -ms-user-select:none;
            user-select:none;
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
            <%--<p class="welcome fr">欢迎登录</p>--%>
        </a>
        <div class="search-form fr">
            <img src="http://www.jszwfw.gov.cn/picture/2/1612071441078297655.png"/>
            <input type="text" name="" id="" placeholder="输入您要的服务"/>
        </div>
    </div>
</div>
<!--主题部分-->
<div class="login-main">
    <div class="login-wrap">
        <div class="wrap-head unselect">
            <span class="login-form-11">账号密码登录</span>
            <span class="denglu_form_14"><a href="${contextPath}/forgetPassword">忘记密码</a></span>
            <span class="denglu_form_13">|</span>
            <span class="denglu_form_12"><a href="${contextPath}/register">注册帐号</a></span>
        </div>

        <form id="form" action="${contextPath}/userLogin" method="post">
        <div class="list unselect">
            <!--账号输入（手机号/身份证号）-->
            <div class="row">
                <div class="content">
                    <img class="icon fleft" src="${contextPath}/resources/ysl_front/images/user.png">
                    <div class="inputborder">
                        <input type="text" id="account" name="account" placeholder="手机号">
                    </div>
                </div>
            </div>
            <!--密码输入-->
            <div class="row">
                <div class="content">
                    <img class="icon fleft" src="${contextPath}/resources/ysl_front/images/pass.png">
                    <div class="inputborder">
                        <input type="password" id="password" name="password" placeholder="请输入密码">
                    </div>
                </div>
            </div>
        </div>
        </form>
        <div class="drag-code" id="drag">
        </div>
        <!--登录按钮-->
        <div class="btn btn-login unselect" onclick="login()">登 录</div>
    </div>
</div>
<!--页脚部分-->
<%@include file="../layout/front/footer.jsp" %>

</body>
<script type="text/javascript">
    var dd = false;
    $('#drag').drag();
    if('${error}'!=''){
        _tips('${error}','2');
    }
    function login() {
        var account = $("#account").val();
        var password = $("#password").val();
        if (_nullValue(account) == '') {
            _tips('请输入手机号', 2);
        } else if (_nullValue(password) == '') {
            _tips('请输入密码', 2);
        } else if (dd) {
            $("#form").submit();
        } else {
            _tips("请拖动滑块验证", 2);
        }
    }
</script>
</html>

