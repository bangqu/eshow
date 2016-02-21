<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="../../common/path.jsp" %>
<s:action name="product!view" id="view" executeResult="false"/>
<head>
    <title>Promisingpromos_修改产品_${view.product.name}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href=""/>
    <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="${promisingpromosadmin}/styles/admin.css">
    <%@ include file="../../common/style/umeditor.jsp" %>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="container mt">
    <%@ include file="../common/left.jsp" %>
    <div class="cont">
        <ul class="breadcrumb">
            <li><a href="${promisingpromosadmin}/index.jsp">首页</a></li>
            <li><a href="${promisingpromosadmin}/product/">产品管理</a></li>
            <li>修改产品</li>
        </ul>
        <div class="com">
            <div class="page-header">
                <h3 class="yahei">修改产品</h3>
            </div>
            <div class="com clearfix">
                <s:form cssClass="form-horizontal" name="productForm" id="productForm" action="product!update.action"
                        namespace="/"
                        method="post"   enctype="multipart/form-data">
                    <input type="hidden" name="redirect" value="/promisingpromos/admin/product/">
                    <input type="hidden" name="id" value="${view.product.id}">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">产品名</label>
                        <div class="col-sm-8">
                            <input type="text" data-errormessage="产品名不能为空" class="form-control"
                                   value="${view.product.name}" id="product_name" name="product.name" placeholder="产品名">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="img"><span class="red">图片</span></label>
                        <div class="col-sm-8" id="img">
                            <img id="preview-img" class="upimgbor" src="${view.product.img}!small.jpg" >
                            <input id="upImg" type="hidden" name="product.img"  >
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
                        <label class="col-sm-2 control-label">产品型号</label>
                        <div class="col-sm-8">
                            <input type="text" data-errormessage="产品型号不能为空" class="form-control"
                                   value="${view.product.code}" id="product_code" name="product.code" placeholder="产品型号">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-8">
                            <input type="text" data-errormessage="" class="form-control" value="${view.product.price}"
                                   id="product_price"
                                   name="product.price" placeholder="如：江西银湾">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="content">产品内容</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" data-errormessage="内容不能超过800个字" rows="10" id="content"
                                      name="product.content" placeholder="请输入您的信息内容！">${view.product.content}</textarea>
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
<%@ include file="../common/footer.jsp" %>
<%@ include file="../../../common/scripts.jsp" %>
<%@ include file="/common/script/validform.jsp" %>
<%@ include file="../../../common/script/umeditor.jsp" %>
<%@ include file="../../../common/script/fileupload.jsp" %>
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
                token: "<%=cn.org.eshow.component.qiniu.QiniuUtil.uptoken("eshow")%>"
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

