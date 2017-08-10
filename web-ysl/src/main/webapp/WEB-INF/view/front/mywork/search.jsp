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
    <script type="text/javascript" src="${contextPath}/resources/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
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
                        <div class="main-contain  col-xs-12">
                            <div class="widget-box widget-color-blue2 col-xs-12">
                                <div class="widget-header widget-header-small">
                                    <h4 class="widget-title">受理查询</h4>
                                    <span class="widget-toolbar">
                                                <a href="#" data-action="collapse">
                                                    <i class="ace-icon fa fa-chevron-up"></i>
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
                                        <form class="center" role="form" id="form">
                                            <label for="search_yslywh">受理单号:</label>
                                            <input type="text" name="yslywh" id="search_yslywh"
                                                   placeholder="受理单号"
                                                   value=""/>
                                            &nbsp;
                                            <label for="search_yslywh">审批结果:</label>
                                            <select name="zt" id="search_zt">
                                                <option value="">全部</option>
                                                <option value="1">待提交</option>
                                                <option value="2">已提交</option>
                                                <option value="3">待审核</option>
                                                <option value="4">审核成功</option>
                                                <option value="5">审核失败</option>
                                            </select>
                                            &nbsp;
                                            <label for="search_yslywh">申请时间:</label>

                                            <input type="text" class="input-sm" id="startTime"
                                                   onClick="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\');}',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"
                                            />

                                            <i class="fa fa-exchange"></i>

                                            <input type="text" class=" input-sm" id="endTime"
                                                   onClick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\');}',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"
                                            />

                                        </form>
                                        <%--表单End--%>
                                    </div>
                                </div>
                            </div>
                            <div id="bljd_app">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>受理单号</th>
                                        <th>权利人</th>
                                        <th>申请时间</th>
                                        <th>登记类型</th>
                                        <th>审批结果</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="(slsq,index) in slsqs">
                                        <td class="center">{{index+1}}</td>
                                        <td class="center">{{slsq.yslywh}}</td>
                                        <td class="center">{{slsq.qlrs}}</td>
                                        <td class="center">{{slsq.sqsj}}</td>
                                        <td class="center">{{slsq.lcmc}}</td>
                                        <td class="center"><span class="orange" v-if="slsq.zt==1">待提交</span>
                                            <span class="orange" v-if="slsq.zt==2">已提交</span>
                                            <span class="blue" v-if="slsq.zt==3">待审核</span>
                                            <span class="blue" v-if="slsq.zt==4">审核通过</span>
                                            <span class="red" v-if="slsq.zt==5">审核失败</span>
                                        </td>
                                        <td class="center">
                                            <a v-if="slsq.zt==1" href="javaScript:void(0);"
                                               @click="details(slsq.yslywh,slsq.djxl)">编辑</a>
                                            <a v-if="slsq.zt==2||slsq.zt==3||slsq.zt==4||slsq.zt==5"
                                               href="javaScript:void(0);" @click="finishDetail(slsq.yslywh,slsq.djxl)">查看</a>
                                            <a v-if="slsq.zt!=3&&slsq.zt!=4&&slsq.zt!=5" href="javaScript:void(0);"
                                               @click="deleteSlsq(slsq.yslywh,slsq.djxl)">删除</a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
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
    <!--底部-->


</div>
<%@include file="../../layout/front/footer.jsp" %>
<script src="${contextPath}/resources/assets/js/jqPaginator.min.js"></script>
<script src="${contextPath}/resources/ysl/js/vue.js"></script>

</body>
<script type="text/javascript">
    $(function () {
        _jqPaginator(getData);
        $('.datepicker').datepicker({
            language: 'zh-CN',
            autoclose: true,
            todayHighlight: true
        });
    });
    function _clear() {
        $("#form")[0].reset();
    }
    var bljd_app = new Vue({
        el: '#bljd_app',
        data: {
            slsqs: []
        },
        methods: {
            details: function (yslywh, lcdm) {
                if (lcdm == '2705') {//预转现无抵押
                    var url = '${contextPath}/front/fdzhdj/yzxStep3?yslywh=' + yslywh + '&lcdm=' + lcdm;
                    window.open(url, '_blank');
                } else if (lcdm == '2701') {//预转现有抵押
                    var url = '${contextPath}/front/fdzhdj/yzxStep3?yslywh=' + yslywh + '&lcdm=' + lcdm;
                    window.open(url, '_blank');
                } else if (lcdm == '2102') {//房屋买卖
                    var url = '${contextPath}/front/fwmm/step1?yslywh=' + yslywh + '&lcdm=' + lcdm;
                    window.open(url, '_blank');
                } else if(lcdm == '9401'||lcdm=='9405'||lcdm=='9407'||lcdm == '9402'||lcdm=='9403'||lcdm=='9409'){
                    var url =  '${contextPath}/front/ygdj/step3?yslywh=' + yslywh + '&lcdm='+lcdm;
                    window.open(url,'_blank');
                } else if(lcdm == '2101'){
                    var url =  '${contextPath}/front/fddj/scdjStep3?yslywh=' + yslywh + '&lcdm='+lcdm;
                    window.open(url,'_blank');
                }
            },
            deleteSlsq: function (yslywh) {
                _confirm("您确定要删除这条申请吗？", function () {
                    _ajax_get("${contextPath}/front/slsq/delete/" + yslywh, function (result) {
                        if (result) {
                            _tips("删除成功", 2);
                            getData(1);
                        }
                    })
                },function() {
                    _tips("正在取消");
                });
            },
            finishDetail: function (yslywh, lcdm) {
                var url = '${contextPath}/front/bjjd/show?yslywh=' + yslywh + '&lcdm=' + lcdm;
                window.open(url, '_blank');
                <%--if (lcdm == '2705') {//预转现无抵押--%>
                    <%--var url = '${contextPath}/front/fdzhdj/yzxShow?yslywh=' + yslywh + '&lcdm=' + lcdm;--%>
                    <%--window.open(url, '_blank');--%>
                <%--} else if (lcdm == '2701') {//预转现有抵押--%>
                    <%--var url = '${contextPath}/front/fdzhdj/yzxShow?yslywh=' + yslywh + '&lcdm=' + lcdm;--%>
                    <%--window.open(url, '_blank');--%>
                <%--} else if (lcdm == '2102') {//房屋买卖--%>
                    <%--var url = '${contextPath}/front/fwmm/show?yslywh=' + yslywh + '&lcdm=' + lcdm;--%>
                    <%--window.open(url, '_blank');--%>
                <%--}--%>
            }
        }
    });
    function getData(num) {
        var url = "${contextPath}/front/bjjd/getSlsqList";
        var data = {
            page: num,
            pageSize: 10,
            zt: $("#search_zt").val(),
            yslywh: $("#search_yslywh").val(),
            startTime: $("#startTime").val(),
            endTime: $("#endTime").val()
        };
        /**
         * 获取受理申请
         */
        _ajax_post(url, data, function (result) {
            var pages = result.pages;
            if (pages == 0) {
                pages = 1;
            }
            _jqPaginator_setting(result.pageNum, pages);
            bljd_app.slsqs.splice(0, bljd_app.slsqs.length);
            $.each(result.list, function (index, obj) {
                if (obj.sqsj.length > 10) {
                    obj.sqsj = obj.sqsj.substring(0, 10);
                }
                bljd_app.slsqs.push(obj);
            });
        });
    }
</script>
</html>
