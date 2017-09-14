<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/huaquan/common/path.jsp" %>
<s:action name="info!view" var="view" executeResult="false"/>
<head>
    <title>修改信息${view.info.title}</title>
    <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="${huaquan}/static/styles/admin.css">
    <%@ include file="/huaquan/common/style/umeditor.jsp" %>
</head>
<body>
<%@ include file="/huaquan/admin/common/header.jsp" %>
<div class="container mt">
    <%@ include file="/huaquan/admin/include/left.jsp" %>
    <div class="cont">
        <ul class="breadcrumb">
            <li><a href="${huaquanmanage}/index.jsp">首页</a>/</li>
            <li><a href="${huaquanmanage}/info/index.jsp">信息页管理</a>/</li>
            <li>修改信息</li>
        </ul>
        <div class="com">
            <div class="page-header">
                <h3 class="yahei">修改信息</h3>
            </div>
            <div class="com clearfix">
                <s:form class="form-horizontal" name="infoForm" id="infoForm" action="info!update.action" namespace=""
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
<%@ include file="/huaquan/admin/common/footer.jsp" %>
<%@ include file="/common/scripts.jsp" %>
<%@ include file="/huaquan/common/script/umeditor.jsp" %>
<%@ include file="/huaquan/common/script/validform.jsp" %>
<script type="text/javascript">
    var um = UM.getEditor('content', {
        initialFrameWidth:600,
        initialFrameHeight:600,
        imagePath:""
    });

    $(document).ready(function () {
        $("#infoForm").Validform({
            tiptype: 2
        });
    })
</script>
</body>

