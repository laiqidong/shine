<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="top">

    <div class="top-head">
        <%--<div class="top-head-l">--%>
        <%--<span class="home-back">返回首页</span>--%>
        <%--</div>--%>
        <div class="top-head-r">
            <c:if test="${token==null}">
                <span style="margin-left: 50px;" onclick="to_url('${contextPath}')">登录</span>
                <span class="" onclick="to_url('${contextPath}/register')">注册</span>

            </c:if>
            <c:if test="${token!=null}">
                <span onclick="to_url('${contextPath}/front/home')">欢迎您，${staffname}</span>
                <span onclick="to_url('${contextPath}/front/mywork/search')">我的申请</span>
                <span onclick="to_url('${contextPath}/front/logout')">退出</span>
            </c:if>
            <%--<span>新手指南</span><span>温馨提示</span>--%>
        </div>
    </div>
    <div class="top_main">
        <div class="top_logo">
            <p class="top_logo_a" href="#">
                <img src="${contextPath}/resources/ysl_front/images/logo.png">
                <span>龙岩市不动产登记网上申请系统</span>
            </p>
        </div>

        <div class="top_search">
            <!--<div class="search_tit"></div>-->
            <div class="search_main" style="overflow: hidden; width: 430px;">
                <form class="search_form">

                    <input class="search_text" name="q" autocomplete="off" maxlength="50" size="20"
                           onfocus="this.style.color='#333';if(this.value=='输入您需要的服务'){this.value=''}"
                           onblur="this.style.color='#999';if(this.value==''){this.value='输入您需要的服务'}"
                           placeholder="输入您需要的服务" value="" type="text">
                    <input class="search_submit" type="button" onclick=" _tips('很抱歉，功能还在建设中...');">
                </form>
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
            $("#menu .active").removeClass("active");
            var pathname = window.location.pathname;
            $("#menu").find("a[href='" + pathname + "']").parent().addClass("active");
        });
    </script>
    <div class="js_head clearfloat">
        <div id="menu" style="/*padding-top:5px;*/">
            <div data-menuanchor="page1" class="active"><a class="top_nav_sub" href="${contextPath}/front/home">首页</a>
            </div>
            <c:if test="${userType==1}">
                <div data-menuanchor="page2"><a class="top_nav_sub sub2 gr_more" href="#" id="top_nav_02"
                                                onclick="_tips('很抱歉，功能还在建设中...')">个人服务</a></div>
            </c:if>
            <c:if test="${userType==2}">
                <div data-menuanchor="page3"><a class="top_nav_sub sub3 fr_more" href="#" id="top_nav_03"
                                                onclick="_tips('很抱歉，功能还在建设中...')">企业服务</a></div>
            </c:if>
            <div data-menuanchor="page8"><a class="top_nav_sub sub6 qjd_more" onclick="_tips('很抱歉，功能还在建设中...')">单件业务</a>
            </div>
            <div data-menuanchor="page9"><a class="top_nav_sub sub6 qjd_more" onclick="_tips('很抱歉，功能还在建设中...')">批量业务</a>
            </div>
            <div data-menuanchor="page7"><a class="top_nav_sub sub6 qjd_more" onclick="_tips('很抱歉，功能还在建设中...')">办件查询</a>
            </div>
            <div data-menuanchor="page4"><a class="top_nav_sub sub4" href="${contextPath}/work_guide"
                                            id="top_nav_04">办理指南</a></div>

            <div data-menuanchor="page5"><a class="top_nav_sub sub5 fw_more"
                                            href="${contextPath}/download">文书下载</a></div>

            <div data-menuanchor="page6"><a class="top_nav_sub sub6 qjd_more" onclick="_tips('很抱歉，功能还在建设中...')">在线帮助</a>
            </div>
        </div>
    </div>
</div>