<%--
  Created by IntelliJ IDEA.
  User: luoxuan
  Date: 2017/6/1
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html style="overflow: visible; height: initial;">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="${contextPath}/resources/ysl_front/css/index.css"/>
    <script type="text/javascript" src="${contextPath}/resources/ysl_front/resource/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/artDialog/skins/default.css">

    <script src="${contextPath}/resources/artDialog/artDialog.js"></script>
    <script src="${contextPath}/resources/artDialog/artWindowTools.js"></script>
    <script src="${contextPath}/resources/artDialog/artDialog.iframeTools.js"></script>
    <script src="${contextPath}/resources/common/common.js"></script>
</head>
<style>
    /* 分页 */
    .pagination {
        width: 200px;
        height: 10px;
        margin: 0px auto;
    }

    .pagination li {
        width: 60px;
        height: 10px;
        float: left;
        margin-right: 20px;
        background-color: #d9d9d9;
        cursor: pointer;
    }

    .pagination li.on {
        background-color: #f39800 !important;
    }

    .row2 {
        position: relative;
        margin-top: 20px;
        margin-left: 30px;
    }

    .content2 {
        border: 0px;
        font-family: "微软雅黑";
        font-size: 16px;
    }
    .profile-user-info {
        display: table;
        width: 98%;
        width: calc(100% - 24px);
        margin: 0 auto;
    }
    .profile-info-row {
        display: table-row;
    }
    .profile-info-row:first-child .profile-info-name {
        border-top: none;
    }
    .profile-info-name {
        text-align: right;
        padding: 6px 10px 6px 4px;
        font-weight: normal;
        color: #667E99;
        background-color: transparent;
        border-top: 1px dotted #D5E4F1;
        display: table-cell;
        width: 110px;
        vertical-align: middle;
    }
    .profile-info-row:first-child .profile-info-value {
        border-top: none;
    }
    .profile-info-value {
        display: table-cell;
        padding: 6px 4px 6px 6px;
        border-top: 1px dotted #D5E4F1;
    }
    .blue {
        color: #478FCA !important;
    }
    h4 {
        margin-top: 10px;
        margin-bottom: 10px;
        font-size: 18px;
        font-weight: normal;
        font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
    }
</style>
<body>
<%@include file="../layout/front/header.jsp" %>
<div class="main_index">
    <div class="top-banner">
        <!-- 图片轮播部分 -->
        <ul class="imgList">
            <li><a href="#"><img class="banner-swipe-pic" src="${contextPath}/resources/ysl_front/images/banner.jpg"
                                 height="320px"></a></li>
            <li><a href="#"><img class="banner-swipe-pic" src="${contextPath}/resources/ysl_front/images/banner.jpg"
                                 height="320px"></a></li>
            <li><a href="#"><img class="banner-swipe-pic" src="${contextPath}/resources/ysl_front/images/banner.jpg"
                                 height="320px"></a></li>
        </ul>
        <ul class="indexList"><!-- 图片左下角序号部分 -->
            <li class="indexOn"></li>
            <li></li>
            <li></li>
        </ul>

        <div class="banner-wrapper">
            <div class="wrapper-left">
                <ul>
                    <c:if test="${token==null}">
                        <li class="on">注册登录</li>
                    </c:if>
                    <c:if test="${token!=null}">
                        <li class="on">用户信息</li>
                    </c:if>
                    <li>进度查询</li>
                    <li>快捷办理</li>
                    <li>我要预约</li>
                    <li>最新公告</li>
                </ul>
            </div>
            <!-- 登录用户中心 -->
            <c:if test="${token==null}">
                <div class="top-banner-con" style="display: block;">
                    <div class="wrap-head">
                        登录用户中心，获得更准确的服务推荐
                    </div>
                    <form id="form" action="${contextPath}/userLogin" method="post">

                        <div class="list">
                            <!--账号输入（手机号/身份证号）-->
                            <div class="row">
                                <div class="content">
                                    <img class="icon fleft" src="${contextPath}/resources/ysl_front/images/user2.png">
                                    <div class="inputborder">
                                        <input type="text" id="account" name="account" placeholder="手机号">
                                    </div>
                                </div>
                            </div>
                            <!--密码输入-->
                            <div class="row">
                                <div class="content" style="border-bottom: 1px solid #E0E0E0;">
                                    <img class="icon fleft"
                                         src="${contextPath}/resources/ysl_front/images/password2.png">
                                    <div class="inputborder">
                                        <input type="password" id="password" name="password" placeholder="请输入密码">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="login-btn-box">
                            <div class="login-btn " onclick="login()">登录</div>
                            <div class="reg-btn" onclick="to_url('${contextPath}/register')">注册</div>
                        </div>
                        <a class="forget-pass" href="${contextPath}/forgetPassword">忘记密码?</a>
                    </form>
                </div>
            </c:if>
            <c:if test="${token!=null}">
                <div class="top-banner-con" style="display: block;">
                    <!--登录信息-->
                    <div class="wrap-head">

                    </div>
                    <div class="">
                        <h4 style="text-align: center" class="blue">
                            <span>${staffname}</span>（在线）
                        </h4>
                        <div class="profile-user-info">
                            <div class="profile-info-row">
                                <div class="profile-info-name"> 账号： </div>

                                <div class="profile-info-value">
                                    <span>${account}</span>
                                </div>
                            </div>

                            <div class="profile-info-row">
                                <div class="profile-info-name"> 姓名 </div>

                                <div class="profile-info-value">
                                    <span>${staffname}</span>
                                </div>
                            </div>

                            <div class="profile-info-row">
                                <div class="profile-info-name"> 用户类型 : </div>

                                <div class="profile-info-value">
                                    <span><c:if test="${userType==1}">
                                         个人用户
                                    </c:if>
                                    <c:if test="${userType==2}">
                                        企业用户
                                    </c:if>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--<div class="list">
                        <div class="row2">
                            <div class="content2">
                                <div class="">&emsp;&emsp;账号 : ${account}</div>
                            </div>
                        </div>
                        <div class="row2">
                            <div class="content2">
                                <div class="">&emsp;&emsp;姓名 : ${staffname}</div>
                            </div>
                        </div>
                        <div class="row2">
                            <div class="content2">
                                <c:if test="${userType==1}">
                                    <div class="">用户类型 : 个人用户</div>
                                </c:if>
                                <c:if test="${userType==2}">
                                    <div class="">用户类型 : 企业用户</div>
                                </c:if>
                            </div>
                        </div>
                    </div>--%>
                </div>
            </c:if>

            <!-- 办件查询 -->
            <div class="top-banner-con">
                <div class="wrap-head">
                    办件查询
                </div>
                <div class="list">
                    <div class="row">
                        <div class="content">
                            <div class="inputborder">
                                <input type="text" placeholder="受理号">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="content" style="border-bottom: 1px solid #E0E0E0;">
                            <div class="inputborder">
                                <input type="text" placeholder="申请人">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list" style="padding-bottom: 1px">
                    <div class="validate-btn validate-btn-bg fr">获取验证码</div>
                    <div class="row" style="overflow: hidden;">
                        <div class="content">
                            <div class="inputborder" style="border:1px solid #E0E0E0 !important;">
                                <input type="text" placeholder="验证码">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="login-btn-box">
                    <div class="login-btn">查询</div>
                    <div class="reg-btn">重置</div>
                </div>
            </div>

            <!-- 快捷办理 -->
            <div class="top-banner-con">
                <ul class="kuaijie">
                    <li>
                        <img src="${contextPath}/resources/ysl_front/images/icon_20.png">
                        <span>预告登记</span>
                    </li>
                    <li>
                        <img src="${contextPath}/resources/ysl_front/images/icon_21.png">
                        <span>房屋抵押</span>
                    </li>
                    <li>
                        <img src="${contextPath}/resources/ysl_front/images/icon_22.png">
                        <span>房屋买卖</span><input class="lcdm" type="hidden" value="2102">
                    </li>
                    <li>
                        <img src="${contextPath}/resources/ysl_front/images/icon_23.png">
                        <span>不动产抵押</span>
                    </li>
                    <li>
                        <img src="${contextPath}/resources/ysl_front/images/icon_24.png">
                        <span>夫妻增名</span>
                    </li>
                    <li>
                        <img src="${contextPath}/resources/ysl_front/images/icon_25.png">
                        <span>房屋继承</span>
                    </li>
                    <li>
                        <img src="${contextPath}/resources/ysl_front/images/icon_26.png">
                        <span>开具房屋证明</span>
                    </li>
                    <li>
                        <img src="${contextPath}/resources/ysl_front/images/icon_27.png">
                        <span>楼盘信息查询</span>
                    </li>
                </ul>
            </div>
            <!-- 我要预约 -->
            <div class="top-banner-con">
                <div class="wrap-head">
                    预约类型
                </div>
                <ul class="kuaijie yuyue-top">
                    <li>
                        <img src="${contextPath}/resources/ysl_front/images/icon_28.png">
                        <span>不动产预告登记</span>
                    </li>
                    <li>
                        <img src="${contextPath}/resources/ysl_front/images/icon_29.png">
                        <span>不动产按揭登记</span>
                    </li>
                    <li>
                        <img src="${contextPath}/resources/ysl_front/images/icon_30.png">
                        <span>不动产抵押登记</span>
                    </li>
                    <li>
                        <img src="${contextPath}/resources/ysl_front/images/icon_31.png">
                        <span>不动产解压登记</span>
                    </li>
                    <li>
                        <img src="${contextPath}/resources/ysl_front/images/icon_32.png">
                        <span>不动产综合收件</span>
                    </li>
                    <li>
                        <img src="${contextPath}/resources/ysl_front/images/icon_33.png">
                        <span>不动产权籍调查</span>
                    </li>
                    <li>
                        <img src="${contextPath}/resources/ysl_front/images/icon_34.png">
                        <span>唯一证明查询</span>
                    </li>
                </ul>
            </div>
            <!-- 新闻公告 -->
            <div class="top-banner-con">
                <div class="news-title">
                    <a href="#" class="fr">更多&gt;&gt;</a><span>登记公告</span>
                </div>
                <div class="news-list-con">
                    <ul>
                        <%--<li><span>2017-04-21</span><a href="#">调研不动产登记工作</a></li>--%>
                        <%--<li><span>2017-04-21</span><a href="#">龙岩市不动产登记推行“互联网”创新模式</a></li>--%>
                        <%--<li><span>2017-04-21</span><a href="#">龙岩市“互联网+智慧不动产”让您登记让您登记更放心更放心.您登记让您登记更放心更放心</a></li>--%>
                        <%--<li><span>2017-04-21</span><a href="#">不动产登记服务中心窗口被评为“红旗窗口”称 </a></li>--%>
                        <%--<li><span>2017-04-21</span><a href="#">足不出户轻松办理不动产登记</a></li>--%>
                        <li><span><fmt:formatDate value="${zxtg[0].infoDate}" pattern="yyyy-MM-dd"/></span><a href="${contextPath}/zxgg/list/${zxtg[0].id}" target="_blank">${zxtg[0].infoTitle}</a></li>
                        <li><span><fmt:formatDate value="${zxtg[1].infoDate}" pattern="yyyy-MM-dd"/></span><a href="${contextPath}/zxgg/list/${zxtg[1].id}" target="_blank">${zxtg[1].infoTitle}</a></li>
                        <li><span><fmt:formatDate value="${zxtg[2].infoDate}" pattern="yyyy-MM-dd"/></span><a href="${contextPath}/zxgg/list/${zxtg[2].id}" target="_blank">${zxtg[2].infoTitle}</a></li>
                        <li><span><fmt:formatDate value="${zxtg[3].infoDate}" pattern="yyyy-MM-dd"/></span><a href="${contextPath}/zxgg/list/${zxtg[3].id}" target="_blank">${zxtg[3].infoTitle}</a></li>
                        <li><span><fmt:formatDate value="${zxtg[4].infoDate}" pattern="yyyy-MM-dd"/></span><a href="${contextPath}/zxgg/list/${zxtg[4].id}" target="_blank">${zxtg[4].infoTitle}</a></li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
    <%@include file="index-business.jsp" %>

    <div class="help-wrapper">
        <ul>
            <li>
                <div class="help-pic help-bg1">
                    <img src="${contextPath}/resources/ysl_front/images/icon_17.png">
                </div>
                <p class="help-title">什么是预受理？</p>
                <p class="info">网上提前预约业务，提前申请等等</p>
                <div class="detail-info" onclick="open_url('${contextPath}/help/0')">点击查看详情</div>
            </li>
            <li>
                <div class="help-pic help-bg2">
                    <img src="${contextPath}/resources/ysl_front/images/icon_18.png">
                </div>
                <p class="help-title">怎么提交申请？</p>
                <p class="info">注册-登录-创建申请-提交申请-等待审核</p>
                <div class="detail-info" onclick="open_url('${contextPath}/help/1')">点击查看详情</div>
            </li>
            <li style="margin-right:0px">
                <div class="help-pic help-bg3">
                    <img src="${contextPath}/resources/ysl_front/images/icon_19.png">
                </div>
                <p class="help-title">遇到不懂的问题怎么办？</p>
                <p class="info">针对不懂的问题，该如何解决......</p>
                <div class="detail-info" onclick="open_url('${contextPath}/help/2')">点击查看详情</div>
            </li>
            <div class="cl"></div>
        </ul>
    </div>

    <%@include file="../layout/front/footer.jsp" %>

</div>


</body>
<script type="text/javascript">
    function login() {
        var account = $("#account").val();
        var password = $("#password").val();
        if (_nullValue(account) == '') {
            _tips('请输入手机号', 2);
        } else if (_nullValue(password) == '') {
            _tips('请输入密码', 2);
        } else {
            $("#form").submit();
        }
    }
    function open_url(url) {
        window.open(url, '_blank');
    }



</script>
<script src="${contextPath}/resources/assets/js/index.js"></script>

</html>

