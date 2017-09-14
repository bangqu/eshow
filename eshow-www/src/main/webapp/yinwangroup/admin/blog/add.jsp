<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/yinwangroup/common/path.jsp" %>
<head>
    <title>添加新闻</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href=""/>
    <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="${yinwangroup}/styles/admin.css">
    <%@ include file="../../common/style/umeditor.jsp" %>
</head>
<body>
<%@ include file="/yinwangroup/admin/common/header.jsp" %>
<div class="container mt">
    <%@ include file="/yinwangroup/admin/common/left.jsp" %>
    <div class="cont">
        <ul class="breadcrumb">
            <li><a href="${yinwangroupmanage}/">首页</a></li>
            <li><a href="${yinwangroupmanage}/blog/">新闻管理</a></li>
            <li>添加新闻</li>
        </ul>
        <div class="com">
            <div class="page-header">
                <h3 class="yahei">添加信息</h3>
            </div>
            <div class="alert alert-warning alert-dismissible fade in" role="alert">
                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <strong>提示!</strong> 加*为必填项.
            </div>
            <div class="com clearfix">
                <s:form cssClass="form-horizontal" name="blogForm" id="blogForm" action="blog!save.action" namespace=""
                        method="post">
                    <input type="hidden" name="redirect" value="${yinwangroupmanage}/blog/">
                    <input type="hidden" name="blog.website" value="yinwangroup">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">区域</label>

                        <div class="col-sm-8">
                            <input type="text" data-errormessage="" class="form-control" value="" id="blog_keyword"
                                   name="blog.keyword" placeholder="如：江西银湾">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">新闻标题</label>

                        <div class="col-sm-8">
                            <input type="text" data-errormessage="新闻标题不能为空" class="form-control" value=""
                                   id="blog_title" name="blog.title" placeholder="新闻标题">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">发布时间</label>
                        <div class="col-sm-3">
                            <input class="form-control" type="text" name="blog.addTime" onClick="WdatePicker()"
                                   id="blog_addTime" value=""/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="img"><span class="red">新闻图标</span></label>

                        <div class="col-sm-8" id="img">
                            <img id="preview-img" class="upimgbor"
                                 src="http://yinwan.qiniudn.com/default.jpg!small.jpg">
                            <input id="upImg" type="hidden" name="blog.img">

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
                        <label class="col-sm-2 control-label">新闻内容</label>

                        <div class="col-sm-8">
                            <textarea class="form-control" data-errormessage="内容不能超过800个字" rows="10" id="content"
                                      name="blog.content" placeholder="新闻内容"></textarea>
                        </div>
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
<%@ include file="/yinwangroup/admin/common/footer.jsp" %>
<%@ include file="../../common/scripts.jsp" %>
<%@ include file="../../common/script/umeditor.jsp" %>
<%@ include file="../../common/script/valiform.jsp" %>
<%@ include file="../../common/script/fileupload.jsp" %>
<script src="../../../static/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
    var ue = UM.getEditor('content', {
        lang: /^zh/.test(navigator.language || navigator.browserLanguage || navigator.userLanguage) ? 'zh-cn' : 'en',
        langPath: UMEDITOR_CONFIG.UMEDITOR_HOME_URL + "lang/",
        focus: true,
        initialFrameWidth: 563,
        initialFrameHeight: 600
    });
    $(document).ready(function () {
        $("#blogForm").Validform({
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
                $('#imgProgress').find(".progress-bar").css("width", progress + "%");
            }
        }).prop('disabled', !$.support.fileInput)
                .parent().addClass($.support.fileInput ? undefined : 'disabled');
    });

</script>
</body>

