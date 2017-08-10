<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link type="text/css" rel="stylesheet" href="${contextPath}/resources/login/global.css">
    <script type="text/javascript" src="${contextPath}/resources/login/jquery.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${contextPath}/resources/login/image.css">
    <%--<script type="text/javascript" src="${contextPath}/resources/login/jquery.scrollUp.min.js"></script>--%>
    <script type="text/javascript" src="${contextPath}/resources/login/ie6fixed.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/login/jquery.cookie.js"></script>
    <link type="text/css" rel="stylesheet" href="${contextPath}/resources/login/page.css">
    <script type="text/javascript" src="${contextPath}/resources/login/ui.js"></script>
    <%--<script type="text/javascript" src="${contextPath}/resources/login/page.js"></script>--%>
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
    <link type="text/css" rel="stylesheet" href="${contextPath}/resources/login/checkpwd.css">
    <script type="text/javascript" src="${contextPath}/resources/login/checkpwd.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/login/jsencrypt.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/login/rsa_util.js"></script>


    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title>个人用户注册</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/login/hanweb.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/login/yhzc_gr.css">
    <script type="text/javascript" src="${contextPath}/resources/login/idcardValidity.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/artDialog/skins/default.css">
    <script src="${contextPath}/resources/artDialog/artDialog.js"></script>
    <script src="${contextPath}/resources/artDialog/artWindowTools.js"></script>
    <script src="${contextPath}/resources/artDialog/artDialog.iframeTools.js"></script>
    <script src="${contextPath}/resources/common/common.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/ysl_front/css/index.css"/>

    <script>
        var levelNum;
        function trim(str) {
            return str.replace(/(^\s*)|(\s*$)/g, "");
        }//过滤左右空格

        function match() {
            password = trim($('#password').val());
            password2 = trim($('#password2').val());
            if (password == password2) {
                return true;
            } else {
                return false;
            }
        }

        window.alert = function (msg, type, fu) {
            top.$.messager.alert(' ', msg, type, fu);
        };

        $.validity.setup({
            outputMode: "showErr"
        }); //校验错误弹出

        window.confirm = function (msg, okCall, cancelCall) {
            top.$.messager.confirm(' ', msg, function (flag) {
                if (flag) {
                    if (typeof(okCall) != 'undefined') {
                        okCall();
                    }
                } else {
                    if (typeof(cancelCall) != 'undefined') {
                        cancelCall();
                    }
                }
            });
        };
        $(function () {
            var pwdlevel = 1;
            $("#account").focus();
            $('#registerform').validity(function () {
                $('#account').require('请填写手机号码')
                        .match('account', "对不起，您输入的手机号错误");
                $('#password').require('请填写密码').minLength(6, '密码不少于6位').maxLength(18, "密码最多18个字")
                        .assert(function () {
                            if (level == "weak") {
                                levelNum = 0;
                            } else if (level == "medium") {
                                levelNum = 1;
                            } else if (level == "strong") {
                                levelNum = 2;
                            }
                            if (levelNum < pwdlevel) {
                                $('#verifyImg').click();
                                return false;
                            } else {
                                return true;
                            }
                        }, "密码强度低于系统要求");
                $('#password2').require('请填写确认密码').assert(match(), '两次输入密码不一致，请正确填写');
                //$('#name').require('请填写姓名').match('username1','姓名只能由字母、数字、下划线、中文组成,不能以下划线开头和结尾');
                $("#idCard").require("请填写证件号码");
                var papersType = $("#papersType").val();
                if (papersType == 1) {
                    $("#idCard").assert(IdCardValidate($('#idCard').val()), "对不起,您输入的身份证格式不正确");
                }
            }, {
                beforeSubmit: function (validateResult) {
                    /*var u_user = $('#account').val();
                     var u_password = $('#password').val();
                     $('#enc_name').val(RSAencode(u_user));
                     $('#enc_password').val(RSAencode(u_password));*/
                },
                success: function (result) {
                    var jsondata = $.parseJSON(result);
                    if (jsondata.ret == "1") {
                        alert("注册成功");
                    } else {
                        alert("注册失败");
                    }
                }
            }, {
                submitHandler: function (form) {
                    alert("submitted");
                    form.submit();
                }
            });
            //findArea();
        });


        //发送手机短信验证码
        function sendCode() {
            var account = $("#account").val();
            //var randCode = $("#randCode").val();
            if (account == "") {
                alert("请输入手机号码")
            } else if (!(/^1[34578]\d{9}$/.test(account))) {
                alert("对不起，您输入的手机号码错误");
            }/*else if(randCode == "") {
             alert("请输入图片验证码");
             }*/
            else {
                /*
                 $.ajax({
                 type:"post",
                 url:"sendaccountrand.do",
                 data:"account="+account+"&userType=1&randCode="+randCode,
                 success:function(result){
                 if(result.success) {
                 alert("短信发送成功");
                 var num = 120
                 timer = setInterval(function(){
                 $("#sendaccountCodeTime").show();
                 $("#sendaccountCode").hide();
                 $("#sendaccountCodeTime").val(num--+"s后可重新发送");
                 num = num--;
                 }, 1000);
                 setTimeout(function(){
                 clearInterval(timer);
                 $("#sendaccountCodeTime").hide();
                 $("#sendaccountCode").show();
                 }, 121*1000);
                 }else {
                 alert(result.message);
                 $('#verifyImg').click();
                 }
                 }
                 });
                 */

            }

        }

        /**
         *检查唯一项是否重复
         */
        var isReg = false;
        function checkAccount() {
            var value = $("#account").val();
            if (!/^(13|15|18|17)[0-9]{9}$/.test(value)) {
                $("#account_warn").html("手机号码未填或格式不正确");
                isReg = false;
            } else {
                $.ajax({
                    type: "get",
                    url: '${contextPath}/getUser?account=' + value,
                    dataType: "json",
                    success: function (result) {
                        if (result.ret == 1) {
                            $("#account_warn").html("手机号：" + value + "已被注册！");
                            isReg = false;
                        } else {
                            $("#account_warn").html("");
                            isReg = true;
                        }
                    }
                });
            }
        }
        /**
         *  校验身份证格式
         * */
        function checkID() {
            var value = $("#idCard").val();
            if (!IdCardValidate(value)) {
                $("#idCard_warn").html("身份证号码未填或格式不正确");
                isReg = false;
            } else {
                $("#idCard_warn").html("");
                isReg = true;
            }
        }
        /**
         * 校验姓名
         * */
        function checkName() {
            var value = $("#name").val();
            if (value == '') {
                $("#name_warn").html("请填写真实姓名");
                isReg = false;
            } else {
                $("#name_warn").html("");
                isReg = true;
            }
        }
        /**
         * 密码校验
         * */
        function checkPwd() {
            var value = $("#password").val();
            if (value == '' || value.length < 6 || value.length > 18) {
                $("#password_warn").html("密码长度为6-18个字符");
                isReg = false;
            } else {
                $("#password_warn").html("");
                isReg = true;
            }
        }
        /**
         * 重复密码校验
         * */
        function checkPwd2() {
            if ($("#password").val() == $("#password2").val()) {
                $("#password2_warn").html("");
                isReg = true;
            } else {
                $("#password2_warn").html("密码不一致，请重新输入");
                isReg = false;
            }
        }
        /**
         * 动态获取市级所属的区县
         */
        // function findArea() {
        //	 $("#area option:gt(0)").remove();
        //	var code = $("#city").val();
        //	if(code == "999999") {
        //	}else {
        //		$.ajax({
        //			url:"${contextPath}/showarea.do",
        //			data:"code="+code,
        //			success:function(result) {
        //				if(result.success) {
        //					$("#area").append("<option value='"+code+"'>市本级</option>")
        //					var jisAreas = result.params.jisAreaList;
        //					for(var i = 0; i < jisAreas.length;i++) {
        //						var jisArea = jisAreas[i];
        //						$("#area").append("<option value='"+jisArea.code+"'>"+jisArea.name+"</option>")
        //					}
        //				}else {
        //					alert(result.message);
        //				}
        //			}
        //		});
        //	}
        //}


        var s = 60;
        function getCode(obj) {
            if(!isReg){
                _tips("必填项未通过",2);
                return false;
            }
            $.ajax({
                type: 'get',
                url: '${contextPath}/sendSmsCode',
                data:{"account":$("#account").val()},
                dataType: 'json',
                success: function (result) {
                    if (result.ret == 1) {
                        resetSmsCode(obj);
                        _tips("验证码发送成功，请注意查收",2);
                    }else{
                        _tips(result.msg,2);
                    }

                }
            });
        }

        function resetSmsCode(obj) {
            var $this = $(obj);
            if (s == 0) {
                $this.attr("onclick", "getCode(this)");
                $this.val("获取验证码");
                s = 60;
            } else {
                $this.removeAttr("onclick");
                $this.val("重新发送(" + s + ")");
                s--;
                setTimeout(function () {
                    resetSmsCode(obj);
                }, 1000);
            }

        }
        /**
         *提交注册
         */
        function reg_submit() {

            if (isReg) {
                var data = {
                    account: $("#account").val(),
                    password: $("#password").val(),
                    idCard: $("#idCard").val(),
                    name: $("#name").val(),
                    code: $("#smsCode").val()
                }
                $.ajax({
                    type: 'POST',
                    url: '${contextPath}/regPubUser',
                    data: data,
                    dataType: 'json',
                    success: function (result) {
                        if (result.ret == "1") {
                            _tips("注册成功，前往登录......","2");
                            window.location.href="${contextPath}/front/loginPage";
                        }else{
                            _tips(result.msg,2);
                        }
                    }
                });
            }else{
//                alert("有未完成信息");
            }
        }
    </script>
    <style>
        #sendaccountCodeTime {
            display: block;
            width: 180px;
            height: 50px;
            position: absolute;
            top: 0px;
            left: 200px;
            background-color: #A5A599;
            border: none;
            font-size: 17px;
            line-height: 50px;
            color: #fff;
            text-align: center;
        }

        .warning {
            color: red;
        }
    </style>
</head>

<body>

<!--top-->
<div class="top">
    <div class="top_main">
        <%--<div class="top_logo"><a class="top_logo_a" href="${contextPath}/index"><img--%>
        <%--src="${contextPath}/resources/login/images/bg-login-logo2.png"></a></div>--%>
        <div class="top_tit">用户注册(个人)</div>
        <div class="top_nav">
            <a class="return" href="${contextPath}/">返回网站首页</a>
        </div>
        <!--
        <div class="top_search">
            <form>
                <input class="text" type="text">
                <input class="submit" type="submit" value="">
            </form>
        </div>
        -->
    </div>
</div>

<!--主体-->
<div class="yhzc_all">
    <div class="yhzc_main">
        <form id="registerform">
            <input id="type" name="type" type="hidden" value="1">

            <div class="yhzc_tit_main">
                <span class="c1">注册信息</span>
                <span class="c2">以下带<font color="#fe4242">*</font>为必填项</span>
            </div>


            <div class="yhzc_list_main">
                <div class="list_cell">
                    <div class="cell_r1">
                        <div class="c1">手机号码：<font color="#fe4242">*</font></div>
                        <div class="c2">
                            <input id="account" name="account" class="cell_r1_input" type="text" value=""
                                   placeholder="请填写正确手机号码（登录账号）"
                                   onblur="checkAccount();" required>

                        </div>
                    </div>
                    <div class="cell_r2">
                        <div class="c1"></div>
                        <div class="c2 warning" id="account_warn" style="color: red;"></div>
                    </div>
                </div>
                <div class="list_cell">
                    <div class="cell_r1">
                        <div class="c1">密码：<font color="#fe4242">*</font></div>
                        <div class="c2">
                            <input id="password" name="password" type="password" class="cell_r1_input"
                                   placeholder="长度为6-18个字符，强度推荐‘中’"
                                   onkeyup="javascript:EvalPwd(this.value);"
                                   onkeydown="if(event.keyCode==32) {event.returnValue = false;return false;}"
                                   onpaste="return false" onblur="checkPwd()" required>
                        </div>
                    </div>
                    <div class="cell_r2">
                        <div class="c1"></div>
                        <div class="c2 warning" id="password_warn" style="color: red;"></div>
                    </div>
                    <div class="cell_r3">
                        <div class="c1"></div>
                        <div class="c2" id="pwdpower">
                            <div id="pweak" class="code_deg">弱</div>
                            <div id="pmedium" class="code_deg">中</div>
                            <div id="pstrong" class="code_deg" style=" border:none;">强</div>
                        </div>
                        <div class="c3"></div>
                    </div>
                </div>

                <div class="list_cell">
                    <div class="cell_r1">
                        <div class="c1">确认密码：<font color="#fe4242">*</font></div>
                        <div class="c2">
                            <input id="password2" name="password2" type="password" class="cell_r1_input"
                                   placeholder="两次密码必须一致" value="" onblur="checkPwd2()">
                        </div>
                    </div>
                    <div class="cell_r2">
                        <div class="c1"></div>
                        <div class="c2 warning" id="password2_warn" style="color: red;"></div>
                    </div>
                </div>

                <div class="list_cell">
                    <div class="cell_r1">
                        <div class="c1">姓名：<font color="#fe4242">*</font></div>
                        <div class="c2"><input id="name" name="name" class="cell_r1_input" type="text" value=""
                                               onblur="checkName()"
                                               placeholder="请填写真实姓名" required></div>
                    </div>
                    <div class="cell_r2">
                        <div class="c1"></div>
                        <div class="c2 warning" id="name_warn" style="color: red;"></div>
                    </div>
                </div>

                <%--<div class="list_cell">--%>
                <%--<div class="cell_r1">--%>
                <%--<div class="c1">证件类型：<font color="#fe4242">*</font></div>--%>
                <%--<div class="c2">--%>
                <%--<select id="papersType" name="papersType" class="cell_r1_input" style=" padding-right:0px;">--%>
                <%--<option value="1">身份证</option>--%>
                <%--<option value="2">护照</option>--%>
                <%--<option value="3">港澳居民往来内地通行证</option>--%>
                <%--<option value="4">台湾居民往来大陆通行证</option>--%>
                <%--</select>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<div class="cell_r2">--%>
                <%--<div class="c1"></div>--%>
                <%--<div class="c2">请选择证件类型</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%----%>
                <div class="list_cell">
                    <div class="cell_r1">
                        <div class="c1">身份证号码：<font color="#fe4242">*</font></div>
                        <div class="c2">
                            <input class="cell_r1_input" type="text" value="" id="idCard" name="idCard"
                                   placeholder="请填写正确证件号码"
                                   onblur="checkID();" required></div>
                    </div>
                    <div class="cell_r2">
                        <div class="c1"></div>
                        <div class="c2 warning" id="idCard_warn" style="color: red;"></div>
                    </div>
                </div>
                <%--<div class="list_cell">--%>
                <%--<div class="cell_r1">--%>
                <%--<div class="c1">地址：<font color="#fe4242">*</font></div>--%>
                <!--
                  <div class="c2" style="width:100px;">

                    <select id="city" name="cityCode" class="cell_r1_input" style=" padding-right:0px;width:150px" onchange="findArea();">
                        <option value="320100">南京市</option>
                        <option value="320500">苏州市</option>
                        <option value="320200">无锡市</option>
                        <option value="320400">常州市</option>
                        <option value="320600">南通市</option>
                        <option value="321000">扬州市</option>
                        <option value="320300">徐州市</option>
                        <option value="320900">盐城市</option>
                        <option value="320700">连云港市</option>
                        <option value="321300">宿迁市</option>
                        <option value="320800">淮安市</option>
                        <option value="321200">泰州市</option>
                        <option value="321100">镇江市</option>
                        <option value="999999">其他省</option>
                    </select>
                </div>
                 <div style="float: left;height: 40px;width:50px;margin-left:70px;margin-top: 10px;font-size:18px">
                    <span>市</span></div>
                <div class="c2" style="width:150px;">
                    <select id="area" name="areaCode" class="cell_r1_input" style="width:150px">
                        <option value="999999">请选择</option>
                    <option value="320100">市本级</option><option value="320106">鼓楼区</option><option value="320102">玄武区</option><option value="320104">秦淮区</option><option value="320105">建邺区</option><option value="320113">栖霞区</option><option value="320111">浦口区</option><option value="320116">六合区</option><option value="320125">高淳区</option><option value="320117">溧水区</option><option value="320115">江宁区</option><option value="320114">雨花台区</option><option value="320192">化工园区</option><option value="320193">经济技术开发区</option><option value="320191">高新区</option></select>

                </div>
                 <div style="float:left;height: 40px;width:50px;margin-left: 20px; margin-top: 10px;font-size:18px">
                 <span>区/县</span>
                 </div>
                 <div class="cell_r2">
                    <div class="c1"></div>
                    <div class="c2">请选择所在城市</div>
                </div>
                 -->
                <%--<div class="c2">--%>
                <%--<input class="cell_r1_input" type="text" value="" id="companyAddress" name="companyAddress">--%>
                <%--</div>--%>
                <%--</div>--%>

                <%--</div>--%>

                <!--div class="list_cell">
                    <div class="cell_r1">
                        <div class="c1">Email：<font color="#fe4242">*</font></div>
                        <div class="c2"><input id="email" name="email" class="cell_r1_input" type="text" value="" onblur="checkValue(this);"></div>
                    </div>
                    <div class="cell_r2">
                        <div class="c1"></div>
                        <div class="c2">请填写正确电子邮箱</div>
                    </div>
                </div-->


                <!--div class="list_cell" style=" margin-bottom:20px;">
                <div class="cell_r1">
                    <div class="c1">图片验证码：<font color="#fe4242">*</font></div>
                    <div class="c2">
                        <input id="randCode" name="randCode" class="check_code_input" type="text" value="">
                       <img id="verifyImg" src="${contextPath}/resources/login/verifyCode.do" onclick="this.src=&#39;http://www.jszwfw.gov.cn/jsjis//component/verifyCode.do?code=4&amp;var=rand&amp;width=142&amp;height=40&amp;random=&#39;+ Math.random();" style="cursor:pointer" class="check_code_img">
                    </div>
                </div>
                <div class="cell_r2">
                    <div class="c1"></div>
                    <div class="c2">请填写正确的图片验证码，否则无法进行短信发送</div>
                </div>
            </div-->
                <div class="list_cell">
                    <div class="cell_r1">
                        <div class="c1">短信验证码：<font color="#fe4242">*</font></div>
                        <div class="c2">
                            <input id="smsCode" name="smsCode" class="check_code_input"
                                   type="text" value="" style="width: 230px;">
                            <input class="form_reset"  type="button" value="获取验证码"
                                   style="margin-left: 120px;width: 130px;" onclick="getCode(this)">
                        </div>

                    </div>
                    <div class="cell_r2">
                        <div class="c1"></div>
                        <div class="c2 warning" style="color: red;"></div>
                    </div>
                </div>

                <div class="list_cell_last">
                    <div class="cell_last_r1">
                        <div class="c1"></div>
                        <div class="c2">
                            <input class="form_reg" type="button" value="注 册" onclick="reg_submit()">
                            <input class="form_reset" type="reset" value="重 置">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<!--foot-->
<%@include file="../layout/front/footer.jsp" %>



<a id="scrollUp" href="#" title="" style="position: fixed; z-index: 2147483647; display: none;"></a></body>
</html>