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
<style>
    .btn i {
        vertical-align: middle;
    }
</style>
<body >
<div id="barrierfree_container">
    <!--top-->
    <%@include file="../../layout/front/header.jsp" %>
    <!--主体-->
    <div class="yhzx_all" style="/*position:relative;padding-top:110px; */">
        <div class="yhzx_main" style="/*margin-top: 35px;*/">
            <div class="yhzx_r1">
                <%--<%@include file="../layout/front/sider.jsp" %>--%>

                <div class="c2" style="margin-left: 0;">
                    <div style="background-color:#ffffff; overflow:hidden;padding: 10px 0">
                        <div class="col-xs-12">
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
                                <li data-step="5" class="active">
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
                                            <input v-if="datum.status == true" name="status" :value="datum.datumGuid" type="checkbox" checked/>
                                            <input v-if="datum.status == false" name="status" :value="datum.datumGuid" type="checkbox"/>
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
                                <div class="mybtn mybtn-large mybtn-orange" id="backBtn" onclick="step3()">上一步</div>
                                <div class="mybtn mybtn-large mybtn-info" id="nextBtn" onclick="step5()">下一步</div>
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
    </div>
</div>
<%@include file="../../layout/front/footer.jsp" %>
</body>
<script src="${contextPath}/resources/ysl/js/vue.js"></script>
<script src="${contextPath}/resources/ssi/js/ssi-uploader.js"></script>
<script>
    var datum_app = new Vue({
        el: '#datum_app',
        data: {
            datums: [

            ]
        },
        methods: {
            openPage: function (datumId) {
                var url = '${contextPath}/file/uploadPage?yslywh=${param.yslywh}&datumId='+datumId;
                _dialog(url, "文件上传", 500, 350, function () {
                    getDate();
                });
            },
            preview:function (datumId) {
                var url = '${contextPath}/file/galleryPage?yslywh=${param.yslywh}&datumId='+datumId;
                _dialog(url, "文件查看", 800, 500, function () {
                    getDate();
                });
            }
        }
    });
    $(function () {
        getDate()
    });
    function getDate(){
        _ajax_get("${contextPath}/file/getDatum?lcdm=${param.lcdm}&yslywh=${param.yslywh}&datumsortName="+encodeURIComponent("预转现"), function (result) {
            datum_app.datums.splice(0, datum_app.datums.length);
            $.each(result,function(index,obj) {
                datum_app.datums.push(obj);
            })
        });
    }
    function step3() {
        window.location.href = "${contextPath}/front/fdzhdj/yzxStep3?yslywh=${param.yslywh}&lcdm=${param.lcdm}";
    }
    function step5() {
        var guids ='';
        var datumsortName = datum_app.datums[0].datumsortName;
        $('input[name="status"]:checked').each(function(){
            guids += $(this).val()+',';
        });
        guids = guids.substring(0, guids.length - 1);
        var data = {
            yslywh:'${param.yslywh}',
            datumsortName:datumsortName,
            datumGuid:guids
        };
        _ajax_post("${contextPath}/front/slsq/saveSlsqDatum",data, function (result) {
           if(result) {
               window.location.href = "${contextPath}/front/fdzhdj/yzxStep5?yslywh=${param.yslywh}&lcdm=${param.lcdm}";
           }else {
               _alert("服务器出错");
           }
        });

    }
</script>
</html>
