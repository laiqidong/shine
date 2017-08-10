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
        .about-con p{line-height:30px;margin-top:0px;}
        .state-title{margin-top: 20px;color: #000;font-weight:bold}
    </style>
	<script type="text/javascript">
	function doZoom(size){
	    document.getElementById('zoom').style.fontSize=size+'px';
	 }
	</script>
</head>

<body>
<div id="barrierfree_container">

    <!--每屏最小高度640px-->
    <!--top-->
    <%@include file="../../layout/front/header.jsp" %>
    <!--主体-->
    <div class="yhzx_all" style="position:relative;padding-top:0px; ">

        <div class="yhzx_main" style="margin-top: 0px;">
            <div class="yhzx_r1">

                <div class="c2" style="margin-left:32px;">
                    <div class="col-xs-12" style="background: #ffffff;padding:0px;height:1000px;">
                        <p class="about-title">版权声明</p>
                        <p class="about-resource">来源 : 龙岩市不动产登记中心&nbsp;&nbsp; &nbsp;     字体大小：【<a href='javascript:doZoom(18)'>大</a>&nbsp;&nbsp;<a href='javascript:doZoom(15)'>中</a>&nbsp;&nbsp;<a href='javascript:doZoom(13)'>小</a>】</p>
                        <div class="about-con" style="margin: 0px 120px;" id="zoom">
                            <p class="state-title">一、版权声明</p>
                            <p>1、龙岩市不动产登记外网申请服务网所有内容均由省、市、县（市、区）人民政府及其组成部门和直属机构提供，包括：文字、图片、声像、软件、标识、域名、图表和附件等。</p>
                            　　                                                 <p>2、任何媒体、互联网站和商业机构只有在获得江苏政务服务网或其他相关权利人的授权之后才能使用上述内容，而不得擅自转载复制、不得歪曲篡改、不得用于任何商业用途或创造与内容相关的派生产品。</p>
                            　　                                                 <p>3、本网站所有内容受版权、商标和其它财产所有权法律的保护，如与相关纸质文本不符，以纸质文本为准。</p>
                            <p class="state-title" style="margin-bottom: -20px;">二、隐私保护</p>
                            　                                                    <p>1、本网站承诺将使用相应技术，对您所提供的个人资料进行严格的管理和保护，防止个人资料丢失、被盗用或遭窜改。</p>
                            　　                                                 <p>2、在未经您同意和确认之前，除国家法律、地方法规和政府规章规定，以及维护江苏政务服务网合法权益之外，本网站保证不会把这些个人资料提供给任何机构和个人，但是会根据工作需要与政府有关部门共同使用。</p>
                            <p class="state-title">三、免责声明</p>
                            <p>1、本网站对上述所有由第三方提供的信息、内容和服务的质量（包括下载后的数据的质量和即时性，以及对取自于本网站的数据的任何分析结果），不提供明示或暗示的担保。本网站对使用上述信息、内容和服务所造成的任何损失不承担责任，包括直接损失和间接损失。</p>
                            <p>2、任何由于黑客攻击、计算机病毒侵入或发作、因政府管制而造成的暂时性关闭等影响网络正常经营及其他之不可抗力原因而造成的资料泄露、丢失、被盗用或被篡改等，本网站将采取必要措施尽力减少用户的损失，但本网站对此不承担任何责任。</p>
                            <p>3、由于与本网站链接的其它网站所造成之个人资料泄露及由此而导致的任何法律争议和后果，请谨慎点击，本网站对此不承担任何责任。</p>
                            <p>4、由于您将用户密码告知他人或与他人共享注册帐户，由此导致的任何个人信息的泄露的，本网站对此不承担任何责任。</p>
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

