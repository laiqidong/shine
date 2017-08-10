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
</head>
<style>
    .btn i {
        vertical-align: middle;
    }

    .first-column {
        background-color: #188EEE;
        color: white;
    }
</style>
<body>
<div id="barrierfree_container">
    <!--top-->
    <%@include file="../../layout/front/header.jsp" %>
    <!--主体-->
    <div class="yhzx_all" style="/*position:relative;padding-top:110px; */">
        <div class="yhzx_main" style="/*margin-top: 35px;*/">
            <div class="yhzx_r1">
                <%--<%@include file="../layout/front/sider.jsp" %>--%>

                <div class="c2" style="margin-left: 0;">
                    <div style="background-color:#ffffff; overflow:hidden;padding: 10px 0">
                        <!--宗地信息-->
                        <div class="mian-contain">
                            <ul class="steps" style="margin-left: 0">
                                <li data-step="1" class="active">
                                    <span class="step">1</span>
                                    <span class="title">
                                        房地首次登记
                                    </span>
                                </li>
                                <li data-step="2" class="active">
                                    <span class="step">2</span>
                                    <span class="title">选择宗地信息</span>
                                </li>
                                <li data-step="3" class="active">
                                    <span class="step">3</span>
                                    <span class="title">选择不动产单元</span>
                                </li>
                                <li data-step="4" class="">
                                    <span class="step">4</span>
                                    <span class="title">申请信息填写</span>
                                </li>
                                <li data-step="5">
                                    <span class="step">5</span>
                                    <span class="title">文件确认</span>
                                </li>
                                <li data-step="6">
                                    <span class="step">6</span>
                                    <span class="title">完成</span>
                                </li>

                            </ul>
                            <div id="fixtop" style="z-index: 999;background-color: white;width: 1197px;">
                                <div class="col-sm-12" >
                                    <h5>
                                        已选择的单元：
                                        <span id="bdcdy_app">
                                            <span v-for="(bdcdy,index) in bdcdys">
                                                <%--<div type="button" @click="deleteBdcdy(index)" style="height:30px; margin:3px;width: auto;padding:0 8px;" class="btn btn-app no-radius btn-light btn-xs" >
                                                    <span style="line-height: 30px" >{{bdcdy.HH}}&nbsp;</span>

                                                </div>--%>
                                                <button type="button" @click="deleteBdcdy(index)"
                                                        class="btn btn-white btn-danger btn-round">
                                                    <span style="color: black;">{{bdcdy.HH}}</span>
                                                    <span v-if="bdcdy.FFLB==2" class="blue">(辅房)</span>
                                                    <i class="ace-icon fa fa-minus red2"></i>
                                                </button>
                                            </span>
                                            <span v-if="bdcdys.length>0" class="red">点击即取消选择</span>
                                        </span>
                                    </h5>
                                </div>
                                <%--<div class="col-sm-12">
                                    <h5>
                                        筛选条件：
                                        <input type="checkbox" checked id="ygzt" name="ygzt" value="true" onclick="check()">预告&nbsp;
                                    </h5>
                                </div>--%>
                                <div class="col-sm-12">
                                    <h5>
                                        产权状态：
                                        <span><img style="margin-bottom: 3px;"
                                                   src="${contextPath}/resources/ysl_front/images/icon/在建工程抵押.png" alt="">在建工程抵押</span>
                                        &nbsp;
                                        <span><img style="margin-bottom: 3px;"
                                                   src="${contextPath}/resources/ysl_front/images/icon/预查封.png"
                                                   alt="">预查封</span>
                                        &nbsp;
                                        <span><img style="margin-bottom: 3px;"
                                                   src="${contextPath}/resources/ysl_front/images/icon/预告登记.png" alt="">预告登记</span>
                                        &nbsp;
                                        <span><img style="margin-bottom: 3px;"
                                                   src="${contextPath}/resources/ysl_front/images/icon/抵押权预告登记.png" alt="">抵押权预告登记</span>
                                        &nbsp;
                                        <span><img style="margin-bottom: 3px;"
                                                   src="${contextPath}/resources/ysl_front/images/icon/抵押.png"
                                                   alt="">抵押</span>
                                        &nbsp;
                                        <span><img style="margin-bottom: 3px;"
                                                   src="${contextPath}/resources/ysl_front/images/icon/查封.png"
                                                   alt="">查封</span>
                                        &nbsp;
                                        <span><img style="margin-bottom: 3px;"
                                                   src="${contextPath}/resources/ysl_front/images/icon/异议.png"
                                                   alt="">异议</span>
                                        &nbsp;
                                        <span><img style="margin-bottom: 3px;"
                                                   src="${contextPath}/resources/ysl_front/images/icon/限制.png"
                                                   alt="">限制</span>
                                        &nbsp;
                                        <span><img style="margin-bottom: 3px;"
                                                   src="${contextPath}/resources/ysl_front/images/icon/办理中.png"
                                                   alt="">办理中</span>
                                    </h5>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div id="zrz_app">
                                    <div class="tabbable">
                                        <ul class="nav nav-tabs" id="myTab">
                                            <li v-for="(zrz,index) in zrzs" class="" :class="{'active':!index}">
                                                <a data-toggle="tab" :href="['#'+zrz.BSM]" @click="getHouse(zrz.BSM)"
                                                   aria-expanded="true">
                                                    <%--<i class="green ace-icon fa fa-home bigger-120"></i>--%>
                                                    <img src="${contextPath}/resources/ysl_front/images/icon/房屋.png">
                                                    {{zrz.ZRZH}}
                                                </a>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <div v-for="(zrz,index) in zrzs" :class="{'active':!index}" :id="zrz.BSM"
                                                 class="tab-pane fade in">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <div class="clearfix center">
                                    <div class="mybtn mybtn-large mybtn-orange" id="backBtn" onclick="back()">上一步</div>
                                    <div class="mybtn mybtn-large mybtn-info" id="nextBtn" onclick="next()">下一步</div>
                                </div>
                            <%--<div class="btn-box">
                                <div class="btn-blue" onclick="step1()">上一步</div>
                                <div class="btn-green" onclick="step3()">下一步</div>
                            </div>--%>
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

    </div>
    <%@include file="../../layout/front/footer.jsp" %>
</body>
<script src="${contextPath}/resources/assets/js/jqPaginator.min.js"></script>
<script src="${contextPath}/resources/ysl/js/vue.js"></script>
<script>
    var zrz_app = new Vue({
        el: '#zrz_app',
        data: {
            zrzs: []
        },
        methods: {
            getHouse: function (zrzbsm) {
                getHouses(zrzbsm);
            }
        }
    });
    var bdcdy_app = new Vue({
        el: '#bdcdy_app',
        data: {
            bdcdys: []
        },
        methods: {
            deleteBdcdy: function (i) {
                bdcdy_app.bdcdys.splice(i, 1);
            }
        }
    });
    $(function () {
        var elm = $('#fixtop');
        var startPos = $(elm).offset().top;
        $.event.add(window, "scroll", function() {
            var p = $(window).scrollTop();
            $(elm).css('position',((p) > startPos) ? 'fixed' : 'static');
            $(elm).css('top',((p) > startPos) ? '0px' : '');
        });
        getData();
    });
    function getData() {
        var zddm = '${param.zddm}';
        var zdshiyqbsm = '${param.zdshiyqbsm}';
        var bdcdyh = '${param.bdcdyh}';
        if (zddm == null || zddm == "") {
            _alert("您还未选择所要查询的宗地，请返回上级");
            return;
        }
        var url = '${contextPath}/register/getBuildings?zddm=' + zddm + '&zdshiyqbsm=' + zdshiyqbsm;
        /**
         * 获取自然幢
         */
        _ajax_get(url, function (result) {
            if (result.ret == 1) {
                zrz_app.zrzs.splice(0, zrz_app.zrzs.length);
                $.each(result.data.buildings, function (index, obj) {
                    zrz_app.zrzs.push(obj);
                });
                if (zrz_app.zrzs.length > 0) {
                    getHouses(zrz_app.zrzs[0].BSM);
                }

            } else if (result.ret == 0) {
                _alert("错误:" + result.exception);
            } else {
                _alert(result.msg);
            }
        });
        /**
         * 获取项目关系的单元
         */
        _ajax_get('${contextPath}/front/fdzhdj/getXmgxHouses?yslywh=${param.yslywh}', function (result) {
            $.each(result, function (index, obj) {
                var bdcdy = {
                    HH: obj.hh,
                    BSM: obj.bsm,
                    BDCDYH: obj.bdcdyh,
                    FFLB: obj.fflb

                };
                bdcdy_app.bdcdys.push(bdcdy);
            })
        });
    }
    function getHouses(zrzbsm) {
        var qszt = 0 ;
        var url = '${contextPath}/register/getHouses?zrzbsm=' + zrzbsm +'&qszt='+ qszt ;
        $("#" + zrzbsm).empty();
        _ajax_get(url, function (result) {
            if (result.ret == 1) {
                var houseMap = result.data.houseMap;
                var dyhs = houseMap.dyhs;
                var chs = houseMap.chs;
                var houses = houseMap.houses;
                if (houses.length == 0) {
                    _tips("暂无数据");
                    return;
                }
                var table = '<table class="table  table-bordered table-hover">';
                var tbody = '<tbody>';
                tbody += '<tr><th class="center first-column" style="width:100px;min-width: 100px;">层号</th>' +
                    '<th class="center" style="color: #188EEE">单元</th></tr>';
                $.each(chs, function (index, ch) {
                    var chstr = ch == 'null' ? '其他' : ch + '层';
                    tbody += '<tr><td class="center first-column" style="vertical-align: middle;">' + chstr + '</td>' +
                        '<td id="' + ch + '_' + zrzbsm + '"></td></tr>';
                });
                tbody += '</tbody>';
                table += tbody + '</table>';
                $("#" + zrzbsm).append(table);
                $.each(houses, function (index, obj) {
                    var icon = '';
                    var dyzt = parseInt(obj.DYZT);
                    var cfzt = parseInt(obj.CFZT);
                    var xzzt = parseInt(obj.XZZT);
                    var ygzt = parseInt(obj.YGZT);
                    var blz = parseInt(obj.BLZ);
                    if (dyzt > 0) {
                        if (dyzt == '3') {//在建工程抵押
                            icon += '&nbsp;<img style="margin-bottom: 3px;" src="${contextPath}/resources/ysl_front/images/icon/在建工程抵押.png" alt="">'
                        } else {
                            icon += '&nbsp;<img style="margin-bottom: 3px;" src="${contextPath}/resources/ysl_front/images/icon/抵押.png" alt="">'
                        }
                    }
                    if (cfzt > 0) {
                        if (cfzt == '3') {//预查封
                            icon += '&nbsp;<img style="margin-bottom: 3px;" src="${contextPath}/resources/ysl_front/images/icon/预查封.png" alt="">'
                        } else {
                            icon += '&nbsp;<img style="margin-bottom: 3px;" src="${contextPath}/resources/ysl_front/images/icon/查封.png" alt="">'
                        }
                    }
                    if (ygzt > 0) {
                        if (ygzt == '3' || ygzt == '4' || ygzt == '5' || ygzt == '6') {//抵押权预告
                            icon += '&nbsp;<img style="margin-bottom: 3px;" src="${contextPath}/resources/ysl_front/images/icon/抵押权预告登记.png" alt="">'
                        } else {
                            icon += '&nbsp;<img style="margin-bottom: 3px;" src="${contextPath}/resources/ysl_front/images/icon/预告登记.png" alt="">'
                        }

                    }
                    if (xzzt > 0) {//限制状态
                        icon += '&nbsp;<img style="margin-bottom: 3px;" src="${contextPath}/resources/ysl_front/images/icon/限制.png" alt="">'
                    }
                    if(blz>0) {
                        icon += '&nbsp;<img style="margin-bottom: 3px;" src="${contextPath}/resources/ysl_front/images/icon/办理中.png" alt="">'
                    }
//                    icon += '<i class="ace-icon fa fa-bullhorn bigger-120"></i>&nbsp;';
                    var hh = obj.HH == null ? '空' : obj.HH;
                    var str = obj.CH + '_' + zrzbsm;
                    var djdyh = _get_string(obj.BDCDYH);
                    djdyh = djdyh == "" ? '空' : djdyh;
                    var fflb = obj.FFLB == null ? '0' : obj.FFLB;
                    var zfbsm = obj.ZFBSM == null ? '0' : obj.ZFBSM;
                    var classname = 'btn-light';
                    var div = '<div type="button" style="height:30px; margin:3px;width: auto;padding:0 8px;" ' +
                        'class="btn btn-app no-radius ' + classname + ' btn-xs" onclick="addBdcdy(\'' + obj.BSM + '\')">' +
                        '<span style="line-height: 30px" title="不动产单元号：' + djdyh + '">' + hh + icon + '</span>' +
                        '</div>&nbsp;';
                    $("#" + str).append(div);
                });
            } else if (result.ret == 0) {
                _alert("错误:" + result.exception);
            } else {
                _alert(result.msg);
            }
        });
    }

    function next() {
        if (bdcdy_app.bdcdys.length == 0) {
            _alert("请选择您要办理的单元！");
            return;
        }
        var dybsms = "";
        var i = 0;
        $.each(bdcdy_app.bdcdys, function (index, obj) {
            dybsms += obj.BSM + ',';
            if (obj.FFLB != 2) {
                i++;
            }
        });
        dybsms = dybsms.substring(0, dybsms.length - 1);
        if (i > 1) {
            art.dialog({
                id: 'dialog',
                width: '300',
                title: '提示',
                lock: true,
                icon:'warning',
                button:[
                    {name:'是',
                        callback:function(){
                            _alert("很抱歉，批量业务暂未开启");
                            <%--window.location.href = '${contextPath}/front/fdzhdjPl/step3?dybsms=' + dybsms + '&yslywh=${param.yslywh}&lcdm=${param.lcdm}';--%>
                        }
                    },
                    {name:"否",
                        callback:function(){
                            window.location.href = '${contextPath}/front/fddj/scdjStep3?dybsms=' + dybsms + '&yslywh=${param.yslywh}&lcdm=${param.lcdm}';
                        }
                    }],
                content: '您添加了多个单元，是否按单元分别办理？'
            });
        } else {
            window.location.href = '${contextPath}/front/fddj/scdjStep3?dybsms=' + dybsms + '&yslywh=${param.yslywh}&lcdm=${param.lcdm}';
        }
    }
    function back() {
        window.location.href = '${contextPath}/front/fdzhdj/yzxStep1?yslywh=${param.yslywh}&lcdm=${param.lcdm}';
    }
    function addBdcdy(dybsm) {
        _ajax_get('${contextPath}/register/checkBlz?dybsm=' + dybsm + '&yslywh=${param.yslywh}', function (result) {
            if (result.ret == 1) {
                if (result.data.blz) {
                    _alert("您选中的单元正在办理中。");
                    return;
                } else {
                    _ajax_get('${contextPath}/register/getHouseDetail/' + dybsm, function (result) {
                        if (result.ret == 1) {
                            var lcdm = '${param.lcdm}';
                            var house = result.data.house;
                            var fflb = house.FFLB;
                            var ygzt = house.YGZT;
                            var cfzt = house.CFZT;
                            var xzzt = house.XZZT;
                            var qszt = house.QSZT;
                            if (cfzt > 0) {
                                _alert("该单元已被查封");
                                return;
                            }
                            if (xzzt > 0) {
                                _alert("该单元已被限制");
                                return;
                            }
                            if(qszt != 0){
                                _alert("该单元已做过首次登记");
                                return;
                            }
                            if (fflb == null) {
                                fflb = '0';
                            }
                            if (fflb == '1') {//判断是否为主房
                                addToBdcdyApp(house);
                                _ajax_get('${contextPath}/register/getHousesByZfbsm/' + house.BSM, function (result1) {
                                    if (result1.ret == 1) {
                                        var houses = result1.data.houses;
                                        $.each(houses, function (index, obj) {
                                            addToBdcdyApp(obj);
                                        });
                                        _alert("您选中的单元含有辅房，系统已为您自动添加该辅房信息");
                                    } else if (result.ret == 0) {
                                        _alert("错误:" + result.exception);
                                    } else {
                                        _alert(result.msg);
                                    }
                                });
                            } else if (fflb == '2') {
                                addToBdcdyApp(house);
                                _alert("您选中的单元是辅房，系统已为您自动添加主房信息");
                                if (house.ZFBSM != null) {
                                    addBdcdy(house.ZFBSM);
                                }
                            } else {
                                addToBdcdyApp(house)
                            }
                        } else if (result.ret == 0) {
                            _alert("错误:" + result.exception);
                        } else {
                            _alert(result.msg);
                        }
                    });
                }
            } else if (result.ret == 0) {
                _alert("错误:" + result.exception);
            } else {
                _alert(result.msg);
            }
        });
    }
    function addToBdcdyApp(obj) {
        var flag = true;
        $.each(bdcdy_app.bdcdys, function (index, bdcdy) {
            if (obj.BSM == bdcdy.BSM) {
                flag = false;
                _alert("您已添加过该单元");
            }
        });
        if (flag) {
            bdcdy_app.bdcdys.push(obj);
        }
    }
    function check() {
        var zrzbsm = $(".tab-pane.active").eq(0).attr("id");
        getHouses(zrzbsm);
    }

</script>

</html>
