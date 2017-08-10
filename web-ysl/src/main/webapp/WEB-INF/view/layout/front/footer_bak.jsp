<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="foot">
    <style>
    .foot{ background-color:#d9d9d9;}
    .foot_main{ width:100%; height:110px; background-color:#d9d9d9;}
    .foot_main_center{ width:1000px; height:110px; margin:0 auto; position:relative;}
    .foot_dzjg{ width:50px; height:62px; position:absolute; top:24px; left:0px;}
    /*版权信息*/
    .foot_word{ position:absolute; top:10px; left:80px;}
    .foot_word_r1{ height:32px;}
    .foot_word_r1 span{ padding-left:5px; padding-right:5px;}
    .foot_word_r1 a{ font-size:15px; line-height:32px; cursor:pointer;}
    .foot_word_r2,.foot_word_r3{}
    .foot_word_r2 span,.foot_word_r3 span{ margin-right:10px; font-size:13px; line-height:32px; color:#666;}
    .foot_word_r2 span a{ color:#666;}
    .foot_word_r2 span a:hover{ color:#4178be;}
    /*底部政府链接*/
    .foot_gov_link{ width:220px; height:90px; position:absolute; top:10px; right:0px; border-left:1px solid #b3b3b3;}
    a.gov_link1{ display:block; width:125px; height:30px; position:absolute; top:10px; left:30px; background:url(#) top no-repeat;}
    a.gov_link2{ display:block; width:162px; height:30px; position:absolute; top:50px; left:30px; background:url(#) top no-repeat;}
    /*右侧浮动*/
    .f_right{ width:60px; height:335px; position:fixed; top:50%; right:20px; margin-top:-150px; margin-right:auto; z-index:100;}
    .f_right_main{ width:60px; height:335px; position:relative;}
    a.f_right_sub{ display:block; width:60px; height:60px; position:absolute; left:0px; background-image:url(#); background-repeat:no-repeat; cursor:pointer;}
    a.f_right_sub.sub1{ top:0px; background-position:0px 0px;}
    a.f_right_sub.sub1:hover{ background-position:0px -60px;}
    a.f_right_sub.sub2{ top:61px; background-position:0px -120px;}
    a.f_right_sub.sub2:hover{ background-position:0px -180px;}
    a.f_right_sub.sub3{ top:122px; background-position:0px -240px;}
    a.f_right_sub.sub3:hover{ background-position:0px -300px;}
    a.f_right_sub.sub4{ top:183px; background-position:0px -360px;}
    a.f_right_sub.sub4:hover{ background-position:0px -420px;}
    .f_right_sub.sub4 .f_right_QRcode{ display:none; width:150px; height:140px; position:absolute; left:-150px; bottom:0px; background:url(#) top no-repeat;}
    .f_right_sub.sub4:hover .f_right_QRcode{ display:block;}
    a.f_right_sub.sub5{ top:244px; background-position:0px -480px;}
    a.f_right_sub.sub5:hover{ background-position:0px -540px;}

    .f_right_ctrl{ width:60px; height:30px; overflow:hidden; position:absolute; top:305px;}
    a.f_right_sub.sub6{ top:0px; height:30px; background:none; background-color:#999; font-size:15px; line-height:30px; color:#fff; text-align:center;}
    a.f_right_sub.sub6:hover{ background-color:#4496f3;}
    a.f_right_sub.sub7{ display:; top:30px; background-position:0px -630px;}
    @media screen and (max-width:1220px){
        .f_right{ right:50%; margin-right:-580px;}
    }
    /*便民服务文章页样式-更新1208*/
    .bmfu_art_all .art_date{ height:auto; min-height:32px; overflow:hidden;}
    /*服务一站频道页通样式-更新1209*/
    .fwyzt_r1{ display:none;}
    /*单元格内数字、英文折行行-更新1222*/
    td{ word-break:break-all;}
    /*首页公告公示-更新0106*/
    .sypage1_gggs{ visibility:hidden;}
    .sc_gggs_index .gggs_up{ top:4px;}
    .sc_gggs_index .gggs_down{ bottom:4px;}
    /*首页首屏底部链接-更新0106*/
    .sypage1_link{ margin-top:-30px;}
    /*头尾box-sizing:border-box*/
    .top,
    .top div,
    .top a,
    .top form,
    .top input,
    .top span,
    .foot,
    .foot div,
    .foot a,
    .foot span{ box-sizing:border-box;}
</style>
    <div class="foot_main">
        <div class="foot_main_center">
            <div class="foot_dzjg"><a href="#" target="_blank"><img src="${contextPath}/resources/ysl_front/resource/foot_icon.png"></a></div>
            <div class="foot_word">
                <div class="foot_word_r1">
                    <%--<a href="javascript:void(0)" onclick="SetHome(this,window.location)">设为首页</a>--%>
                    <%--<span>|</span>--%>
                    <a href="${contextPath}/about_us" target="_blank">关于我们</a>
                    <span>|</span>
                    <a href="${contextPath}/statement" target="_blank">本站声明</a>
                    <!--
                    <span>|</span>
                    <a href="#" target="_blank">新手指南</a>
                    -->
                    <span>|</span>
                    <a href="${contextPath}/contact_us" target="_blank">联系我们</a>
                </div>
                <div class="foot_word_r2">
                    <span>主办：福建臻善信息科技有限公司 版权所有</span>
                    <span id="cp_chengban">承办：政务服务管理办公室</span>
                    <span><a href="http://www.miitbeian.gov.cn" target="_blank">备案序号：闽ICP备×××××号</a></span>
                </div>
                <div class="foot_word_r3">
                    <span>运行管理：龙岩市不动产登记中心</span>
                    <span>地址：福建省龙岩市新罗区西安南路423</span>
                    <span>联系电话：0597-2231934</span>
                </div>
            </div>
        </div>
    </div>
    <!--右侧浮动-->
    <%--<div class="f_right" style="margin-top: -150px;">--%>
        <%--<div class="f_right_main">--%>
            <%--<a class="f_right_sub sub1" id="f_right_member" href="" target="_blank" style="top: 0px;"></a>--%>
            <%--<a class="f_right_sub sub2" href="http://.cn/" target="_blank" style="top: 61px;"></a>--%>
            <%--<a class="f_right_sub sub3" href="http://kkk/jact/front/front_mailwrite?sysid=1&amp;groupid=&amp;error_url=file:///C:/Users/fjzs/Desktop/%E5%AE%97%E5%9C%B0/%E5%AE%97%E5%9C%B0/index-zd.html" target="_blank" style="top: 122px;"></a>--%>
            <%--<a class="f_right_sub sub4" style="top: 183px;"><div class="f_right_QRcode"></div></a>--%>
            <%--<a class="f_right_sub sub5" style="top: 244px;"></a>--%>
        <%--</div>--%>
        <%--<div class="f_right_ctrl" style="height: 30px; top: 305px;">--%>
            <%--<a class="f_right_sub sub6" style="top: 0px;">收起</a>--%>
            <%--<a class="f_right_sub sub7" style="top: 30px;"></a>--%>
        <%--</div>--%>
    <%--</div>--%>
</div>