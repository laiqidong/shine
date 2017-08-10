<%--
  Created by IntelliJ IDEA.
  User: luoxuan
  Date: 2017/6/13
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .top-logo{border:0px solid red;position: absolute;left:20px;top:20px;text-decoration: none;width:600px}
    .top-logo img{float:left;margin-right: 10px;}
    .top-logo .logo-name .zhongwen{font-family: "微软雅黑";font-size:22px;color: #067ebb;font-weight: bolder;letter-spacing:2px;}
    .top-logo .logo-name .yingwen{font-family: "微软雅黑";font-size:14px;color: #2391c2;word-spacing:2px;margin-top: -10px;}
    .yhzx-nav .list1{background: url(${contextPath}/resources/ysl_front/images/2.png) no-repeat 22px center;}
    .yhzx-nav .list1:hover{background: url(${contextPath}/resources/ysl_front/images/2_hov.png) no-repeat 22px center;color: #FF6600;}
    .yhzx-nav .list2{background: url(${contextPath}/resources/ysl_front/images/3.png) no-repeat 22px center;}
    .yhzx-nav .list2:hover{background: url(${contextPath}/resources/ysl_front/images/3_hov.png) no-repeat 22px center;color: #FF6600;}
    .yhzx-nav .list3{background: url(${contextPath}/resources/ysl_front/images/4.png) no-repeat 22px center;}
    .yhzx-nav .list3:hover{background: url(${contextPath}/resources/ysl_front/images/4_hov.png) no-repeat 22px center;color: #FF6600;}

    .getCodeBtn{float:right;border:1px solid red;display: inline-block;height: 30px;line-height: 30px;color: #188fef;border: 1px solid #dddddd;padding: 0px 6px;margin-right: 6px;}

</style>
<div class="yhzx-left" style="float: left;">
    <!--登录信息-->
    <div class="c1" style="background-color: #188fef">
        <div class="info_photo"><img src="${contextPath}/resources/ysl_front/images/info_photo.png"></div>
        <div class="info_hello">
            <div class="hello">${sessionScope.staffname}</div>
            <c:if test="${userType==1}">
                <div class="quit" onclick="to_url('${contextPath}/front/logout')">个人用户&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[退出]</div>
            </c:if>
            <c:if test="${userType==2}">
                <div class="quit" onclick="to_url('${contextPath}/front/logout')">企业用户&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[退出]</div>
            </c:if>
        </div>
        <div class="info_lgtime">
            <span>上次登录时间</span><br>
            <span style="margin-left:5px;">${sessionScope.lastLoginTime}</span>
        </div>
    </div>
    <div class="yhzx-nav" style="width: 184px;">
        <ul>

            <li class="list1" onclick="to_url('${contextPath}/front/user/account_set')">
                <span>账户设置</span>
            </li>
            <li class="list2" onclick="to_url('${contextPath}/front/mywork/search')">
                <span>我的办件</span>
            </li>
            <li class="list3" onclick="to_url('${contextPath}/front/consultation')">
                <span>我要咨询</span>
            </li>
        </ul>
    </div>
    <div class="hr"></div>
    <div class="c1">
        <div class="col-xs-12 left">
            <span style="font-size:16px;color: #333333 !important;" class="orange">办件查询</span>
        </div>
        <div class="col-xs-12">
            <form id="searchBjForm">
                <p style="margin-top: 10px">
                    <input style="width: 182px;height:30px;" type="text" id="mobile" placeholder="手机号" onblur="checkMobile()">
                </p>
                <p>
                    <input style="width: 182px;height:30px;" type="text" id="idCard" placeholder="身份证号" onblur="checkID()">
                </p>
                <p>
                <div class="getCodeBtn" onclick="getCode(this)">获取验证码</div>
                <input id="smsCode" style="width: 104px; height:30px;overflow: hidden;" type="text" placeholder="验证码">

                </p>
            </form>
        </div>
        <div class="col-xs-12 center">

            <div class="btn-blue-smaller" style="margin-bottom: 10px" onclick="searchBJ()">查询</div>
            <div class="btn-green-smaller" style="margin-bottom: 10px" onclick="resetSearch()">重置</div>
        </div>
    </div>
</div>
<script>
    var isSearch=false;
    function resetSearch() {
        $("#searchBjForm")[0].reset();
    }
    function searchBJ() {
        _tips("很抱歉，功能还在建设中...");
        return;
        checkMobile();
        checkID();
        if(isSearch){
            if ($("#smsCode").val().trim() == '') {
                _tips("请输入验证码", 1);
            } else {
                $.ajax({
                    type: 'get',
                    url: '${contextPath}/bljd/valSmsCode',
                    data:{"sfzh":$("#idCard").val(),"sjhm":$("#mobile").val(),"code":$("#smsCode").val().trim()},
                    dataType: 'json',
                    success: function (result) {
                        if (result.ret == 1) {
                            window.open("${contextPath}/bljd/","_blank");
                        }else{
                            _tips(result.msg,2);
                        }
                    }
                });
            }
        }
    }
    function checkCode() {

    }
    var s = 60;
    function getCode(obj) {
        _tips("很抱歉，功能还在建设中...");
        return;
        $.ajax({
            type: 'get',
            url: '${contextPath}/sendSmsCode',
            dataType: 'json',
            success: function (result) {
                if (result.ret == 1) {
                    resetSmsCode(obj);
                }else{
                    _tips(result.msg,2);
                }
            }
        });
    }

    function resetSmsCode(obj) {
        var $this = $(obj);
        if (s == 0) {
            $this.removeAttr("onclick");
            $this.html("获取验证码");
            s = 60;
        } else {
            $this.attr("onclick", "getCode(this)");
            $this.html("重新发送(" + s + ")");
            s--;
            setTimeout(function () {
                resetSmsCode(obj);
            }, 1000);
        }
    }

    function checkMobile() {
        var value = $("#mobile").val();
        if (!/^(13|15|18|17)[0-9]{9}$/.test(value)) {
            isSearch=false;
            _tips("手机号码格式不正确",2);
        }else{
            isSearch=true;
        }
    }
    /**
     *  校验身份证格式
     * */
    function checkID() {
        var value = $("#idCard").val();
        if (IdCardValidate(value)) {
            isSearch = true;
        } else {
            _tips("身份证号码有误!",2);
            isSearch = false;
        }
    }
</script>
