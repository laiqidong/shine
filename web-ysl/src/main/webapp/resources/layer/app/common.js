define(function(require, exports, module){
	exports.mobileUtilMethod = function(){
		(function(e, t) {
		    function n() {
		        for (var e = navigator.userAgent,
		        t = ["Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod"], n = !0, i = 0; t.length > i; i++) if (e.indexOf(t[i]) > 0) {
		            n = !1;
		            break
		        }
		        return n
		    }
		    function i() {
		        var t = a.getBoundingClientRect().width;
		        n() && 2047 > t && (t = 640);
		        var i = t * 100 / w;
		        a.style.fontSize = i + "px",
		        d.rem = e.rem = i
		    }
		    var r, o = e.document,
		    a = o.documentElement,
		    s = o.querySelector('meta[name="viewport"]'),
		    c = o.querySelector('meta[name="flexible"]'),
		    l = 0,
		    u = 0,
		    d = t.flexible || (t.flexible = {});
		    var w = o.querySelector('meta[name="W_design"]') ? o.querySelector('meta[name="W_design"]').getAttribute('content') : 640;
		    if (s) {
		        // console.warn("将根据已有的meta标签来设置缩放比例");
		        var p = s.getAttribute("content").match(/initial\-scale=([\d\.]+)/);
		        p && (u = parseFloat(p[1]), l = parseInt(1 / u))
		    } else if (c) {
		        var f = c.getAttribute("content");
		        if (f) {
		            var h = f.match(/initial\-dpr=([\d\.]+)/),
		            m = f.match(/maximum\-dpr=([\d\.]+)/);
		            h && (l = parseFloat(h[1]), u = parseFloat((1 / l).toFixed(2))),
		            m && (l = parseFloat(m[1]), u = parseFloat((1 / l).toFixed(2)))
		        }
		    }
		    if (!l && !u) {
		        e.navigator.appVersion.match(/android/gi);
		        var g = e.navigator.appVersion.match(/iphone/gi);
		        e.navigator.appVersion.match(/ipad/gi);
		        var v = e.devicePixelRatio;
		        l = g ? v >= 3 && (!l || l >= 3) ? 3 : v >= 2 && (!l || l >= 2) ? 2 : 1 : 1,
		        u = 1 / l
		    }
		    if (a.setAttribute("data-dpr", l), !s) if (s = o.createElement("meta"), s.setAttribute("name", "viewport"), s.setAttribute("content", "initial-scale=" + u + ", maximum-scale=" + u + ", minimum-scale=" + u + ", user-scalable=no"), a.firstElementChild) a.firstElementChild.appendChild(s);
		    else {
		        var y = o.createElement("div");
		        y.appendChild(s),
		        o.write(y.innerHTML)
		    }
		    e.addEventListener("resize",
		    function() {
		        clearTimeout(r),
		        r = setTimeout(i, 300)
		    },!1),
		    e.addEventListener("pageshow",
		    function(e) {
		        e.persisted && (clearTimeout(r), r = setTimeout(i, 300))
		    },!1),
		    "complete" === o.readyState ? o.body.style.fontSize = 12 * l + "px": o.addEventListener("DOMContentLoaded",
		    function() {
		        o.body.style.fontSize = 12 * l + "px"
		    },!1),
		    i(),
		    d.dpr = e.dpr = l,
		    d.refreshRem = i,
		    d.rem2px = function(e) {
		        var t = parseFloat(e) * this.rem;
		        return "string" == typeof e && e.match(/rem$/) && (t += "px"),
		        t
		    },
		    d.px2rem = function(e) {
		        var t = parseFloat(e) / this.rem;
		        return "string" == typeof e && e.match(/px$/) && (t += "rem"),
		        t
		    }
		})(window, window.lib || (window.lib = {}));
	}

	//表单验证
	exports.dyValidate = function(url, tourl, erurl){
		require("layer");
		require("validate");
		$("form.Jvalidation").each(function(){
		    var $form = $(this);
		    $form.validate({
				submitHandler:function(form){
					require("submitform");
					var index = layer.open({type: 2});
                    var $submitBtn = $form.find(".button"),
					    txt = $submitBtn.text();
					$submitBtn.attr("disabled", "disabled").text("提交中...");
					$(form).ajaxSubmit({
						url: url,
						success: function(data){
							layer.close(index);
                         	if(data.status == "success"){
                         		if(typeof($("#tourl").val()) != "undefined"){
                         			tourl = $("#tourl").val();
                         		}
                         		if(typeof(data.data) != "undefined" && typeof(data.data.tourl) != "undefined" && data.data.tourl != ""){
 									tourl = data.data.tourl;
 								}
                         		layer.open({
                         			content: data.remark || "提交成功",
                         			style: "background: rgba(0, 0, 0, 0.5); color: #fff",
                         			time: 2,
                         			end: function(){
	 									if(tourl){
	 										parent.window.location.href = tourl;
	 									} else {
	 										parent.window.location.reload();
	 									}
	 		                    	}
                         		})
                         	} else {
                         		layer.open({
                         			content: data.remark || "提交失败",
                         			style: "background: rgba(0, 0, 0, 0.5); color: #fff",
                         			time: 2,
                         			end: function(){
	 									if(erurl) parent.window.location.href = erurl;
                         				$submitBtn.removeAttr("disabled").text(txt);
	 		                    	}
                         		})
                         	}
						}
					});
					return false;
				}
			});
		});
	}

    /*
     * 手机校验码倒计时发送
     * @param 第一个参数为触发元素，第二个参数是一个对象
     * obj中有两个默认的接口(图形验证码接口、手机短信校验码接口)
     * 如不需要验证图形验证码就可获取短信校验码则 imgVericode: false
     */
    exports.countDown = function(target, options){
        var defaults = {
            vericodeApi: "ordercall/booking/orderVericode",  //验证验证码接口
            sendApi: "ordercall/booking/orderWechatSend",  //验证手机短信校验码接口
            time: 59,
            imgVericode: true  //是否需要验证验证码
        };
        var opts = $.extend({}, defaults, options);
        var time = opts.time;
 		var isclick = true;
        $("#" + target).on("click", function(){
            var $this = $(this), $phone = $("#phone"), $vericode = $("#veriCode"), $phonecode = $("#phoneCode"),
                phone = $phone.val(),
                phonecode = $phonecode.val(),
                vericode = $vericode.val();
            if(phone == ""){
                layer.open({
                    content: "请先填写手机号码",
                    style: "background: rgba(0, 0, 0, 0.5); color: #fff",
                    time: 2
                })
                $phone.focus();
                return false;
            } else {
                if(/^1[3|4|5|7|8][0-9]\d{8}$/.test(phone) == false){
                    layer.open({
                        content: "请填写正确的手机号码格式",
                        style: "background: rgba(0, 0, 0, 0.5); color: #fff",
                        time: 2
                    })
                    $phone.focus();
                    return false;
                }
                if(vericode == ""){
                    layer.open({
                        content: "请先填写图形验证码",
                        style: "background: rgba(0, 0, 0, 0.5); color: #fff",
                        time: 2
                    })
                    return false;
                }
            }           
            //$this.attr("disabled", "disabled");
            function _success(){
            	isclick = false;
                $this.val("发送中...");
                $.ajax({
                    type: "post",
                    url: "/",
                    data: {
                        phone: phone,
                        vericode: vericode,
                        getapi: opts.sendApi
                    },
                    dataType: "json",
                    success: function(data){
                        if(data.status == "success"){
                        	
                            layer.open({
                                content: "发送成功",
                                style: "background: rgba(0, 0, 0, 0.5); color: #fff",
                                time: 1.5,
                                end: function(){
                                    $this.html("重新获取(" + time + ")");
                                    var timer = setInterval(function(){
                                        time--;
                                        if(time < 0){
                                        	isclick = true;
                                            $this.html("重新获取");
                                            clearInterval(timer);
                                            time = opts.time;
                                        } else {
                                            $this.html("重新获取(" + time + ")");
                                        }
                                    }, 1000);
                                }
                            })
                        } else {
                            layer.open({
                                content: data.remark || "发送失败",
                                style: "background: rgba(0, 0, 0, 0.5); color: #fff",
                                time: 1.5,
                                end: function(){
                                    if(data.remark != "send_too_frequent"){
                                        $this.html("获取验证码");
                                    } else {
                                        time = 300;
                                        $this.html("重新获取(" + time + ")");
                                        var timer = setInterval(function(){
                                            time--;
                                            if(time < 0){
                                            	isclick = true;
                                                $this.html("重新获取");
                                                clearInterval(timer);
                                            } else {
                                                $this.html("重新获取(" + time + ")");
                                            }
                                        }, 1000);
                                    }
                                }
                            })
                        }
                    }
                })
            }
            if(opts.imgVericode){
                $.ajax({
                    type: "post",
                    url: "/",
                    data: {
                        phone: phone,
                        getapi: opts.vericodeApi,
                        vericode: vericode
                    },
                    dataType: "json",
                    success: function(data){
                        if(data.status == "success"){
                            _success();
                        } else {
                            layer.open({
                                content: data.remark,
                                style: "background: rgba(0, 0, 0, 0.5); color: #fff",
                                time: 1.5
                            })
                            //刷新验证码
                            $("#veriCode").click();
                            $this.removeAttr("disabled");
                        }
                    }
                });
            } else {
               if(isclick===true) _success();
            }
        })
    }


    /*
     * 手机校验码倒计时发送
     * @param 第一个参数为触发元素，第二个参数是一个对象
     * obj中有两个默认的接口(图形验证码接口、手机短信校验码接口)
     * 如不需要验证图形验证码就可获取短信校验码则 imgVericode: false
     */
    //exports.countDown1 = function(target, options) {
    //    var defaults = {
    //        vericodeApi: "ordercall/booking/orderVericode",  //验证验证码接口
    //        sendApi: "ordercall/booking/orderWechatSend",  //验证手机短信校验码接口
    //        time: 59,
    //        imgVericode: true  //是否需要验证验证码
    //    };
    //    console.log(defaults);
    //    var opts = $.extend({}, defaults, options);
    //    var time = opts.time;
    //
    //    $("#" + target).click(function(){
    //        var $this = $(this),
    //            phone = $("#phone").val(),
    //            vericode = $("#vericode").val();
    //        if(phone == ""){
    //            $("#phone").focus();
    //            return false;
    //        }
    //        if(vericode == ""){
    //            $("#vericode").focus();
    //            layer.msg("请先填写图片验证码", {icon: 2, time: 1000});
    //            return false;
    //        }
    //        $this.attr("disabled", "disabled");
    //        function _success(){
    //            $this.val("发送中...");
    //            $.ajax({
    //                type: "post",
    //                //url: opts.sendApi,
    //                url: "/",
    //                data: {
    //                    getapi: opts.sendApi,
    //                    phone: phone,
    //                    vericode: vericode
    //                },
    //                dataType: "json",
    //                success: function(data){
    //                    if(data.status == "success"){
    //                        layer.msg("发送成功", {icon: 1, time: 1500}, function(){
    //                            $this.val("重新获取(" + time + ")");
    //                            var timer = setInterval(function(){
    //                                time--;
    //                                if(time < 0){
    //                                    $this.removeAttr("disabled").val("重新获取");
    //                                    clearInterval(timer);
    //                                    time = opts.time;
    //                                } else {
    //                                    $this.val("重新获取(" + time + ")");
    //                                }
    //                            }, 1000);
    //                        })
    //                    } else {
    //                        layer.msg(data.remark, {icon: 2, time: 1000}, function(){
    //                            if(data.discription != "send_too_frequent"){
    //                                $this.removeAttr("disabled").val("获取验证码");
    //                            } else {
    //                                time = 300;
    //                                $this.val("重新获取(" + time + ")");
    //                                var timer = setInterval(function() {
    //                                    time--;
    //                                    if(time < 0){
    //                                        $this.removeAttr("disabled").val("重新获取");
    //                                        clearInterval(timer);
    //                                    } else {
    //                                        $this.val("重新获取(" + time + ")");
    //                                    }
    //                                }, 1000);
    //                            }
    //                        });
    //                    }
    //                }
    //            })
    //        }
    //        if(opts.imgVericode){
    //            $.ajax({
    //                type: "post",
    //                //url: opts.vericodeApi,
    //                url: "/",
    //                data: {
    //                    getapi: opts.vericodeApi,
    //                    phone: phone,
    //                    vericode: vericode
    //                },
    //                dataType: "json",
    //                success: function(data){
    //                    if(data.status == "success"){
    //                        _success();
    //                    } else {
    //                        parent.layer.msg(data.remark, {icon: 2, time: 1000}, function(){
    //                            //刷新验证码
    //                            $("#valicode").click();
    //                            $this.removeAttr("disabled");
    //                        });
    //                    }
    //                }
    //            });
    //        } else {
    //            _success();
    //        }
    //    })
    //}
})