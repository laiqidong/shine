<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html style="overflow: visible; height: initial;">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>文书下载</title>
    <meta name="sitename" content="龙岩市不动产外网预受理">
    <%@include file="../../layout/front/common_front.jsp" %>
    <%@include file="../../layout/common.jsp" %>
    <style type="text/css">
        .fl{float: left;}
        .fr{float: right;}

        .dl_rt{ margin:22px 22px 16px 15px; background: #fff;}
        .dl_rt table{ width: 100%;border: 1px solid #d9d9d9;}
        .dl_rt table th{ background-color: #118EEE !important;
            color: white; height: 40px;border: 1px solid #d9d9d9;font-family:simsun;font-size:14px;font-weight:bold;text-align: center;}
        .dl_rt table td{height: 40px;text-align: center;border: 1px solid #d9d9d9;font-family:simsun;font-size:14px;}
        .dl_rt table td input[type="checkbox"]{width: 30px;height:20px;}
        .dl_rt table a{display: inline-block; margin-right: 10px; padding: 5px 15px 5px 40px; border-radius:5px;color: #ffffff !important;text-decoration: none;}
        .dl_rt table a[class='blue']{background:#118eee url(${contextPath}/resources/ysl_front/images/doc02.png) no-repeat 10px center;background-size: 24px;}
        .dl_rt table a[class='bulegreen']{background:#06a730 url(${contextPath}/resources/ysl_front/images/doc03.png) no-repeat left center;}

        .dl_tab_top{border: 1px solid #d9d9d9; padding:16px 0; border-bottom: none;}
        .dl_tab_top span{font-size: 18px;color:#00a0e9; font-weight: bold;line-height: 35px; margin-left: 20px;}
        .search_box{ margin-right: 10px;}
        .search_btn{ display:inline-block;padding: 7px 20px 7px 20px; border-radius:4px; background: #019e07;text-align: center;color: #ffffff !important;text-decoration: none; }
        .search_box input{height: 30px;line-height:30px;width: 380px; margin-right: 10px;text-indent: .5em;}

        .load-table table tr th{text-align: center;}
        .btn-box{width:50%;margin: 0 auto;height: 40px;margin-bottom: 10px;text-align: center;}
        .btn-blue{background: #4076BD !important;width: 100px;margin-right: 30px;border-radius: 3px;line-height:30px;float: left;margin-left:100px;text-align: center;color: #ffffff;cursor: pointer;}
        .btn-green{background: #74B11E !important;width: 100px;margin-right: 30px;border-radius: 3px;line-height:30px;float: left;text-align: center;color: #ffffff;cursor: pointer;cursor: pointer;}
        .btn-blue:hover{background: #4094bd !important;}
        .btn-green:hover{background: #93b11e !important;}

        .yhzx-nav ul{margin-left: 0px !important;}
        .yhzx-nav ul li{text-align: center;}
        .yhzx-nav ul li.on{background: #4178BE;color: #ffffff;}
        .yhzx-nav ul li.active{background: #DEF3F3;}
        .yhzx-nav ul li img{border: 1px solid red;}
    </style>
</head>
<body>
<div id="barrierfree_container">
    <!--top-->
    <%@include file="../../layout/front/header.jsp" %>
    <!--主体-->
    <div class="yhzx_all" style="/*position:relative;padding-top:110px; */">
        <div class="yhzx_main" style="/*margin-top: 35px;*/">
            <div class="yhzx_r1">
                <div class="yhzx-left" style="float: left;min-height:476px;">
                    <div class="yhzx-nav" style="width: 184px;">
                        <ul id="type_app">
                            <li class="on">
                                <!--<img src="images/set.png"/>-->
                                <span>文书材料</span>
                            </li>
                            <li :id="'type_'+temp.id" v-for="(temp,index) in types" :class="index==0? 'active':''" >
                                <!--<img src="images/set.png"/>-->
                                <span @click="files(temp.id)">{{temp.type}}</span>
                            </li>
                            <%--<li>
                                <!--<img src="images/set.png"/>-->
                                <span>公告文书</span>
                            </li>
                            <li class="active">
                                <!--<img src="images/task.png"/>-->
                                <span>通知/告知书</span>
                            </li>
                            <li>
                                <!--<img src="images/consult.png"/>-->
                                <span>资料查询文书</span>
                            </li>
                            <li>
                                <!--<img src="images/complain.png"/>-->
                                <span>其他文书格式</span>
                            </li>--%>
                        </ul>
                    </div>
                </div>
                <div class="c2" style="margin-left:194px;">
                    <div class="col-xs-12" style="background: #ffffff;padding-top: 10px;min-height:476px">
                        <div class="dl_rt">
                            <%--<div class="dl_tab_top">

                                &lt;%&ndash;<div class="search_box fr">
                                    <input type="text"/>
                                    <a href="#" class="search_btn">搜索</a>
                                </div>&ndash;%&gt;
                                <span>材料列表</span>
                            </div>--%>
                            <table id="file_app">
                                <tr>
                                    <th width="110px">序号</th>
                                    <th>材料名称</th>
                                    <th width="140px">材料格式</th>
                                    <th width="246px">操作</th>
                                </tr>
                                <tr v-for="(file,index) in files">
                                    <td>{{index+1}}</td>
                                    <td>{{file.name}}</td>
                                    <td>doc</td>
                                    <td>
                                        <a :href="'${contextPath}/wsDownload/download/'+file.id" class="blue">下载</a>
                                        <a href="#" @click="preview(file.id)" class="bulegreen">预览</a>
                                    </td>
                                </tr>
                                <%--<tr>
                                    <td>2</td>
                                    <td>不动产权证书登记证明遗失（灭失）声明</td>
                                    <td>docx</td>
                                    <td><a href="#" class="blue">下载</a><a href="#" class="bulegreen">预览</a></td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>不动产权证书登记证明作废公告</td>
                                    <td>docx</td>
                                    <td><a href="#" class="blue">下载</a><a href="#" class="bulegreen">预览</a></td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>不动产首次登记公告</td>
                                    <td>docx</td>
                                    <td><a href="#" class="blue">下载</a><a href="#" class="bulegreen">预览</a></td>
                                </tr>--%>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--底部-->
    <%@include file="../../layout/front/footer.jsp" %>
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
<script src="${contextPath}/resources/ysl/js/vue.js"></script>

</body>
<script type="text/javascript">
    var type_app = new Vue({
        el: '#type_app',
        data: {
            types: [{}]
        },
        methods:{
            files:function(id){
                $("#type_app li").removeClass("active");
                $("#type_" + id).addClass("active");
                getFiles(id);
            }
        }
    });
    var file_app = new Vue({
        el: '#file_app',
        data: {
            files: []
        },
        methods: {
            preview: function (id) {
                _dialog("${contextPath}/wsDownload/getWordPreview/"+id,
                    "文件预览",1000,600,function () {
                    })
            }
        }
    });
    _ajax_get("${contextPath}/wsDownload/downTypes", function (result) {
        if (result.length > 0) {
            type_app.types.splice(0, type_app.types.length);
        }
        $.each(result, function (index, obj) {
            type_app.types.push(obj);
        });
        getFiles(type_app.types[0].id);
    });
    function getFiles(id) {
        _ajax_get("${contextPath}/wsDownload/documents/" + id, function (result) {
            file_app.files.splice(0, file_app.files.length);
            $.each(result, function (index, obj) {
                file_app.files.push(obj);
            });
        });
    }
</script>
</html>
