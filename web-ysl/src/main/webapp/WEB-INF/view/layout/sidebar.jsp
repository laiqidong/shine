<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="sidebar" class="sidebar responsive ace-save-state">
    <div class="sidebar-shortcuts" id="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
            <button class="btn btn-success">
                <i class="ace-icon fa fa-signal"></i>
            </button>
            <button class="btn btn-info">
                <i class="ace-icon fa fa-pencil"></i>
            </button>
            <!-- #section:basics/sidebar.layout.shortcuts -->
            <button class="btn btn-warning">
                <i class="ace-icon fa fa-users"></i>
            </button>
            <button class="btn btn-danger">
                <i class="ace-icon fa fa-cogs"></i>
            </button>
            <!-- /section:basics/sidebar.layout.shortcuts -->
        </div>

        <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>
    </div><!-- /.sidebar-shortcuts -->

    <ul class="nav nav-list">
        <li class="">
            <a href="${pageContext.request.contextPath}/home">
                <i class="menu-icon fa fa-tachometer"></i>
                <span class="menu-text"> 主页 </span>
            </a>
            <b class="arrow"></b>
        </li>
        <c:forEach var="menu" items="${sessionScope.menus}">
            <c:if test="${empty menu.children}">
                <li class="">
                    <a href="${pageContext.request.contextPath}${menu.url}">
                        <i class="menu-icon fa fa-list-alt"></i>
                        <span class="menu-text"> ${menu.menuname} </span>
                    </a>
                    <b class="arrow"></b>
                </li>
            </c:if>
            <c:if test="${not empty menu.children}">
                <li class="">
                    <a href="#" class="dropdown-toggle">
                        <i class="menu-icon fa fa-list"></i>
                        <span class="menu-text"> ${menu.menuname} </span>
                        <b class="arrow fa fa-angle-down"></b>
                    </a>
                    <b class="arrow"></b>
                    <ul class="submenu">
                        <c:forEach var="child" items="${menu.children}">
                            <li class="">
                                    <%--/--%>
                                <a href="${pageContext.request.contextPath}${child.url}">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                        ${child.menuname}
                                </a>
                                <b class="arrow"></b>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
            </c:if>
        </c:forEach>
    </ul><!-- /.nav-list -->

    <!-- #section:basics/sidebar.layout.minimize -->
    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
        <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state"
           data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>

    <script>
        var url = window.location.pathname;
        $("a[href='" + url + "']").parent().addClass("active").parent().addClass("nav-show").css("display", "block").parent().addClass("open");
    </script>
    <!-- /section:basics/sidebar.layout.minimize -->
</div>

