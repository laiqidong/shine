<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<!-- saved from url=(0025)http://www.jszwfw.gov.cn/ -->
<html style="overflow: visible; height: initial;">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <script language="javascript" src="${contextPath}/resources/login/jquery.js"></script>
    <script language="javascript" src="${contextPath}/resources/login/urite.min.js"></script>
    <script type="text/ecmascript" src="data:,_data_uri_useable=1" urite-agent="1"></script>

    <link href="${contextPath}/resources/login/page.css" type="text/css" rel="stylesheet">

    <title>龙岩市不动产外网预受理</title>
    <meta name="Maketime" content="2017-04-07 17:31:50">

    <meta name="sitename" content="龙岩市不动产外网预受理">



    <script type="text/javascript" src="${contextPath}/resources/login/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/login/hanweb.css">
    <link rel="stylesheet" href="${contextPath}/resources/login/jquery.fullPage.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/login/shouye.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/login/login.css">

	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/login/global.css">
	<script type="text/javascript" src="${contextPath}/resources/login/jquery.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/login/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/login/jquery.parser.js"></script>
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/login/linkbutton.css">
	<script type="text/javascript" src="${contextPath}/resources/login/jquery.linkbutton.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/login/jquery.resizable.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/login/jquery.draggable.js"></script>
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/login/panel.css">
	<script type="text/javascript" src="${contextPath}/resources/login/jquery.panel.js"></script>
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/login/window.css">
	<script type="text/javascript" src="${contextPath}/resources/login/jquery.window.js"></script>
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/login/messager.css">
	<script type="text/javascript" src="${contextPath}/resources/login/jquery.messager.js"></script>
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/login/validity.css">
	<script type="text/javascript" src="${contextPath}/resources/login/validity.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/login/validity(1).js"></script>
	<script type="text/javascript" src="${contextPath}/resources/login/jquery.cookie.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/login/jsencrypt.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/login/rsa_util.js"></script>
    <!--<script type="text/javascript" src="${contextPath}/resources/login/jquery.fullPage.js"></script>-->

	<!--首页效果-->
        <script type="text/javascript" src="${contextPath}/resources/login/shouye_add.js"></script>

	<!--首页辅助-->
	<script src="${contextPath}/resources/login/1611191517336121.js"></script>
	<style>
		.foot_hidden .foot_main {
			display: none;
		}
	</style>

	<script language="javascript" src="${contextPath}/resources/login/pagecontrol.js"></script><noscript>&lt;iframe src="*.html"&gt;&lt;/iframe&gt;</noscript>
    <script language="javascript" src="${contextPath}/resources/login/web_front.js"></script>

</head>
<script>
	function SetHome(obj, vrl) {
                    try {
                        obj.style.behavior = 'url(#default#homepage)';
                        obj.setHomePage(vrl);
                        return false;
                    }
                    catch (e) {
                        alert('您的浏览器不支持一键设为首页，请到浏览器【设置】功能里操作。');
                    }
     }	

	 //个人-企业登录框切换
	function checklogin(className) {
		if(className == "login_tit2") {
			$(".login_tit2").addClass("login_titOn").siblings(".login_tit1").removeClass("login_titOn");
			$(".fr_login").stop().fadeIn(300).siblings(".gr_login").hide();
		}else {		
			$(".login_tit1").addClass("login_titOn").siblings(".login_tit2").removeClass("login_titOn");
			$(".gr_login").stop().fadeIn(300).siblings(".fr_login").hide();
		}
	}

	//个人
	function gr_submit() {
		var grusername = $('#grusername').val();
		var grpwd = $('#grpwd').val();
		if(grusername == "") {
			//jisopen("请填写登录名");
			alert("请填写登录名");
		}else if(grpwd == "") {
			alert("请填写密码");
		}else {
			//$("#grloginform").submit();
			userLogin(grusername,grpwd,1);
		}
	}

	//企业
	function fr_submit() {
		var frusername = $('#frusername').val();
		var frpwd = $('#frpwd').val();
		if(frusername == "") {
			alert("请填写登录名");
		}else if(frpwd == "") {
			alert("请填写密码");
		}else {
			//$("#frloginform").submit();
			userLogin(frusername,frpwd,2);
		}
	}

	window.alert = function (msg,type,fu){
		top.$.messager.alert(' ',msg,type,fu);
	};
	$.validity.setup({
		outputMode : "showErr"
	});

	window.confirm = function(msg,okCall,cancelCall){
		top.$.messager.confirm(' ',msg,function(flag){
			if(flag){
				if(typeof(okCall) != 'undefined'){
					okCall();
				}
			}else{
				if(typeof(cancelCall) != 'undefined'){
					cancelCall();
				}
			}
		});
	};

	function userLogin(){
		$.ajax({
			 url: '${contextPath}/pub/userLogin?username='+$("#username").val()+'&password='+$("#password").val(),
             type: 'get',
             dataType: 'json',
			success : function(obj) {
				if(obj.ret=="1"){
					//alert("用户验证成功");
					window.location.href='${contextPath}/front/index';
				}else{
					_tips(obj.msg,2);
				}

			},
			error : function(a, b, msg) {
				//submitBtn.attr('disabled', false).removeClass('disabled').addClass('btn-primary');
				alert('操作失败');
				//op.error();
			}
		});
	}
</script>

<body >
    <div id="barrierfree_container">

        <!--每屏最小高度640px-->
        <!--top-->
        <div class="test_run" style="display: none;"><a class="test_run_close"></a><a href="http://www.jszwfw.gov.cn/art/2016/12/30/art_122805_64849.html" target="_blank"><div class="test_run_main"></div></a></div>
        <div class="top">
            <div class="top_main">
                <div class="top_logo">
                    <a class="top_logo_a" href="${contextPath}/front/home">
                    <img src="${contextPath}/resources/login/images/bg-login-logo2.png"></a>
                </div>

                <div class="top_search">
                    <!--<div class="search_tit"></div>-->
                    <div class="search_main" style="overflow: hidden; width: 430px;">
                        <form class="search_form" action="http://.../search.do" method="get" target="_blank">
                            <input id="search_webid" name="webid" type="hidden" value="1">
                            <input name="pg" type="hidden" value="10">
                            <input name="p" type="hidden" value="1">
                            <input name="tpl" type="hidden" value="">
                            <input name="category" type="hidden" value="">
                            <input class="search_text" name="q" autocomplete="off" maxlength="50" size="20" placeholder="输入您需要的服务" value="" type="text">
                            <input class="search_submit" type="submit" name="submit" value="">
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <div id="dowebok" class="fullpage-wrapper" style="height: 100%; position: relative; transform: translate3d(0px, 0px, 0px);">
            <!--第一屏-->
            <div class="section section1 fp-section fp-table active" style="height: 565px; overflow: hidden;">
                <div class="fp-tableCell" style="height:638px;">
                    <!--首页banner建议1920*750px-->
                    <style>
                        .sypage1_bg_main {
                            display: none;
                        }
                    </style>
                    <style>
                        .sypage1_bg_main {
                            display: none;
                        }
                    </style>

                    <div class="sypage1_bg_add">

                        <div class="sypage1_bg_main" style="overflow: hidden; height: 435px; display: none; background-image: url(${contextPath}/resources/login/images/1.jpg); background-position-y: -157.5px;"></div>

                        <div class="sypage1_bg_main" style="overflow: hidden; height: 435px; display: none; background-image: url(${contextPath}/resources/login/images/2.jpg); background-position-y: -157.5px;"></div>

                        <div class="sypage1_bg_main" style="overflow: hidden; height: 435px; display: block; background-image: url(${contextPath}/resources/login/images/indexbg05.jpg); background-position-y: -157.5px;"></div>

                    </div>
                    <div class="sypage1" style="overflow: hidden; height: 640px;">
                        <!--登录框-->
                        <div class="sypage1_login">
								<div class="sc_login">
									<div class="login_tit_main">
										用户中心
										<div class="login_tit1 login_titOn" onclick="checklogin('login_tit1')">个人</div>
										<%--<div class="login_tit2" onclick="checklogin(&#39;login_tit2&#39;)">企业</div>--%>
									</div>
									<!--个人登录-->
									<div class="gr_login" style="display: block;">
                                        <form action="${pageContext.request.contextPath}/pub/userLogin" method="post" name="loginForm">
											<div class="login_r1">
												<input id="username" class="login_user" name="username" type="text" placeholder="手机号">
												<input id="password" class="login_pswd" name="password" type="password" placeholder="请输入密码">
											</div>
											<div class="login_r3">
												<input class="login_submit" type="submit" value="登 录" >
												<a class="login_reg" href="${contextPath}/register" target="_blank">注&nbsp;册</a>
											</div>
											<div class="login_r2">
												<a class="wjmm" href="${contextPath}/forgetPassword" target="_blank">忘记密码？</a>
											</div>
										</form>
									</div>
									<!--法人登录-->
									<%--<div class="fr_login" style="display: none;">
										<form id="frloginform" action="" method="" class="login_form">
											<div class="login_r1">
												<input id="frusername" class="login_user" type="text" placeholder="用户名/工商号/组织机构代码">
												<input id="frpwd" class="login_pswd" type="password" placeholder="请输入密码">
											</div>
											<div class="login_r3">
												<input class="login_submit" type="button" style="width:220px;" value="登 录" onclick="fr_submit();">
												<!--a class="login_reg" href="http://www.jszwfw.gov.cn/jsjis/front/register/corregister.do" target="_blank">注&nbsp;册</a-->
											</div>
											<div class="login_r2">
											<!--  
												<a class="zfbdl" href="../alipay/login.do" target="_blank">支付宝登录</a>-->
												<a class="wjmm" href="http://www.jszwfw.gov.cn/jsjis/front/findpwd/step1.do" target="_blank">忘记密码？</a>
											</div>
										</form>
									</div>--%>
								</div>
                         </div>
                        <!--第一屏底部链接-->
                        <div class="sypage1_bottom">                            
                            <div class="sypage1_link">
                                <div class="sc_sypage1_link">
                                    <a class="sypage1_link1" href="http://www.jszwfw.gov.cn/col/col122785/index.html" target="_blank" style="background-position:0px top;"></a>
                                    <a class="sypage1_link2" href="http://www.jszwfw.gov.cn/col/col13/index.html" target="_blank" style="background-position:-200px top;"></a>
                                    <a class="sypage1_link3" href="http://www.jsggzy.com.cn/" target="_blank" style="background-position:-400px top;"></a>
                                    <a class="sypage1_link4" href="http://12345.jszwfw.gov.cn/" target="_blank" style="background-position:-600px top;"></a>
                                    <a class="sypage1_link5" href="http://www.jszwfw.gov.cn/jsxycx/front/home_show.do" target="_blank" style="background-position:-800px top;"></a>
                                </div>
                            </div>
                        </div>                     
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="foot_main">
        <div class="foot_main_center">
            <div class="foot_dzjg"><a href="http://bszs.conac.cn/sitename?method=show&amp;id=0AC8833E8BF70EE9E053012819AC7074" target="_blank">
                <img src="${contextPath}/resources/login/images/dhui.png"></a></div>
            <div class="foot_word">
                <div class="foot_word_r1">
                    <a href="javascript:void(0)" onclick="SetHome(this,window.location)">设为首页</a>
                    <span>|</span>
                    <a href="" target="_blank">关于我们</a>
                    <span>|</span>
                    <a href="" target="_blank">本站声明</a>
                    <!--
                    <span>|</span>
                    <a href="#" target="_blank">新手指南</a>
                    -->
                    <span>|</span>
                    <a href="" target="_blank">联系我们</a>
                </div>
                <div class="foot_word_r2">
                    <span>主办：福建臻善信息科技有限公司 版权所有</span>
                    <span id="cp_chengban"></span>
                    <span><a href="" target="_blank">备案序号：闽ICP备×××××号</a></span>
                </div>
                <div class="foot_word_r3">
                    <span>运行管理：龙岩市不动产登记中心</span>
                    <span>地址：福建省龙岩市新罗区西安南路423</span>
                    <span>联系电话：0597-2231934</span>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
