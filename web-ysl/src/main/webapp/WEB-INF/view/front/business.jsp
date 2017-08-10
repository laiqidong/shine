<%--
  Created by IntelliJ IDEA.
  User: luoxuan
  Date: 2017/6/1
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html style="overflow: visible; height: initial;">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <link rel="stylesheet" href="${contextPath}/resources/ysl_front/css/index.css"/>
    <script type="text/javascript" src="${contextPath}/resources/ysl_front/resource/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/artDialog/skins/default.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/ysl_front/css/user_gr.css">

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


</style>
<body>
<%@include file="../layout/front/header.jsp" %>
<div class="main_index">
    <%@include file="index-business.jsp" %>



    <%@include file="../layout/front/footer.jsp" %>

</div>


</body>
<script src="${contextPath}/resources/assets/js/index.js"></script>
</html>

