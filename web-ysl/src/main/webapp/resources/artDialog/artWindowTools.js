
/**
 * 跳转页面，加载框提示框.
 * @param url 目标url.
 */
function loading2(url) {
	art.dialog.tips('正在努力加载数据，请稍等...');
	window.frames["mainFrame"].location.href = url;	
	//window.location.href = url;
}

/**
 * 弹出框（自定义按钮）
 * @param title
 * @param url
 * @param width
 * @param height
 */
function artWindow(title, url, width, height) {
	art.dialog.open(url, {
		title:title,
		width:width,
		height:height,
		resize:false,
		fixed: true,
		//drag: false,
		opacity: 0.7,
		// ~ 自定义按钮
		button: [ {
			name: '确 定',
			focus: true,
		    callback: function () {
	        	var iframe = this.iframe.contentWindow;
	 	    	if (!iframe.document.body) {
	 	        	alert('iframe还没加载完毕呢，请稍后！ ');
	 	        	return false;
	 	        };
	 	        iframe.submitForm();
	 			return false;
		    }
		}],
		// ~ 关闭窗口时，刷新页面.
		cancel: function () {
	       	return true;
	    },
		lock: true
	}, false);
}

/**
 * 弹出框（自定义按钮） 跟随ID显示
 * @param title
 * @param url
 * @param width
 * @param height
 */
function artFollowWindow(title, url, width, height, follow) {
	art.dialog.open(url, {
		title:title,
		width:width,
		height:height,
		follow: document.getElementById(follow),
		drag: false,
		opacity: 0.1,
		// ~ 自定义按钮
		button: [ {
			name: '确 定',
			focus: true,
		    callback: function () {
	        	var iframe = this.iframe.contentWindow;
	 	    	if (!iframe.document.body) {
	 	        	alert('iframe还没加载完毕呢，请稍后！ ');
	 	        	return false;
	 	        };
	 	        iframe.submitForm();
	 			return false;
		    }
		}],
		// ~ 关闭窗口时，刷新页面.
		cancel: function () {
	       	return true;
	    },
		lock: true
	}, false);
}

/**
 * 弹出框（无按钮）
 * @param title
 * @param url
 * @param width
 * @param height
 */
function artMessageWindow(title, url, width, height) {
	art.dialog.open(url, {
		title:title,
		//top: "30px",
		width:width,
		height:height,
		resize:true,
		fixed: true,
		//drag: false,
		opacity: 0.7,
		lock: true
	}, false);
}

/**
 * 弹出框（无按钮）
 * @param title
 * @param url
 * @param width
 * @param height
 */
function artNewWindow(title, url, width, height,closeFun) {
	art.dialog.open(url, {
		title:title,
		//top: "30px",
		width:width,
		height:height,
		resize:true,
		fixed: true,
		//drag: false,
		opacity: 0.1,
		lock: true,
		close : function () {
			eval(closeFun);
		}
		
	}, false);
}

/**
 * 弹出框（无按钮）
 * @param title
 * @param url
 * @param width
 * @param height
 */
function artMessageFollowWindow(title, url, width, height, follow) {
	art.dialog.open(url, {
		title:title,
		//top: "30px",
		width:width,
		follow: document.getElementById(follow),
		height:height,
		resize:true,
		fixed: true,
		//drag: false,
		opacity: 0.1,
		lock: true
	}, false);
}

function showMsgDialog(message, url) {
	window.top.art.dialog( {
		id : "showMessageDialog",
		title : "温馨提示",
		content : message,
		icon : 'face-smile',
		resize : false,
		fixed: true,
		lock : true,
		opacity:0.1,
		cancel : function() {
			if (url != '') {
				window.location.href = url;
			}
			return true;
		},
		cancelVal : "确定"
	});
}


//~ 
function showMessageDialog(message, isRefresh) {
	window.top.art.dialog( {
		id : "waitMessageDialog",
		title : "温馨提示",
		content : message,
		icon : 'face-smile',
		resize : false,
		fixed: true,
		lock : true,
		opacity:0.1,
		ok : function() {
			if (isRefresh == 'Yes') {
				window.location.href = window.location.href;
			}
			return true;
		},
		okVal : "确定"
	});
}

//~ 显示成功对话框，并刷新源页面.
function showDialogSuccessDialog(message) {
	art.dialog( {
		icon: 'succeed',
		title : "温馨提示",
		content : message,
		icon : 'face-smile',
		resize : false,
		lock : true,
		opacity:0.1,
		ok : function() {
			art.dialog.open.origin.location.reload();
			return true;
		},
		okVal : "确定"
	});
}

function closeWaitDialog() {
	art.dialog.list['waitMessageDialog'].close();
}
