<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html style="overflow: visible; height: initial;">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>龙岩市不动产外网预受理</title>
    <meta name="sitename" content="龙岩市不动产外网预受理">
    <%@include file="../../layout/front/common_front.jsp" %>
    <%@include file="../../layout/common.jsp" %>
</head>
<body >
<div id="barrierfree_container">
    <!--top-->
    <%@include file="../../layout/front/header.jsp" %>
    <!--主体-->
    <div class="yhzx_all" style="/*position:relative;padding-top:110px; */">
        <div class="yhzx_main" style="/*margin-top: 35px;*/">
            <div class="yhzx_r1">
                <%--<%@include file="../../layout/front/sider.jsp" %>--%>
                <div class="c2" style="margin-left: 0px;">
                    <div style="background-color:#ffffff; overflow:hidden;padding: 10px 0">
                        <!--宗地信息-->
                        <div class="main-contain">
                            <%--<div class="center">
                                <h2 class="blue">预转现
                                    <c:if test="${param.lcdm=='2701'}">
                                        （有抵押）
                                    </c:if>
                                    <c:if test="${param.lcdm=='2705'}">
                                        （无抵押）
                                    </c:if>
                                </h2>
                            </div>--%>
                            <ul class="steps" style="margin-left: 0">

                                <li data-step="1" class="active">
                                    <span class="step">1</span>
                                    <span class="title">预转现
                                    <c:if test="${param.lcdm=='2701'}">
                                        （有抵押）
                                    </c:if>
                                    <c:if test="${param.lcdm=='2705'}">
                                        （无抵押）
                                    </c:if></span>
                                </li>
                                <li data-step="2" class="active">
                                    <span class="step">2</span>
                                    <span class="title">选择宗地信息</span>
                                </li>
                                <li data-step="3" class="">
                                    <span class="step">3</span>
                                    <span class="title">选择不动产单元</span>
                                </li>
                                <li data-step="4" class="">
                                    <span class="step">4</span>
                                    <span class="title">申请信息填写</span>
                                </li>
                                <li data-step="5">
                                    <span class="step">5</span>
                                    <span class="title">文件确认</span>
                                </li>
                                <li data-step="6">
                                    <span class="step">6</span>
                                    <span class="title">完成</span>
                                </li>

                            </ul>
                            <div class="widget-box widget-color-blue2 collapsed col-xs-12">
                                <div class="widget-header widget-header-small">
                                    <h4 class="widget-title">条件搜索</h4>
                                    <span class="widget-toolbar">
                                                <a href="#" data-action="collapse">
                                                    <i class="ace-icon fa fa-chevron-down"></i>
                                                    <span class="white">点击展开</span>
                                                </a>
                                                <a href="#" data-action="search" onclick="getData(1)">
                                                    <i class=" white ace-icon fa fa-search"></i>
                                                    <span class="white">查询</span>
                                                </a>
                                                <a href="#" data-action="reset" onclick="_clear()">
                                                    <i class="white ace-icon fa fa-refresh"></i>
                                                    <span class="white">重置</span>
                                                </a>
                                </span>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <%--表单Start--%>
                                        <form class="form-horizontal" role="form" id="form">
                                            <div class="form-group">
                                                <label class="control-label col-xs-2 no-padding-right"
                                                       for="search_xmmc">项目名称:</label>
                                                <div class="col-xs-3">
                                                    <input type="text" name="xmmc" id="search_xmmc"
                                                           placeholder="项目名称" class="col-xs-12"
                                                           value=""/>
                                                </div>
                                                <label class="control-label col-xs-2 no-padding-right"
                                                       for="search_bdcdyh">不动产单元号:</label>
                                                <div class="col-xs-3">
                                                    <input type="text" name="bdcdyh" id="search_bdcdyh"
                                                           placeholder="不动产单元号" class="col-xs-12"
                                                           value=""/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-xs-2 no-padding-right"
                                                       for="search_zl">坐落:</label>
                                                <div class="col-xs-8">
                                                    <input type="text" name="zl" id="search_zl"
                                                           placeholder="坐落" class="col-xs-12"
                                                           value=""/>
                                                </div>
                                            </div>
                                        </form>
                                        <%--表单End--%>
                                    </div>
                                </div>
                            </div>
                            <div id="zd_app">
                                <div v-for="(zd,index) in zds" class="col-xs-6 col-sm-4 col-md-3" style="height: 170px">
                                    <div class="thumbnail search-thumbnail">
                                        <%--<div class="col-xs-11 label label-lg label-warning arrowed-in arrowed-right">
                                        宗地信息
                                    </div>--%>
                                        <div class="col-xs-11 white label label-xlg label-warning arrowed-in-right arrowed-in"
                                             style="margin-bottom: 10px;">
                                            项目信息
                                        </div>
                                        <div style="padding-left: 10px;padding-right: 10px;">

                                            <i class="fa fa-tag blue info bigger-110"></i><span>项目名称</span>

                                            <p><a href="#" @click="step2(zd.zddm,zd.bsm)">{{zd.xmmc}}</a></p>

                                            <i class="fa fa-map-marker blue bigger-110"></i><span>坐落</span>

                                            <p>{{zd.zl}}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="dataTables_paginate paging_bootstrap col-xs-12">
                                <ul id="pagination" class="pagination"></ul>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            if ($(".yhzx_r2 .c1 .list_main .list_sub").length > 7) {
                $(".yhzx_r2 .c1 .list_main").css({"overflow-y": "scroll"});
            }
            if ($(".zzzx_list.sub1 .list_sub").length > 7) {
                $(".zzzx_list.sub1").css({"overflow-y": "scroll"});
            }
            if ($(".zzzx_list.sub2 .list_sub").length > 7) {
                $(".zzzx_list.sub2").css({"overflow-y": "scroll"});
            }
            if ($(".wdsc_list_main .wdsc_list_sub").length > 12) {
                $(".wdsc_list_main").css({"overflow-y": "scroll"});
            }
        });
    </script>
    <!--底部-->
    <%@include file="../../layout/front/footer.jsp" %>

</div>
<script src="${contextPath}/resources/assets/js/jqPaginator.min.js"></script>
<script src="${contextPath}/resources/ysl/js/vue.js"></script>

</body>
<script type="text/javascript">
    $(function () {
        _jqPaginator(getData);
    });
    var zd_app = new Vue({
        el: '#zd_app',
        data: {
            zds: []
        },
        methods: {
            step2: function (zddm, zdshiyqbsm) {
                window.location.href = '${contextPath}/front/fdzhdj/yzxStep2?zddm=' + zddm + '&zdshiyqbsm=' + zdshiyqbsm+'&lcdm=${param.lcdm}&yslywh=${param.yslywh}';
            }
        }
    });
    function getData(num) {
        var url = "${contextPath}/register/getLandList";
        var data = {
            page: num,
            pageSize: 8,
            xmmc: $("#search_xmmc").val(),
            bdcdyh: $("#search_bdcdyh").val(),
            zl: $("#search_zl").val(),
//            xmmc:$("#xmmc").val(),
            kfsbsm: '${kfsbsm}'
        };
        /**
         * 获取宗地
         */
        _ajax_json_post(url, data, function (result) {
            if (result.ret == 1) {
                var pageInfo = result.data.pageInfo;
                zd_app.zds.splice(0, zd_app.zds.length);
                if(pageInfo.list.length>0) {
                    _jqPaginator_setting(pageInfo.pageNum, pageInfo.pages);
                    $.each(pageInfo.list, function (index, obj) {
                        zd_app.zds.push(obj);
                    });
                }else {
                    _tips("很抱歉，未查到数据")
                }
            } else if (result.ret == 0) {
                _alert("错误:" + result.exception);
            } else {
                _alert(result.msg);
            }
        });
    }
</script>
</html>
