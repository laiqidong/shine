<%--
  Created by IntelliJ IDEA.
  User: luoxuan
  Date: 2017/5/17
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="overflow: visible; height: initial;">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <%@include file="../../layout/front/common_front.jsp" %>
    <%@include file="../../layout/common.jsp" %>
    <script type="text/ecmascript" src="data:,_data_uri_useable=1" urite-agent="1"></script>

    <link href="./resource/page.css" type="text/css" rel="stylesheet">

    <title>龙岩市不动产外网预受理</title>

    <!--新增的css以及js start-->
    <style type="text/css">

        .account-container {
            border: 0px solid red;
            height: 484px;
        }

        .account-bars {
            height: 42px;
            line-height: 42px;
            border: 1px solid #E8EEF4;
            border-right: none;
        }

        .account-bars ul {
            margin: 0px;
            padding: 0px;
        }

        .account-bars ul li {
            float: left;
            width: 140px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            border-right: 1px solid #E8EEF4;
        }

        .account-bars ul li.on {
            background: #49C1EB;
            color: #ffffff;
        }

        .base-info {
            padding-left: 40px;
            padding-top: 10px;
            display: none;
        }

        .base-info ul li {
            margin-top: 10px;
        }

        .base-info ul li label {
            margin-right: 10px;
        }

        .base-info ul li label input {
            height: 12px;
        }

        .base-info ul li input {
            font-family: "微软雅黑";
            color: #666666;
            font-size: 16px;
            height: 34px;
        }

        .info-title {
            width: 140px;
            display: inline-block;
            margin-right: 10px;
            font-family: "微软雅黑";
            font-size: 16px;
            text-align: right;
        }

        .send-btn {
            padding: 8px 10px;
            background: #75B1F3;
            color: #ffffff;
            font-family: "微软雅黑";
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 10px;
        }

        .border-blue {
            border: 1px solid #CDE4F3 !important;
            width: 450px;
        }

        .border-none {
            border: none !important;
            background: none !important;
            width: 450px;
        }

        .complete {
            width: 120px;
            background: #40D2AF;
            height: 40px;
            line-height: 40px;
            text-align: center;
            color: #ffffff;
            border-radius: 3px;
            margin: 0 auto;
            letter-spacing: 4px;
            font-family: "微软雅黑";
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
            margin-left: 320px;
        }

        .contact-title {
            font-size: 20px;
            margin: 10px 40px;
        }

        .contact-caption {
            display: inline-block;
            float: left;
        }

        /*.address-info{font-family: "微软雅黑";font-size: 16px;color: #333;padding: 10px; line-height:30px;margin-right:30px;margin-top: 0px; background: #f2f2f2;border: 1px solid #cccccc;}*/
        .address-info {
            font-family: "微软雅黑";
            font-size: 18px;
            color: #333;
            padding: 10px;
            line-height: 30px;
            margin-left: 20px;
            margin-top: 20px;
        }
        .red-color{color: #ff6600;}

        /*.fr{float:right}*/
    </style>
</head>

<body >
<div id="barrierfree_container">

    <!--每屏最小高度640px-->
    <!--top-->
    <%@include file="../../layout/front/header.jsp" %>
    <!--主体-->
    <div class="yhzx_all" style="/*position:relative;padding-top:110px; */">

        <div class="yhzx_main" style="/*margin-top: 35px;*/">
            <div class="yhzx_r1">
                <%@include file="../../layout/front/sider.jsp" %>
                <div class="c2" style="margin-left:224px;">
                    <div class="col-xs-12" style="background: #ffffff;padding:0px; min-height:494px;">
                        <div class="account-container">
                            <div class="address-info ">
                                <div><span class="contact-caption">办事地点：</span>
                                    <p style="overflow: hidden;">新罗区华莲路138号金融中心B3幢（龙岩大道和华莲路交叉处）一楼 不动产登记窗口</p></div>
                                <div><span class="contact-caption">办公时间：</span>
                                    <p style="overflow: hidden;">夏天&emsp;周一至周五&emsp;
                                        上午8:30-11:30 —下午14:00-17:30<br>
                                        冬天&emsp;周一至周五&emsp;
                                        上午8:30-11:30 —下午13:30-17:30</p></div>
                                <div><span class="contact-caption">联系电话：</span>
                                    <p style="overflow: hidden;"> 0597-3295003（<span class="red-color">咨询电话</span>）<br>
                                        0597-3295004（<span class="red-color">投诉电话</span>）</p></div>
                                <p>工程服务部：0572-8021820-8016</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


        </div>


    </div>
    <script>


    </script>
    <!--底部-->
    <%@include file="../../layout/front/footer.jsp" %>

</div>

<!--<script language="javascript" src="./resource/pagecontrol.js"></script><noscript>&lt;iframe src="*.html"&gt;&lt;/iframe&gt;</noscript>
<script language="javascript" src="./resource/web_front.js"></script>-->
<!--foot-->


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