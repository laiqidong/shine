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

    .input-icon > .ace-icon {
        font-size: 13px;
    }

    .table th {
        background-color: #d9edf7;
        color: #31708f;
    }

    .styled-select {

    }

    .dis-select {
        /*width: 240px;*/
        /*height: 34px;*/
        overflow: hidden;
        background: transparent;
        padding: 5px;
        border: 0 solid #ccc;
        -webkit-appearance: none;
        color: black;
    }
</style>
<body >
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
                                    <span class="title">文件确认</span>
                                </li>
                                <li data-step="6">
                                    <span class="step">6</span>
                                    <span class="title">完成</span>
                                </li>

                            </ul>
                            <div style="margin-top: 20px" class="alert alert-info">
                                <button class="close" data-dismiss="alert">
                                    <i class="ace-icon fa fa-times"></i>
                                </button>
                                <span class="orange"> 温馨提示：</span>请检查以下信息，如对以下信息存在异议，请与不动登记中心联系。
                            </div>
                            <form class="">
                                <h4 class="blue">申请人信息</h4>
                                <div class="hr"></div>
                                <table class="table table-bordered" id="sqr_app">
                                    <tbody>
                                    <tr class="table_thead_tr">
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
                                            <u class="orange" v-if="sqr.gyfs==2&&sqr.qlrlb!=null">
                                                {{sqr.qlbl}}%
                                            </u>
                                            <u class="orange" v-if="sqr.gyfs==2&&sqr.qlrlb==null">
                                                <input style="width: 40px"
                                                       class="myinput myrequird"
                                                       v-model="sqr.qlbl">%
                                            </u>

                                        </td>
                                        <%--<td style="width: 75px;vertical-align: middle">
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
                                        </td>--%>
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
                                            {{bdcdy.ycjzmj}}
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div id="slsq_app">
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
                                                <select class="myrequird" style="width: 163px"
                                                        v-model="slsq.qdfs" id="qdfs">
                                                    <c:forEach items="${qdfss}" var="qdfs">
                                                        <option value="${qdfs.code}">${qdfs.value}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <td class="center">
                                                <%--{{slsq.fkfsmc}}--%>
                                                <select class="myrequird" style="width: 163px"
                                                        v-model="slsq.fkfs" id="fkfs">
                                                    <c:forEach items="${fkfss}" var="fkfs">
                                                        <option value="${fkfs.code}">${fkfs.value}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <td class="center">
                                                <input type="text" v-model="slsq.htbh" class=" myrequird"
                                                       id="htbh"
                                                       placeholder="交易合同编号">
                                            </td>
                                            <td class="center">
                                                <input v-model="slsq.jyje" type="number" class="myrequird"
                                                       id="jyje"
                                                       placeholder="交易金额">
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <c:if test="${param.lcdm=='2701'}">
                                        <h4 class="blue">抵押信息</h4>
                                        <div class="hr"></div>
                                        <table class="table table-bordered">
                                            <tbody>
                                            <tr class="my-th">
                                                <th class="center width-25">抵押方式</th>
                                                <th class="center width-25">被担保债权数额（万元）</th>
                                                <th class="center width-25">债权起始时间</th>
                                                <th class="center width-25">债权结束时间</th>
                                            </tr>
                                            <tr>
                                                <td class="center">
                                                    <select class="myrequird" style="width: 163px"
                                                            v-model="slsq.dyfs" id="dyfs">
                                                        <c:forEach items="${dyfss}" var="dyfs">
                                                            <option value="${dyfs.code}">${dyfs.value}</option>
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
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../../layout/front/footer.jsp" %>
</body>
<script src="${contextPath}/resources/assets/js/jqPaginator.min.js"></script>
<script src="${contextPath}/resources/ysl/js/vue.js"></script>
<script>
    var sqr_app = new Vue({
        el: '#sqr_app',
        data: {
            sqrs: [{sqrmc: '', sqrlb: 1, sqrzjzl: 1,sqrlx: '', sqryddh: '', sqrzjh: '', gyfs: '', qlbl: ''}]
        },
        methods: {
            addSqrRow: function () {
                sqr_app.sqrs.push({sqrmc: '', sqrlb: 1, sqrzjzl: 1,sqrlx: '', sqryddh: '', sqrzjh: '', gyfs: '', qlbl: ''});
            },
            deleteSqrRow: function (i) {
                sqr_app.sqrs.splice(i, 1);
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
    var bdcdy_app = new Vue({
        el: '#bdcdy_app',
        data: {
            bdcdys: []
        }
    });
    $(function () {
        _ajax_get('${contextPath}/front/fdzhdj/getSlsqMsg?yslywh=${param.yslywh}&dybsms=${param.dybsms}&lcdm=${param.lcdm}', function (result) {
            if(result.ret==1) {
                var sqrs = result.sqrs;
                var houses = result.houses;
                if (sqrs.length > 0) {
                    sqr_app.sqrs.splice(0, sqr_app.sqrs.length);
                }else{
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
                        ycjzmj:obj.ycjzmj
                    };
                    bdcdy_app.bdcdys.push(bdcdy);
                });
                if (result.slsq.zt == 2 || result.slsq == 3 || result.slsq == 4 || result.slsq == 5) {
                    _tips("很抱歉，该办件申请状态不可编辑，正为您跳转到查看页面");
                    window.location.href = '${contextPath}/front/fdzhdj/yzxShow?yslywh=${param.yslywh}&lcdm=${param.lcdm}'
                }
                if (result.slsq.qdfs == null || result.slsq.qdfs == '') {
                    result.slsq.qdfs = 2;
                }
                if (result.slsq.fkfs == null || result.slsq.fkfs == '') {
                    result.slsq.fkfs = 2;
                }
                if ('${param.lcdm}' == '2701') {
                    if (result.slsq.zqqssj != null && result.slsq.zqqssj != "") {
                        result.slsq.zqqssj = result.slsq.zqqssj.substring(0, 10);
                    } else {
                        result.slsq.zqqssj = '';
                    }

                    if (result.slsq.zqjssj != null && result.slsq.zqjssj != "") {
                        result.slsq.zqjssj = result.slsq.zqjssj.substring(0, 10);
                    } else {
                        result.slsq.zqjssj = '';
                    }
                    if (result.slsq.dyfs == null || result.slsq.dyfs == '') {
                        result.slsq.dyfs = 1;
                    }
                }
                slsq_app.slsq = result.slsq;
            }else{
                _alert(result.msg);
            }
        });
    });
    function updateDate() {
        if ('${param.lcdm}' == '2701') {
            slsq_app.slsq.zqqssj = $("#zqqssj").val();
            slsq_app.slsq.zqjssj = $("#zqjssj").val();
        }
    }
    function back() {
        window.location.href = '${contextPath}/front/fdzhdj/yzxStep1?yslywh=${param.yslywh}&lcdm=${param.lcdm}'
    }
    function next() {
        if ('${param.lcdm}' == '2701') {
            slsq_app.slsq.zqqssj = $("#zqqssj").val();
            slsq_app.slsq.zqjssj = $("#zqjssj").val();
        }
        var flag = validateForm();
        if (flag) {
            var url = '${contextPath}/front/slsq/saveSQXX';
            var data = {
                dybsms: '${param.dybsms}',
                yslywh: '${param.yslywh}',
                sqrs: sqr_app.sqrs,
                slsq: slsq_app.slsq
            };
            _ajax_json_post(url, data, function (result) {
                 if (result) {
                    if (result.ret == 1) {
                        window.location.href = '${contextPath}/front/fdzhdj/yzxStep4?yslywh=${param.yslywh}&lcdm=${param.lcdm}';
                    } else {
                        _alert(result.msg);
                    }
                }
            })
        }
    }
    function validateForm() {
        var flag = true;
        $.each(sqr_app.sqrs, function (index, sqr) {
            if (sqr.gyfs != 2) {
                sqr.qlbl = '';
            } else {
                if (sqr.qlbl.length == 0) {
                    _tips("请输入权利比例", "2");
                    flag = false;
                }
            }
            if (sqr.sqrmc.length == 0) {
                _tips("请输入申请人名称", "2");
                flag = false;
            } /*else if (sqr.sqryddh.length == 0) {
             _tips("请输入申请人联系方式", "2");
             flag = false;
             }*/ else if (sqr.sqrzjh.length == 0) {
                _tips("请输入证件号", "2");
                flag = false;
            } else if (sqr.sqrzjzl == 1) {
                var value = sqr.sqrzjh;
                /*if (!IdCardValidate(value)) {
                 _tips("身份证号码有误", "2");
                 flag = false;
                 }*/
            }
            if (sqr.gyfs == 2) {
                if (sqr.qlbl.length == 0) {
                    _tips("请输入权利比例", "2");
                    flag = false;
                }
            }
        });
        var slsq = slsq_app.slsq;
        if (slsq.qdfs == null || slsq.qdfs.length == 0) {
            _tips("请选择取得方式", "2");
            flag = false;
        } else if (slsq.fkfs == null || slsq.fkfs.length == 0) {
            _tips("请选择付款方式", "2");
            flag = false;
        } else if (slsq.htbh == null || slsq.htbh.length == 0) {
            _tips("请输入交易合同编号", "2");
            flag = false;
        } else if (slsq.jyje == null || slsq.jyje.length == 0) {
            _tips("请输入交易金额", "2");
            flag = false;
        }
        if ('${param.lcdm}' == '2701') {
            if (slsq.dyfs == null || slsq.dyfs.length == 0) {
                _tips("请选择抵押方式", "2");
                flag = false;
            } else if (slsq.bdbzqse == null || slsq.bdbzqse.length == 0) {
                _tips("请输入被担保债权数额", "2");
                flag = false;
            }else if (slsq.bdbzqse <= 0) {
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
</script>
</html>

