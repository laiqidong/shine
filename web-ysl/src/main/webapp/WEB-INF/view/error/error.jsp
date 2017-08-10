<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>错误</title>
    <%@include file="../layout/common.jsp" %>
</head>
<body>
<div class="error-container">
    <div class="well">
        <h1 class="grey lighter smaller">
            <span class="red bigger-125">
                <i class="ace-icon fa fa-random"></i>
               哎呀，出问题了...
            </span>
        </h1>

        <hr/>
        <h3 class="lighter smaller">

            <i class="ace-icon fa fa-wrench icon-animated-wrench bigger-125"></i>
            ${msg}
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
