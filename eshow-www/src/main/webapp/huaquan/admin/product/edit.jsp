<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/huaquan/common/path.jsp" %>
<%@ include file="/huaquan/common/taglibs.jsp" %>
    <s:action name="product!view" id="view" executeResult="false"/>
<head>
    <title>修改产品${view.product.name}</title>
    <link rel="stylesheet" href="${huaquan}/static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${huaquan}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${huaquan}/static/styles/admin.css">
    <%@ include file="/common/style/umeditor.jsp" %>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container mt">
    <%@ include file="../left.jsp" %>
    <div class="cont">
        <ul class="breadcrumb">
            <li><a href="${huaquanmanage}/">首页</a>/</li>
            <li><a href="${huaquanmanage}/product">产品管理</a>/</li>
            <li>修改产品</li>
        </ul>
        <div class="com">
            <div class="page-header">
                <h3 class="yahei">修改新闻</h3>
            </div>
            <div class="com clearfix">
                <s:form class="form-horizontal" name="productForm" id="productForm" action="product!update.action" method="post" enctype="multipart/form-data" namespace="">
                    <input type="hidden" name="redirect" value="${huaquanmanage}/product/">
                    <input type="hidden" name="id" value="${view.product.id}">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">产品名称</label>

                        <div class="col-sm-8">
                            <input type="text" data-errormessage="请输入您的产品名称！" class="form-control" value="${view.product.name}"
                                   id="name" name="product.name" placeholder="请输入您的产品名称！">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">规格/型号</label>

                        <div class="col-sm-8">
                            <input type="text" data-errormessage="请输入您的规格/型号！" class="form-control" value="${view.product.code}"
                                   id="code" name="product.code" placeholder="请输入您的规格/型号！">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">产品报价</label>

                        <div class="col-sm-8">
                            <input type="text" data-errormessage="请输入您的产品报价！" class="form-control" value="${view.product.price}"
                                   id="price" name="product.price" placeholder="请输入您的产品报价！">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">产品产地</label>

                        <div class="col-sm-8">
                            <textarea class="form-control" data-errormessage="内容描述不能超过800个字" rows="10" id="content"
                                      name="product.content" placeholder="产品产地">${view.product.content}</textarea>
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
        $("#productForm").Validform({
            tiptype: 2
        });
    })
</script>
</body>




