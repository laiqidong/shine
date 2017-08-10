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

    select.myrequird {
        border: 1px solid #f2a696
    }

    .myinput {
        width: 100%;
        height: 30px;
        padding-left: 5px;
        padding-right: 5px;
    }

    .table th {
        background-color: #d9edf7;
        color: #31708f;
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
                <div class="c2" style="margin-left: 0;">
                    <div style="background-color:#ffffff; overflow:hidden;padding: 10px 0">
                        <!--宗地信息-->
                        <div class="main-contain col-sm-12">
                            <ul class="steps" style="margin-left: 0">
                                <li data-step="1" class="active">
                                    <span class="step">1</span>
                                    <span class="title">
                                        <c:if test="${param.lcdm=='9401'}">
                                            预售商品房买卖预告登记
                                        </c:if>
                                        <c:if test="${param.lcdm=='9405'}">
                                            预售商品房抵押权预告登记
                                        </c:if>
                                        <c:if test="${param.lcdm=='9407'}">
                                            预售商品房买卖预告及抵押权预告登记
                                        </c:if>
                                        <c:if test="${param.lcdm=='9403'}">
                                            其它类买卖预告登记
                                        </c:if>
                                        <c:if test="${param.lcdm=='9402'}">
                                            其它类抵押权预告登记
                                        </c:if>
                                        <c:if test="${param.lcdm=='9409'}">
                                            其它类买卖预告及抵押权预告登记
                                        </c:if>
                                    </span>
                                </li>
                                <li data-step="2" class="active">
                                    <span class="step">2</span>
                                    <span class="title">选择宗地信息</span>
                                </li>
                                <li data-step="3" class="active">
                                    <span class="step">3</span>
                                    <span class="title">选择不动产单元</span>
                                </li>
                                <li data-step="4" class="active">
                                    <span class="step">4</span>
                                    <span class="title">申请信息填写</span>
                                </li>
                                <li data-step="5">
                                    <span class="step">5</span>
                                    <span class="title">文件上传</span>
                                </li>
                                <li data-step="6">
                                    <span class="step">6</span>
                                    <span class="title">完成</span>
                                </li>

                            </ul>
                            <form class="">
                                <h4 class="blue">申请人信息</h4>
                                <div class="hr"></div>
                                <table class="table table-bordered" id="sqr_app">
                                    <tbody>
                                    <tr class="table_thead_tr">
                                        <th class="center">姓名</th>
                                        <th class="center">申请人类别</th>
                                        <th class="center">申请人类型</th>
                                        <th class="center">证件类型</th>
                                        <th class="center">证件号</th>
                                        <th class="center">联系方式</th>
                                        <th class="center">共有情况</th>
                                        <th class="center">操作</th>
                                    </tr>
                                    <tr v-for="(sqr,index) in sqrs">
                                        <td style="vertical-align: middle">
                                            <input v-model="sqr.sqrmc" name="sqrmc" class="myinput myrequird"
                                                   placeholder="姓名">
                                            <br>
                                            <button v-if="sqr.sqrlb==7"
                                                    @click="searchBank(index)"
                                                    type="button"
                                                    class="btn btn-white btn-default btn-round no-border">
                                                <i class="ace-icon fa fa-hand-o-right icon-animated-hand-pointer  red2"></i>
                                                查询银行
                                            </button>
                                        </td>
                                        <td style="vertical-align: middle" class="center">
                                            <select class="myrequird" name="sqrlb" v-model="sqr.sqrlb">
                                                <c:forEach items="${qlrlbs}" var="qlrlb">
                                                    <option value="${qlrlb.code}">${qlrlb.value}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td style="vertical-align: middle" class="center">
                                            <select class="myrequird" name="sqrlx" v-model="sqr.sqrlx">
                                                <c:forEach items="${qlrlxs}" var="qlrlx">
                                                    <option value="${qlrlx.code}">${qlrlx.value}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td style="vertical-align: middle">
                                            <select class="myrequird" name="sqrzjzl" v-model="sqr.sqrzjzl">
                                                <c:forEach items="${zjzls}" var="zjzl">
                                                    <option value="${zjzl.code}">${zjzl.value}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td style="vertical-align: middle">
                                            <input v-model="sqr.sqrzjh" class="myinput myrequird" placeholder="证件号">
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <input v-model="sqr.sqryddh" class="myinput" placeholder="移动电话">
                                        </td>
                                        <td style="vertical-align: middle" class="center">
                                            <select class="" name="gyfs" v-model="sqr.gyfs">
                                                <option value=""></option>
                                                <c:forEach items="${gyfss}" var="gyfs">
                                                    <option value="${gyfs.code}">${gyfs.value}</option>
                                                </c:forEach>
                                            </select>
                                            <span v-if="sqr.gyfs==2"><input style="width: 40px"
                                                                            class="myinput myrequird"
                                                                            v-model="sqr.qlbl">%</span>
                                        </td>
                                        <td style="width: 75px;vertical-align: middle">
                                            <div v-if="index==0">
                                                <div class="btn-blue" style="margin: 0; width: 80px" @click="addSqrRow">
                                                    <i class="ace-icon fa fa-plus white"></i>
                                                    &nbsp;添加
                                                </div>
                                            </div>
                                            <div v-else>
                                                <div class="btn-orange" style="margin: 0; width: 80px"
                                                     @click="deleteSqrRow(index)">
                                                    <i class="ace-icon fa fa-minus white"></i>
                                                    &nbsp;删除
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="row">
                                    <c:if test="${param.lcdm=='9407'||param.lcdm=='9409'}">
                                        <div class="btn-green pull-right" style="" onclick="createDyywr()">&nbsp;生成抵押义务人</div>
                                    </c:if>
                                </div>
                                <h4 class="blue">不动产单元</h4>
                                <div class="hr"></div>

                                <table class="table table-bordered" id="bdcdy_app">
                                    <tbody>
                                    <tr class="table_thead_tr">
                                        <th class="center width-40">不动产单元号</th>
                                        <th class="center width-40">坐落</th>
                                        <th class="center width-10">面积（㎡）</th>
                                        <%--<th class="center">操作</th>--%>
                                    </tr>

                                    <tr v-for="(bdcdy,index) in bdcdys">
                                        <td class="center">
                                            <%--<input class="myinput myrequird" @blur="checkBdcdy(index,bdcdy.bdcdyh)"
                                                   type="text" v-model="bdcdy.bdcdyh">--%>
                                            {{bdcdy.bdcdyh}}
                                        </td>
                                        <td class="center">
                                            {{bdcdy.zl}}
                                        </td>
                                        <td class="center">
                                            {{bdcdy.scjzmj}}
                                        </td>
                                        <%--<td style="width: 75px;vertical-align: middle">
                                            <div v-if="index==0">
                                                <div class="btn-blue" style="margin: 0; width: 80px" @click="addRow">
                                                    <i class="ace-icon fa fa-plus white"></i>
                                                    &nbsp;添加
                                                </div>
                                            </div>
                                            <div v-else>
                                                <div class="btn-orange" style="margin: 0; width: 80px"
                                                     @click="deleteRow(index)">
                                                    <i class="ace-icon fa fa-minus white"></i>
                                                    &nbsp;删除
                                                </div>
                                            </div>
                                        </td>--%>
                                    </tr>
                                    </tbody>
                                </table>
                                <%--<span class="orange">温馨提示：如果您还没有不动产单元号，请到行政服务中心权调科领取配号凭证！</span>--%>
                                <div class="hr"></div>
                                <div id="slsq_app">
                                    <c:if test="${param.lcdm=='9401'||param.lcdm=='9407'||param.lcdm=='9403'||param.lcdm=='9409'}">
                                        <h4 class="blue">买卖预告信息</h4>
                                        <div class="hr"></div>
                                        <div id="jyxx">
                                            <table class="table table-bordered">
                                                <tbody>
                                                <tr class="my-th">
                                                    <th class="center">合同编号：</th>
                                                    <th class="center">付款方式：</th>
                                                    <th class="center">交易金额（万元）：</th>
                                                </tr>
                                                <tr style="margin-bottom: 10px">
                                                        <%--<td class="width-20" style="padding-bottom: 20px"><span
                                                                class="pull-right">付款方式：</span>
                                                        </td>--%>
                                                    <td class="center" <%--class="width-30" style="padding-bottom: 20px"--%>>
                                                        <input v-model="slsq.htbh" type="text" class="myrequird"
                                                               id="htbh"
                                                               placeholder="合同编号">
                                                    </td>
                                                    <td class="center" <%--class="width-30" style="padding-bottom: 20px"--%>>
                                                        <select class="myrequird" style="width: 163px"
                                                                v-model="slsq.fkfs" id="fkfs">
                                                            <c:forEach items="${fkfss}" var="fkfs">
                                                                <option value="${fkfs.code}">${fkfs.value}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                        <%--<td class="width-20" style="padding-bottom: 20px"><span
                                                                class="pull-right">交易金额（万元）：</span>
                                                        </td>--%>
                                                    <td class="center" <%--class="width-30" style="padding-bottom: 20px"--%>>
                                                        <input v-model="slsq.jyje" type="number" class="myrequird"
                                                               id="jyje"
                                                               placeholder="交易金额">
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </c:if>
                                    <c:if test="${param.lcdm=='9405'||param.lcdm=='9407'||param.lcdm=='9402'||param.lcdm=='9409'}">
                                        <h4 class="blue">抵押权预告信息</h4>
                                        <div class="hr"></div>
                                        <table class="table table-bordered">
                                            <tbody>
                                            <tr class="my-th">
                                                <th class="center ">抵押合同编号</th>
                                                <th class="center ">抵押方式</th>
                                                <th class="center ">贷款类型</th>
                                                <th class="center ">被担保债权数额（万元）</th>
                                                <th class="center ">债权起始时间</th>
                                                <th class="center ">债权结束时间</th>
                                            </tr>
                                            <tr>
                                                <td class="center">
                                                    <input v-model="slsq.dyhtbh" type="text" class="myrequird"
                                                           id="dyhtbh"
                                                           placeholder="抵押合同编号">
                                                </td>
                                                <td class="center">
                                                    <select class="myrequird" style="width: 163px"
                                                            v-model="slsq.dyfs" id="dyfs">
                                                        <c:forEach items="${dyfss}" var="dyfs">
                                                            <option value="${dyfs.code}">${dyfs.value}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                <td class="center">
                                                    <select class="myrequird" style="width: 163px"
                                                            v-model="slsq.dklx" id="dklx">
                                                        <c:forEach items="${dklxs}" var="dklx">
                                                            <option value="${dklx.code}">${dklx.value}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                <td class="center">
                                                    <input v-model="slsq.bdbzqse" type="number" class="myrequird"
                                                           id="bdbzqse"
                                                           placeholder="被担保债权数额">
                                                </td>
                                                <td class="center">
                                                    <input v-model="slsq.zqqssj" class="input-sm myrequird" id="zqqssj"
                                                           type="text"
                                                           onblur="updateDate()"
                                                           onClick="WdatePicker({maxDate:'#F{$dp.$D(\'zqjssj\');}',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})">
                                                </td>
                                                <td class="center">
                                                    <input v-model="slsq.zqjssj" class="input-sm myrequird" id="zqjssj"
                                                           type="text"
                                                           onblur="updateDate()"
                                                           onClick="WdatePicker({minDate:'#F{$dp.$D(\'zqqssj\');}',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})">
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </c:if>
                                </div>
                                <div class="clearfix center">
                                    <div class="mybtn mybtn-large mybtn-orange" id="backBtn" onclick="back()">上一步</div>
                                    <div class="mybtn mybtn-large mybtn-info" id="nextBtn" onclick="next()">下一步</div>
                                </div>
                                <%--  <div class="btn-box">
                                      <div class="btn-green" onclick="step2()">下一步</div>
                                  </div>--%>
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
</div>
</body>
<script src="${contextPath}/resources/assets/js/jqPaginator.min.js"></script>
<script src="${contextPath}/resources/ysl/js/vue.js"></script>
<script>
    var sqr_app = new Vue({
        el: '#sqr_app',
        data: {
            sqrs: [{sqrmc: '', sqrlb: 9, sqrzjzl: 1, sqrlx: 1, sqryddh: '', sqrzjh: '', gyfs: '', qlbl: ''}]
        },
        methods: {
            addSqrRow: function () {
                sqr_app.sqrs.push({
                    sqrmc: '',
                    sqrlb: 9,
                    sqrlx: 1,
                    sqrzjzl: 1,
                    sqryddh: '',
                    sqrzjh: '',
                    gyfs: '',
                    qlbl: ''
                });
            },
            deleteSqrRow: function (i) {
                sqr_app.sqrs.splice(i, 1);
            },
            searchBank:function(i) {
                _dialog('${contextPath}/front/bank/bankPage?index='+i, "银行列表", 700, 600, function () {

                });
            }
        }
    });
    var bdcdy_app = new Vue({
        el: '#bdcdy_app',
        data: {
            bdcdys: [{bsm: '', bdcdyh: '', zl: '', scjzmj: ''}]
        },
        methods: {
            addRow: function () {
                bdcdy_app.bdcdys.push({bsm: '', bdcdyh: '', zl: '', scjzmj: ''});
            },
            deleteRow: function (i) {
                bdcdy_app.bdcdys.splice(i, 1);
            },
            checkBdcdy: function (i, bdcdyh) {
                if (bdcdyh.length > 18) {
                    _ajax_get("${contextPath}/front/fwmm/checkBdcdyh?bdcdyh=" + bdcdyh, function (result) {
                        if (result.ret == 1) {
                            bdcdy_app.bdcdys[i].bsm = result.bdcdy.bsm;
                            bdcdy_app.bdcdys[i].scjzmj = result.bdcdy.scjzmj;
                            bdcdy_app.bdcdys[i].zl = result.bdcdy.zl;
                        } else if (result.ret == 0) {
                            _alert(result.msg);
                        }
                    });
                } else {
//                    bdcdy_app.bdcdys[i].bdcdyh = '';
                    _tips("您输入的不动产单元号有误，请检查", 2);
                }

            }

        }
    });
    var slsq_app = new Vue({
        el: '#slsq_app',
        data: {
            slsq: {}
        },
        methods: {
            addSqrRow: function () {
                sqr_app.sqrs.push({});
            },
            deleteSqrRow: function (i) {
                sqr_app.sqrs.splice(i, 1);
            }
        }
    });
    $(function () {
        _ajax_get('${contextPath}/front/ygdj/getSlsqMsg?yslywh=${param.yslywh}&lcdm=${param.lcdm}&dybsms=${param.dybsms}', function (result) {
            if (result.ret == 1) {
                var houseList = result.houseList;
                if (houseList.length > 0) {
                    bdcdy_app.bdcdys.splice(0, bdcdy_app.bdcdys.length);
                }
                $.each(houseList, function (index, obj) {
                    var bdcdy = {
                        bsm: obj.bsm,
                        scjzmj: obj.scjzmj,
                        zl: obj.zl,
                        bdcdyh: obj.bdcdyh
                    };
                    bdcdy_app.bdcdys.push(bdcdy);
                });
                var sqrs = result.sqrs;
                if (sqrs.length > 0) {
                    sqr_app.sqrs.splice(0, sqr_app.sqrs.length);
                }
                $.each(sqrs, function (index, obj) {
                    sqr_app.sqrs.push(obj);
                });
                if (result.slsq.zt == 3 || result.slsq.zt == 4 || result.slsq.zt == 5) {
                    _tips("很抱歉，该办件申请状态不可编辑，正为您跳转到查看页面");
                    window.location.href = '${contextPath}/front/bjjd/show?yslywh=${param.yslywh}&lcdm=${param.lcdm}'
                }

                if ('${param.lcdm}' == '9401' || '${param.lcdm}' == '9407'||'${param.lcdm}' == '9403' || '${param.lcdm}' == '9409') {
                    if (result.slsq.fkfs == null || result.slsq.fkfs == '') {
                        result.slsq.fkfs = 2;
                    }
                }
                if ('${param.lcdm}' == '9405' || '${param.lcdm}' == '9407'||'${param.lcdm}' == '9402' || '${param.lcdm}' == '9409') {
                    if (result.slsq.dyfs == null || result.slsq.dyfs == '') {
                        result.slsq.dyfs = 1;
                    }
                    if (result.slsq.dklx == null || result.slsq.dklx == '') {
                        result.slsq.dklx = 1;
                    }
                }
                slsq_app.slsq = result.slsq;
            } else {
                _alert(result.msg);
            }
        });
    });
    function next() {
        var flag = validateForm();
        var dybsms = "";
        $.each(bdcdy_app.bdcdys, function (index, bdcdy) {
            if (bdcdy.bsm.length == 0) {
                _tips("请输入正确的不动产单元", "2");
                flag = false;
            }
            dybsms += bdcdy.bsm + ",";
        });
        dybsms = dybsms.substring(0, dybsms.length - 1);
        if (flag) {
            var url = '${contextPath}/front/slsq/saveSQXXCommon';
            var data = {
                dybsms: dybsms,
                yslywh: '${param.yslywh}',
                sqrs: sqr_app.sqrs,
                slsq: slsq_app.slsq,
                lcdm: '${param.lcdm}'
            };
            _ajax_json_post(url, data, function (result) {
                if (result) {
                    if (result.ret == 1) {
                        window.location.href = '${contextPath}/front/ygdj/step4?yslywh=${param.yslywh}&lcdm=${param.lcdm}';
                    } else {
                        _alert(result.msg);
                    }
                }
            })
        }
    }
    function validateForm() {
        var flag = true;
        if ('${param.lcdm}' == '9401'||'${param.lcdm}' == '9403') {
            if (!existSqrlb("9")) {
                _alert("请添加预告权利人");
                return false;
            }
            if (!existSqrlb("10")) {
                _alert("请添加预告义务人");
                return false;
            }
        } else if ('${param.lcdm}' == '9405'||'${param.lcdm}' == '9402') {
            if (!existSqrlb("4")) {
                _alert("请添加债务人");
                return false;
            }
            if (!existSqrlb("8")) {
                _alert("请添加抵押义务人");
                return false;
            }
            if (!existSqrlb("7")) {
                _alert("请添加抵押权利人");
                return false;
            }
        } else if ('${param.lcdm}' == '9407'||'${param.lcdm}' == '9409') {
            if (!existSqrlb("4")) {
                _alert("请添加债务人");
                return false;
            }
            if (!existSqrlb("9")) {
                _alert("请添加预告权利人");
                return false;
            }
            if (!existSqrlb("10")) {
                _alert("请添加预告义务人");
                return false;
            }
            if (!existSqrlb("8")) {
                _alert("请添加抵押义务人");
                return false;
            }
            if (!existSqrlb("7")) {
                _alert("请添加抵押权利人");
                return false;
            }
        }
        var ygqlrgyfs = null;
        var dyqlrgyfs = null;
        var ddgycount = 0;
        var ddsyArray = new Array();
        for(var k=0;k<17;k++){
            ddsyArray[k]=0;
        }
        $.each(sqr_app.sqrs, function (index, sqr) {
            if (sqr.sqrmc.length == 0) {
                _tips("请输入申请人名称", "2");
                flag = false;
            }
            if (sqr.sqrzjh.length == 0) {
                _tips("请输入证件号", "2");
                flag = false;
            }
            if (sqr.sqrzjzl == 1) {
                var value = sqr.sqrzjh;
                if (!IdCardValidate(value)) {
                    _tips("身份证号码有误", "2");
                    flag = false;
                }
            }
            if (sqr.sqrzjzl == null || sqr.sqrzjzl.length == 0) {
                _tips("请选择证件类型", "2");
                flag = false;
            }
            if (sqr.sqrlx == null || sqr.sqrlx.length == 0) {
                _tips("请选择申请人类型", "2");
                flag = false;
            }
            if (sqr.gyfs != null && sqr.gyfs == 2) {
                if(sqr.qlbl ==null || sqr.qlbl.length ==0 ) {
                    _tips("请输入权利比例", "2");
                    flag = false;
                }
            }
            if (sqr.gyfs != null && sqr.gyfs != '' && sqr.gyfs == 0) {
                var arrIndex = parseInt(sqr.sqrlb) -1;
                ddsyArray[arrIndex] = ddsyArray[arrIndex] + 1;
//                ddgycount ++ ;
            }
            if (sqr.sqrlb == 9) {
                if (sqr.gyfs == null || sqr.gyfs.length == 0) {
                    _tips("请选择预告权利人的共有方式", "2");
                    flag = false;
                } else {
                    if (ygqlrgyfs == null) {
                        ygqlrgyfs = sqr.gyfs;
                    } else {
                        if (ygqlrgyfs != sqr.gyfs) {
                            _tips("您选择的预告权利人的共有方式不同，请重新选择", "2");
                            flag = false;
                        }
                    }
                }
            }
            if (sqr.sqrlb == 7) {
                if (sqr.gyfs == null || sqr.gyfs.length == 0) {
                    /*_tips("请选择预告权利人的共有方式", "2");
                    flag = false;*/
                } else {
                    if (dyqlrgyfs == null) {
                        dyqlrgyfs = sqr.gyfs;
                    } else {
                        if (dyqlrgyfs != sqr.gyfs) {
                            _tips("您选择的抵押权利人的共有方式不同，请重新选择", "2");
                            flag = false;
                        }
                    }
                }
            }
        });
        /*if(ddgycount>1) {
            _tips("共有方式有误，请检查");
            flag = false;
        }*/
        $.each(ddsyArray, function (index, obj) {
            if(obj>1){
                _tips("共有方式有误，请检查");
                flag = false;
                return false;
            }
        });
        if (!flag) {
            return flag;
        }
        var slsq = slsq_app.slsq;
        if ('${param.lcdm}' == '9401' || '${param.lcdm}' == '9407'||'${param.lcdm}' == '9403' || '${param.lcdm}' == '9409') {
            if (slsq.fkfs == null || slsq.fkfs.length == 0) {
                _tips("请选择付款方式", "2");
                flag = false;
            } else if (slsq.jyje == null || slsq.jyje.length == 0) {
                _tips("请输入交易金额", "2");
                flag = false;
            } else if (slsq.jyje <= 0) {
                _tips("交易金额不能为负数", "2");
                flag = false;
            } else if (slsq.htbh == null || slsq.htbh.length == 0) {
                _tips("请输入合同编号", "2");
                flag = false;
            }
        }
        if ('${param.lcdm}' == '9405' || '${param.lcdm}' == '9407'||'${param.lcdm}' == '9402' || '${param.lcdm}' == '9409') {
            if (slsq.dyhtbh == null || slsq.dyhtbh.length == 0) {
                _tips("请输入抵押合同编号", "2");
                flag = false;
            } else if (slsq.dyfs == null || slsq.dyfs.length == 0) {
                _tips("请选择抵押方式", "2");
                flag = false;
            } else if (slsq.dklx == null || slsq.dklx.length == 0) {
                _tips("请选择贷款类型", "2");
                flag = false;
            } else if (slsq.bdbzqse == null || slsq.bdbzqse.length == 0) {
                _tips("请输入被担保债权数额", "2");
                flag = false;
            } else if (slsq.bdbzqse <= 0) {
                _tips("担保债权数额不能为负数", "2");
                flag = false;
            } else if (slsq.zqqssj == null || slsq.zqqssj.length == 0) {
                _tips("请输入债权起始时间", "2");
                flag = false;
            } else if (slsq.zqjssj == null || slsq.zqjssj.length == 0) {
                _tips("请输入债权结束时间", "2");
                flag = false;
            }
        }
        return flag;
    }
    function existSqrlb(sqrlb) {
        var flag = false;
        $.each(sqr_app.sqrs, function (index, sqr) {
            if (sqr.sqrlb == sqrlb) {
                flag = true;
            }
        });
        return flag;
    }
    function updateDate() {
        if ('${param.lcdm}' == '9405' || '${param.lcdm}' == '9407'||'${param.lcdm}' == '9402' || '${param.lcdm}' == '9409') {
            slsq_app.slsq.zqqssj = $("#zqqssj").val();
            slsq_app.slsq.zqjssj = $("#zqjssj").val();
        }
    }
    function back() {
        window.location.href = '${contextPath}/front/ygdj/step1?yslywh=${param.yslywh}&lcdm=${param.lcdm}';
    }
    function getBankSqr(sqrIndex,bank) {
        sqr_app.sqrs[sqrIndex].sqrmc = bank.qlrmc;
        sqr_app.sqrs[sqrIndex].sqrlx = 2;
        sqr_app.sqrs[sqrIndex].sqrzjzl = bank.zjzl;
        sqr_app.sqrs[sqrIndex].sqrzjh = bank.zjh;
        sqr_app.sqrs[sqrIndex].sqryddh = bank.lxdh;
    }
    function createDyywr() {
        var hasygqlr = false;
        $.each(sqr_app.sqrs, function (index, obj) {
            if(obj.sqrlb=='9'){
                hasygqlr = true;
                var ygqlr = {
                    sqrmc: obj.sqrmc,
                    sqrlx: obj.sqrlx,
                    sqrlb: '8',
                    sqrzjzl: obj.sqrzjzl,
                    sqrzjh: obj.sqrzjh,
                    sqryddh: obj.sqryddh,
                    gyfs: obj.gyfs,
                    qlbl: obj.qlbl
                };
                sqr_app.sqrs.push(ygqlr);
            }
        });
        if (!hasygqlr) {
            _tips("请先添加预告权利人");
        }
    }
</script>
</html>

