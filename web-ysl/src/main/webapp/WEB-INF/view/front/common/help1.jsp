<%--
  Created by IntelliJ IDEA.
  User: luoxuan
  Date: 2017/6/2
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> -->
    <link rel="stylesheet" href="${contextPath}/resources/ysl_front/css/help.css"/>
    <link rel="stylesheet" href="${contextPath}/resources/ysl_front/css/index.css"/>
    <script type="text/javascript" src="${contextPath}/resources/ysl_front/resource/jquery-1.8.3.min.js"></script>
</head>

<body>
<%@include file="../../layout/front/header.jsp" %>

<div class="main">

    <div class="tab-help">
        <div class="box">
            <ul class="tab-title">
                <c:forEach items="${h}" var="item">
                    <li>${item.infoTitle}</li>
                </c:forEach>
                <li  class="on">遇到不懂的问题怎么办？</li>
                <%--<li>什么是预受理?</li>--%>
                <%--<li>我该怎么提交申请?</li>--%>
                <%--<li>3</li>--%>
            </ul>
            <div class="tab-con">
                <c:forEach items="${h}" var="item">
                    <div class="con" style="display: none;">
                        <ul>
                                ${item.content}
                        </ul>
                    </div>
                </c:forEach>
                    <div class="con">
                        <ul  class="question-list">
                            <c:forEach items="${q}" var="item">
                                <li>
                                    <p class="list-title">Q&nbsp;&nbsp;&nbsp;${item.question}</p>
                                    <p class="list-info">A&nbsp;&nbsp;&nbsp;${item.answer}</p>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                <%--<div class="con" style="display: none;">--%>
                    <%--<ul class="shouli-list">--%>
                        <%--<li>--%>
                            <%--<div class="fl">--%>
                                <%--<img src="${contextPath}/resources/ysl_front/images/help1.png">--%>
                            <%--</div>--%>
                            <%--<p class="list-title">预受理系统的产生背景</p>--%>
                            <%--<p class="list-info">--%>
                                <%--自不动产登记机构成立以来，申请人对不动产登记收件材料、办理流程、办件期限都不了解，申请人为办理不动产登记收集资料东奔西走，材料齐全后正式办理后不知何时能够领证，窗口工作人员因需要手动录入权利人、房产信息，大大降低了工作效率，导致办件积压，发证量少。</p>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="fl">--%>
                                <%--<img src="${contextPath}/resources/ysl_front/images/help2.png">--%>
                            <%--</div>--%>
                            <%--<p class="list-title">预受理系统的主要职责</p>--%>
                            <%--<p class="list-info">建设不动产网上预受理平台，实现网上预受理功能，精简窗口工作，提高发证效率。方便申请人可以足不出户，网上预约申请登记</p>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="fl">--%>
                                <%--<img src="${contextPath}/resources/ysl_front/images/help3.png">--%>
                            <%--</div>--%>
                            <%--<p class="list-title">预受理系统的面向人群</p>--%>
                            <%--<p class="list-info">办理不动产登记业务的群众和不动产登记窗口工作人员。</p>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
                <%--<div class="con" style="display: none;">--%>
                    <%--<ul class="shenqin-list">--%>
                        <%--<li>--%>
                            <%--<div class="num fl">--%>
                                <%--1--%>
                            <%--</div>--%>
                            <%--<p class="list-title">注册帐号</p>--%>
                            <%--<p class="list-info"> 点击页面右上角【注册】按钮，注册帐号</p>--%>
                            <%--<img class="down-arrow" src="${contextPath}/resources/ysl_front/images/downArrow.png">--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="num fl">--%>
                                <%--2--%>
                            <%--</div>--%>
                            <%--<p class="list-title">登录</p>--%>
                            <%--<p class="list-info">注册完成后，在首页或者点击右上角【登录】并登录 。</p>--%>
                            <%--<img class="down-arrow" src="${contextPath}/resources/ysl_front/images/downArrow.png">--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="num fl">--%>
                                <%--3--%>
                            <%--</div>--%>
                            <%--<p class="list-title">创建申请</p>--%>
                            <%--<p class="list-info">在首页工作台或者打开我的草稿箱，点击【新增】按钮创建一条新的申请。</p>--%>
                            <%--<img class="down-arrow" src="${contextPath}/resources/ysl_front/images/downArrow.png">--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="num fl">--%>
                                <%--4--%>
                            <%--</div>--%>
                            <%--<p class="list-title">提交申请。</p>--%>
                            <%--<p class="list-info">完善申请信息并提交材料。 用户可以在【我的申请】业务箱查看审核状态。</p>--%>
                            <%--<img class="down-arrow" src="${contextPath}/resources/ysl_front/images/downArrow.png">--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="num fl">--%>
                                <%--5--%>
                            <%--</div>--%>
                            <%--<p class="list-title">通知</p>--%>
                            <%--<p class="list-info">登录网页查看审核状态。。</p>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
                <%--<div class="con">--%>
                    <%--<ul class="question-list">--%>
                        <%--<li>--%>
                            <%--<p class="list-title">Q&nbsp;&nbsp;&nbsp;忘记密码怎么办？</p>--%>
                            <%--<p class="list-info">A&nbsp;&nbsp;&nbsp; 登陆时使用旁边的＂忘记密码＂功能。</p>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<p class="list-title">Q&nbsp;&nbsp;&nbsp;以前的手机号不再用了怎么办？</p>--%>
                            <%--<p class="list-info">A&nbsp;&nbsp;&nbsp; 登陆后可以更改手机信息。</p>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<p class="list-title">Q&nbsp;&nbsp;&nbsp;提交的申请发现有错误怎么办？</p>--%>
                            <%--<p class="list-info">A&nbsp;&nbsp;&nbsp; 审核人审核不通过会打回申请。</p>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<p class="list-title">Q&nbsp;&nbsp;&nbsp;只有房产证，没有土地证怎么办？</p>--%>
                            <%--<p class="list-info">A&nbsp;&nbsp;&nbsp; 由开发商提供土地证复印件，若开发商不提供，到窗口请不动产登记中心人员协助补齐材料。</p>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<p class="list-title">Q&nbsp;&nbsp;&nbsp;只有批复文件，未办理土地证怎么办？</p>--%>
                            <%--<p class="list-info">A&nbsp;&nbsp;&nbsp; 只有批复文件，未办理土地证，税费已交齐，可以窗口请不动产登记中心人员协助办理。</p>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<p class="list-title">Q&nbsp;&nbsp;&nbsp;土地用途与房产用途不一致怎么办？</p>--%>
                            <%--<p class="list-info">A&nbsp;&nbsp;&nbsp; 需要到窗口咨询具体处理办法，或者网上发布解决办法。</p>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<p class="list-title">Q&nbsp;&nbsp;&nbsp;幢跨宗地怎么办？</p>--%>
                            <%--<p class="list-info">A&nbsp;&nbsp;&nbsp; 需要到窗口咨询具体处理办法，或者网上发布解决办法。</p>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<p class="list-title">Q&nbsp;&nbsp;&nbsp;划拨类土地房产转移、抵押类业务怎么办？</p>--%>
                            <%--<p class="list-info">A&nbsp;&nbsp;&nbsp; 需要到窗口咨询具体处理办法，或者网上发布解决办法。</p>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<p class="list-title">Q&nbsp;&nbsp;&nbsp;其他特殊业务</p>--%>
                            <%--<p class="list-info">A&nbsp;&nbsp;&nbsp;需要到窗口咨询具体处理办法，或者网上发布解决办法。</p>--%>
                        <%--</li>--%>

                    <%--</ul>--%>
                <%--</div>--%>
            </div>
        </div>

    </div>

    <%@include file="../../layout/front/footer.jsp" %>

</div>


</body>
<script src="${contextPath}/resources/assets/js/index.js"></script>
<script type="text/javascript">
    $(function () {
        var question = '${question}';
        if (question < 3 && question > -1) {
            $(".tab-title li").eq(question).addClass("on").siblings().removeClass("on");
            $(".tab-con .con").hide().eq(question).show();
        }
        $(".tab-title li").click(function () {
            var _index = $(this).index();
            $(".tab-title li").eq(_index).addClass("on").siblings().removeClass("on");
            $(".tab-con .con").hide().eq(_index).show();
        })


        $(".question-list li").click(function () {
            $(this).find(".list-info").toggle().parent().siblings().find(".list-info").hide();
        });
    })
</script>
</html>

