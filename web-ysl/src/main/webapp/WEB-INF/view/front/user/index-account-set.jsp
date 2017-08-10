<%--
  Created by IntelliJ IDEA.
  User: luoxuan
  Date: 2017/5/17
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="overflow: visible; height: initial;">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <%@include file="../../layout/front/common_front.jsp" %>
    <%@include file="../../layout/common.jsp" %>
    <script type="text/ecmascript" src="data:,_data_uri_useable=1" urite-agent="1"></script>

    <link href="./resource/page.css" type="text/css" rel="stylesheet">

    <title>龙岩市不动产外网预受理</title>

    <!--新增的css以及js start-->
    <style type="text/css">

        .account-container {
            border: 0px solid red;
            height: 484px;
        }

        .account-bars {
            height: 42px;
            line-height: 42px;
            border: 1px solid #E8EEF4;
            border-right: none;
        }

        .account-bars ul {
            margin: 0px;
            padding: 0px;
        }

        .account-bars ul li {
            float: left;
            width: 140px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            border-right: 1px solid #E8EEF4;
        }

        .account-bars ul li.on {
            background: #49C1EB;
            color: #ffffff;
        }

        .base-info {
            padding-left: 40px;
            padding-top: 10px;
            display: none;
        }

        .base-info ul li {
            margin-top: 10px;
        }

        .base-info ul li label {
            margin-right: 10px;
        }

        .base-info ul li label input {
            height: 12px;
        }

        .base-info ul li input {
            font-family: "微软雅黑";
            color: #666666;
            font-size: 16px;
            height: 34px;
        }

        .info-title {
            width: 140px;
            display: inline-block;
            margin-right: 10px;
            font-family: "微软雅黑";
            font-size: 16px;
            text-align: right;
        }

        .send-btn {
            padding: 8px 10px;
            background: #75B1F3;
            color: #ffffff;
            font-family: "微软雅黑";
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 10px;
        }

        .border-blue {
            border: 1px solid #CDE4F3 !important;
            width: 450px;
        }

        .border-none {
            border: none !important;
            background: none !important;
            width: 450px;
        }

        .complete {
            width: 120px;
            background: #40D2AF;
            height: 40px;
            line-height: 40px;
            text-align: center;
            color: #ffffff;
            border-radius: 3px;
            margin: 0 auto;
            letter-spacing: 4px;
            font-family: "微软雅黑";
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
            margin-left: 320px;
        }

    </style>
</head>

<body >
<div id="barrierfree_container">

    <!--每屏最小高度640px-->
    <!--top-->
    <%@include file="../../layout/front/header.jsp" %>
    <!--主体-->
    <div class="yhzx_all" style="/*position:relative;padding-top:110px; */">

        <div class="yhzx_main" style="/*margin-top: 35px;*/">
            <div class="yhzx_r1">
                <%@include file="../../layout/front/sider.jsp" %>
                <div class="c2" style="margin-left:224px;">
                    <div class="col-xs-12" style="background: #ffffff;padding:0px; min-height:494px;">
                        <div class="account-container">
                            <div class="account-bars">
                                <ul>
                                    <li class="on">基本信息</li>
                                    <li>密码设置</li>
                                    <%--<li>手机绑定</li>--%>
                                    <div class="cl"></div>
                                </ul>
                            </div>
                            <div class="base-info" style="display: block;">
                                <ul>
                                    <c:if test="${user.type==1}">
                                        <li>
                                            <span class="info-title">账号 : </span><input class="border-none" type="text"
                                                                                        readonly="readonly"
                                                                                        value="${user.account}"/>
                                        </li>
                                        <li>
                                            <span class="info-title">姓名 : </span><input class="border-none" type="text"
                                                                                        readonly="readonly"
                                                                                        value="${user.name}"/>
                                        </li>
                                        <%--<li>--%>
                                        <%--<span class="info-title">手机 : </span><input class="border-none"--%>
                                        <%--readonly="readonly" type="text"--%>
                                        <%--value="${user.account}"/>--%>
                                        <%--</li>--%>
                                        <li>
                                            <span class="info-title">证件号码 : </span><input class="border-none"
                                                                                          readonly="readonly"
                                                                                          type="text"
                                                                                          value="${user.idCard}"/>
                                        </li>
                                    </c:if>
                                    <c:if test="${user.type==2}">
                                        <li>
                                            <span class="info-title">账号 : </span><input class="border-none" type="text"
                                                                                        readonly
                                                                                        value="${user.account}"/>
                                        </li>
                                        <li>
                                            <span class="info-title">姓名 : </span><input class="border-none" type="text"
                                                                                        readonly
                                                                                        value="${user.name}"/>
                                        </li>
                                        <li>
                                            <span class="info-title">开发商名称: </span><input class="border-none"
                                                                                          type="text"
                                                                                          readonly
                                                                                          value="${user.companyName}"/>
                                        </li>
                                        <li>
                                            <span class="info-title">开发商标识码: </span><input class="border-none"
                                                                                           type="text"
                                                                                           readonly
                                                                                           value="${user.kfsbsm}"/>
                                        </li>

                                        <li>
                                            <span class="info-title">企业电话 : </span><input class="border-none"
                                                                                          type="text" readonly
                                                                                          value="${user.companyPhone}"/>
                                        </li>
                                        <li>
                                            <span class="info-title">详细地址 : </span><input class="border-none"
                                                                                          type="text" readonly
                                                                                          value="${user.companyAddress}"/>
                                        </li>
                                    </c:if>
                                    <%--<li>--%>
                                    <%--<span class="info-title">性别 : </span><label><input type="radio" name="sex" value="" />男</label><label><input type="radio" name="sex" value="" />女</label>--%>
                                    <%--</li>--%>

                                    <%--<li>--%>
                                    <%--<span class="info-title">电话电话 : </span><input class="border-blue" type="text" value="15722247896" />--%>
                                    <%--</li>--%>
                                    <%--<li>--%>
                                    <%--<span class="info-title">邮箱地址 : </span><input class="border-blue" type="text" value="12456785@qq.com" />--%>
                                    <%--</li>--%>

                                </ul>
                                <%--<div class="complete">完成</div>--%>
                            </div>
                            <div class="base-info">
                                <ul>
                                    <li>
                                        <span class="info-title"><strong
                                                style="color: #ff0000;">*</strong>当前密码 : </span><input
                                            class="border-blue" type="password" id="password_old" value=""/>
                                    </li>
                                    <li>
                                        <span class="info-title"><strong
                                                style="color: #ff0000;">*</strong>输入新密码 : </span><input
                                            class="border-blue" type="password" id="password_new" value=""/>
                                    </li>
                                    <li>
                                        <span class="info-title"><strong
                                                style="color: #ff0000;">*</strong>重复新密码 : </span><input
                                            class="border-blue" type="password" id="password_new_repeat" value=""/>
                                    </li>
                                </ul>
                                <div class="complete" onclick="mergePassword()">完成</div>
                            </div>

                            <%--<div class="base-info">--%>
                            <%--<ul>--%>
                            <%--<li>--%>
                            <%--<span class="info-title"><strong style="color: #ff0000;">*</strong>当前使用手机号 : </span><input class="border-none" type="text" value="15722247896" />--%>
                            <%--</li>--%>
                            <%--<li>--%>
                            <%--<span class="info-title"><strong style="color: #ff0000;">*</strong>输入新号码 : </span><input class="border-blue" type="text" value="12456785@qq.com" /><span class="send-btn">发送验证码</span>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                            <%--<span class="info-title"><strong style="color: #ff0000;">*</strong>重复验证码 : </span><input class="border-blue" type="text" value="" />--%>
                            <%--</li>--%>
                            <%--</ul>--%>
                            <%--<div class="complete">完成</div>--%>
                            <%--</div>--%>

                        </div>

                    </div>
                </div>
            </div>


        </div>


    </div>

    <%@include file="../../layout/front/footer.jsp" %>


</div>

<!--<script language="javascript" src="./resource/pagecontrol.js"></script><noscript>&lt;iframe src="*.html"&gt;&lt;/iframe&gt;</noscript>
<script language="javascript" src="./resource/web_front.js"></script>-->
<!--foot-->


</body>
<script type="text/javascript">
    $(function () {
        $(".account-bars ul li").click(function () {
            $(".account-bars ul li").removeClass("on");
            $(".base-info").hide();
            $(".account-bars ul li").eq($(this).index()).addClass("on");
            $(".base-info").eq($(this).index()).show();
        })
    })


    function mergePassword() {
        var old = $('#password_old').val();
        var new_ = $('#password_new').val();
        var new_repeat = $('#password_new_repeat').val();
        if (old.length < 6 || old.length > 18) {
            _tips("请输入6~18位旧密码", "2");
        } else if (new_.length < 6 || new_.length > 18) {
            _tips("请输入6~18位新密码", "2");
        } else if (new_ == new_repeat) {
            $.ajax({
                type: 'POST',
                url: '${contextPath}/front/user/mergePassword',
                data: {"password_old": old, "password_new": new_},
                dataType: 'json',
                success: function (result) {
                    if (result.ret == "1") {
                        _tips("密码更新成功!", "2");
                        <%--window.location.href="${contextPath}/front/loginPage";--%>
                    } else {
                        _tips(result.msg, '2');
                    }
                }
            });
        } else {
            _tips("两次输入的新密码不一致", '2');
        }
    }

</script>
</html>