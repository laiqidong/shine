<%--
  Created by IntelliJ IDEA.
  User: luoxuan
  Date: 2017/5/18
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0025)http://www.jszwfw.gov.cn/ -->
<html style="overflow: visible; height: initial;">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">


    <title>龙岩市不动产外网预受理</title>
    <%@include file="../../layout/front/common_front.jsp" %>
    <%@include file="../../layout/common.jsp" %>
    <!--新增的css以及js start-->
    <style type="text/css">
        .about-title{height: 60px;line-height: 60px;margin-top:10px;text-align: center;font-family: "微软雅黑";font-size: 24px;color: #333333;}
        .about-resource{height:30px;line-height:30px;margin-top:0px;text-align: center;font-family: "微软雅黑";font-size:18px;color: #333333;border-bottom: 1px solid #DCDCDC;padding-bottom:40px;margin:0px 100px}
        .about-con{font-size: 18px;line-height:34px;text-indent: 1.5em;margin-top:20px !important;font-family: "微软雅黑";color: #333333;}

    </style>
	<script type="text/javascript">
	function doZoom(size){
	    document.getElementById('zoom').style.fontSize=size+'px';
	 }
	</script>
</head>

<body >
<div id="barrierfree_container">

    <!--每屏最小高度640px-->
    <!--top-->
    <%@include file="../../layout/front/header.jsp" %>


    <!--主体-->
    <div class="yhzx_all" style="position:relative;padding-top:0px; ">

        <div class="yhzx_main" style="margin-top: 0px;">
            <div class="yhzx_r1">

                <div class="c2" style="margin-left:32px;">
                    <div class="col-xs-12" style="background: #ffffff;padding:0px; min-height:494px;">
                        <p class="about-title">关于我们</p>
                       <p class="about-resource">来源 : 龙岩市不动产登记中心&nbsp;&nbsp; &nbsp;     字体大小：【<a href='javascript:doZoom(18)'>大</a>&nbsp;&nbsp;<a href='javascript:doZoom(15)'>中</a>&nbsp;&nbsp;<a href='javascript:doZoom(13)'>小</a>】</p>
                        <div class="about-con" style="margin: 0px 120px;" id="zoom">
                            <p>根据（不动产登记条例）（国务院令第656）福建省人民政府办公厅 关于印发《福建省不动产统一登记工作实施方案的通知》 （闽政办[2014]129号）《中共龙岩市委机关编制委员会关于印发 龙岩不动产统一登记职责整合、 机构组建和人员编制方案的通知》 （岩编[2015]18号）以及《龙岩人民政府办公室关于建立市、 区不动产登记工作职责分工和协调机制的通知》 （龙岩政协[2016]5号）文件精神，成立龙岩不动产登记中心， 为隶属国土资源局管理的相关正科级财拨事业单位（公益一类）。
                                具体承担中心城区土地、房屋等不动产登记等事务性、辅助性 和服务性工作。</p>
                            <p>主要职能：负责中心城区不动产登记的申请、受理、审核、 登簿、发证、存档等工作； 负责办理中心城区不动产登记交易登记； 建立不动产统一登记信息平台； 负责中心城区各类不动产登记资料的收集、整理、共享、 汇交、归档和保管工作； 负责不动产登记资料社会查询服务。
                            </p>
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
    <%@include file="../../layout/front/footer.jsp" %>


<!--<script language="javascript" src="./resource/pagecontrol.js"></script><noscript>&lt;iframe src="*.html"&gt;&lt;/iframe&gt;</noscript>
<script language="javascript" src="./resource/web_front.js"></script>-->
<!--foot-->

</div>
</body>
<script type="text/javascript">
    $(function () {
        $(".account-bars ul li").click(function () {
            $(".account-bars ul li").removeClass("on");
            $(".base-info").hide();
            $(".account-bars ul li").eq($(this).index()).addClass("on");
            $(".base-info").eq($(this).index()).show();
        })
    })
</script>
</html>
