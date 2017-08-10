<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("X-Frame-Options", "SAMEORIGIN");
%>
<!DOCTYPE html>
<html style="overflow: visible; height: initial;">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title>龙岩市不动产外网预受理</title>
    <%@include file="../../layout/front/common_front.jsp" %>
    <%@include file="../../layout/common.jsp" %>
    <!--新增的css以及js start-->
    <style type="text/css">
        .about-title{height: 60px;line-height: 60px;margin-top:10px;text-align: center;font-family: "微软雅黑";font-size: 24px;color: #333333;}
        .about-resource{height:30px;line-height:30px;margin-top:0px;text-align: center;font-family: "微软雅黑";font-size:16px;color: #333333;border-bottom: 1px solid #DCDCDC;padding-bottom:40px;margin:0px 100px}
        .about-con{font-size: 16px;line-height:34px;text-indent: 1.5em;margin-top:20px !important;font-family: "微软雅黑";color: #333333;}
        .about-con p{line-height:30px;margin-top:0px;}
        .state-title{margin-top: 20px;color: #000;font-weight:bold}
    </style>
</head>

<body style="background-color: white">
${content}
</body>
</html>

