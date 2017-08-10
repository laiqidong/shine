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
                                    <span class="title">
                                        房地首次登记
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
                                            <th class="center  width-25">开发商名称</th>
                                            <th class="center  width-25">项目名称</th>
                                            <th class="center  width-25">预售许可证</th>
                                            <th class="center  width-25">土地证号</th>
                                        </tr>
                                        <tr>
                                            <td class="center">

                                            </td>
                                            <td class="center">

                                            </td>
                                            <td class="center">

                                            </td>
                                            <td class="center">
                                                <input v-model="slsq.jyje" type="number" class="myrequird"
                                                       id="jyje"
                                                       placeholder="交易金额">
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
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
        _ajax_get('${contextPath}/front/fddj/getSlsqMsg?yslywh=${param.yslywh}&dybsms=${param.dybsms}&lcdm=${param.lcdm}', function (result) {
            if(result.ret==1) {
                var sqrs = result.sqrs;
                if (sqrs.length > 0) {
                    sqr_app.sqrs.splice(0, sqr_app.sqrs.length);
                }else{
                    _alert("很抱歉，未找到该单元的权利人，请与不动登记中心联系。")
                }
                $.each(sqrs, function (index, obj) {
                    sqr_app.sqrs.push(obj);

                });
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

