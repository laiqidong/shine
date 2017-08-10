/**
 * 显示加载
 */
function _show_loading() {
    $("#loading").show();
}

/**
 * 隐藏加载
 */
function _hide_loading() {
    $("#loading").hide();
}
/**
 * @return {string}
 */
function RootPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    return pathName.substr(0, index + 1);
}
/**
 * 获取序列的下一位
 * @param name 序列名称
 * @private
 */
function _get_sequence(name) {
    var url = RootPath() + "/common/getSequence/" + name;
    _ajax_get(url, function (result) {
        if (result.ret == 1) {
            return result.data.seq;
        } else if (result.ret == 0) {
            _alert("错误:" + result.exception);
            return null;
        } else {
            _alert(result.msg);
            return null;
        }
    })
}
/**
 * 保存方法
 * @param data 传入参数
 * @param callback 回调函数
 */
function _save(data, callback) {
    var url = RootPath() + "/common/save";
    _ajax_json_post(url, data, function (result) {
        callback(result);
    });
}
// /**
//  * 删除方法
//  */
// function _delete(tablename,column,value, callback) {
//     var url = RootPath() + '/common/delete?tablename='+tablename+
//         '&column='+column+'&value='+value;
//     _ajax_delete(url, null, function (result) {
//         callback(result);
//     })
// }
// /**
//  *批量删除
//  */
// function _delete_batch(tablename,column,values,callback) {
//     var url = RootPath() + '/common/deleteBatch?tablename='+tablename+
//     '&column='+column+'&value='+values;
//     _ajax_delete(url, null, function (result) {
//         callback(result);
//     })
// }
/**
 *更新
 */
function _update(data,callback) {
    var url = RootPath() + "/common/update";
    _ajax_json_post(url, data, function (result) {
        callback(result);
    });
}
/**
 * ajax post 请求
 * @param url
 * @param data
 * @param callBack
 */
function _ajax_post(url, data, callBack) {
    _show_loading();
    $.ajax({
        type: 'post',
        dataType: 'json',
        url: url,
        data: data,
        success: function (result) {
            callBack(result);
            _hide_loading();
        },
        error: function (result) {
            _hide_loading();
            if(result.responseText=="登录超时"){
                _tips("登录超时，正在跳往登陆页面");
                window.location.reload();
            }else{
                _tips("系统异常，请稍后再试");
            }
        }
    });
}
/**
 * ajax post 请求 contentType:'application/json'
 * @param url
 * @param data
 * @param callBack
 */
function _ajax_json_post(url, data, callBack) {
    _show_loading();
    $.ajax({
        type: 'post',
        dataType: 'json',
        url: url,
        data: JSON.stringify(data),
        contentType: 'application/json',
        success: function (result) {
            callBack(result);
            _hide_loading();
        },
        error: function (result) {
            _hide_loading();
            if(result.responseText=="登录超时"){
                _tips("登录超时，正在跳往登陆页面");
                window.location.reload();
            }else{
                _tips("系统异常，请稍后再试");
            }
        }

    });
}
/**
 * ajax delete 请求 contentType:'application/json'
 * @param url
 * @param data
 * @param callBack
 */
function _ajax_json_delete(url, data, callBack) {
    _show_loading();
    $.ajax({
        type: 'delete',
        dataType: 'json',
        url: url,
        data: JSON.stringify(data),
        contentType: 'application/json',
        success: function (result) {
            callBack(result);
            _hide_loading();
        },
        error: function (result) {
            _hide_loading();
            if(result.responseText=="登录超时"){
                _tips("登录超时，正在跳往登陆页面");
                window.location.reload();
            }else{
                _tips("系统异常，请稍后再试");
            }
        }

    });
}
/**
 * ajax get 请求
 * @param url
 * @param callBack
 */
function _ajax_get(url, callBack) {
    _show_loading();
    $.ajax({
        type: 'get',
        dataType: 'json',
        url: url,
        success: function (result) {
            callBack(result);
            _hide_loading();
        },
        error: function (result) {
            _hide_loading();
            if(result.responseText=="登录超时"){
                _tips("登录超时，正在跳往登陆页面");
                window.location.reload();
            }else{
                _tips("系统异常，请稍后再试");
            }
        }
    });
}
/**
 * ajax  delete请求
 * @param url
 * @param data
 * @param callBack
 */
function _ajax_delete(url, data, callBack) {
    _show_loading();
    $.ajax({
        type: 'delete',
        dataType: 'json',
        url: url,
        data: data,
        success: function (result) {
            _hide_loading();
            callBack(result);
        },
        error: function (result) {
            _hide_loading();
            if(result.responseText=="登录超时"){
                _tips("登录超时，正在跳往登陆页面");
                window.location.reload();
            }else{
                _tips("系统异常，请稍后再试");
            }
        }
    });
}

/**
 * 短暂提示
 * @param msg
 * @param time 默认1.5s
 */
function _tips(msg, time) {
    art.dialog.tips(msg, time);
}
/**
 * 确认
 * @param    msg    消息内容
 * @param    yes    确定按钮回调函数
 * @param    no    取消按钮回调函数
 */
function _confirm(msg, yes, no) {
    art.dialog.confirm(msg, yes, no);
}

/**
 * 警告
 * @param msg
 */
function _alert(msg) {
    art.dialog.alert(msg);
}
/**
 * 对话框
 * @param url
 * @param title
 * @param width
 * @param height
 * @param callback
 */
function _dialog(url, title, width, height, callback) {
    art.dialog.open(url, {
        title: title,
        width: width,
        height: height,
        resize: true,
        fixed: true,
        //drag: false,
        opacity: 0.7,
        lock: true,
        id: "dialog",
        close: function () {
            callback();
        }
    }, false);
}
/**
 * 关闭对话框
 */
function _dialog_close() {
    art.dialog({
        id: "dialog"
    }).close();
}
/**
 * 分页插件初始化
 * @param callback 改变页数时的回调函数
 */
function _jqPaginator(callback) {
    $('#pagination').jqPaginator({
        totalPages: 1,
        visiblePages: 5,
        currentPage: 1,
        first: '<li class="first"><a href="javascript:void(0);">首页</a></li>',
        prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
        next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
        last: '<li class="last"><a href="javascript:void(0);">末页</a></li>',
        page: '<li class="page"><a href="javascript:void(0);" id="currentPage">{{page}}</a></li>',
        onPageChange: function (num) {
            callback(num);
        }
    });
}
/**
 * 分页设置属性
 * @param currentPage 当前页数
 * @param totalPages 总页数
 */
function _jqPaginator_setting(currentPage, totalPages) {
    $('#pagination').jqPaginator('option', {
        currentPage: currentPage,
        totalPages: totalPages
    });
}
/**
 * 表单校验
 * @param id
 * @param rules
 * @param submit 表单提交的方法
 */
function _validate(id, rules, submit) {
    $('#' + id).validate({
        errorElement: 'div',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: rules,
        messages: {
            image: {
                accept: "上传的图片格式不正确"
            }
        },
        highlight: function (e) {
            $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
        },
        success: function (e) {
            $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
            $(e).remove();
        },
        errorPlacement: function (error, element) {
            if (element.is(':checkbox') || element.is(':radio')) {
                var controls = element.closest('div[class*="col-"]');
                if (controls.find(':checkbox,:radio').length > 1) controls.append(error);
                else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
            }
            else if (element.is('.select2')) {
                error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
            }
            else if (element.is('.chosen-select')) {
                error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
            }
            else error.insertAfter(element.parent());
        },
        submitHandler: function () {
            submit();
        },
        invalidHandler: function (form) {
        }
    });
}
/**
 * 判空返回字符串
 * @param val
 * @returns {string}
 */
function _get_string(val) {
    if (val == null || typeof(val) == "undefined") {
        return '';
    } else {
        return val;
    }
}
/**
 * 是否为空
 *
 *
 */
function _nullValue(value) {
    if(typeof(value)=="undefined"||value==null||value=='null'){
        return "";
    }
    return value;
}