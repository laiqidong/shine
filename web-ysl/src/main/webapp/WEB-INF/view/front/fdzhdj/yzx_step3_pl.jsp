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

    .input-icon > .ace-icon {
        font-size: 13px;
    }

    .table th {
        background-color: #118EEE;
        color: white;
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
                        <div class="col-sm-12">
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
                                <span class="orange"> 温馨提示：</span>在操作此页面时尽量不要刷新页面，刷新页面则需要重新保存
                            </div>
                            <div class="hr"></div>
                            <div class="tabbable tabs-left" style="margin-top: 10px">
                                <ul class="nav nav-tabs" id="myTab3">
                                    <c:forEach items="${houseList}" var="house" varStatus="idx">
                                        <c:if test="${idx.index==0}">
                                            <li class="active">
                                        </c:if>
                                        <c:if test="${idx.index!=0}">
                                            <li class="">
                                        </c:if>
                                        <a data-toggle="tab" href="#dybsm_${house.bsm}" onclick="show('${idx.index+1}','${house.bsm}')" aria-expanded="false">
                                            <i id="icon_${house.bsm}" class="grey ace-icon fa fa-circle bigger-110"></i>
                                            户号：${house.hh}
                                        </a>
                                        </li>
                                    </c:forEach>
                                </ul>

                                <div class="tab-content">

                                    <c:forEach var="house" items="${houseList}" varStatus="idx">
                                        <c:if test="${idx.index==0}">
                                            <div class="active tab-pane" id="dybsm_${house.bsm}">
                                            <iframe id="iframe_${house.bsm}" width="100%"
                                                    src="${contextPath}/front/fdzhdjPl/step3Iframe?dybsms=${house.bsm}&yslywh=${param.yslywh}-${idx.index+1}&lcdm=${param.lcdm}"
                                                    scrolling="yes" frameborder="0"></iframe>
                                            </div>
                                        </c:if>
                                        <c:if test="${idx.index!=0}">
                                            <div class="tab-pane" id="dybsm_${house.bsm}"></div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="clearfix center">
                                <div class="mybtn mybtn-large mybtn-orange" id="backBtn" onclick="back()">上一步</div>
                                <div class="mybtn mybtn-large mybtn-info" id="nextBtn" onclick="next()">下一步</div>
                            </div>
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

    function show(id,dybsm) {
        var content = $("#dybsm_" + dybsm).html();
        if(content == null || content.length == 0){
            var src = '${contextPath}/front/fdzhdjPl/step3Iframe?dybsms=' + dybsm + '&yslywh=${param.yslywh}-'+id+'&lcdm=${param.lcdm}';
            content = '<iframe id="iframe_'+ dybsm +'" width="100%"'+
            ' src="'+src+'"'+
            ' scrolling="yes" frameborder="0"></iframe>';
            $("#dybsm_" + dybsm).append(content);
        }
    }
    function changeHeight(id,height) {
        $("#"+id).height(height);
    }
    function changeState(id) {
        $("#" + id).removeClass("grey").addClass("green");
    }
    function next() {
        var flag = true;
        $("i[id^=icon]").each(function(i){
            if($(this).hasClass("grey")) {
                flag= false;
            }
        });
        if(!flag) {
            _alert("您还有未保存的信息，请检查。")
        }else {
            window.location.href='${contextPath}/front/fdzhdjPl/yzxStep5?yslywh=${param.yslywh}'
        }
    }
</script>
</html>