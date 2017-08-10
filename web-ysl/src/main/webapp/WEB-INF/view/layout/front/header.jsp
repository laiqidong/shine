<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>龙岩市不动产登记网上申请系统</title>
<style>
    body{overflow: auto;}
</style>
<div class="header_index" >
    <!--  头部logo和搜索框 -->
    <div class="head-wrapper">
        <a class="top-logo top-index fl" href="#" style="text-decoration: none;">
            <img src="${contextPath}/resources/ysl_front/images/logo.png">
            <div class="logo-name-index">
                <p class="zhongwen">龙岩市不动产登记网上申请系统</p>
                <p class="yingwen">Longyan Real Estate Registration Online Application System</p>
            </div>
        </a>

        <div class="search-form fr">
            <span class="search-btn fr"></span>
            <input style="border: none" type="text" name="" id="" placeholder="输入您要的服务"/>
        </div>
    </div>
    <!-- 头部导航条 -->
    <div class="head-bars">
        <ul>
            <li class="current" onclick="to_url('${contextPath}/index')">首页</li>
            <%--<c:if test="${userType==1}">--%>
                <%--<li onclick="_tips('很抱歉，功能还在建设中...')">个人服务</li>--%>
            <%--</c:if>--%>
            <%--<c:if test="${userType==2}">--%>
                <%--<li onclick="_tips('很抱歉，功能还在建设中...')">企业服务</li>--%>
            <%--</c:if>--%>
            <%--<li onclick="_tips('很抱歉，功能还在建设中...')">单件业务</li>--%>
            <%--<li onclick="_tips('很抱歉，功能还在建设中...')">批量业务</li>--%>
            <li onclick="to_url('${contextPath}/front/business')">业务办理</li>
            <li onclick="to_url('${contextPath}/front/mywork/search')">办件查询</li>
            <li  onclick="to_url('${contextPath}/work_guide')">办理指南</li>
            <li  onclick="to_url('${contextPath}/download')">文书下载</li>
            <li onclick="to_url('${contextPath}/help/0')">在线帮助</li>
        </ul>
        <div class="head-bars-r fr">
            <c:if test="${token==null}">
                <span  class="bars-blue-title" onclick="to_url('${contextPath}/front/loginPage')">登录</span>
                <span class="bars-blue-title" onclick="to_url('${contextPath}/register')">注册</span>
            </c:if>
            <c:if test="${token!=null}">
                <span onclick="to_url('${contextPath}/front/home')">欢迎您，${staffname}</span>
                <span class="bars-blue-title" onclick="to_url('${contextPath}/front/home')">个人中心</span>
                <%--<span class="bars-blue-title" onclick="to_url('${contextPath}/front/mywork/search')">我的业务</span>--%>
                <span class="bars-blue-title" onclick="to_url('${contextPath}/front/logout')">退出</span>
            </c:if>
        </div>
    </div>
</div>
<!--当前站点名称-->
<script>
    //首屏登录弹框
    function jisopen(message) {
        alert(message);
    }
    //指定当前页面的菜单焦点
    $(function () {
        $(".head-bars .current").removeClass("current");
        var pathname = window.location.pathname;
        var obj=$(".head-bars").find("li[onclick=\"to_url('" + pathname + "')\"]");
//        alert(obj.html());
        if(obj!=null){
            obj.addClass("current");
        }
    });

    function to_url(url) {
        window.location.href = url;
    }
</script>