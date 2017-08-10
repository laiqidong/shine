<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("X-Frame-Options", "SAMEORIGIN");
%>
<!DOCTYPE html>
<html>
<head>
    <title>图片展示</title>
    <%@include file="../layout/common.jsp" %>
</head>
<body>
<!-- PAGE CONTENT BEGINS -->
<div>
    <ul class="ace-thumbnails clearfix">

        <c:forEach items="${files}" var="file">
            <li id="id_${file.id}">
                <a href="${contextPath}/file/pic/${file.id}" target="_blank">
                    <img width="250" height="250" src="${contextPath}/file/pic/${file.id}"/>
                    <div class="text">
                        <div class="inner">${file.fileName}</div>
                    </div>
                </a>
                <div class="tools tools-bottom">
                    <a href="javaScript:void(0);" onclick="deleteFile('${file.id}')">
                        <i class="ace-icon fa fa-times red"></i>
                    </a>
                </div>
            </li>
        </c:forEach>
    </ul>
</div><!-- PAGE CONTENT ENDS -->
<script>
    function deleteFile(id) {
        _ajax_get("${contextPath}/file/deleteFile/" + id, function (result) {
            if(result) {
                _tips("删除成功",2);
                $("#id_" + id).remove();
            }
        });
    }
</script>
</body>
</html>
