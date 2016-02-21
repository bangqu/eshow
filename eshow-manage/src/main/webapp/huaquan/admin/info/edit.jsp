<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/yinwangroup/common/path.jsp" %>
<s:action name="info!view" id="view" executeResult="false"/>
<head>
    <title>修改信息${view.info.title}</title>
    <link rel="stylesheet" href="../../../static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../../../static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${yinwangroup}/styles/admin.css">
    <%@ include file="/common/style/umeditor.jsp" %>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container mt">
    <%@ include file="../left.jsp" %>
    <div class="cont">
        <ul class="breadcrumb">
            <li><a href="${yinwangroupmanage}/index.jsp">首页</a>/</li>
            <li><a href="${yinwangroupmanage}/info/index.jsp">信息页管理</a>/</li>
            <li>修改信息</li>
        </ul>
        <div class="com">
            <div class="page-header">
                <h3 class="yahei">修改信息</h3>
            </div>
            <div class="com clearfix">
                <s:form class="form-horizontal" name="infoForm" id="infoForm" action="!update.action" namespace=""
                        method="post" enctype="multipart/form-data">

                    <input type="hidden" name="redirect"  value="${huaquanmanage}/info/">
                    <input type="hidden" name="id" value="${view.info.id}">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">信息URL</label>

                        <div class="col-sm-8">
                            <input type="text" data-errormessage="请输入您的信息URL！" class="form-control"
                                   value="${view.info.url}" id="info_url" name="info.url">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">信息标题</label>

                        <div class="col-sm-8">
                            <input type="text" data-errormessage="请输入你的信息标题" class="form-control"
                                   value="${view.info.title}" id="info_title" name="info.title">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="content">信息内容</label>

                        <div class="col-sm-8">
                            <textarea class="form-control" data-errormessage="内容不能超过800个字" rows="10" id="content"
                                      name="info.content" placeholder="请输入您的信息内容！">${view.info.content}</textarea>
                        </div>
                        <span class="Validform_checktip"></span>
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
<%@ include file="/huaquan/admin/footer.jsp" %>
<%@ include file="../../common/scripts.jsp" %>
<%@ include file="../../common/script/umeditor.jsp" %>
<%@ include file="/common/script/validform.jsp" %>
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

