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
                                    <span class="title">房屋买卖</span>
                                </li>
                                <li data-step="2" class="active">
                                    <span class="step">2</span>
                                    <span class="title">申请信息填写</span>
                                </li>
                                <li data-step="3" class="active">
                                    <span class="step">3</span>
                                    <span class="title">文件上传</span>
                                </li>
                                <li data-step="4" class="active">
                                    <span class="step">4</span>
                                    <span class="title">完成</span>
                                </li>

                            </ul>
                            <div class="center">

                                <h1 class="grey lighter smaller">
											<span class="blue bigger-125">
												<i class="ace-icon glyphicon glyphicon-ok"></i>
											</span>
                                    恭喜您,您的信息已录入完成！
                                </h1>

                                <hr>
                                <h4 class="lighter smaller">
                                    您的业务编号为：${param.yslywh}
                                </h4>
                                <h4 class="lighter smaller">
                                    请点击下面关闭按钮结束本操作
                                </h4>
                                <div class="space"></div>
                                <hr>
                            </div>
                            <div class="clearfix center">
                                <div class="mybtn mybtn-large mybtn-orange" style="height: 50px;line-height: 48px" id="backBtn" onclick="finish()">提交审核</div>
                                <%--<div class="mybtn mybtn-large mybtn-info" id="nextBtn" onclick="step4()">打印预览</div>--%>
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
    function finish() {
        _confirm("提交完成后，不能再修改，请确认！", function () {
            _ajax_get("${contextPath}/front/slsq/finish?yslywh=${param.yslywh}", function (result) {
                if (result) {
                    _alert("提交成功");
                    window.location.href = '${contextPath}/front/home'
                } else {
                    _alert("操作失败");
                }
            });
        },function() {
        });
    }
</script>
</html>
