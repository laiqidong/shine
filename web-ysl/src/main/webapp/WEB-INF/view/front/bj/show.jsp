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
    <script type="text/javascript" src="${contextPath}/resources/login/idcardValidity.js"></script>
</head>
<style>
    .btn i {
        vertical-align: middle;
    }

    input.myrequird {
        border: 1px solid #f2a696
    }

    input.myrequird:focus {
        outline: none;
        border: 1px solid #D68273
    }

    .myinput {
        width: 100%;
        height: 30px;
        padding-left: 5px;
        padding-right: 5px;
    }

    .input-icon > .ace-icon {
        font-size: 13px;
    }

    .table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td {
        border: 1px solid #aaa;
    }

    .my-th {
        background-color: #d5d5d5;
    !important;
        color: black;
    }
</style>
<body>
<div id="barrierfree_container">
    <!--top-->
    <%@include file="../../layout/front/header.jsp" %>
    <!--主体-->
    <div class="yhzx_all" style="/*position:relative;padding-top:110px;*/ ">
        <div class="yhzx_main" style="/*margin-top: 35px;*/">
            <div class="yhzx_r1">
                <%--<%@include file="../layout/front/sider.jsp" %>--%>

                <div class="c2" style="margin-left: 0;">
                    <div style="background-color:#ffffff; overflow:hidden;padding: 10px 0">
                        <!--宗地信息-->
                        <div class="main-contain col-sm-12">
                            <div class="center">
                                <h2 class="blue">
                                    ${title}
                                </h2>
                            </div>
                            <form class="">
                                <h4 class="blue">申请人信息</h4>
                                <div class="hr"></div>
                                <table class="table table-bordered" id="sqr_app">
                                    <tbody>
                                    <tr class="my-th">
                                        <th class="center">姓名</th>
                                        <th class="center">申请人类别</th>
                                        <%--<th class="center">申请人类型</th>--%>
                                        <th class="center">证件类型</th>
                                        <th class="center">证件号</th>
                                        <th class="center">移动电话</th>
                                        <th class="center">固定电话</th>
                                        <th class="center">共有情况</th>
                                    </tr>
                                    <tr v-for="(sqr,index) in sqrs">
                                        <td class="center">
                                            {{sqr.sqrmc}}
                                        </td>
                                        <td class="center">
                                            {{sqr.sqrlbmc}}
                                        </td>
                                        <%--<td class="center">
                                        {{sqr.sqrlxmc}}
                                        </td>--%>
                                        <td class="center">
                                            {{sqr.sqrzjzlmc}}
                                        </td>
                                        <td class="center">
                                            {{sqr.sqrzjh}}
                                            <%--<input v-model="sqr.sqrzjh" class="myinput myrequird" placeholder="证件号">--%>
                                        </td>
                                        <td class="center">
                                            {{sqr.sqryddh}}
                                            <%--<input v-model="sqr.sqryddh" class="myinput" placeholder="移动电话">--%>
                                        </td>
                                        <td class="center">
                                            {{sqr.sqrgddh}}
                                            <%--<input v-model="sqr.sqryddh" class="myinput" placeholder="移动电话">--%>
                                        </td>
                                        <td class="center">
                                            {{sqr.gyfsmc}}
                                            <u class="orange" v-if="sqr.gyfs==2">
                                                {{sqr.qlbl}}%
                                            </u>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <h4 class="blue">不动产单元</h4>
                                <div class="hr"></div>
                                <table class="table table-bordered" id="bdcdy_app">
                                    <tbody>
                                    <tr class="my-th">
                                        <th class="center width-40">不动产单元号</th>
                                        <th class="center width-40">坐落</th>
                                        <th class="center width-20">面积（㎡）</th>
                                    </tr>

                                    <tr v-for="(bdcdy,index) in bdcdys">
                                        <td class="center">
                                            {{bdcdy.bdcdyh}}
                                        </td>
                                        <td class="center">
                                            {{bdcdy.zl}}
                                        </td>
                                        <td class="center">
                                            <c:if test="${param.lcdm=='2102'}">
                                                {{bdcdy.scjzmj}}
                                            </c:if>
                                            <c:if test="${param.lcdm!='2102'}">
                                                {{bdcdy.ycjzmj}}
                                            </c:if>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div id="slsq_app">
                                    <c:if test="${param.lcdm!='9405'||param.lcdm=='9407'||param.lcdm!='9402'||param.lcdm=='9409'}">
                                        <h4 class="blue">交易信息</h4>
                                        <div class="hr"></div>
                                        <table class="table table-bordered">
                                            <tbody>
                                            <tr class="my-th">
                                                <th class="center  width-25">取得方式</th>
                                                <th class="center  width-25">付款方式</th>
                                                <th class="center  width-25">交易合同编号</th>
                                                <th class="center  width-25">交易金额（万元）</th>
                                            </tr>
                                            <tr>
                                                <td class="center">
                                                    {{slsq.qdfsmc}}
                                                </td>
                                                <td class="center">
                                                    {{slsq.fkfsmc}}
                                                </td>
                                                <td class="center">
                                                    {{slsq.htbh}}
                                                </td>
                                                <td class="center">
                                                    {{slsq.jyje}}
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </c:if>
                                    <c:if test="${param.lcdm=='2701'||param.lcdm=='9405'||param.lcdm=='9407'||param.lcdm=='9402'||param.lcdm=='9409'}">
                                        <h4 class="blue">抵押信息</h4>
                                        <div class="hr"></div>
                                        <table class="table table-bordered">
                                            <tbody>
                                            <tr class="my-th">
                                                <th class="center ">抵押方式</th>
                                                <c:if test="${param.lcdm=='9405'||param.lcdm=='9407'||param.lcdm=='9402'||param.lcdm=='9409'}">
                                                    <th class="center ">贷款类型</th>
                                                </c:if>
                                                <th class="center ">被担保债权数额（万元）</th>
                                                <th class="center ">债权起始时间</th>
                                                <th class="center ">债权结束时间</th>
                                            </tr>
                                            <tr>
                                                <td class="center">
                                                    {{slsq.dyfsmc}}
                                                </td>
                                                <c:if test="${param.lcdm=='9405'||param.lcdm=='9407'||param.lcdm=='9402'||param.lcdm=='9409'}">
                                                    <td class="center">
                                                        {{slsq.dklxmc}}
                                                    </td>
                                                </c:if>
                                                <td class="center">
                                                    {{slsq.bdbzqse}}
                                                </td>
                                                <td class="center">
                                                    {{slsq.zqqssj}}
                                                </td>
                                                <td class="center">
                                                    {{slsq.zqjssj}}
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </c:if>
                                    <div v-if="slsq.zt == '5'">
                                        <h4 class="blue">登记失败原因</h4>
                                        <div class="hr"></div>
                                        <div class="alert alert-danger no-margin alert-dismissable">
                                            <i class="ace-icon fa fa-times bigger-120 red"></i>
                                            {{slsq.djbslyj}}

                                        </div>
                                        <div v-if="slsq.newywh.length > 0"
                                             class="alert alert-info no-margin alert-dismissable">
                                            <i class="ace-icon fa fa-check bigger-120 blue"></i>
                                            重新办理的预受理业务号为： {{slsq.newywh}}
                                        </div>
                                        <div v-if="slsq.newywh =='' || slsq.newywh==null" class="clearfix center">
                                            <div class="mybtn mybtn-large mybtn-info" id="redo" onclick="redo()">重新办理
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </form>
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
    </div>
    <%@include file="../../layout/front/footer.jsp" %>
</body>
<script src="${contextPath}/resources/assets/js/jqPaginator.min.js"></script>
<script src="${contextPath}/resources/ysl/js/vue.js"></script>
<script>
    var sqr_app = new Vue({
        el: '#sqr_app',
        data: {
            sqrs: [{sqrmc: '', sqrlb: 1, sqrzjzl: 1, sqrlx: '', sqryddh: '', sqrzjh: '', gyfs: '', qlbl: ''}]
        }
    });
    var slsq_app = new Vue({
        el: '#slsq_app',
        data: {
            slsq: {}
        }
    });
    var bdcdy_app = new Vue({
        el: '#bdcdy_app',
        data: {
            bdcdys: []
        }
    });
    $(function () {
        _ajax_get('${contextPath}/front/slsq/getShowMsg?yslywh=${param.yslywh}&lcdm=${param.lcdm}', function (result) {
            if (result.ret == 1) {
                var sqrs = result.sqrs;
                var houses = result.houses;
                if (sqrs.length > 0) {
                    sqr_app.sqrs.splice(0, sqr_app.sqrs.length);
                } else {
                    _alert("很抱歉，未找到该单元的权利人，请与不动登记中心联系。")
                }
                $.each(sqrs, function (index, obj) {
                    sqr_app.sqrs.push(obj);

                });
                $.each(houses, function (index, obj) {
                    var bdcdy = {
                        bsm: obj.bsm,
                        scjzmj: obj.scjzmj,
                        zl: obj.zl,
                        bdcdyh: obj.bdcdyh,
                        ycjzmj: obj.ycjzmj
                    };
                    bdcdy_app.bdcdys.push(bdcdy);
                });
                if ('${param.lcdm}' == '2701' || '${param.lcdm}' == '9405'||'${param.lcdm}' == '9407'||'${param.lcdm}'=='9402'||'${param.lcdm}'=='9409') {
                    if (result.slsq.zqqssj != null && result.slsq.zqqssj != "") {
                        result.slsq.zqqssj = result.slsq.zqqssj.substring(0, 10);
                    }

                    if (result.slsq.zqjssj != null && result.slsq.zqjssj != "") {
                        result.slsq.zqjssj = result.slsq.zqjssj.substring(0, 10);
                    }
                }
                slsq_app.slsq = result.slsq;
            } else {
                _alert(result.msg);
            }
        });
    });
    function redo() {
        _ajax_get('${contextPath}/front/getywh', function (newywh) {
            _ajax_get('${contextPath}/front/bjjd/redo?yslywh=${param.yslywh}&newywh=' + newywh, function (result) {
                if (result) {
                    var lcdm = '${param.lcdm}';
                    if (lcdm == '2705') {//预转现无抵押
                        window.location.href = '${contextPath}/front/fdzhdj/yzxStep3?yslywh=' + newywh + '&lcdm=' + lcdm;
                    } else if (lcdm == '2701') {//预转现有抵押
                        window.location.href = '${contextPath}/front/fdzhdj/yzxStep3?yslywh=' + newywh + '&lcdm=' + lcdm;
                    } else if (lcdm == '2102') {//房屋买卖
                        window.location.href = '${contextPath}/front/fwmm/step1?yslywh=' + newywh + '&lcdm=' + lcdm;
                    } else if (lcdm == '9401' || lcdm == '9405' || lcdm == '9407'||lcdm == '9402' || lcdm == '9403' || lcdm == '9409') {//预告登记
                        window.location.href = '${contextPath}/front/ygdj/step3?yslywh=' + newywh + '&lcdm=' + lcdm;
                    }
                }
            })
        });
    }
</script>
</html>

