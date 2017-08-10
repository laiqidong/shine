/**
 *  2017-3-6
 *  @by luoxuan
 */

 var submit_check=true; //提交验证标识，默认通过   true通过验证，false未通过验证
//通用checkForm
function checkForm(url, validate) {
    return $('#form').validate({
        errorElement: 'div',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: validate,
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
        submitHandler: function (form) {
            submitFormAjaxPostJson(url);
        },
        invalidHandler: function (form) {
        }
    });
}

//通用提交
function submitFormAjaxPostJson(url) {
    if (submit_check) {
        $.ajax({
            url: url,
            type: 'post',
            dataType: "json",
            data: $("#form").serialize(),
            success: function (result) {
                if (result.ret = "1") {
                    top.art.dialog.tips("操作成功");
                    top.art.dialog({
                        id: "dialog"
                    }).close();
                } else {
                    top.art.dialog.tips("操作失败");
                }
            }
        })
    }else{
        _tips("表单验证未通过，请检查");
    }
}

//通用删除
function _delete(url) {
    art.dialog.confirm('您确定要删除这条记录吗？',
        function () {
            art.dialog.tips('正在执行删除');
            $.ajax({
                url: url,
                type: "post",
                dataType: "json",
                success: function (result) {
                    if (result.ret = "1") {
                        art.dialog.tips('删除成功');
                        getData(1);
                    } else {
                        art.dialog.tips('删除失败');
                    }
                }
            });
        },
        function () {
            art.dialog.tips('正在取消删除');
        }
    );
}

//选中行
function selectRow(id) {
    var $this = $("#" + id);
    if ($this.is(":checked")) {
        $this.prop("checked", false);
    }
    else {
        $this.prop("checked", 'checked');
    }
}

//批量删除
function _delete_batch(url) {

    var checkedList = $("input[name='checkInput']:checked");
    if (checkedList.length == 0) {
        art.dialog.tips("请选择您要删除的记录");
    } else {
        art.dialog.confirm('您确定要删除这些记录吗？',
            function () {
                //art.dialog.tips('正在执行删除');
                var idStr = "";
                checkedList.each(function () {
                    idStr += $(this).val() + ",";
                });
                idStr = idStr.substring(0, idStr.length - 1);
                $.ajax({
                    url: url + "?ids=" + idStr,
                    type: "post",
                    dataType: "json",
                    success: function (ret) {
                        if (ret.ret = "1") {
                            art.dialog.tips("操作成功");
                            getData(1);
                        } else {
                            art.dialog.tips("操作失败");
                        }
                    }
                })
            },
            function () {
                art.dialog.tips('正在取消删除');
            }
        );
    }
}


//新增修改的弹窗
function artDialogByEdit(url, title, width, height) {
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
            getData(1);
        }
    }, false);
}

function updateStatus(url) {
    $.ajax({
        url: url,
        type: "post",
        dataType: "json",
        success: function (data) {
            if (data.ret == "1") {
                art.dialog.tips("操作成功");
                getData(1);
            } else {
                art.dialog.tips(data.msg);
            }
        }
    })
}

function resetForm(obj) {
    obj.reset();
}

/**
 * 失去焦点时，文本框去空格
 * @param obj
 */
function onblur_trim(obj){
    $(obj).val($(obj).val().trim());
}