<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("X-Frame-Options", "SAMEORIGIN");
%>
<!DOCTYPE html>
<html>
<head>
    <title>银行列表</title>
    <%@include file="../../layout/common.jsp" %>
</head>
<body>
<div class="page-content">
    <div class="row">
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
                            <label for="qlrmc">银行名称:</label>
                            <input type="text" name="qlrmc" id="qlrmc"
                                   placeholder="银行名称"
                                   value=""/>
                        </form>
                        <%--表单End--%>
                    </div>
                </div>
            </div>
            <div id="bank_app">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>银行名称</th>
                        <th>证件种类</th>
                        <th>证件号</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="(bank,index) in banks">
                        <td class="center">{{index+1}}
                            <input name="bank" type="radio" :value="index"/>
                        </td>
                        <td class="center">{{bank.qlrmc}}</td>
                        <td class="center">{{bank.zjzlmc}}</td>
                        <td class="center">{{bank.zjh}}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="dataTables_paginate paging_bootstrap col-xs-12">
                <ul id="pagination" class="pagination"></ul>
            </div>
            <div class="clearfix center">
                <button class="btn btn-white btn-default btn-round" onclick="check()">
                    确定
                </button>
                <%--<div class="mybtn mybtn-large mybtn-orange" id="backBtn" onclick="check()">确定</div>--%>
            </div>
        </div>
    </div>
</div>
<script src="${contextPath}/resources/assets/js/jqPaginator.min.js"></script>
<script src="${contextPath}/resources/ysl/js/vue.js"></script>
<script>
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
    var bank_app = new Vue({
        el: '#bank_app',
        data: {
            banks: []
        }
    });
    function getData(num) {
        var url = "${contextPath}/front/bank/getBankList";
        var data = {
            page: num,
            pageSize: 10,
            qlrmc: $("#qlrmc").val()
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
            bank_app.banks.splice(0, bank_app.banks.length);
            $.each(result.list, function (index, obj) {
                bank_app.banks.push(obj);
            });
        });
    }
    function check() {
        var index = $("input[name='bank']:checked").val();
        if(index!=null && typeof(index)!='undefined'){
//            alert(bank_app.banks[index].bsm);
            top.getBankSqr('${param.index}', bank_app.banks[index]);
            top._dialog_close();
        }else {
            _tips("请选择您要添加的抵押权利人");
        }
    }
</script>
</body>
</html>
