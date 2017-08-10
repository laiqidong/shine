<%--
  Created by IntelliJ IDEA.
  User: luoxuan
  Date: 2017/5/12
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
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
    <!--新增的css以及js start-->
    <style type="text/css">
        .fl{float: left;}
        .fr{float: right;}

        /*左边手风琴菜单列表样式开始*/
        .listbox{width:184px;border: 0px solid red;float: left;}
        .list_ul{width:90%;margin: 0 auto;}
        .list_ul .list{margin-bottom: 4px;}
        .list_ul .list h2{height: 34px;line-height: 34px;color: #fff;font-size: 14px;padding-left:30px;cursor: pointer;margin-top: 0px;}
        .list_ul .list h2.list-ul1{background:#087BC1 url(images/register01-01.png) no-repeat 10px 10px;background-size: 12px;}
        .list_ul .list h2.list-ul2{background:#087BC1 url(images/register02-01.png) no-repeat 10px 10px;background-size: 12px;}
        .list_ul .list h2.list-ul3{background:#087BC1 url(images/register03-01.png) no-repeat 10px 10px;background-size: 12px;}
        .list_ul .list h2.list-ul4{background:#087BC1 url(images/register04-01.png) no-repeat 10px 10px;background-size: 12px;}
        .list_ul .list h2.list-ul5{background:#087BC1 url(images/register05-01.png) no-repeat 10px 10px;background-size: 12px;}
        .list_ul .list h2 img{float: right;width: 18px;margin-top: 8px;margin-right: 6px;}
        .list_ul .list h2 span{overflow: hidden;}
        .list_ul .list ul{display: none;margin-top: 4px;}
        .list_ul ul li { line-height:30px;text-indent:24px;cursor: pointer;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;}
        .list_ul ul li:hover{background: #FFF3D9;color: #007C06;}
        .liang{background: #DEF3F3 !important;color: #393939 !important;border-radius: 2px;}
        /*左边手风琴菜单列表样式结束*/

        /*右边表格内容部分样式开始*/
        .col-xs-12{overflow:hidden;border: 0px solid red;margin-right: 20px;}
        .col-xs-12 .head{height: 50px;line-height: 50px;text-align: left;background: #DEEEF6;padding-left: 40px;}
        .col-xs-12 .head span{font-family:"微软雅黑";color: #002E73;font-size:20px;font-weight:600;text-indent: 40px;overflow: hidden;}
        .col-xs-12 .apply_btn{float: right;width: 90px;height: 30px;line-height: 30px;text-align: center;background: #087FC5;color: #fff;border-radius: 5px;font-size:14px;margin-right: 10px;margin-top: 10px;cursor: pointer;text-decoration: none;}
        .col-xs-12 .apply_btn:hover{background: #0099CC;}
        .col-xs-12 .apply_btn a{text-decoration: none;color: #fff;}
        .col-xs-12 .table_box{border: 0px solid blue;min-height: 400px;padding: 20px;background: #fff;}
        .col-xs-12 .table_box table{text-align: left;width: 100%;border: 1px solid #DDD;color: #0068B7;min-width: 600px;}
        .col-xs-12 .table_box table td{padding: 10px 20px;border: 1px solid #DDD;}
        /*右边表格内容部分样式结束*/
        .NoNewline {word-break: keep-all;/*必须*/}
    </style>

</head>

<body>
<div id="barrierfree_container">

    <!--每屏最小高度640px-->
    <!--top-->

    <%@include file="../../layout/front/header.jsp" %>

    <!--主体-->
    <div class="yhzx_all" style="/*position:relative;padding-top:110px; */">
        <div class="yhzx_main" style="/*margin-top: 35px;*/">
            <div class="yhzx_r1">
                <div class="yhzx-left" style="float: left;min-height:476px;">
                    <div class="listbox" style="width: 284px;">
                        <ul class="list_ul" id="list_ul">
                            <li class="list">
                                <h2 class="list-ul1">
                                    <img src="${contextPath}/resources/ysl_front/images/r_btn.png"/>
                                    <span>首次登记</span>
                                </h2>
                                <ul>
                                    <c:forEach items="${scdj}" var="item">
                                        <li title="${item.qllx}" onclick="_content(${item.id})">${item.qllx}</li>
                                    </c:forEach>
                                </ul>
                            </li>
                            <li class="list">
                                <h2 class="list-ul2">
                                    <img src="${contextPath}/resources/ysl_front/images/r_btn.png"/>
                                    <span>转移登记</span>
                                </h2>
                                <ul>
                                    <c:forEach items="${zydj}" var="item">
                                        <li title="${item.qllx}" onclick="_content('${item.id}')">${item.qllx}</li>
                                    </c:forEach>
                                </ul>
                            </li>
                            <li class="list">
                                <h2 class="list-ul3">
                                    <img src="${contextPath}/resources/ysl_front/images/r_btn.png"/>
                                    <span>变更登记</span>
                                </h2>
                                <ul>
                                    <c:forEach items="${bgdj}" var="item">
                                        <li title="${item.qllx}" onclick="_content('${item.id}')">${item.qllx}</li>
                                    </c:forEach>
                                </ul>
                            </li>
                            <li class="list">
                                <h2 class="list-ul4">
                                    <img src="${contextPath}/resources/ysl_front/images/r_btn.png"/>
                                    <span>注销登记</span>
                                </h2>
                                <ul>
                                    <c:forEach items="${zxdj}" var="item">
                                        <li title="${item.qllx}" onclick="_content('${item.id}')">${item.qllx}</li>
                                    </c:forEach>
                                </ul>
                            </li>
                            <li class="list">
                                <h2 class="list-ul5">
                                    <img src="${contextPath}/resources/ysl_front/images/r_btn.png"/>
                                    <span>其他登记</span>
                                </h2>
                                <ul>
                                    <c:forEach items="${qtdj}" var="item">
                                        <li title="${item.qllx}" onclick="_content('${item.id}')">${item.qllx}</li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="c2" style="margin-left:294px;">
                    <div class="col-xs-12" style="background: #ffffff;padding-top: 10px;min-height:476px">
                        <div class="head">
                            <a class="apply_btn" href="#">在线申请</a>
                            <span id="con_title">${scdj[0].qllx}</span>
                        </div>
                        <div class="table_box" id="content">
                            <%--${first.content}--%>
                            ${scdj[0].content}
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
    <div class="foot">
        <script src="./resource/foot.js"></script>

        <link href="css/foot.css" rel="stylesheet"/>
        <script type="text/javascript">

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
        </script>

        <script>
            $(document).ready(function () {
                //获取webid、webname
                var f_webid = $('.site_local').attr('data');
                var f_webname = $('.site_local').text();
                //设置底部版权承办机构
                var wx_cbids = ['6', '50', '53', '51', '54', '52', '49', '47', '48', '115', '119', '120'];
                if (f_webid == '1') {
                    $('#cp_chengban').text('');
                } else if ($.inArray(f_webid, wx_cbids) > -1) {
                    $('#cp_chengban').text('承办：' + f_webname + '行政审批局');
                } else {
                    $('#cp_chengban').text('承办：' + f_webname + '政务服务管理办公室');
                }
                //右侧浮动_登录状态
                $.ajax({
                    url: 'http://jszwfw/front/islogin.do',
                    type: 'post',
                    dataType: 'json',
                    async: true,
                    error: function () {
                    },
                    success: function (data) {
                        if (data.code == 0) {
                            $('#f_right_member').css('background-image', 'url(http://n/picture/2/1612202126339668821.png)');
                        } else {
                            $('#f_right_member').css('background-image', 'url(http:///picture/2/1612202126340019953.png)');
                        }
                    }
                });
                //右侧浮动_12345
                //$('a.f_right_sub.sub2').attr('href','/jszwfw/front/smrx/smrxapply.do?webId='+f_webid);
                $('a.f_right_sub.sub2').attr('href', 'http://.cn/');
                //右侧浮动_纠错链接
                var f_sub3_a = 'http://kkk/jact/front/front_mailwrite?sysid=1&groupid=';
                var f_local_url = '&error_url=' + window.location.href;
                $('a.f_right_sub.sub3').attr('href', f_sub3_a + f_local_url);
                //右侧浮动_返回顶部
                $('a.f_right_sub.sub5').click(function () {
                    $('html,body').stop().animate({scrollTop: 0}, 300);
                });
                //右侧浮动_收回展开效果
                function f_scroll_in() {
                    $('a.f_right_sub.sub1,a.f_right_sub.sub2,a.f_right_sub.sub3,a.f_right_sub.sub4,a.f_right_sub.sub5').stop().animate({top: 275}, 300);
                    //$('a.f_right_sub.sub5').stop().animate({top:214},300);
                    $('.f_right_ctrl').stop().animate({height: '60px', top: 275}, 300);
                    $('a.f_right_sub.sub6').stop().animate({top: 30}, 300);
                    $('a.f_right_sub.sub7').stop().animate({top: 0}, 300);
                }

                function f_scroll_out() {
                    $('a.f_right_sub.sub1').stop().animate({top: 0}, 300);
                    $('a.f_right_sub.sub2').stop().animate({top: 61}, 300);
                    $('a.f_right_sub.sub3').stop().animate({top: 122}, 300);
                    $('a.f_right_sub.sub4').stop().animate({top: 183}, 300);
                    $('a.f_right_sub.sub5').stop().animate({top: 244}, 300);
                    $('.f_right_ctrl').stop().animate({height: '30px', top: 305}, 300);
                    $('a.f_right_sub.sub6').stop().animate({top: 0}, 300);
                    $('a.f_right_sub.sub7').stop().animate({top: 30}, 300);
                }

                $('a.f_right_sub.sub6').click(function () {
                    f_scroll_in();
                });
                $('a.f_right_sub.sub7').click(function () {
                    f_scroll_out();
                });
                //右侧浮动_板块距顶部高度微调
                function f_scroll_H() {
                    var scroll_H = $(window).scrollTop();
                    if (scroll_H >= 250) {
                        //f_scroll_out();
                        $(".f_right").stop().animate({marginTop: -150}, 500);
                        setTimeout(f_scroll_out, 1000);
                    } else if (scroll_H < 250) {
                        //f_scroll_in();
                        $(".f_right").stop().animate({marginTop: -75}, 500);
                        setTimeout(f_scroll_in, 1000);
                    }
                }

                f_scroll_H();
                $(window).scroll(function () {
                    f_scroll_H();
                });
            });
        </script>

    </div>


</div>

<!--<script language="javascript" src="./resource/pagecontrol.js"></script><noscript>&lt;iframe src="*.html"&gt;&lt;/iframe&gt;</noscript>
<script language="javascript" src="./resource/web_front.js"></script>-->
<!--foot-->
<%@include file="../../layout/front/footer.jsp" %>

</body>
<script type="text/javascript">
    $(function () {
        $(".task-head ul li").click(function () {
//			alert($(this).index())
            $(".task-head ul li").removeClass("on");
            $(".task-con").hide();
            $(".task-head ul li").eq($(this).index()).addClass("on");
            $(".task-con").eq($(this).index()).show();
        })
    });

    $(function(){
        $("#list_ul .list").children("h2").eq(0).children("img").attr("src","${contextPath}/resources/ysl_front/images/d_btn.png")
        $("#list_ul .list").children("ul").eq(0).css('display','block')

        $("#list_ul .list h2").click(function(){
            if($(this).next("ul").css("display")=="block"){
                $(this).next("ul").slideUp(300);
                $(this).children("img").attr("src","${contextPath}/resources/ysl_front/images/r_btn.png")
            }else{
                $(this).children("img").attr("src","${contextPath}/resources/ysl_front/images/d_btn.png").parent().parent().siblings().children().children("img").attr("src","${contextPath}/resources/ysl_front/images/r_btn.png");
                $(this).parent().children("ul").stop(true,false).slideToggle(300).parent().siblings().children("ul").slideUp();
            }
        });

        $("#list_ul .list ul li").click(function(){
            var $this_Text=$(this).text();
            $("#con_title").text($this_Text);
            $(this).addClass("liang").siblings().removeClass("liang")
            $(this).addClass("liang").parent().parent().siblings().find("li").removeClass("liang")
        })

    })
    function _content(id){
        $("#simple-table tbody").empty();
        $.ajax({
            url: "${contextPath}/work_guide1/getWorkGuideList/"+id,
            type: "get",
            dataType: "json",
            success: function (result) {
//                var data=;
//                $("#content").html();
                $("#content").html(result.data.content.content);
            }
        })
    }
</script>
</html>
