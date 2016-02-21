<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/huaquan/common/path.jsp" %>
<%@ include file="/huaquan/common/taglibs.jsp" %>
<s:action name="info!view" id="view" executeResult="false"/>
<head>
    <s:action name="blog!view" id="view" executeResult="false"/>
<head>
    <title>修改新闻${view.blog.title}</title>
    <link rel="stylesheet" href="${huaquan}/static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${huaquan}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${huaquan}/styles/admin.css">
    <%@ include file="/common/style/umeditor.jsp" %>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container mt">
    <%@ include file="../left.jsp" %>
    <div class="cont">
        <ul class="breadcrumb">
            <li><a href="${huaquanmanage}/">首页</a>/</li>
            <li><a href="${huaquanmanage}/blog">新闻页管理</a>/</li>
            <li>修改新闻</li>
        </ul>
        <div class="com">
            <div class="page-header">
                <h3 class="yahei">修改新闻</h3>
            </div>
            <div class="com clearfix">
                <s:form class="form-horizontal" name="blogForm" id="blogForm" action="http://localhost:8080/eshow/blog!update.action" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="redirect" value="${huaquanmanage}/blog/">
                    <input type="hidden" name="id" value="${view.blog.id}">


                    <div class="form-group">
                        <label class="col-sm-2 control-label">新闻标题</label>

                        <div class="col-sm-8">
                            <input type="text" data-errormessage="新闻标题不能为空" class="form-control"
                                   value="${view.blog.title}" id="blog_title" name="blog.title" placeholder="新闻标题">
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
<%@ include file="../footer.jsp" %>
<%@ include file="../../../common/scripts.jsp" %>
<%@ include file="/common/script/validform.jsp" %>
<%@ include file="../../../common/script/umeditor.jsp" %>
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
</script>
</body>




