<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html style="overflow: visible; height: initial;">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>龙岩市不动产外网预受理</title>
    <meta name="sitename" content="龙岩市不动产外网预受理">
    <%@include file="../layout/front/common_front.jsp" %>

    <%@include file="../layout/common.jsp" %>
    <script src="${contextPath}/resources/ysl/js/vue.js"></script>
</head>
<body >
<div id="barrierfree_container">
    <!--top-->
    <%@include file="../layout/front/header.jsp" %>
    <!--主体-->
    <div class="yhzx_all" <%--style="position:relative;padding-top:110px; "--%>>
        <div class="yhzx_main" <%--style="margin-top: 35px;"--%>>
            <div class="yhzx_r1">
                <%@include file="../layout/front/sider.jsp" %>
                <div class="c2" style="margin-left: 0px;">
                    <div style="background-color:#ffffff; overflow:hidden;padding: 10px 0">
                        <%--<div class="fw_tit_main">
                            <div class="div-inline" style="float:left;">我可能需要的服务</div>
                            <div class="go-more div-inline" style="float:right;">进入更多</div>
                        </div>--%>
                        <div class="fw_list_main">
                            <a class="fw_list_cell" href="javaScript:void(0);" onclick="ygdj()">
                                <img src="${contextPath}/resources/ysl_front/images/homebutton/button3.png">
                                <div class="tit1" title="预售商品房买卖预告登记">预告登记</div>
                                <div class="tit2" title="预售商品房买卖预告登记">预售商品房买卖预告登记</div>
                            </a>
                            <a class="fw_list_cell" href="javaScript:void(0);" onclick="ygdj_ydy()">
                                <img src="${contextPath}/resources/ysl_front/images/homebutton/button5.png">
                                <div class="tit1" title="预售商品房抵押权预告登记">预告登记(有抵押)</div>
                                <div class="tit2" title="预售商品房抵押权预告登记">预售商品房抵押权预告登记</div>
                            </a>
                            <a class="fw_list_cell" href="javaScript:void(0);" onclick="yzx_ydy()">
                                <img src="${contextPath}/resources/ysl_front/images/homebutton/button6.png">
                                <div class="tit1" title="预转现（有抵押）">预转现（有抵押）</div>
                                <div class="tit2" title="预转现（有抵押）">预转现（有抵押）</div>
                            </a>
                            <a class="fw_list_cell" href="javaScript:void(0);" onclick="yzx()">
                                <img src="${contextPath}/resources/ysl_front/images/homebutton/button4.png">
                                <div class="tit1" title="预转现（无抵押）">预转现（无抵押）</div>
                                <div class="tit2" title="预转现（无抵押）">预转现（无抵押）</div>
                            </a>

                            <a class="fw_list_cell" href="javaScript:void(0);" onclick="fwmm()">
                                <img src="${contextPath}/resources/ysl_front/images/homebutton/button1.png">
                                <div class="tit1" title="房屋买卖">房屋买卖</div>
                                <div class="tit2" title="房屋买卖">房屋买卖</div>
                            </a>
                            <a class="fw_list_cell" href="javaScript:void(0);" onclick="ygdj_zh()">
                                <img src="${contextPath}/resources/ysl_front/images/homebutton/button2.png">
                                <div class="tit1" title="预售商品房预告及预售商品房抵押权预告登记">预售商品房预告及预售商品房抵押权预告登记</div>
                                <div class="tit2" title="预售商品房预告及预售商品房抵押权预告登记">预售商品房预告及预售商品房抵押权预告登记</div>
                            </a>
                        </div>
                        <div class="yhzx_r2" style="height: inherit">
                            <!--我的办件-->
                            <div class="task-box" style="height: inherit">
                                <div class="task-head">
                                    <span class="active-title">我的办件</span>
                                    <ul>
                                        <li id="dbl" class="on" onclick="dblClick()">待办理</li>
                                        <li id="ybl" onclick="yblClick()">已办理</li>
                                        <input type="hidden" id="zt" value="1">
                                    </ul>
                                </div>
                                <div class="task-con" style="display: block;background: #ffffff;">
                                    <table class="table-hover" id="bljd_app" border="1" cellspacing="0" cellpadding="0" style="width: 100%">
                                        <tr>
                                            <th width="160px">受理单号</th>
                                            <th>申请时间</th>
                                            <th>登记类型</th>
                                            <th>审批结果</th>
                                            <th>操作</th>
                                        </tr>
                                        <tr v-for="(slsq,index) in slsqs" :class="index/2==0?'my-lighter':'my-darker'">
                                            <td width="160px">{{slsq.yslywh}}</td>
                                            <td>{{slsq.sqsj}}</td>
                                            <td>{{slsq.lcmc}}</td>
                                            <td><span class="orange" v-if="slsq.zt==1">待提交</span>
                                                <span class="orange" v-if="slsq.zt==2">已提交</span>
                                                <span class="blue" v-if="slsq.zt==3">待审核</span>
                                                <span class="blue" v-if="slsq.zt==4">审核通过</span>
                                                <span class="red" v-if="slsq.zt==5">审核失败</span>
                                            </td>
                                            <td>
                                                <a v-if="slsq.zt==1" href="javaScript:void(0);" @click="details(slsq.yslywh,slsq.djxl)">查看</a>
                                                <a v-if="slsq.zt==2||slsq.zt==3||slsq.zt==4||slsq.zt==5" href="javaScript:void(0);" @click="finishDetail(slsq.yslywh,slsq.djxl)">查看</a>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="dataTables_paginate paging_bootstrap col-xs-12">
                                        <ul id="pagination" class="pagination"></ul>
                                    </div>
                                </div>
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
    <%@include file="../layout/front/footer.jsp" %>
</div>
<script src="${contextPath}/resources/assets/js/jqPaginator.min.js"></script>
<script>
    $(function () {
        _jqPaginator(getData);
    });
    var bljd_app = new Vue({
        el: '#bljd_app',
        data: {
            slsqs: []
        },
        methods: {
            details: function (yslywh, lcdm) {
                if(lcdm=='2705') {//预转现无抵押
                    var url = '${contextPath}/front/fdzhdj/yzxStep3?yslywh=' + yslywh + '&lcdm='+lcdm;
                    window.open(url,'_blank');
                }else if(lcdm=='2701') {//预转现有抵押
                    var url =  '${contextPath}/front/fdzhdj/yzxStep3?yslywh=' + yslywh + '&lcdm='+lcdm;
                    window.open(url,'_blank');
                }else if(lcdm=='2102') {//房屋买卖
                    var url =  '${contextPath}/front/fwmm/step1?yslywh=' + yslywh + '&lcdm='+lcdm;
                    window.open(url,'_blank');
                }else if(lcdm == '9401'||lcdm=='9405'||lcdm=='9407'||lcdm == '9402'||lcdm=='9403'||lcdm=='9409'){
                    var url =  '${contextPath}/front/ygdj/step3?yslywh=' + yslywh + '&lcdm='+lcdm;
                    window.open(url,'_blank');
                }
            },
            finishDetail:function (yslywh, lcdm) {
                var url = '${contextPath}/front/bjjd/show?yslywh=' + yslywh + '&lcdm=' + lcdm;
                window.open(url, '_blank');
            }
        }
    });
    function getData(num) {
        var url = "${contextPath}/front/bjjd/getSlsqList";
        var data = {
            page: num,
            pageSize: 6,
            blzt: $("#zt").val()
        };
        /**
         * 获取受理申请
         */
        _ajax_post(url, data, function (result) {
            var pages = result.pages;
            if(pages==0) {
                pages=1;
            }
            _jqPaginator_setting(result.pageNum, pages);
            bljd_app.slsqs.splice(0, bljd_app.slsqs.length);
            $.each(result.list, function (index, obj) {
                if(obj.sqsj.length>10) {
                    obj.sqsj = obj.sqsj.substring(0, 10);
                }
                bljd_app.slsqs.push(obj);
            });
        });
    }
    function yzx_ydy() {
        _ajax_get('${contextPath}/front/getywh', function (result) {
            window.location.href = ' ${contextPath}/front/fdzhdj/yzxStep1?yslywh=' + result + '&lcdm=2701';
        });

    }
    function yzx() {
        _ajax_get('${contextPath}/front/getywh', function (result) {
            window.location.href = ' ${contextPath}/front/fdzhdj/yzxStep1?yslywh=' + result + '&lcdm=2705';
        });

    }
    function fwmm() {
        _ajax_get('${contextPath}/front/getywh', function (result) {
            window.location.href = ' ${contextPath}/front/fwmm/step1?yslywh=' + result + '&lcdm=2102';
        });

    }
    function ygdj() {
//        _tips('很抱歉，功能还在建设中...');
        _ajax_get('${contextPath}/front/getywh', function (result) {
            window.location.href = ' ${contextPath}/front/ygdj/step1?yslywh=' + result + '&lcdm=9401';
        });
    }
    function ygdj_ydy() {
//        _tips('很抱歉，功能还在建设中...');
        _ajax_get('${contextPath}/front/getywh', function (result) {
            window.location.href = ' ${contextPath}/front/ygdj/step1?yslywh=' + result + '&lcdm=9405';
        });
    }
    function ygdj_zh() {
//        _tips('很抱歉，功能还在建设中...');
        _ajax_get('${contextPath}/front/getywh', function (result) {
            window.location.href = ' ${contextPath}/front/ygdj/step1?yslywh=' + result + '&lcdm=9407';
        });
    }
    function dblClick() {
        $("#dbl").addClass("on");
        $("#ybl").removeClass("on");
        $("#zt").val(1);
        getData(1)
    }
    function yblClick() {
        $("#ybl").addClass("on");
        $("#dbl").removeClass("on");
        $("#zt").val(2);
        getData(1)
    }
</script>
</body>
</html>
