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
</style>
<body style="background-color: white;min-width: inherit; overflow: auto">
<%--<%@include file="../../layout/front/header.jsp" %>--%>
<div class="main-contain col-sm-12">
    <div class="tabbable">
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a data-toggle="tab" href="#sqxx" onclick="changeIframeHeight('sqxx');" aria-expanded="true">
                    <i id="icon_sqxx" class="grey ace-icon fa fa-credit-card bigger-120"></i>
                    <%--<i class="green ace-icon fa fa-credit-card bigger-120"></i>--%>
                    申请信息
                </a>
            </li>

            <li class="">
                <a data-toggle="tab" href="#datum" onclick="getDatum()" aria-expanded="false">
                    <i id="icon_datum" class="grey ace-icon fa fa-upload bigger-120"></i>
                    <%--<i class="green ace-icon fa fa-upload bigger-120"></i>--%>
                    资料确认
                </a>
            </li>

        </ul>

        <div class="tab-content">
            <div id="sqxx" class="tab-pane fade active in">
                <div style="margin-top: 20px" class="alert alert-info">
                    <%--<button class="close" data-dismiss="alert">
                        <i class="ace-icon fa fa-times"></i>
                    </button>--%>
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
                            </td>
                            <td class="center">
                                {{sqr.sqryddh}}
                            </td>
                            <td class="center">
                                {{sqr.sqrgddh}}
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
                        <div class="mybtn mybtn-large mybtn-info" id="saveSqxx" onclick="saveSqxx()">保存申请信息</div>
                    </div>
                </form>
            </div>
            <div id="datum" class="tab-pane fade">
                <div style="margin-top: 20px" class="alert alert-info">
                    <%--<button class="close" data-dismiss="alert">
                        <i class="ace-icon fa fa-times"></i>
                    </button>--%>
                    <span class="orange">温馨提示：</span>以下选择的材料为该办件的必备材料，若现场提供的材料与外网预受理选择的材料不相符或者缺少造成的办件失败或超期后果由申请人自负。
                </div>
                <%--<div class="load-table" id="datum_app">
                    <table>
                        <tr>
                            <th width="40px">序号</th>
                            <th>材料名称</th>
                            <th width="140px">原件份数</th>
                            <th width="140px">复印件份数</th>
                            <th width="80px">要求</th>
                            <th width="246px">状态</th>
                        </tr>
                        <tr v-for="(datum,index) in datums">
                            <td>{{index+1}}</td>
                            <td>{{datum.datumName}}</td>
                            <td>{{datum.originalNumber}}</td>
                            <td>{{datum.copyNumber}}</td>
                            <td>
                                <span v-if="datum.receiveType =='NotSelected'">其他</span>
                                <span class="blue" v-if="datum.receiveType =='Selected'">可选</span>
                                <span class="orange" v-if="datum.receiveType =='MustSelected'">必选</span>
                            </td>
                            <td>
                                <input v-if="datum.status == true" name="status" :value="datum.datumGuid"
                                       type="checkbox" checked/>
                                <input v-if="datum.status == false" name="status" :value="datum.datumGuid"
                                       type="checkbox"/>
                            </td>
                        </tr>
                    </table>
                </div>--%>
                <div class="load-table" id="datum_app">
                    <table>
                        <tr>
                            <th width="40px">序号</th>
                            <th>材料名称</th>
                            <th width="140px">原件份数</th>
                            <th width="140px">复印件份数</th>
                            <th width="80px">要求</th>
                            <th width="">状态</th>
                            <th width="246px">操作</th>
                        </tr>
                        <tr v-for="(datum,index) in datums">
                            <td>{{index+1}}</td>
                            <td>{{datum.datumName}}</td>
                            <td>{{datum.originalNumber}}</td>
                            <td>{{datum.copyNumber}}</td>
                            <td>
                                <span v-if="datum.receiveType =='NotSelected'">其他</span>
                                <span class="blue" v-if="datum.receiveType =='Selected'">可选</span>
                                <span class="orange" v-if="datum.receiveType =='MustSelected'">必选</span>
                            </td>
                            <td>
                                <input v-if="datum.status == true" name="status" :value="datum.datumGuid"
                                       type="checkbox" checked/>
                                <input v-if="datum.status == false" name="status" :value="datum.datumGuid"
                                       type="checkbox"/>
                            </td>
                            <td><a href="#" @click="openPage(datum.id)" class="blue">上传</a>
                                <a href="#" @click="preview(datum.datumGuid)" class="bulegreen">预览</a></td>
                        </tr>

                    </table>
                </div>
                <div class="clearfix center">
                    <div class="mybtn mybtn-large mybtn-info" id="saveDatum" onclick="saveDatum()">保存资料</div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script src="${contextPath}/resources/assets/js/jqPaginator.min.js"></script>
<script src="${contextPath}/resources/ysl/js/vue.js"></script>
<script>
    var sqxxState = false;
    var datumState = false;
    var sqr_app = new Vue({
        el: '#sqr_app',
        data: {
            sqrs: [{sqrmc: '', sqrlb: 1, sqrzjzl: 1,sqrlx:'', sqryddh: '', sqrzjh: '', gyfs: '', qlbl: ''}]
        },
        methods: {
            addSqrRow: function () {
                sqr_app.sqrs.push({sqrmc: '', sqrlb: 1, sqrzjzl: 1,sqrlx:'',sqryddh: '', sqrzjh: '', gyfs: '', qlbl: ''});
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
    var datum_app = new Vue({
        el: '#datum_app',
        data: {
            datums: []
        },
        methods: {
            openPage: function (datumId) {
                var url = '${contextPath}/file/uploadPage?yslywh=${param.yslywh}&datumId=' + datumId;
                _dialog(url, "文件上传", 500, 350, function () {
                    getDate();
                });
            },
            preview: function (datumId) {
                var url = '${contextPath}/file/galleryPage?yslywh=${param.yslywh}&datumId=' + datumId;
                _dialog(url, "文件查看", 800, 500, function () {
                    getDate();
                });
            }
        }
    });
    $(function () {
        _ajax_get('${contextPath}/front/fdzhdj/getSlsqMsg?yslywh=${param.yslywh}&dybsms=${param.dybsms}&lcdm=${param.lcdm}', function (result) {
            if(result.ret==1) {
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
            changeIframeHeight("sqxx");
        });
    });
    function updateDate() {
        if ('${param.lcdm}' == '2701') {
            slsq_app.slsq.zqqssj = $("#zqqssj").val();
            slsq_app.slsq.zqjssj = $("#zqjssj").val();
        }
    }

    function saveSqxx() {
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
                        if (!sqxxState) {
                            $("#icon_sqxx").removeClass("grey");
                            $("#icon_sqxx").addClass("blue");
                            sqxxState = true;
                        }
                        if (sqxxState && datumState) {
                            parent.changeState("icon_" +${param.dybsms});
                        }
                        _tips("保存成功")
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


    function getDatum() {
        if (datum_app.datums.length == 0) {
            _ajax_get("${contextPath}/file/getDatum?lcdm=${param.lcdm}&yslywh=${param.yslywh}&datumsortName="+encodeURIComponent("预转现"), function (result) {
                datum_app.datums.splice(0, datum_app.datums.length);
                $.each(result, function (index, obj) {
                    datum_app.datums.push(obj);
                });
                changeIframeHeight("datum");
            });
        } else {
            changeIframeHeight("datum");
        }
    }
    function saveDatum() {
        var guids = '';
        var datumsortName = datum_app.datums[0].datumsortName;
        $('input[name="status"]:checked').each(function () {
            guids += $(this).val() + ',';
        });
        guids = guids.substring(0, guids.length - 1);
        var data = {
            yslywh: '${param.yslywh}',
            datumsortName: datumsortName,
            datumGuid: guids
        };
        _ajax_post("${contextPath}/front/slsq/saveSlsqDatum", data, function (result) {
            if (result) {
                if (!datumState) {
                    $("#icon_datum").removeClass("grey");
                    $("#icon_datum").addClass("blue");
                    datumState = true;
                }
                if (sqxxState && datumState) {
                    parent.changeState("icon_" +${param.dybsms});
                }
                _tips("保存成功")
            } else {
                _alert("服务器出错");
            }
        });

    }
    function changeIframeHeight(type) {
        <%--var main = $(window.parent.document).find("#iframe_${param.dybsms}");--%>
        var thisheight = 0;
        if (type == "sqxx") {
            thisheight = 715 + sqr_app.sqrs.length * 35 + bdcdy_app.bdcdys.length * 35;
            if(${param.lcdm=='2705'}) {
                thisheight-=150;
            }
        } else if (type == "datum") {
            thisheight = 231 + (datum_app.datums.length + 1) * 40;
        }
//        main.height(thisheight);
        parent.changeHeight("iframe_${param.dybsms}", thisheight);
    }
</script>
</html>

