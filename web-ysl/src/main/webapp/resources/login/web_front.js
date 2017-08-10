$(function(){
	 var pathname = window.location.pathname;

	 if(pathname.indexOf('/view/')!=-1){
		path = pathname.substr(0,pathname.indexOf('/site')) + '/site/module/jslib/accessiblereading/js/barrierfree.js';
	 }else{
	   path = '/module/jslib/accessiblereading/js/barrierfree.js';
	 }

	 $.getScript(path);
});