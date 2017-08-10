//首页辅助-设参调用
$(document).ready(function(){
	//首屏背景图切换
	var sypage1_bg_i = 0;
	function sypage1_bg(){
		sypage1_bg_i %= 3;
		$(".sypage1_bg_add .sypage1_bg_main").eq(sypage1_bg_i).stop(true,true).fadeIn(800).siblings().stop(true,true).fadeOut(500);
		sypage1_bg_i++;
	}
	sypage1_bg();
	setInterval(sypage1_bg,5000);
	//个人-法人登录框切换
	$(".login_tit1").click(function(){
		$(".login_tit1").addClass("login_titOn").siblings(".login_tit2").removeClass("login_titOn");
		$(".gr_login").stop().fadeIn(300).siblings(".fr_login").hide();
	});
	$(".login_tit2").click(function(){
		$(".login_tit2").addClass("login_titOn").siblings(".login_tit1").removeClass("login_titOn");
		$(".fr_login").stop().fadeIn(300).siblings(".gr_login").hide();
	});
	
	//试运行公告
	var test_run = "<style>.test_run{ width:290px; height:150px; position:fixed; top:140px; left:50%; margin-left:210px; z-index:200;}.test_run_close{ display:block; width:30px; height:30px; position:absolute; top:0px; right:0px; background:url(http://www.jszwfw.gov.cn/picture/2/1610281414014392747.png) top no-repeat; cursor:pointer;}.test_run_close:hover{ background:url(http://www.jszwfw.gov.cn/picture/2/1610281822423574445.png) top no-repeat;}.test_run_main{ width:290px; height:120px; position:absolute; top:30px; left:0px; background:url(http://www.jszwfw.gov.cn/picture/2/1612302113539204473.png) top no-repeat;}</style><div class='test_run'><a class='test_run_close'></a><a href='http://www.jszwfw.gov.cn/art/2016/12/30/art_122805_64849.html' target='_blank'><div class='test_run_main'></div></a></div>";
	$(".top").before(test_run);
	$(".test_run_close").click(function(){
		$(".test_run").stop(true,true).fadeOut(300);
	});
	
	
	//公告公示
	var gggs_index = 0;
	var gggs_H = $(".sc_gggs_list .list_main").height();
	var gggs_len = Math.ceil(gggs_H/50);
	function gggs_action(){
		gggs_index++;
		gggs_index %= gggs_len;
		$(".sc_gggs_tit").text(gggs_index);
		$(".sc_gggs_list .list_main").stop(true).animate({top:-50*gggs_index},500);
	}
	gggs_action();
	var play = setInterval(gggs_action,5000);
	$(".gggs_stop").hover(function(){
		clearInterval(play);
	},function(){
		play = setInterval(gggs_action,5000);
	});	
	$(".gggs_up").click(function(){
		gggs_index++;
		gggs_index %= gggs_len;
		$(".sc_gggs_list .list_main").stop(true).animate({top:-50*gggs_index},500);
	});
	$(".gggs_down").click(function(){
		gggs_index--;
		if(gggs_index<0){
			gggs_index = gggs_len-1;
		}
		gggs_index %= gggs_len;
		$(".sc_gggs_list .list_main").stop(true).animate({top:-50*gggs_index},500);
	});
	
	
	var azt_webid = $(".site_local").attr("data");
	//个人-按主题-切换效果
	$(".scp2_azt_list .scp2_azt_sub").eq(12).after("<a class='scp2_azt_sub' href='/jszwfw/bscx/itemlist/gr_index.do?webId="+azt_webid+"&themid=B131&deptid=' title='规划建设' target='_blank' style='background-image:url(http://www.jszwfw.gov.cn//picture/1/1701181117576484264.png);'><div></div><span>规划建设</span></a>");
	function scp2_azt_page(){
		var scp2_azt_i = 0;     //单元index
		var scp2_azt_len = 0;   //单元总数量
		var scp2_azt_num = 15;  //单元组内数量
		var scp2_azt_p = 0;     //单元屏数
		var scp2_azt_pi = 0;    //单元屏次
		var scp2_azt_copyW;		//屏宽
		scp2_azt_len = $(".scp2_azt_list .scp2_azt_sub").length;
		scp2_azt_p = Math.ceil(scp2_azt_len/scp2_azt_num);
		//标记分组
		$(".scp2_azt_list .scp2_azt_sub").each(function(){
			scp2_azt_pi = parseInt($(this).index()/scp2_azt_num);
			$(this).addClass("sub"+scp2_azt_pi);
		});
		//生成新分组
		for(var i=0; i<scp2_azt_p; i++){
			$(".scp2_azt_btn").append("<div class='azt_btn'></div>");			
			$(".scp2_azt_list2").append("<div class='scp2_azt_copy sub" + i + "'></div>");
			$(".scp2_azt_copy.sub"+i).html($(".scp2_azt_list").html());
			$(".scp2_azt_copy.sub"+i+" .scp2_azt_sub").not($(".sub"+i)).remove();
		}
		//改变新列表总宽度
		scp2_azt_copyW = $(".scp2_azt_copy").width();
		$(".scp2_azt_list2").width(scp2_azt_copyW*(scp2_azt_p+1));
		//设置按钮居中
		$(".scp2_azt_btn").css({left:285-25*scp2_azt_p});
		$(".scp2_azt_btn .azt_btn").eq(scp2_azt_i).addClass("azt_btnOn").siblings().removeClass("azt_btnOn");
		$(".scp2_azt_btn .azt_btn").mouseover(function(){
			scp2_azt_i = $(this).index();
			$(".scp2_azt_btn .azt_btn").eq(scp2_azt_i).addClass("azt_btnOn").siblings().removeClass("azt_btnOn");
			$(".scp2_azt_list2").stop().animate({left:-scp2_azt_i*scp2_azt_copyW},300);
		});
	}
	scp2_azt_page();
		
	//法人-按主题-切换效果
	$(".scp3_azt_list .scp3_azt_sub").eq(15).attr("title","国土和规划建设").find("span").text("国土和规划建设");
	$(".scp3_azt_list .scp3_azt_sub").eq(17).after("<a class='scp3_azt_sub' href='/jszwfw/bscx/itemlist/fr_index.do?webId="+azt_webid+"&themid=B234&deptid=' title='应对气候变化' target='_blank' style='background-image:url(http://www.jszwfw.gov.cn/picture/1/1701181117576128589.png);'><div></div><span>应对气候变化</span></a>");
	function scp3_azt_page(){
		var scp3_azt_i = 0;     //单元index
		var scp3_azt_len = 0;   //单元总数量
		var scp3_azt_num = 15;  //单元组内数量
		var scp3_azt_p = 0;     //单元屏数
		var scp3_azt_pi = 0;    //单元屏次

		var scp3_azt_copyW;		//屏宽
		scp3_azt_len = $(".scp3_azt_list .scp3_azt_sub").length;
		scp3_azt_p = Math.ceil(scp3_azt_len/scp3_azt_num);
		//标记分组
		$(".scp3_azt_list .scp3_azt_sub").each(function(){
			scp3_azt_pi = parseInt($(this).index()/scp3_azt_num);
			$(this).addClass("sub"+scp3_azt_pi);
		});
		//生成新分组
		for(var i=0; i<scp3_azt_p; i++){
			$(".scp3_azt_btn").append("<div class='azt_btn'></div>");			
			$(".scp3_azt_list2").append("<div class='scp3_azt_copy sub" + i + "'></div>");
			$(".scp3_azt_copy.sub"+i).html($(".scp3_azt_list").html());
			$(".scp3_azt_copy.sub"+i+" .scp3_azt_sub").not($(".sub"+i)).remove();
		}
		//改变新列表总宽度
		scp3_azt_copyW = $(".scp3_azt_copy").width();
		$(".scp2_azt_list3").width(scp3_azt_copyW*(scp3_azt_p+1));
		//设置按钮居中
		$(".scp3_azt_btn").css({left:285-25*scp3_azt_p});
		$(".scp3_azt_btn .azt_btn").eq(scp3_azt_i).addClass("azt_btnOn").siblings().removeClass("azt_btnOn");
		$(".scp3_azt_btn .azt_btn").mouseover(function(){
			scp3_azt_i = $(this).index();
			$(".scp3_azt_btn .azt_btn").eq(scp3_azt_i).addClass("azt_btnOn").siblings().removeClass("azt_btnOn");
			$(".scp3_azt_list2").stop().animate({left:-scp3_azt_i*scp3_azt_copyW},300);
		});
	}
	scp3_azt_page();
	
	
	//首页第四屏效果
	$(".sc_p4 .sc_p4_cell").each(function(){
		if($(this).index()>=5){
			$(this).addClass("Off");
		}
	});
	for(var i=0; i<5; i++){
		$(".sc_p4 .sc_p4_cell").each(function(){
			if($(this).index()%5==i){
				$(this).addClass("On"+i).clone().appendTo($(".scopy_p4_sub.On"+i));
			}
		});
	}
	$(".scopy_p4_sub .sc_p4_cell").mouseenter(function(){
		$(this).stop().animate({height:250,paddingTop:140},500).siblings().stop().animate({height:60,paddingTop:14},500);
		$(this).find(".p4_cell_img,.p4_cell_list").stop(true,true).fadeIn(500);
		$(this).siblings().find(".p4_cell_img,.p4_cell_list").stop(true).fadeOut(500);
	});
	
	//底部复制
	var foot_html = $(".foot_hidden .foot_main").html();
	$(".section4 .foot").html(foot_html);	
});