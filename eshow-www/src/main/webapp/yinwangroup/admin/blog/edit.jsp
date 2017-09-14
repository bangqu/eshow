<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/yinwangroup/common/path.jsp" %>
<s:action name="blog!view" id="view" executeResult="false"/>
<head>
    <title>修改新闻${view.blog.title}</title>
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
            <li><a href="${yinwangroupmanage}/index.jsp">首页</a></li>
            <li><a href="${yinwangroupmanage}/blog/index.jsp">新闻管理</a></li>
            <li>修改新闻</li>
        </ul>
        <div class="com">
            <div class="page-header">
                <h3 class="yahei">修改新闻</h3>
            </div>
            <div class="com clearfix">
                <s:form cssClass="form-horizontal" name="blogForm" id="blogForm" action="blog!update.action" namespace="" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="redirect" value="${yinwangroupmanage}/blog/index.jsp">
                    <input type="hidden" name="id" value="${view.blog.id}">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">区域</label>

                        <div class="col-sm-8">
                            <input type="text" data-errormessage="" class="form-control" value="${view.blog.keyword}"
                                   id="blog_keyword"
                                   name="blog.keyword" placeholder="如：江西银湾">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">新闻标题</label>

                        <div class="col-sm-8">
                            <input type="text" data-errormessage="新闻标题不能为空" class="form-control"
                                   value="${view.blog.title}" id="blog_title" name="blog.title" placeholder="新闻标题">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="img"><span class="red">新闻图标</span></label>

                        <div class="col-sm-8" id="img">
                            <img id="preview-img" class="upimgbor" src="${view.blog.img}" >
                            <input id="upImg" type="hidden" name="blog.img"  >
                            <div class="upbox">
                                <span class="yellow">图盘格式jpg、png,<br>大小限制在300M以内</span>
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
                            <textarea class="form-control" data-errormessage="内容描述不能超过800个字" rows="10" id="content"
                                      name="blog.content" placeholder="新闻内容">${view.blog.content}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">保存更改</button>
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
<%@ include file="../../common/script/validform.jsp" %>
<%@ include file="../../common/script/umeditor.jsp" %>
<%@ include file="../../common/script/fileupload.jsp" %>
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
                $("#preview-img").attr("src","http://eshow.u.qiniudn.com/" + key + "!small.jpg");
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

