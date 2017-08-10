
//首页效果
$(document).ready(function(){
	$(".top_nav .top_nav_sub").eq(0).addClass("top_nav_subOn").siblings().removeClass("top_nav_subOn");
	$(".f_right").css({height:240});
	//fullpage回调效果
	//$('#dowebok').fullpage({
	//	afterLoad: function(anchorLink, index){
	//		$(".top_nav .top_nav_sub").eq(index-1).addClass("top_nav_subOn").siblings().removeClass("top_nav_subOn");
	//	},
	//	onLeave: function(index, direction){
	//	}
	//});
	
	var win_W = $(window).width();
	var win_H = $(window).height();
	var p1bg_W = 1920;
	var p1bg_H = 435;
	var p2bg_W = $(".sypage2_bg").width();
	var p2bg_H = $(".sypage2_bg").height();
	var p1bg_WH = p1bg_W/p1bg_H;
	var p2bg_WH = p2bg_W/p2bg_H;
	var p1bg_T = -157.5;
	var p2bg_L = -200;
	
	function page_auto(){
		if(win_H>640){
			$.fn.fullpage.setAutoScrolling(true); //允许全屏效果
			/*首屏自适应*/
			p1bg_T = -(750-(win_H-205))/2;
			$(".section1,.sypage1,.section2,.section3,.section4").stop().animate({height:win_H},50);
			$(".sypage1_bg_main").stop().animate({height:win_H-205,"background-position-y":p1bg_T},50);
			/*第二、三、四屏自适应*/
			$(".sypage2,.sypage3,.sypage4").stop().animate({height:640,"padding-top":100,"padding-bottom":0},50);
			p2bg_L = -(p2bg_WH*win_H-win_W)/2;
			$(".sypage3_line").stop().show();
			/*显示向下箭头*/
			$(".down_index").stop().show();
		}else{
			$.fn.fullpage.setAutoScrolling(false); //禁止全屏效果
			$("body").css({"overflow-x":"hidden"});
			/*首屏自适应*/
			p1bg_T = -157.5;
			$(".section1,.sypage1,.section2,.section3,.section4").stop().animate({height:565},50);
			$(".sypage1_bg_main").stop().animate({height:p1bg_H,"background-position-y":p1bg_T},50);
			$(".sypage1").stop().animate({height:640},50);
			/*第二、三、四屏自适应*/
			$(".sypage2,.sypage3,.sypage4").stop().animate({height:565,"padding-top":35,"padding-bottom":35},50);
			p2bg_L = -(p2bg_W-win_W)/2;
			$(".sypage3_line").stop().hide();
			/*显示向下箭头*/
			$(".down_index").stop().hide();
		}
	}
	page_auto();	
	
	/*窗口变化*/
	$(window).resize(function(){
		win_W = $(window).width();
		win_H = $(window).height();
		page_auto();
	});
	
	/*个人审批-按主题-按部门切换*/
	var gr_right_index = 0;
	function gr_right_tab(){
		$(".sypage2 .right_tit_main .right_tit").eq(gr_right_index).addClass("right_titOn").siblings().removeClass("right_titOn");
		$(".sypage2 .right_list_main .right_list").eq(gr_right_index).css({'visibility':'visible','z-index':'1'}).siblings().css({'visibility':'hidden','z-index':'-1'});
	}
	gr_right_tab();
	$(".sypage2 .right_tit_main .right_tit").mouseover(function(){
		gr_right_index = $(this).index();
		gr_right_tab();
	});
	
	/*法人审批-按主题-按部门切换*/
	var fr_right_index = 0;
	function fr_right_tab(){
		$(".sypage3 .right_tit_main .right_tit").eq(fr_right_index).addClass("right_titOn").siblings().removeClass("right_titOn");
		$(".sypage3 .right_list_main .right_list").eq(fr_right_index).css({'visibility':'visible','z-index':'1'}).siblings().css({'visibility':'hidden','z-index':'-1'});
	}
	fr_right_tab();
	$(".sypage3 .right_tit_main .right_tit").mouseover(function(){
		fr_right_index = $(this).index();
		fr_right_tab();
	});
	
});












