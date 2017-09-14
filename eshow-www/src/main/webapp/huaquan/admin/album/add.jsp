<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/huaquan/common/path.jsp" %>
<head>
    <title>添加相册</title>
    <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="${huaquan}/styles/admin.css">
    <%@ include file="/common/style/umeditor.jsp" %>
</head>
<body>
<%@ include file="/huaquan/admin/common/header.jsp" %>
<div class="container mt">
    <%@ include file="/huaquan/admin/include/left.jsp" %>
    <div class="cont">
        <ul class="breadcrumb">
            <li><a href="${huaquanmanage}/">首页</a>/</li>
            <li><a href="${huaquanmanage}/album">相册管理</a>/</li>
            <li>添加相册</li>
        </ul>
        <div class="com">
            <div class="page-header">
                <h3 class="yahei">添加相册</h3>
            </div>
            <div class="com clearfix">
                <s:form class="form-horizontal" name="albumForm" id="albumForm" action="album!save.action"
                        method="post" namespace="">
                    <input type="hidden" name="redirect" value="${huaquanmanage}/album/">
                    <input type="hidden" name="album.website" value="huaquan">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">相册名称</label>
                        <div class="col-sm-8">
                            <input type="text" data-errormessage="相册名称不能为空" class="form-control" value=""
                                   id="name" name="album.name" placeholder="相册名称">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="img"><span class="red">相册封面</span></label>

                        <div class="col-sm-8" id="img">
                            <img id="preview-img" class="upimgbor" src="http://yinwan.qiniudn.com/default.jpg!small.jpg">
                            <input id="upImg" type="hidden" name="album.img">

                            <div class="upbox">
                                <span class="yellow">图片格式jpg、png,<br>大小限制在300M以内</span>
                                <p>
                                <span class="btn btn-success fileinput-button">
                                    <i class="glyphicon glyphicon-plus"></i>
                                    <span>选择新图片</span>
                                    <input id="imgFileupload" type="file" name="file">
                                </span>

                                <div id="imgProgress" class="progress">

                                    <div class="progress-bar progress-bar-warning"></div>
                                </div>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="description">相册描述</label>

                        <div class="col-sm-8">
                            <textarea class="form-control"  rows="10" id="description"
                                      name="album.description" ></textarea>
                        </div>
                        <span class="Validform_checktip"></span>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">添加</button>
                            <button type="button" onclick="window.history.go(-1);" class="btn">取消</button>
                        </div>
                    </div>
                </s:form>
            </div>
        </div>
    </div>
</div>
<%@ include file="/huaquan/admin/common/footer.jsp" %>
<%@ include file="/common/scripts.jsp" %>
<%@ include file="/common/script/validform.jsp" %>
<%@ include file="/common/script/umeditor.jsp" %>
<%@ include file="/common/script/fileupload.jsp" %>
<script type="text/javascript">

    var ue = UM.getEditor('description', {
        lang: /^zh/.test(navigator.language || navigator.browserLanguage || navigator.userLanguage) ? 'zh-cn' : 'en',
        langPath: UMEDITOR_CONFIG.UMEDITOR_HOME_URL + "lang/",
        focus: true,
        initialFrameWidth: 563,
        initialFrameHeight: 600
    });

    $(document).ready(function () {
        $("#albumForm").Validform({
            tiptype: 2
        });

    })
    $(function () {
        'use strict';
        var url = 'http://up.qiniu.com/';
        var _d = new Date();
        var _m = _d.getTime() + 1;
        var key = _d.getFullYear() + '/' + _d.getMonth() + '/' + _d.getDay() + '/' + _m;
        $('#imgFileupload').fileupload({
            url: url,
            dataType: 'json',
            post: 'POST',
            formData: {
                key: key,
                token: "<%=cn.org.eshow.component.qiniu.QiniuUtil.uploadToken("eshow")%>"
            },
            done: function (e, data) {
                $("#preview-img").attr("src", "http://eshow.u.qiniudn.com/" + key + "!small.jpg");
                $("#upImg").val("http://eshow.u.qiniudn.com/" + key);
            },
            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#imgProgress').find(".progress-bar").css("width",progress+"%");
            }
        }).prop('disabled', !$.support.fileInput)
                .parent().addClass($.support.fileInput ? undefined : 'disabled');
    });
</script>
</body>

