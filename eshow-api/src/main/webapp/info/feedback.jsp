<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0">
    <title>意见反馈</title>
    <link rel="stylesheet" href="${dll}/api/frozenui/dist/css/frozen.css">
    <link rel="stylesheet" href="${dll}/api/styles/style.css">
</head>
<body>
<div class="cpmment_bd">
    <div class="cpmment_textarea padding-sm">
        <textarea id="feedback" placeholder="请输入您的宝贵意见"></textarea>
    </div>

    <div class="block margin-sm-top">
        <div class="ui-btn-wrap">
            <button class="ui-btn-lg ui-btn-danger" onclick="feedback()">
                提交
            </button>
        </div>
    </div>

    <div class="margin-big-top text-center">
        <p class="color-gray">基于HTML5技术构建</p>
    </div>
</div>
<%@ include file="/common/scripts.jsp" %>
<script src="${dll}/layerm/layer.m.js"></script>
<script type="text/javascript">
    function feedback() {
        var content = $("#content").val();
        var accessToken = "${param.accessToken}";
        if (content == null || content == '') {
            layer.open({
                content: '请填写反馈内容',
                time: 1
            });
            return;
        }
        //$("#upbtn").removeClass("ui-btn-primary").addClass("active").html("提交中...");
        $.ajax({
            url: "${ctx}/system!feedback.action",
            data: {
                content: content,
                accessToken: accessToken
            },
            type: "post",
            async: false,
            dataType: "json",
            success: function (result) {
                if (result.status == 1 || result.status == '') {
                    layer.open({
                        content: '管理员已经收到您的反馈，我们会根据大家的反馈做出合理的修改，感谢您的反馈，祝您甚或愉快.',
                        time: 1
                    });
                }
            }
        });
    }

</script>
</body>
</html>
