<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>修改头像</title>
</head>
<body>
<s:action name="user!view" var="view" executeResult="false">
    <s:param name="id">${authentication.id}</s:param>
</s:action>
<c:set var="current">login</c:set>
<div class="user_centerbox eshow_top">
    <div class="user_conter">
        <div class="user_txt">
            <ul>
                <li><a href="${ctx}/center/info">个人资料</a></li>
                <li><a class="active" href="">修改头像</a></li>
                <li><a href="${ctx}/center/password">修改密码</a></li>
            </ul>
            <s:form id="password_form" action="user!photo.action" method="post" namespace="">
                <input type="hidden" name="id" value="${authentication.id}">
                <input type="hidden" name="redirect" value="/center/photo?active=login">
                <div class="user_bd avatar_bd">
                    <div class="avatar_left">
                        <div class="avatar_hd">
                            <span>选择本地照片，上传编辑自己的头像</span>
                        </div>
                        <div class="avatar_content">
                                <%--<img id="preview-img" src="${view.user.photo}"--%>
                                <%--width="149" height="149">--%>
                            <input id="upimg" type="hidden" name="user.photo">
                            <span class="upimgbtn">上传头像
                            <input class="file_btn" id="fileupload" type="file" name="file" value="上传头像">
                             </span>
                            <div id="progress" class="progress clearfix">
                                <span style=""></span>
                            </div>
                            <span>图片大小不能超过2M，支持 .jpeg .jpg .gif .bmp .png 格式</span>
                        </div>
                    </div>
                    <div class="avatar_right">
                        <ol>
                            <li class="avatar_title"><span>头像预览</span></li>
                            <li class="ol_dis upload_img1"><img id="img1" src="${view.user.photo}"></li>
                            <li><span>100*100</span></li>
                            <li class="ol_dis upload_img2"><img id="img2" src="${view.user.photo}"></li>
                            <li><span>50*50</span></li>
                            <li class="ol_dis upload_img3"><img id="img3" src="${view.user.photo}"></li>
                            <li><span>28*28</span></li>
                        </ol>
                    </div>
                    <div class="user_bolck user_btn">
                        <input class="make_sure" type="submit" value="确定"/>
                    </div>
                </div>
            </s:form>
        </div>
    </div>
</div>
<script src="${dll}/fileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="${dll}/fileupload/js/jquery.iframe-transport.js"></script>
<script src="${dll}/fileupload/js/jquery.fileupload.js"></script>
<script type="text/javascript">
    $(function () {
        'use strict';
        var url = 'http://up.qiniu.com/';
        <%--var key = "<%=cn.org.eshow.component.qiniu.QiniuUtil.key()%>";--%>
        $('#fileupload').fileupload({
            url: url,
            dataType: 'json',
            post: 'POST',
            formData: {
//                key: key,
                token: "<%=cn.org.eshow.component.qiniu.QiniuUtil.uploadToken("eshow")%>"
            },
            done: function (e, data) {
                $("#upimg").val("http://eshow.u.qiniudn.com/" + data.result.key);
                $("#img1").attr("src", "http://eshow.u.qiniudn.com/" + data.result.key);
                $("#img2").attr("src", "http://eshow.u.qiniudn.com/" + data.result.key);
                $("#img3").attr("src", "http://eshow.u.qiniudn.com/" + data.result.key);
            },
            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10) + "%";
                $('#progress').find("span").css("width", progress);
            }
        }).prop('disabled', !$.support.fileInput)
                .parent().addClass($.support.fileInput ? undefined : 'disabled');
    });

    if (${current=='login'}) {
        $("[pr='login']").addClass("nav_active");
    }
</script>
</body>