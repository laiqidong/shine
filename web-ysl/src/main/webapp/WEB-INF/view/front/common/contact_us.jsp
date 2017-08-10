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
    <%@include file="../../layout/common.jsp" %>
    <script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
    <link rel="stylesheet" href="${contextPath}/resources/ysl_front/css/index.css"/>

    <script language="javascript" src="${contextPath}/resources/ysl_front/resource/jquery.js"></script>
    <script language="javascript" src="${contextPath}/resources/ysl_front/resource/urite.min.js"></script>
    <script type="text/ecmascript" src="data:,_data_uri_useable=1" urite-agent="1"></script>
    <%--<script type="text/javascript" src="${contextPath}/resources/ysl_front/resource/jquery-1.8.3.min.js"></script>--%>
    <%--<link rel="stylesheet" type="text/css" href="${contextPath}/resources/ysl_front/resource/hanweb.css">--%>
    <link rel="stylesheet" href="${contextPath}/resources/ysl_front/resource/jquery.fullPage.css">
    <%--<link rel="stylesheet" type="text/css" href="${contextPath}/resources/ysl_front/resource/shouye.css">--%>
    <%--<script type="text/ecmascript" src="${contextPath}/resources/ysl_front/resource/jquery.min.js"></script>--%>
    <%--<link type="text/css" rel="stylesheet" href="${contextPath}/resources/ysl_front/resource/global.css">--%>
    <%--<link type="text/css" rel="stylesheet" href="${contextPath}/resources/ysl_front/resource/validity.css">--%>
    <%--<script type="text/javascript" src="${contextPath}/resources/ysl_front/resource/validity.js"></script>--%>
    <%--<link type="text/css" rel="stylesheet" href="${contextPath}/resources/ysl_front/resource/jquery.loadmask.css">--%>
    <%--<script type="text/javascript" src="${contextPath}/resources/ysl_front/resource/jquery.loadmask.min.js"></script>--%>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/ysl_front/css/user_gr.css">
    <link href="${contextPath}/resources/ysl_front/css/head.css" rel="stylesheet"/>
    <link href="${contextPath}/resources/ysl_front/css/top.css" rel="stylesheet"/>
    <link href="${contextPath}/resources/ysl_front/css/common.css" rel="stylesheet"/>


    <link href="${contextPath}/resources/ysl_front/resource/page.css" type="text/css" rel="stylesheet">
    <!--新增的css以及js start-->
    <style type="text/css">
        /*.about-title{height: 60px;line-height: 60px;margin-top:10px;text-align: center;font-family: "微软雅黑";font-size: 24px;color: #333333;}*/
        /*.about-resource{height:30px;line-height:30px;margin-top:0px;text-align: center;font-family: "微软雅黑";font-size:18px;color: #333333;border-bottom: 1px solid #DCDCDC;padding-bottom:40px;margin:0px 100px}*/
        /*.about-con{font-size: 18px;line-height:34px;text-indent: 1.5em;margin-top:20px !important;font-family: "微软雅黑";color: #333333;}*/
        /*.contact-title{font-size: 20px;margin: 10px 40px;}*/
        /*.map{border:4px solid #CCCCCC; float: left; width:500px; height:330px;margin: 1px 20px 0px 40px;}*/
        /*.contact-caption{display: inline-block;float: left;}*/
        /*.address-info{font-family: "微软雅黑";font-size: 16px;color: #333;padding: 10px; line-height:30px;margin-right:30px;margin-top: 0px; background: #f2f2f2;border: 1px solid #cccccc;}*/
        /*.fr{float:right}*/
        .contact-con{border:0px solid red;margin-top:0px;background-color: #F4F4F5;}
        .con-box{border: 1px solid red;width: 80%;margin:10px auto;height:480px;margin-top: 10px;background-color: #ffffff;border:1px solid #E7E7E7;}
        .map{border:4px solid #CCCCCC;overflow: hidden; height:340px;margin:40px 20px 0px 40px;}
        .address-info{ font-family: "微软雅黑";font-size: 16px;color: #666666;padding: 10px; line-height:30px;margin:24px 40px 0px 20px;}
        .contact-caption{display: inline-block;float: left;font-family: "微软雅黑";color: #000000;font-size: 16px;}
        .contact-title{margin-bottom:20px;font-family: "微软雅黑";color: #000000;font-size: 18px;}
        .red-color{color: #ff6600;}
        .row-top{margin-top: 6px}
    </style>

</head>

<body style="height: initial;">
<div id="barrierfree_container">

    <!--每屏最小高度640px-->
    <!--top-->
    <%@include file="../../layout/front/header.jsp" %>

    <div class="main">

        <div class="contact-con">
            <div class="con-box">

                <div class="address-info fr">
                    <p class="contact-title">联系我们</p>
                    <div class="row-top">
                        <span class="contact-caption">办事地点：</span>
                        <p style="overflow: hidden;">新罗区华莲路138号金融中心B3幢（龙岩大道和华莲路交叉处）行政服务中心 <br>一楼&emsp;不动产登记窗口</p>
                    </div>
                    <div class="row-top">
                        <span class="contact-caption">办公时间：</span>
                        <p style="overflow: hidden;">夏季　周一至周五<br>
                        上午8:30-11:30 —下午14:00-17:30<br>
                        冬季　周一至周五<br>
                        上午8:30-11:30 —下午13:30-17:30</p>
                    </div>
                    <div class="row-top">
                        <span class="contact-caption">联系电话：</span>
                        <p style="overflow: hidden;"> 0597-3295001（<span class="red-color">咨询电话</span>）<br>
                            0597-3295004（<span class="red-color">投诉电话</span>）</p>
                    </div>
                    <div class="row-top">
                        <span class="contact-caption">工程服务部：</span>
                        <p style="overflow: hidden;">0572-8021820-8016</p>
                    </div>

                </div>
                <div class="map" id="dituContent"></div>
            </div>
        </div>
    <!--主体-->
    <%--<div class="yhzx_all" style="position:relative;padding-top:0px; ">--%>

        <%--<div class="yhzx_main" style="margin-top: 0px;">--%>
            <%--<div class="yhzx_r1">--%>

                <%--<div class="c2" style="margin-left:32px;">--%>
                    <%--<div class="col-xs-12" style="background: #ffffff;padding:0px;padding-right: 10px !important; min-height:494px;">--%>
                        <%--<p class="contact-title">联系我们</p>--%>
                        <%--<div class="map" id="dituContent"></div>--%>
                        <%--<div class="address-info fr">--%>
                            <%--<div><b class="contact-caption">办事地点：</b>--%>
                                <%--<p style="overflow: hidden;">新罗区华莲路138号金融中心B3幢（龙岩大道和华莲路交叉处）<br>一楼&emsp;不动产登记窗口</p></div>--%>
                            <%--<div><b class="contact-caption">办公时间：</b>--%>
                                <%--<p style="overflow: hidden;">夏季　周一至周五<br>--%>
                                    <%--上午8:30-11:30 —下午14:00-17:30<br>--%>
                                    <%--冬季　周一至周五<br>--%>
                                    <%--上午8:30-11:30 —下午13:30-17:30</p></div>--%>
                            <%--<div><b class="contact-caption">联系电话：</b>--%>
                                <%--<p style="overflow: hidden;"> 0597-3295003（<span class="orange">咨询电话</span>）<br>--%>
                                    <%--0597-3295004（<span class="orange">投诉电话</span>）</p></div>--%>
                            <%--<b>工程服务部：</b><span>0572-8021820-8016</span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>


        <%--</div>--%>

    <%--</div>--%>
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

    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
    }

    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(117.023677,25.081386);//定义一个中心点坐标
        map.centerAndZoom(point,17);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }

    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }

    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
        var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
        map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
        var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
        map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
        var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
        map.addControl(ctrl_sca);
    }


    initMap();//创建和初始化地图



//    //创建和初始化地图函数：
//    function initMap(){
//        createMap();//创建地图
//        setMapEvent();//设置地图事件
//        addMapControl();//向地图添加控件
//        addMarker();//向地图中添加marker
//    }
//
//    //创建地图函数：
//    function createMap(){
//        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
////				var point = new BMap.Point(120.005343,30.382196);//定义一个中心点坐标
//        var point = new BMap.Point(120.034133,30.558536)
//        map.centerAndZoom(point,15);//设定地图的中心点和坐标并将地图显示在地图容器中
//        window.map = map;//将map变量存储在全局
//    }
//
//    //地图事件设置函数：
//    function setMapEvent(){
//        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
//        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
//        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
//        map.enableKeyboard();//启用键盘上下左右键移动地图
//    }
//
//    //地图控件添加函数：
//    function addMapControl(){
//        //向地图中添加缩放控件
//        var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
//        map.addControl(ctrl_nav);
//        //向地图中添加缩略图控件
//        var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:0});
//        map.addControl(ctrl_ove);
//        //向地图中添加比例尺控件
//        var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
//        map.addControl(ctrl_sca);
//    }
//
//    //标注点数组
//    //			var markerArr = [{title:"浙江鑫宙竹基复合材料科技有限公司",content:"电话：0572-8021820<br/>传真：0572-8232821<br/>地址：杭州市（湖州市）",point:"120.034133|30.558536",isOpen:1,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}},{title:"浙江鑫宙竹基复合材料",content:"电话：0572-8021820<br/>传真：0572-8232821<br/>地址：杭州市（湖州市）",point:"119.034133|30.558536",isOpen:1,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}}
//    //				 ];
//    //创建marker
//    function addMarker(){
//        for(var i=0;i<markerArr.length;i++){
//            var json = markerArr[i];
//            var p0 = json.point.split("|")[0];
//            var p1 = json.point.split("|")[1];
//            var point = new BMap.Point(p0,p1);
//            var iconImg = createIcon(json.icon);
//            var marker = new BMap.Marker(point,{icon:iconImg});
//            var iw = createInfoWindow(i);
//            var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
//            marker.setLabel(label);
//            map.addOverlay(marker);
//            label.setStyle({
//                borderColor:"#808080",
//                color:"#333",
//                cursor:"pointer"
//            });
//
//            (function(){
//                var index = i;
//                var _iw = createInfoWindow(i);
//                var _marker = marker;
//                console.log(json)
//                _marker.addEventListener("click",function(){
//                    this.openInfoWindow(_iw);
//                });
////						_iw.addEventListener("open",function(){
////							_marker.getLabel().hide();
////						})
////						_iw.addEventListener("close",function(){
////							_marker.getLabel().show();
////						})
////						label.addEventListener("click",function(){
////							_marker.openInfoWindow(_iw);
////						})
//                if(!!json.isOpen){
//                    label.hide();
//                    _marker.openInfoWindow(_iw);
//                }
//            })()
//        }
//    }
//    //创建InfoWindow
//    function createInfoWindow(i){
//        var json = markerArr[i];
//        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
//        return iw;
//    }
//    //创建一个Icon
//    function createIcon(json){
//        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
//        return icon;
//    }
//
//    initMap();//创建和初始化地图

</script>
</html>

