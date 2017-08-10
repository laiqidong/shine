<%--
  Created by IntelliJ IDEA.
  User: luoxuan
  Date: 2017/6/1
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .gray {
        -webkit-filter: grayscale(100%);
        -webkit-filter: grayscale(1);
        filter: grayscale(100%);
        filter:url('${contextPath}/resources/ysl_front/resource/gray.svg#grayscale');
        filter:gray;
    }
    .type-con .row ul li div{background-color:gray;}
    .type-con .row ul li .zt1{background-color:#198BEA;}
    <%--img {--%>
        <%---webkit-filter: grayscale(100%);--%>
        <%---webkit-filter: grayscale(1);--%>
        <%--filter: grayscale(100%);--%>
        <%--filter:url('${contextPath}/resources/ysl_front/resource/gray.svg#grayscale');--%>
        <%--filter:gray;--%>
    <%--}--%>

</style>
<script>

//    if($(".type-con .row ul li .f1").attr("zt")==1){
    $(".type-con .row ul li .zt1").css("background-color","198BEA");
//    }
</script>

<div class="type-wrapper">
    <div class="bdc-type-l fl">
        <h3 class="bdc-title">不动产类型</h3>
        <ul class="bdc-type">
            <li id="td_"><span class="bdc-type1">土地</span><span class="arrow"></span></li>
            <li  class="on"  id="fd_"><span class="bdc-type2">房地</span><span class="arrow"></span></li>
            <li id="ld_"><span class="bdc-type3">林地</span><span class="arrow"></span></li>
            <li id="hy_"><span class="bdc-type4">海域</span><span class="arrow"></span></li>
        </ul>
    </div>
    <div class="bdc-type-r">
        <div class="type-list">
            <div class="type-head">
                <span>登记类型</span>
                <ul>
                    <li class="on" id="qb">全部</li>
                    <li id="sc">首次</li>
                    <li id="zy">转移</li>
                    <li id="bg">变更</li>
                    <li id="dy">抵押</li>
                    <li id="yg">预告</li>
                    <li id="zx">注销</li>
                    <li id="qt">其他</li>
                </ul>
            </div>
            <!-- 登记详细类型内容 -->

            <!-- 登记类型内容--全部 -->
            <div class="type-con show-all" id="qb_1" style="display: none;">
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>划拨土地首次登记</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_16.png">
                            </div>
                            <span>出让土地首次登记</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_07.png">
                            </div>
                            <span>宅基地房屋首次登记</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_08.png">
                            </div>
                            <span>出让土地抵押首登</span>
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_09.png">
                            </div>
                            <span>土地抵押注销</span>
                        </li>
                        <li class="">
                            <div class="fl zt1" zt="1">
                                <img src="${contextPath}/resources/ysl_front/images/icon_09.png">
                            </div>
                            <span>新建房屋首登</span>
                            <input class="lcdm" type="hidden" value="2101">
                        </li>

                        <li>
                            <div class="fl ">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>房屋买卖</span><input class="lcdm" type="hidden" value="2102">
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>夫妻加名</span>
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>房屋继承</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_13.png">
                            </div>
                            <span>房屋抵押</span>
                        </li>
                        <li>
                            <div class="fl zt1" zt="1">
                                <img src="${contextPath}/resources/ysl_front/images/icon_07.png">
                            </div>
                            <span>买卖预告及抵押预告</span><input class="lcdm" type="hidden" value="9407">
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>房屋抵押注销</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="type-con show-all" id="qb_2" style="display: none;">
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_07.png">
                            </div>
                            <span style="width: 300px;">抵押权预告登记</span>
                        </li>

                        <li>
                            <div class="fl zt1" zt="1">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>预售商品房预告登记</span><input class="lcdm" type="hidden" value="9401">
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_06.png">
                            </div>
                            <span>开具房屋证明</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>补换证登记</span>
                        </li>
                    </ul>
                </div>
                <c:if test="${userType!=1}">
                    <div class="row">
                        <ul>
                            <li>
                                <div class="fl">
                                    <img src="${contextPath}/resources/ysl_front/images/icon_09.png">
                                </div>
                                <span>新建房屋首登(批量)</span>
                            </li>
                            <li>
                                <div class="fl">
                                    <img src="${contextPath}/resources/ysl_front/images/icon_12.png">
                                </div>
                                <span>在建工程抵押</span>
                            </li>
                            <li>
                                <div class="fl zt1" zt="1">
                                    <img src="${contextPath}/resources/ysl_front/images/icon_14.png">
                                </div>
                                <span>预转现（有抵押）</span><input class="lcdm" type="hidden" value="2701">
                            </li>
                            <li>
                                <div class="fl zt1" zt="1">
                                    <img src="${contextPath}/resources/ysl_front/images/icon_15.png">
                                </div>
                                <span>预转现（无抵押）</span><input class="lcdm" type="hidden" value="2705">
                            </li>
                        </ul>
                    </div>
                </c:if>
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>林权首次登记</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>林权抵押首次登记</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>林权转移登记</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>林权变更登记</span>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- 土地-全部 -->
            <div class="type-con" id="td_qb" style="display: none;">
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>划拨土地首次登记</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_16.png">
                            </div>
                            <span>出让土地首次登记</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_07.png">
                            </div>
                            <span>宅基地房屋首次登记</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_08.png">
                            </div>
                            <span>出让土地抵押首登</span>
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_09.png">
                            </div>
                            <span>土地抵押注销</span>
                        </li>

                    </ul>
                </div>
            </div>
            <!-- 土地-首次 -->
            <div class="type-con" id="td_sc" style="display: none;">
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>划拨土地首次登记</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_16.png">
                            </div>
                            <span>出让土地首次登记</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_07.png">
                            </div>
                            <span>宅基地房屋首次登记</span>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 土地-抵押 -->
            <div class="type-con" id="td_dy" style="display: none;">
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>出让土地抵押首登</span>
                        </li>

                    </ul>
                </div>
            </div>
            <!-- 土地-注销 -->
            <div class="type-con" id="td_zx" style="display: none;">
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>土地抵押注销</span>
                        </li>

                    </ul>
                </div>
            </div>
            <!-- 房地-全部 -->
            <div class="type-con" id="fd_qb" style="display: block;">
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl zt1" zt="1">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span style="width: 300px;">商品房抵押预告登记</span><input class="lcdm" type="hidden" value="9405">
                        </li>
                        <li>
                            <div class="fl zt1" zt="1">
                                <img src="${contextPath}/resources/ysl_front/images/icon_06.png" style="">
                            </div>
                            <span>预售商品房预告登记</span><input class="lcdm" type="hidden" value="9401">
                        </li>
                        <c:if test="${userType!=1}">
                            <li>
                                <div class="fl zt1" zt="1">
                                    <img src="${contextPath}/resources/ysl_front/images/icon_14.png">
                                </div>
                                <span>预转现（有抵押）</span><input class="lcdm" type="hidden" value="2701">

                            </li>
                            <li>
                                <div class="fl zt1" zt="1">
                                    <img src="${contextPath}/resources/ysl_front/images/icon_15.png">
                                </div>
                                <span>预转现（无抵押）</span><input class="lcdm" type="hidden" value="2705">
                            </li>
                        </c:if>

                    </ul>
                </div>
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl zt1" zt="1">
                                <img src="${contextPath}/resources/ysl_front/images/icon_07.png">
                            </div>
                            <span>买卖预告及抵押预告</span><input class="lcdm" type="hidden" value="9407">
                        </li>

                        <li class="">
                            <div class="fl zt1" zt="1">
                                <img src="${contextPath}/resources/ysl_front/images/icon_09.png">
                            </div>
                            <span>新建房屋首登</span>
                            <input class="lcdm" type="hidden" value="2101">
                        </li>

                        <li>
                            <div class="fl ">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>房屋买卖</span><input class="lcdm" type="hidden" value="2102">
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>夫妻加名</span>
                        </li>


                    </ul>
                </div>
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>房屋继承</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_13.png">
                            </div>
                            <span>房屋抵押</span>
                        </li>

                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>房屋抵押注销</span>
                        </li>

                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_06.png">
                            </div>
                            <span>开具房屋证明</span>
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>补换证登记</span>
                        </li>
                        <c:if test="${userType!=1}">
                            <li>
                                <div class="fl">
                                    <img src="${contextPath}/resources/ysl_front/images/icon_09.png">
                                </div>
                                <span>新建房屋首登(批量)</span>
                            </li>
                        </c:if>

                        <c:if test="${userType!=1}">
                            <li>
                                <div class="fl">
                                    <img src="${contextPath}/resources/ysl_front/images/icon_12.png">
                                </div>
                                <span>在建工程抵押</span>
                                <input class="lcdm" type="hidden" value="">
                            </li>
                        </c:if>

                    </ul>
                </div>
            </div>
            <!-- 房地-首次 -->
            <div class="type-con" id="fd_sc" style="display: none;">
                <div class="row">
                    <ul>
                        <li class="">
                            <div class="fl zt1" zt="1">
                                <img src="${contextPath}/resources/ysl_front/images/icon_09.png">
                            </div>
                            <span>新建房屋首登</span>
                            <input class="lcdm" type="hidden" value="2101">
                        </li>
                        <c:if test="${userType!=1}">
                            <li>
                                <div class="fl">
                                    <img src="${contextPath}/resources/ysl_front/images/icon_09.png">
                                </div>
                                <span>新建房屋首登(批量)</span>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
            <!-- 房地-转移 -->
            <div class="type-con" id="fd_zy" style="display: none;">
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl ">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>房屋买卖</span><input class="lcdm" type="hidden" value="2102">
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>夫妻加名</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>房屋继承</span>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 房地-抵押 -->
            <div class="type-con" id="fd_dy" style="display: none;">
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_13.png">
                            </div>
                            <span>房屋抵押</span>
                        </li>
                        <li>
                            <div class="fl zt1" zt="1">
                                <img src="${contextPath}/resources/ysl_front/images/icon_07.png">
                            </div>
                            <span>买卖预告及抵押预告</span><input class="lcdm" type="hidden" value="9407">
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <ul>
                        <c:if test="${userType!=1}">
                            <li>
                                <div class="fl zt1" zt="1">
                                    <img src="${contextPath}/resources/ysl_front/images/icon_14.png">
                                </div>
                                <span>预转现（有抵押）</span><input class="lcdm" type="hidden" value="2701">
                            </li>
                            <li>
                                <div class="fl zt1" zt="1">
                                    <img src="${contextPath}/resources/ysl_front/images/icon_15.png">
                                </div>
                                <span>预转现（无抵押）</span><input class="lcdm" type="hidden" value="2705">
                            </li>
                            <li>
                                <div class="fl">
                                    <img src="${contextPath}/resources/ysl_front/images/icon_12.png">
                                </div>
                                <span>在建工程抵押</span>
                            </li>
                        </c:if>

                    </ul>
                </div>
            </div>
            <!-- 房地-注销 -->
            <div class="type-con" id="fd_zx" style="display: none;">
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>房屋抵押注销</span>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 房地-查封 -->
            <!-- 房地-预告 -->
            <div class="type-con" id="fd_yg" style="display: none;">
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl zt1" zt="1" >
                                <img src="${contextPath}/resources/ysl_front/images/icon_06.png">
                            </div>
                            <span>预售商品房预告登记</span><input class="lcdm" type="hidden" value="9401">
                        </li>
                        <li>
                            <div class="fl zt1" zt="1">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>商品房抵押预告登记</span><input class="lcdm" type="hidden" value="9405">
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 房地-其他 -->
            <div class="type-con" id="fd_qt" style="display: none;">
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_06.png">
                            </div>
                            <span>开具房屋证明</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>补换证登记</span>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- 林地-全部 -->
            <div class="type-con" id="ld_qb" style="display: none;">
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>林权首次登记</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>林权抵押首次登记</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>林权转移登记</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>林权变更登记</span>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 林地-首次 -->
            <div class="type-con" id="ld_sc" style="display: none;">
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>林权首次登记</span>
                        </li>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>林权抵押首次登记</span>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 林地-转移 -->
            <div class="type-con" id="ld_zy" style="display: none;">
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>林权转移登记</span>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 林地-变更 -->
            <div class="type-con" id="ld_bg" style="display: none;">
                <div class="row">
                    <ul>
                        <li>
                            <div class="fl">
                                <img src="${contextPath}/resources/ysl_front/images/icon_05.png">
                            </div>
                            <span>林权变更登记</span>
                        </li>
                    </ul>
                </div>
            </div>

            <ul class="pagination" style="display: none">
                <li class="on"></li>
                <li></li>
            </ul>


            <div class="tip-box" id="tipBox" onmouseover='showTip("tipBox")' onmouseout='hideTip("tipBox")'>
                <ul>
                    <li class="tip1">
                        <a href="javascript:void(0)" onclick="open_url('${contextPath}/work_guide')">办事指南</a>
                    </li>
                    <li class="tip2">
                        <a href="javascript:void(0)" onclick="zxsq()">在线申请</a>
                    </li>
                    <li class="tip3">
                        <a href="javascript:void(0)" onclick="_tips('该功能正在建设中...', 2);">使用情形</a>
                    </li>
                    <li class="tip4">
                        <a href="javascript:void(0)" onclick="to_url('${contextPath}/front/mywork/search')">查询结果</a>
                    </li>
                </ul>
                <img class="arrow" src="${contextPath}/resources/ysl_front/images/tipUp.png">
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    var lcdm = null;

    //在线申请
    function zxsq() {
        if (isNaN(lcdm)) {
            _tips('该业务功能正在建设中...', 2);
        } else if ('${token}' == '') {
            _tips('请登录后操作...', 2);
        } else {
            _ajax_get('${contextPath}/front/getywh', function (result) {
                if (lcdm == '2102') {
                    window.location.href = ' ${contextPath}/front/fwmm/step1?yslywh=' + result + '&lcdm=' + lcdm;
                } else if (lcdm == '2701' || lcdm == '2705') {
                    window.location.href = ' ${contextPath}/front/fdzhdj/yzxStep1?yslywh=' + result + '&lcdm=' + lcdm;
                } else if (lcdm == '9401' || lcdm == '9405' || lcdm == '9407') {
                    window.location.href = ' ${contextPath}/front/ygdj/step1?yslywh=' + result + '&lcdm=' + lcdm;
                } else if (lcdm == '2101') {
                    //房地首次登记
                    window.location.href = ' ${contextPath}/front/fddj/scdjStep1?yslywh=' + result + '&lcdm=' + lcdm;
                }
            });
        }
    }
</script>


