<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("X-Frame-Options", "SAMEORIGIN");
%>
<!DOCTYPE html>
<html>
<head>
    <title>文件上传</title>
    <%@include file="../layout/common.jsp" %>
</head>
<body>
<div class="center" style="width:450px; margin:12px;">
    <h3 class="header blue smaller lighter">
        文件上传
    </h3>
    <form id="myform" method="post" action="${contextPath}/file/upload?yslywh=${param.yslywh}&datumId=${param.datumId}">
        <input  type="file" name="files" multiple />
        <div class="hr hr-12 dotted"></div>
        <%--<p>提示：请选择图片格式的文件</p>--%>
        <p>拍照要求提示：尺寸（A4）、格式(.jpg、.jpeg、.png或.pdf)，拍照时正直射材料，保障材料外的环境不要在照片中出现超过5%。图片中字迹要清晰。</p>
        <button type="submit" class="btn btn-sm btn-primary">上传</button>
        <button type="reset" class="btn btn-sm">重置</button>
    </form>
</div>
</body>
<script>
    jQuery(function($) {
        var $form = $('#myform');
        var file_input = $form.find('input[type=file]');
        var upload_in_progress = false;

        file_input.ace_file_input({
            style: 'well',
            btn_choose: '选择或者拖拽文件到这里',
            btn_change: null,
            droppable: true,
//            thumbnail: '',

            maxSize: 1024*1024*16,//bytes
            allowExt: ["jpeg", "jpg", "png", "gif","pdf"],
            allowMime: ["image/jpg", "image/jpeg", "image/png", "image/gif","application/pdf"],

            before_remove: function () {
                if (upload_in_progress)
                    return false;//if we are in the middle of uploading a file, don't allow resetting file input
                return true;
            },

            preview_error: function (filename, code) {
                //code = 1 means file load error
                //code = 2 image load error (possibly file is not an image)
                //code = 3 preview failed
            }
        });
        file_input.on('file.error.ace', function(ev, info) {
            if(info.error_count['ext'] || info.error_count['mime']) alert('文件类型错误，请选择图片类型的格式');
            if(info.error_count['size']) alert('文件大小超出范围，请选择少于1M的文件');

            //you can reset previous selection on error
            //ev.preventDefault();
            //file_input.ace_file_input('reset_input');
        });


        var ie_timeout = null;//a time for old browsers uploading via iframe

        $form.on('submit', function(e) {
            e.preventDefault();

            var files = file_input.data('ace_input_files');
            if( !files || files.length == 0 ) return false;//no files selected

            var deferred ;
            if( "FormData" in window ) {
                //for modern browsers that support FormData and uploading files via ajax
                //we can do >>> var formData_object = new FormData($form[0]);
                //but IE10 has a problem with that and throws an exception
                //and also browser adds and uploads all selected files, not the filtered ones.
                //and drag&dropped files won't be uploaded as well

                //so we change it to the following to upload only our filtered files
                //and to bypass IE10's error
                //and to include drag&dropped files as well
                formData_object = new FormData();//create empty FormData object

                //serialize our form (which excludes file inputs)
                $.each($form.serializeArray(), function(i, item) {
                    //add them one by one to our FormData
                    formData_object.append(item.name, item.value);
                });
                //and then add files
                $form.find('input[type=file]').each(function(){
                    var field_name = $(this).attr('name');
                    //for fields with "multiple" file support, field name should be something like `myfile[]`

                    var files = $(this).data('ace_input_files');
                    if(files && files.length > 0) {
                        for(var f = 0; f < files.length; f++) {
                            formData_object.append(field_name, files[f]);
                        }
                    }
                });


                upload_in_progress = true;
                file_input.ace_file_input('loading', true);

                deferred = $.ajax({
                    url: $form.attr('action'),
                    type: $form.attr('method'),
                    processData: false,//important
                    contentType: false,//important
                    dataType: 'json',
                    data: formData_object
                    /**
                     ,
                     xhr: function() {
								var req = $.ajaxSettings.xhr();
								if (req && req.upload) {
									req.upload.addEventListener('progress', function(e) {
										if(e.lengthComputable) {
											var done = e.loaded || e.position, total = e.total || e.totalSize;
											var percent = parseInt((done/total)*100) + '%';
											//percentage of uploaded file
										}
									}, false);
								}
								return req;
							},
                     beforeSend : function() {
							},
                     success : function() {
							}*/
                });

            }
            else {
                //for older browsers that don't support FormData and uploading files via ajax
                //we use an iframe to upload the form(file) without leaving the page

                deferred = new $.Deferred //create a custom deferred object

                var temporary_iframe_id = 'temporary-iframe-'+(new Date()).getTime()+'-'+(parseInt(Math.random()*1000));
                var temp_iframe =
                    $('<iframe id="'+temporary_iframe_id+'" name="'+temporary_iframe_id+'" \
								frameborder="0" width="0" height="0" src="about:blank"\
								style="position:absolute; z-index:-1; visibility: hidden;"></iframe>')
                        .insertAfter($form)

                $form.append('<input type="hidden" name="temporary-iframe-id" value="'+temporary_iframe_id+'" />');

                temp_iframe.data('deferrer' , deferred);
                //we save the deferred object to the iframe and in our server side response
                //we use "temporary-iframe-id" to access iframe and its deferred object

                $form.attr({
                    method: 'POST',
                    enctype: 'multipart/form-data',
                    target: temporary_iframe_id //important
                });

                upload_in_progress = true;
                file_input.ace_file_input('loading', true);//display an overlay with loading icon
                $form.get(0).submit();


                //if we don't receive a response after 30 seconds, let's declare it as failed!
                ie_timeout = setTimeout(function(){
                    ie_timeout = null;
                    temp_iframe.attr('src', 'about:blank').remove();
                    deferred.reject({'status':'fail', 'message':'Timeout!'});
                } , 30000);
            }


            ////////////////////////////
            //deferred callbacks, triggered by both ajax and iframe solution
            deferred
                .done(function(result) {//success
                    _tips("上传成功",2)
                })
                .fail(function(result) {//failure
                    _alert("上传失败");
                })
                .always(function() {//called on both success and failure
                    if(ie_timeout) clearTimeout(ie_timeout);
                    ie_timeout = null;
                    upload_in_progress = false;
                    file_input.ace_file_input('loading', false);
                });

            deferred.promise();
        });


        //when "reset" button of form is hit, file field will be reset, but the custom UI won't
        //so you should reset the ui on your own
        $form.on('reset', function() {
            $(this).find('input[type=file]').ace_file_input('reset_input_ui');
        });


        if(location.protocol == 'file:') alert("For uploading to server, you should access this page using 'http' protocal, i.e. via a webserver.");

    });
</script>
</html>
