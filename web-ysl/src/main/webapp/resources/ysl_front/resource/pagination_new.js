/**
 * <p>
 * pagination.js
 * <p>
 * 通用的基于AJAX的分页类
 *
 * @author Wendell
 * @version 1.0
 */
var paginationIndex = 0;

var pagination = function (trTemplatId, filedValArr) {
    $().ajaxStart(function () {
        $.blockUI(
            {
                message: '<table><tr><td style="vertical-align :bottom"><font size=2pt>&nbsp;正在处理，请稍候...</font></td></tr></table>'
            });
    }).ajaxStop($.unblockUI);

    paginationIndex = paginationIndex + 1;
    this.id = paginationIndex;
    this.trTemplatId = trTemplatId;
    this.filedValArr = filedValArr;
    this.pageNo = 1;
    this.pageSize = 10;
    this.beforeQuery = null;
    this.afterQuery = null;
    this.noDataRtn = null; //无数据返回
    this.loadEach = null; //无数据返回
    this.url = null;
    this.params = null;
    this.templat = null;
    this.childrenCount = null;
    this.isPageBar = true;
    this.replaceBlankSpace = false;
    this.isshow = false;
    this.setIsPageBar = function (isPageBar) {
        if (isPageBar != null)
            this.isPageBar = isPageBar;
    };
    this.setReplaceBlankSpace = function (replaceBlankSpace) {
        if (replaceBlankSpace != null)
            this.replaceBlankSpace = replaceBlankSpace;
    };
    this.setPageNo = function (pageNo) {
        if (pageNo != null)
            this.pageNo = pageNo;
    };
    this.setPageSize = function (pageSize) {
        if (pageSize != null)
            this.pageSize = pageSize;
    };
    this.setBeforeQuery = function (fn) {
        this.beforeQuery = fn;
    };
    this.setAfterQuery = function (fn) {
        this.afterQuery = fn;
    };
    this.noDataRtn = function (fn) {
        this.noDataRtn = fn;
    };
    this.loadEach = function (fn) {
        this.loadEach = fn;
    };
    this.setIsShow = function (isshow) {
        this.isshow = isshow;
    };
    this.load = function (url, params) {
        // 初始化(只在第一次查询时执行)
        if (this.templat == null && this.childrenCount == null) {
            if (this.isshow) {
                $('#' + this.trTemplatId).show();
            }
            var templatObj = $('#' + this.trTemplatId);
            templatObj.parent().attr('id', 'tbody_id' + this.id);
            templatObj.removeAttr('id');
            templatObj.wrap("<div id='"+this.trTemplatId+"_Obj'></div>");
            this.templat = $('#' + this.trTemplatId+'_Obj').html();
            $('#' + this.trTemplatId+'_Obj').remove();
            this.childrenCount = $('#tbody_id' + this.id).children().size();
        }
        // 开始查询
        this.url = url;
        if (params == null)
            params = {};
        $.extend(params,
            {
                pageNo: this.pageNo,
                pageSize: this.pageSize
            });
        this.params = params;
        var thisObj = this;
        var options =
        {
            url: url,
            data: params,
            async: false, // 采用同步方式请求
            type: 'POST',
            dataType: 'json',
            beforeSend: function () {
                $("#vvv").append('<img src="../../images/loading.gif"  />');
            },
            error: function (xmlhttp, errInfo, e) { // 请求出错处理:如:404等

                if (xmlhttp.status == 200)
                    alert('您已经很长时间没有访问网站,请退出后重新登陆！');
                else
                    alert('请求后台服务时发生错误：' + xmlhttp.status);
            },
            success: function (data) {
                if (data.total == 0) {
                    if ($.isFunction(thisObj.noDataRtn))
                        thisObj.noDataRtn();
                }
                // 删除上一次的数据
                $('#tbody_id' + thisObj.id).children().filter(':gt(' + ( thisObj.childrenCount - 1 ) + ')').remove();
                thisObj.pageList(data.items);
                if (thisObj.isPageBar) {
                    thisObj.pageBar(data.total);
                }
                if ($.isFunction(thisObj.afterQuery))
                    thisObj.afterQuery();
            }
        };
        if ($.isFunction(this.beforeQuery))
            this.beforeQuery();
        $.ajax(options); // 发送请求
    };

    this.pageList = function (data) {
        var filedArr = this.templat.match(/\{[A-Za-z0-9_]+\}/ig);
        var thisTemplatAll = "";
        for (var i = 0; i < data.length; i++) {
            var thisTemplat = this.templat;
            for (var j = 0; j < filedArr.length; j++) {
                var key = filedArr[j].substring(1, filedArr[j].length - 1);
                var key_sub = "";
                if (key.length > 4) {
                    key_sub = key.substr(0, key.length - 4);
                }
                if (key_sub == "_SUB") {// 代表需要截取字符长度的
                    continue;
                }
                if (key == 'NO_') { // 序号标识
                    var value = ( this.pageNo - 1 ) * this.pageSize + i + 1;
                    thisTemplat = thisTemplat.replace(new RegExp('\{' + key + '\}', 'gm'), value);
                }
                else {
                    var value = data[i][key];
                    var value2 = data[i][key];
                    if (value == undefined || value == null || isLiteralUndefined(value)) {
                        value = '';
                    }
                    if (this.replaceBlankSpace) {
                        if (value != '') {
                            var reg = new RegExp("#", "g"); //创建正则RegExp对象
                            value = value.toString().replace(reg, "&nbsp;");
                            //alert(newstr);
                        }

                    }
                    //add by caikun 2016-12-20 截取字符长度，用……替代后续内容
                    var filedValArr = this.filedValArr;
                    if (filedValArr != null && filedValArr.length > 0) {
                        for (var m = 0; m < filedValArr.length; m++) {
                            var filedName = filedValArr[m].text;
                            var filedValLength = filedValArr[m].length;
                            if (filedName == key) {
                                if (filedValLength > 0 && value.length > filedValLength) {
                                    value2 = value2.substr(0, filedValLength) + "…";
                                }
                            }
                        }
                    }
                    thisTemplat = thisTemplat.replace(new RegExp('\{' + key + '\}', 'gm'), value);
                    thisTemplat = thisTemplat.replace(new RegExp('\{' + key + '_SUB\}', 'gm'), value2);
                }
            }
            if (i % 2 != 0) {
                thisTemplat = thisTemplat.replace("<tr>", "<tr bgcolor=\"#f1f1f1\">");
                //兼容ie
                thisTemplat = thisTemplat.replace("<TR>", "<TR bgcolor=\"#f1f1f1\">");
            }
            //$(thisTemplat).appendTo($('#tbody_id' + this.id));
            thisTemplatAll = thisTemplatAll + thisTemplat;
        }
        thisTemplatAll = "<tr><td colspan=\"8\"><div style=\"width:600px; height:auto;overflow:auto; border:0px solid #000000;overflow-x:hidden;position: absolute;top:100px;\">" +
            "<table width=\"100%\"  style='border-collapse:collapse;' >" + thisTemplatAll + "</table></div></td>";
        $(thisTemplatAll).appendTo($('#tbody_id' + this.id));
        function isLiteralUndefined(value) {
            if (typeof value == 'string') {
                return value.trim().toLowerCase() == 'undefined';
            }
            return false;
        }
    };

    this.pageBar = function (total) {
        var templatObj = $(this.templat);
        var delChildren = templatObj.children(':gt(0)');
        delChildren.remove();
        templatObj.children().attr('colspan', $(this.templat).children().size());
        templatObj.children().attr('align', 'right');
        templatObj.children().attr('float', 'right');
        templatObj.children().attr('width', '1000');
        templatObj.children().attr('title', '');
        templatObj.children(0).removeClass("ytj_cell1");
        templatObj.children(0).removeClass("cgx_cell1");
        // templatObj.children().removeClass("ytj_cell");

        var pageCount;
        if (total % this.pageSize == 0)
            pageCount = total / this.pageSize;
        else
            pageCount = parseInt(total / this.pageSize) + 1;
        if (pageCount == 0)
            pageCount = 1;
        var toolbar = "第 <span style='color: #3e89dc;padding:5px'>" + this.pageNo + " </span>页 共<span style='padding:5px'>" + pageCount + "页</span>(" + total + "条记录)";
        if (this.pageNo == 1)
            toolbar = toolbar + "&nbsp;首页&nbsp;上页";
        else
            toolbar = toolbar + "&nbsp;<a href='' class='' id='firstPage" + this.id + "'>首页</a>&nbsp;<a href='' id='prePage" + this.id + "'>上页</a>";
        if (this.pageNo == pageCount)
            toolbar = toolbar + "&nbsp;下页&nbsp;末页";
        else
            toolbar = toolbar + "&nbsp;<a href='' id='nextPage" + this.id + "'>下页</a>&nbsp;<a href='' id='lastPage" + this.id + "'>末页</a>";
        // toolbar = toolbar + "&nbsp;每页<input style='text-align:center;width:25px;height:20px;border:1 solid black' type='text' id='pageSize" + this.id
        //   + "' value=" + this.pageSize + " />条";
        //toolbar = toolbar + "&nbsp;<input style='text-align:center;width:25px;height:20px;border:1 solid black' type='text' id='pageNo" + this.id
        //  + "' value=" + this.pageNo + " />";
        //toolbar = toolbar + "&nbsp;<input style='height:20px;border:1 solid black' id='goPage" + this.id + "' type='button' value='GO'>";
        templatObj.children().html(toolbar);
        $(templatObj.wrap("<div></div>").parent().html()).appendTo($('#tbody_id' + this.id));
        var thisObj = this;
        $('#firstPage' + thisObj.id).click(function () {
            thisObj.pageNo = 1;
            thisObj.load(thisObj.url, thisObj.params);
            // this.setAfterQuery = caozuo();
            return false;
        });
        $('#prePage' + thisObj.id).click(function () {
            thisObj.pageNo = parseInt(thisObj.pageNo) - 1;
            thisObj.load(thisObj.url, thisObj.params);
            // this.setAfterQuery = caozuo();
            return false;
        });
        $('#nextPage' + thisObj.id).click(function () {
            thisObj.pageNo = parseInt(thisObj.pageNo) + 1;
            thisObj.load(thisObj.url, thisObj.params);
            // this.setAfterQuery = caozuo();
            return false;
        });
        $('#lastPage' + thisObj.id).click(function () {
            thisObj.pageNo = pageCount;
            thisObj.load(thisObj.url, thisObj.params);
            // this.setAfterQuery = caozuo();
            return false;
        });
        $('#pageSize' + thisObj.id).keydown(function (e) {
            if (e.keyCode == 13) {
                var v = $('#pageSize' + thisObj.id).val();
                if (!isIntGreatZero(v) || v == '0') {
                    alert('您输入显示条数不合法,请重新输入!');
                    $("#pageSize" + thisObj.id).focus();
                    return;
                }
                if (v > 200) {
                    alert('您输入显示条数过大了,请重新输入!');
                    $("#pageSize" + thisObj.id).focus();
                    return;
                }
                thisObj.pageNo = 1;
                thisObj.pageSize = v;
                thisObj.load(thisObj.url, thisObj.params);
            }
        });
        $('#pageNo' + thisObj.id).keydown(function (e) {
            if (e.keyCode == 13) {
                $('#goPage' + thisObj.id).triggerHandler('click');
            }
        });
        $('#goPage' + thisObj.id).click(function () {
            var v = $('#pageNo' + thisObj.id).val();
            if (!isIntGreatZero(v) || v == '0') {
                alert('您输入页数不合法,请重新输入!');
                $("#pageNo" + thisObj.id).focus();
                return;
            }
            if (v > pageCount) {
                alert('您输入页数大于总页数,请重新输入!');
                $("#pageNo" + thisObj.id).focus();
                return;
            }
            thisObj.pageNo = v;
            thisObj.load(thisObj.url, thisObj.params);
        });
    };

};
