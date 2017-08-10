<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="yhzx-left" style="float: left;">
    <!--登录信息-->
    <div class="c1">
        <div class="info_photo"><img src="${contextPath}/resources/ysl_front/images/info_photo.jpg"></div>
        <%--<div class="info_photo"><img src="${contextPath}/resources/assets/avatars/avatar2.png" width="60px" height="60px" alt=""></div>--%>

        <div class="info_hello">
            <div class="hello">${sessionScope.staffname}</div>
            <c:if test="${userType==1}">
                <div class="quit" onclick="to_url('${contextPath}/front/logout')">个人用户[退出]</div>
            </c:if>
            <c:if test="${userType==2}">
                <div class="quit" onclick="to_url('${contextPath}/front/logout')">企业用户[退出]</div>
            </c:if>
            <%--<a class="modify" onclick="xgyh(1);">修改信息</a>--%>
            <%--<a class="exit" href="#">退出登录</a>--%>
        </div>
        <div class="info_lgtime">
            <span>上次登录时间</span><br>
            <span style="margin-left:30px;">${sessionScope.lastLoginTime}</span>
        </div>
    </div>
    <div class="yhzx-nav" style="width: 184px;">
        <ul>

            <li onclick="to_url('${contextPath}/front/user/account_set')">
                <img src="${contextPath}/resources/ysl_front/images/set.png"/>
                <span>账户设置</span>
            </li>
            <li onclick="to_url('${contextPath}/front/mywork/search')">
                <img src="${contextPath}/resources/ysl_front/images/task.png"/>
                <span>我的办件</span>
            </li>
            <li  onclick="to_url('${contextPath}/front/consultation')">
                <img src="${contextPath}/resources/ysl_front/images/consult.png"/>
                <span>我要咨询</span>
            </li>
        </ul>
    </div>
    <div class="hr"></div>
    <div class="c1">
        <div class="col-xs-12 center">
            <img style="vertical-align: top;" src="${contextPath}/resources/ysl_front/images/search.gif" alt="">
            <span style="font-size: 20px;" class="orange">办件查询</span>
        </div>
        <div class="col-xs-12">
            <form id="searchBjForm">
            <p style="margin-top: 10px">
                受理号：
                <input style="width: 100px;height:30px;" type="text">

            </p>
            <p>
                申请人：
                <input style="width: 100px;height:30px;" type="text">
            </p>
            <p>
                验证码：
                <input id="smsCode" style="width: 80px;height:30px;" type="text">
            </p>
            </form>
        </div>
        <div class="col-xs-12 center">
            <div class="btn-orange" style="margin-bottom: 10px;margin-left: 20px" onclick="getCode(this)">获取验证码</div>
            <div class="btn-blue-smaller" style="margin-bottom: 10px" onclick="searchBJ()">查询</div>
            <div class="btn-green-smaller" style="margin-bottom: 10px" onclick="resetSearch()">重置</div>
        </div>
    </div>
</div>
<script>
    function resetSearch() {
        $("#searchBjForm")[0].reset();
    }
    function searchBJ() {
        _tips("很抱歉，功能还在建设中...");
        return;
        if ($("#code").val().trim() == ''){
            _tips("请输入验证码", 1);
        }else{
            if(checkCode()) {

            }else {
                _tips("验证码错误");
            }
        }

    }
    function checkCode() {


    }
    var s = 60;
    function getCode(obj) {
        _tips("很抱歉，功能还在建设中...");
        return;
        resetSmsCode(obj);
        $.ajax({
            type: 'get',
            url: '${contextPath}/sendSmsCode',
            dataType: 'json',
            success: function (result) {
                if (result.ret == 1) {
                    $("#smsCode").val(result.data.code);
                }
            }
        });
    }

    function resetSmsCode(obj) {
        var $this = $(obj);
        if (s == 0) {
            $this.prop("onclick", "");
            $this.html("获取验证码");
            s = 60;
        } else {
            $this.prop("onclick", "getCode(this)");
            $this.html("重新发送(" + s + ")");
            s--;
            setTimeout(function () {
                resetSmsCode(obj);
            }, 1000);
        }

    }
</script>
