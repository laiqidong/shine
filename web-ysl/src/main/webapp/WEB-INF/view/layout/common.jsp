<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<link rel="stylesheet" href="${contextPath}/resources/assets/css/bootstrap.css"  />
<link rel="stylesheet" href="${contextPath}/resources/components/font-awesome/css/font-awesome.css" />
<link rel="stylesheet" href="${contextPath}/resources/assets/css/ace-fonts.css" />
<link rel="stylesheet" href="${contextPath}/resources/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
<link rel="stylesheet" href="${contextPath}/resources/components/_mod/jquery-ui/jquery-ui.css" />
<link rel="stylesheet" href="${contextPath}/resources/artDialog/skins/default.css">
<link rel="stylesheet" href="${contextPath}/resources/components/select2/dist/css/select2.css" />
<!--[if lte IE 9]>
<link rel="stylesheet" href="${contextPath}/assets/components/css/ace-ie.css" />
<![endif]-->
<link rel="stylesheet" href="${contextPath}/resources/assets/css/ace-skins.css" />
<link rel="stylesheet" href="${contextPath}/resources/assets/css/ace-rtl.css" />



<!-- ace settings handler -->
<script src="${contextPath}/resources/assets/js/ace-extra.js"></script>
<!--[if lte IE 8]>
<script src="${contextPath}/resources/assets/html5shiv/dist/html5shiv.min.js"></script>
<script src="${contextPath}/resources/assets/respond/dest/respond.min.js"></script>
<![endif]-->


<!--[if !IE]> -->
<script src="${contextPath}/resources/components/jquery/dist/jquery.js"></script>
<!-- <![endif]-->
<!--[if IE]>
<script src="${contextPath}/resources/components/jquery.1x/dist/jquery.js"></script>
<![endif]-->
<script src="${contextPath}/resources/components/bootstrap/dist/js/bootstrap.js"></script>


<!-- page specific plugin scripts -->

<!-- ace scripts -->
<script src="${contextPath}/resources/assets/js/src/elements.scroller.js"></script>
<script src="${contextPath}/resources/assets/js/src/elements.colorpicker.js"></script>
<script src="${contextPath}/resources/assets/js/src/elements.fileinput.js"></script>
<script src="${contextPath}/resources/assets/js/src/elements.typeahead.js"></script>
<script src="${contextPath}/resources/assets/js/src/elements.wysiwyg.js"></script>
<script src="${contextPath}/resources/assets/js/src/elements.spinner.js"></script>
<script src="${contextPath}/resources/assets/js/src/elements.treeview.js"></script>
<script src="${contextPath}/resources/assets/js/src/elements.wizard.js"></script>
<script src="${contextPath}/resources/assets/js/src/elements.aside.js"></script>
<script src="${contextPath}/resources/assets/js/src/ace.js"></script>
<script src="${contextPath}/resources/assets/js/src/ace.basics.js"></script>
<script src="${contextPath}/resources/assets/js/src/ace.scrolltop.js"></script>
<script src="${contextPath}/resources/assets/js/src/ace.ajax-content.js"></script>
<script src="${contextPath}/resources/assets/js/src/ace.touch-drag.js"></script>
<script src="${contextPath}/resources/assets/js/src/ace.sidebar.js"></script>
<script src="${contextPath}/resources/assets/js/src/ace.sidebar-scroll-1.js"></script>
<script src="${contextPath}/resources/assets/js/src/ace.submenu-hover.js"></script>
<script src="${contextPath}/resources/assets/js/src/ace.widget-box.js"></script>
<script src="${contextPath}/resources/assets/js/src/ace.settings.js"></script>
<script src="${contextPath}/resources/assets/js/src/ace.settings-rtl.js"></script>
<script src="${contextPath}/resources/assets/js/src/ace.settings-skin.js"></script>
<script src="${contextPath}/resources/assets/js/src/ace.widget-on-reload.js"></script>
<script src="${contextPath}/resources/assets/js/src/ace.searchbox-autocomplete.js"></script>
<script src="${contextPath}/resources/components/jquery-ui/jquery-ui.js"></script>
<script src="${contextPath}/resources/artDialog/artDialog.js"></script>
<script src="${contextPath}/resources/artDialog/artWindowTools.js"></script>
<script src="${contextPath}/resources/artDialog/artDialog.iframeTools.js"></script>

<script src="${contextPath}/resources/components/fuelux/js/wizard.js"></script>
<script src="${contextPath}/resources/components/jquery-validation/dist/jquery.validate.js"></script>
<script src="${contextPath}/resources/components/jquery-validation/dist/additional-methods.js"></script>
<script src="${contextPath}/resources/components/bootbox.js/bootbox.js"></script>
<script src="${contextPath}/resources/components/jquery.maskedinput/dist/jquery.maskedinput.js"></script>
<script src="${contextPath}/resources/components/select2/dist/js/select2.js"></script>
<script src="${contextPath}/resources/components/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="${contextPath}/resources/components/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>

<!-- 自定义js -->
<script src="${contextPath}/resources/common/common_manage.js"></script>
<script src="${contextPath}/resources/common/common.js"></script>



<style type="text/css">
    /*opacity是设置遮罩透明度的，可以自己调节*/
    #loading{position:fixed;top:0;left:0;width:100%;height:100%;background: #565656;opacity:0.5;z-index:15000;}
    #loading span{position:absolute;top:50%;left:46%;}
    td{word-wrap:break-word;word-break:break-all;} /* td自动换行*/
    .file {
        position: relative;
        display: inline-block;
        background: #D0EEFF;
        border: 1px solid #99D3F5;
        border-radius: 4px;
        padding: 4px 12px;
        overflow: hidden;
        color: #1E88C7;
        text-decoration: none;
        text-indent: 0;
        line-height: 20px;
    }
    .file input {
        position: absolute;
        font-size: 100px;
        right: 0;
        top: 0;
        opacity: 0;
    }
    .file:hover {
        background: #AADFFD;
        border-color: #78C3F3;
        color: #004974;
        text-decoration: none;
    }
    #showFileName{
        font-size:150%;
        position: relative;
        vertical-align: top;overflow: hidden;
    }
</style>
<div id="loading" hidden>
    <span style="color: white;font-size: x-large"><i class="ace-icon fa fa-spinner fa-spin white"></i>&nbsp;加载中...</span>
</div>