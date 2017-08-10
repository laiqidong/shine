<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>404</title>
    <%@include file="../layout/common.jsp" %>
</head>
<body>
<div class="error-container">
    <div class="well">
        <h1 class="grey lighter smaller">
            <span class="blue bigger-125">
                <i class="ace-icon fa fa-random"></i>
                404
            </span>
        </h1>

        <hr/>
        <h3 class="lighter smaller">

            <i class="ace-icon fa fa-wrench icon-animated-wrench bigger-125"></i>
            您要访问的页面不存在
        </h3>

        <div class="space"></div>


        <hr/>
        <div class="space"></div>

        <div class="center">
            <a href="javascript:history.back()" class="btn btn-grey">
                <i class="ace-icon fa fa-arrow-left"></i>
                返回上一页
            </a>
        </div>
    </div>
</div>
</body>
</html>
