var userid = "";
var username = "";
jQuery( function()
{
console.log("----------------------KAISHI-----------------");
    $("#mytable").hide();
    $("#mytable2").hide();
    // $("#bj_title").hide();
    // $("#cg_title").hide();
    /*我的办件-已提交-草稿箱*/
    var wdbj_i = 0;

    function wdbj_tab() {
        
        $(".wdbj_tittab_main .wdbj_tittab").eq(wdbj_i).addClass("On").siblings().removeClass("On");
        $(".wdbj_list_main .wdbj_listtab").eq(wdbj_i).stop(true, true).fadeIn(300).siblings().hide();
    }

    wdbj_tab();
    $(".wdbj_tittab_main .wdbj_tittab").mouseover(function () {
        wdbj_i = $(this).index();
        wdbj_tab();
    });

    /*我的办件-已提交*/
    if ($(".ytj_list_main .ytj_list_cell").length > 6) {
        $(".wdbj_list_ytj").css({"overflow-y": "scroll"});
    }
    /*我的办件-草稿箱*/
    if ($(".cgx_list_main .cgx_list_cell").length > 6) {
        $(".wdbj_list_cgx").css({"overflow-y": "scroll"});
    }


    var ticket = getTicket();
    var needSSO = getNeedSSO();
console.log("----------------------needSSO -----------------"+needSSO );
    if(needSSO=="true"){//是否需要单点登录，方便测试。
        if (ticket != null && ticket != "") {//如果ticket不为空，则走单点登录
            $.ajax({
                type: "post",
                url: getPath() + "/SSOController.do?getUserInfo=true",
                data: {
                    ticket: getTicket()
                },
                success: function (userInfo) {
                    if (userInfo != null) {

                        if (userInfo.errormsg != null) {
                            alert(userInfo.errormsg);
                            return;
                        } else {
                            var userId = userInfo.IDUSER;
                            if (userId == undefined || userId == "undefined") {
                                removeDocument();
                                console.log("没有用户信息！");
                                return;
                            }
                            userid = userInfo.IDUSER;
                            username = userInfo.name;

                            var filedValArr = [{
                                text:"SQ_YW",
                                length: 15
                            },{
                                text:"YW_NAME",
                                length: 15
                            }];
                            var pg = new pagination('templat',filedValArr);
                            var pg2 = new pagination('templat2',filedValArr);

                            doQuery(pg);
                            doQuery2(pg2);
                            $( "#doQuery" ).click( function()
                            {
                                doQuery( pg );
                            } );

                            $('.close').click(function(){
                                $('#popup,#shade').hide();
                            });

                        }


                    } else {
                        removeDocument();
                        console.log("没有用户信息！");
                    }

                }
            });
        }else{
            removeDocument();
            alert("没有可用的票据信息！");
            return;
        }

    }else{
        userid = getid();
        username = getUsername();
        var filedValArr = [{
            text:"SQ_YW",
            length: 15
        },{
            text:"YW_NAME",
            length: 15
        }];
        var pg = new pagination('templat',filedValArr);
        var pg2 = new pagination('templat2',filedValArr);

        doQuery(pg);
        doQuery2(pg2);
        $( "#doQuery" ).click( function()
        {
            doQuery( pg );
        } );

        $('.close').click(function(){
            $('#popup,#shade').hide();
        });
    }


} );
//
function removeDocument(){
    $("#templat").remove();
    $("#templat2").remove();
}
// 列表查询-我的办件
function doQuery( pg )
{
    $("#templat").remove();
    $("#mytable").hide();
    $("#mytable").append('<tr class="ytj_list_main ytj_list_cell" id="templat"   > ' +
        '<td class="ytj_cell1" title="{SQ_YW}">{SQ_YW_SUB}</td> ' +
        '<td class="ytj_cell2">{BJ_STATU}</td> ' +
        '<td class="ytj_cell3">{SJ_TIME}</td> ' +
        '<td class="ytj_cell4"><a class="ytj_cell4_1" href="" target="_blank">查看</a></td> ' +
        '<td style="display: none">{IDINF_APPLY}</td> ' +
        '<td style="display: none">{STATU}</td> ' +
        '<td style="display: none">{IDCASE}</td> ' +
        '<td style="display: none">{IDDEPT_YW}</td> ' +
        '<td style="display: none">{PROCESSDEFINITIONID}</td> ' +
        '<td style="display: none">{ORG_ID}</td> ' +
        '<td style="display: none">{TASKID}</td> ' +
        '<td style="display: none">{PROCESSINSTANCEID}</td></tr>');

    pg.setPageNo(1);
    pg.setPageSize(5);
    pg.setAfterQuery(caozuo);
    //pg.setIsShow( true );
    pg.load( getPath() + "/WdbjController.do?blcxMain=true",
        {
        } );
}
// 草稿-列表查询
function doQuery2( pg )
{
    $("#templat2").remove();
    $("#mytable2").hide();
    $("#mytable2").append('<tr class="cgx_list_main cgx_list_cell" id="templat2" > ' +
        '<td class="cgx_cell1" title="{YW_NAME}">{YW_NAME_SUB}</td> ' +
        '<td class="cgx_cell2">{PROCESSDEFINITIONNAME}</td> ' +
        '<td class="cgx_cell3">{SAVEDATE}</td> ' +
        '<td class="cgx_cell4"><a class="cgx_cell4_1" ' +
        'href="javascript:void(0)" onclick="cg_bianji(\'{PROCESSDEFINITIONID}\',\'{EXTENDPARAM}\',\'{SAVEUSERID}\',\'{PROCESSDEFINITIONNAME}\',\'{IDDRAFTS}\')" target="_blank">继续编辑</a></td> </tr>');
    pg.setPageNo(1);
    pg.setPageSize(5);
    pg.setAfterQuery(caozuo_cg);
    pg.load( getPath() + "/BjcgController.do?bjcgMain=true",
        {
        } );

}
function caozuo()
{
    $("#mytable tr:gt(0)").each(function() {
        var eq1 = $(this).children("td").eq(1);
        // var eq2 = $(this).children("td").eq(2);
        var eq3 = $(this).children("td").eq(3);
        var eq4 = $(this).children("td").eq(4);
        var eq5 = $(this).children("td").eq(5);
        var eq6 = $(this).children("td").eq(6);
        var eq7 = $(this).children("td").eq(7);
        var eq8 = $(this).children("td").eq(8);
        var eq9 = $(this).children("td").eq(9);
        var eq10 = $(this).children("td").eq(10);
        var eq11 = $(this).children("td").eq(11);
        var eq12 = $(this).children("td").eq(12);
        var eq1 = $(this).children("td").eq(1).wrap('<a href="javascript:void(0);"onclick=" details.history(\'' + eq4.html() +'\',\''+eq9.html()+'\')"></a>');
        if(eq1.html()=='窗口预审,不通过')
        {
            eq3.html('<a class="ytj_cell4_1" href="javascript:tiaozhuan1(\''+eq4.html()+'\',\''+eq5.html()+'\',\''+eq6.html()+'\',\''+eq7.html()+'\',\''+eq8.html()+'\',\''+eq9.html()+'\',\''+eq10.html()+'\',\''+eq11.html()+'\')">查看</a>'+
                '<a class="ytj_cell4_1" href="javascript:tiaozhuan2(\''+eq4.html()+'\',\''+eq5.html()+'\',\''+eq6.html()+'\',\''+eq7.html()+'\',\''+eq8.html()+'\',\''+eq9.html()+'\',\''+eq10.html()+'\',\''+eq11.html()+'\')">修改</a>');
        }else{
            eq3.html('<a class="ytj_cell4_1" href="javascript:tiaozhuan1(\''+eq4.html()+'\',\''+eq5.html()+'\',\''+eq6.html()+'\',\''+eq7.html()+'\',\''+eq8.html()+'\',\''+eq9.html()+'\',\''+eq10.html()+'\',\''+eq11.html()+'\')">查看</a>');
        }
    });
    showTab();
};

function caozuo_cg()
{
    showTab();
};
//根据选中的tab页 决定显示已提交的办件还是草稿
function showTab(){
    if($(".wdbj_tittab_main .wdbj_tittab").eq(0).hasClass("On")){
        $("#mytable").show();
        $("#bj_title").show();
        $("#mytable2").hide();
        // $("#cg_title").hide();
    }else{
        $("#mytable2").show();
        // $("#cg_title").show();
        $("#mytable").hide();
        // $("#bj_title").hide();
    }
}
function cg_bianji(pro,json,userId,proName,iddraft){
    var ywid=json.replace(/\<p>/g,'"');//json.YWID;//JSON.parse(json)
    ywid=JSON.parse(ywid).YWID;
    $.ajax({
        type : "post",
        url : getPath() + "/ConsultativeController.do?findByid=true",
        data :
        {
            ywid:ywid
        },
        success : function(data){
            var strs= new Array();
            strs=data.split(",");
            window.parent.location.href=strs[2]+'?processDefinitionId='+strs[0]+'&json={"YWID":%22'+ywid+'%22}&userId='+userId+'&processDefinitionName='+proName+'&flag=editer&iddraft='+iddraft+'&org_id='+strs[1]+'';
            //self.location=strs[2]+'?processDefinitionId='+strs[0]+'&json={"YWID":%22'+ywid+'%22}&userId='+id+'&org_id='+strs[1]+'';
        }
    });
}
//打开查看页面
function tiaozhuan1(idinf,statu,idcase,ywid,pro,orgid,taskid,processinstanceid){
    window.parent.location.href="bjform.jsp?IDINF_APPLY="+idinf+"&STATU="+statu+"&processDefinitionId="+pro+"&json={%22YWID%22:%22"+ywid+"%22}&userId="+userid+"&idCase="+idcase+"&taskId="+taskid+"&org_id="+orgid+"&processinstanceid="+processinstanceid+"&watch=true";
    //"bjform.jsp?IDINF_APPLY={IDINF_APPLY}&STATU={STATU}&processDefinitionId={PROCESSDEFINITIONID}&json={YWID:{IDDEPT_YW}}&userId=<%=id %>&flag=find&taskId={TASKID}&idEntityLog={IDINF_APPLYOLD}&idFormDefinition={FORMID}" target="_blank">查看</a>
}
function tiaozhuan2(idinf,statu,idcase,ywid,pro,orgid,taskid,processinstanceid)
{
    $.ajax({
        type : "post",
        url : getPath() + "/WdbjController.do?findurl=true",
        dataType:'Text',
        success : function(msg){
            window.parent.location.href=msg+"?IDINF_APPLY="+idinf+"&STATU="+statu+"&processDefinitionId="+pro+"&json={%22YWID%22:%22"+ywid+"%22}&userId="+userid+"&idCase="+idcase+"&flag=modify&org_id="+orgid+"&taskId="+taskid+"&processinstanceid="+processinstanceid+"&watch=false";
        }
    });
    //'http://192.168.10.202:9090/starshine-workspace/starshine/netInvoking/index.html?processDefinitionId={PROCESSDEFINITIONID}&json={YWID:{IDDEPT_YW}}&userId=<%=id%>&flag=find&taskId={TASKID}&idEntityLog={IDINF_APPLYOLD}&idFormDefinition={FORMID}'
    //window.parent.location.href="http://218.2.177.210:9000/onlineGovHall/starshine/netInvoking/index.html?IDINF_APPLY="+idinf+"&STATU="+statu+"&processDefinitionId="+pro+"&json="+ywid+"&userId="+id+"&flag=find&taskId="+taskid+"&idEntityLog="+idlog+"&idFormDefinition="+formid+"&IDCASE="+idcase+"";

}

var details = {
    history : function(idInf,idorg) {
        var page = $(window.document);
        var ajaxUrl = getPath() + '/WdbjController.do?findDetailHistory=true';
        if(idorg!='25'){ //若不是质监的办件 则查询本地库
            ajaxUrl = getPath()+'/BLCXController.do?bjyjInfo';
        }
        /*
         * function doQuery2( pg )
			{
			    $("#templat2").remove();
			    $("#mytable2").hide();
			    $("#mytable2").append('<tr class="cgx_list_main cgx_list_cell" id="templat2" > ' +
			        '<td class="cgx_cell1" title="{YW_NAME}">{YW_NAME_SUB}</td> ' +
			        '<td class="cgx_cell2">{PROCESSDEFINITIONNAME}</td> ' +
			        '<td class="cgx_cell3">{SAVEDATE}</td> ' +
			        '<td class="cgx_cell4"><a class="cgx_cell4_1" ' +
			        'href="javascript:void(0)" onclick="cg_bianji(\'{PROCESSDEFINITIONID}\',\'{EXTENDPARAM}\',\'{SAVEUSERID}\',\'{PROCESSDEFINITIONNAME}\',\'{IDDRAFTS}\')" target="_blank">继续编辑</a></td> </tr>');
			    pg.setPageNo(1);
			    pg.setPageSize(5);
			    pg.setAfterQuery(caozuo_cg);
			    pg.load( getPath() + "/BjcgController.do?bjcgMain=true",
			        {
			        } );
			
			}
         * */
        $.ajax({
            url : ajaxUrl,
            data : {idInf : idInf,IDT_YWBL_INF:idInf},
            type : 'post',
            success : function(e) {
                var rows = e.items || [], html = '', length = e.total;
                for(var i = 0, l = rows.length; i < l; i++) {
                    html += '<tr>';
                    html += '<td>' + (rows[i].CONTENT || '') + '</td>';
                    html += '<td>' + (rows[i].OPNAME || '') + '</td>';
                    html += '<td>' + (rows[i].OPTIME || '') + '</td>';
                    if(null==rows[i].PROCESS_REPORT_NAME){
                    	html += '<td>' + (rows[i].JY || '') + '</td>';
                    }else{
                    	var url = getPath()+'/portal/watchBJinf.jsp?idInf='+rows[i].NO;
                    	html += '<td><a href="'+url+'" target="view_window" style="color: blue;">' + (rows[i].JY || '') + '</a></td>';
                    }
                    /*html += '<td>' + (rows[i].PROCESS_REPORT_NAME || '') + '</td>';*/
                    html += '<td style="display:none;">' + (rows[i].NO || '') + '</td>';
                    html += '</tr>';
                }
                if(!rows.length)
                    html = '<tr><td colspan="5"><p style="margin-left: 18px;">没有记录</p></td><tr>';
                var _top = (page.height() - $('.popup', page).height())/2;
                var _left = (page.width() - $('.popup', page).width())/2;
                $('#popup .btools').html('共 ' + (length || 0) + ' 条记录');
                $('#details tbody').html(html);
                $('#shade,#popup').show();
                $('.popup').css({top:_top,left:_left});
            }
        });
    }
};
