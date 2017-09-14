<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/huaquan/common/path.jsp" %>
<head>
    <title>新闻页管理</title>
    <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="${huaquan}/static/styles/admin.css">
    <%@ include file="/common/style/umeditor.jsp" %>
</head>
<body>
<%@ include file="/huaquan/admin/common/header.jsp" %>
<div class="container mt">
    <%@ include file="/huaquan/admin/include/left.jsp" %>
    <div class="cont">
        <ul class="breadcrumb">
            <li><a href="${huaquanmanage}/">首页</a>/</li>
            <li><a href="${huaquanmanage}/blog">新闻页管理</a>/</li>
            <li>添加新闻</li>
        </ul>
        <div class="com">
            <div class="page-header">
                <h3 class="yahei">添加新闻</h3>
            </div>
            <div class="alert alert-warning alert-dismissible fade in" role="alert">
                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <strong>提示!</strong> 加*为必填项.
            </div>
            <div class="com clearfix">
                <s:form class="form-horizontal" name="blogForm" id="blogForm" action="blog!save.action"
                        method="post" namespace="">
                    <input type="hidden" name="redirect" value="${huaquanmanage}/blog/">
                    <input type="hidden" name="blog.website" value="huaquan">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">新闻标题</label>

                        <div class="col-sm-8">
                            <input type="text" data-errormessage="请输入您的新闻标题！" class="form-control" value=""
                                   id="title" name="blog.title" placeholder="请输入您的新闻标题！">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="content">新闻内容</label>

                        <div class="col-sm-8">
                            <textarea class="form-control" data-errormessage="内容不能超过800个字" rows="10" id="content"
                                      name="blog.content" placeholder="请输入您的信息内容！"></textarea>
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
<script type="text/javascript">

    var ue = UM.getEditor('content', {
        lang: /^zh/.test(navigator.language || navigator.browserLanguage || navigator.userLanguage) ? 'zh-cn' : 'en',
        langPath: UMEDITOR_CONFIG.UMEDITOR_HOME_URL + "lang/",
        focus: true,
        initialFrameWidth: 563,
        initialFrameHeight: 600
    });

    $(document).ready(function () {
        $("#infoForm").Validform({
            tiptype: 2
        });

    })


</script>
</body>

