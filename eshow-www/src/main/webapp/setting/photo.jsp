<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<s:action name="user!view" id="view" executeResult="false" namespace="">
    <s:param name="id">${myid}</s:param>
</s:action>
<head>
    <title>个人用户_修改头像</title>
    <link rel="stylesheet" href="${ctx}/static/styles/setting.css"/>
</head>
<body>
<section id="content">
    <div class="container">
        <div class="row">
            <div class="setbox clearfix">
                <div class="tabsnav clearfix">
                    <a href="<c:url value='/setting/'/>" style="cursor: pointer;text-decoration:none;">个人资料</a>
                    <a href="<c:url value='/setting/edit'/>" style="cursor: pointer;text-decoration:none;">完善资料</a>
                    <span>修改头像</span>
                    <a href="<c:url value='/setting/password'/>"
                       style="cursor: pointer;text-decoration:none;">修改密码</a>
                </div>
                <div>
                    <!--上传头像-->
                    <div id="uploadfaceimg">
                        <div class="fl" id="div_Log">
                            <p class="title">
                                当前头像
                            </p>
                            <p class="avatar50">
                                <c:if test="${view.user.photo==null}">
                                    <a
                                            href="<c:url value="/user/view?id=${view.user.id}"/>"><img
                                            src="${pageContext.request.contextPath}/images/base/user50-50.jpg"
                                            alt="${view.user.nickname}" width="50" height="50"/> </a>
                                </c:if>
                                <c:if test="${view.user.photo!=null}">
                                    <a href="<c:url value="/user/view?id=${view.user.id}"/>"><img
                                            src="${pageContext.request.contextPath}/upload/user/<s:date name='%{#view.user.addTime}' format='yyyyMMdd' />/${view.user.photo}"
                                            alt="${view.user.nickname}" width="50" height="50"/> </a>
                                </c:if>
                            </p>

                            <p class="avatar100">
                                <c:if test="${view.user.photo==null}">
                                    <a  href="<c:url value="/user/view?id=${view.user.id}"/>">
                                        <img src="${pageContext.request.contextPath}/images/base/user100-100.jpg"
                                            alt="${view.user.nickname}"/> </a>
                                </c:if>
                                <c:if test="${view.user.photo!=null}">
                                    <a href="<c:url value="/user/view?id=${view.user.id}"/>">
                                        <img  src="${pageContext.request.contextPath}/upload/user/<s:date name='%{#view.user.addTime}' format='yyyyMMdd' />/${view.user.photo}"
                                                width="100" height="100"/>
                                    </a>
                                </c:if>

                            </p>
                        
                            <p class="title">剪辑头像照片</p>
                            <div id="div_Loading" class="loading">
                                <span><img src="/content/images/ui/loading.gif"/> </span>
                                <span style="margin: 0 0 20px 10px">图像加载中...</span>
                            </div>
                            <div id="div_Editor" style="display: none">
                                <div id="img_content">
                                    <div id="image"> <img id="img" src=""/> </div>
                                    <div id="drop"><img id="drop_img" src=""/> </div>
                                </div>
                                <table>
                                    <tr>
                                        <td width="30"></td>
                                        <td id="Min">
                                            <img alt="缩小" src="/content/images/faceimg/Minc.gif"
                                                 style="width: 19px; height: 19px" id="moresmall"
                                                 class="smallbig"/>
                                        </td>
                                        <td>
                                            <div id="bar"><div class="child"></div>
                                            </div>
                                        </td>
                                        <td id="Max">
                                            <img alt="放大" src="/content/images/faceimg/Maxc.gif"
                                                 style="width: 19px; height: 19px" id="morebig"
                                                 class="smallbig"/>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                            <s:form action="user!photo.action"  id="userForm" method="post" namespace="" cssClass="fr" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="${view.user.id}" />
                                <p class="title">更换头像 </p>

                                <p style="margin-top: 10px; color: #999;"> 图片大小不能超过2M，支持 .jpeg .jpg .gif .bmp .png 格式 </p>

                                <p style="margin: 5px 0 5px 0;">
                                    <input style="width: 250px; height: 24px;" type="file" id="file" class="inputtext" style="width:250px" name="file"/>
                                </p>

                                <p>
                                    <input type="submit" class="botton" value="上传"id="btnUpload" onMouseOut="this.className='botton';"onMouseOver="this.className='botton2';"/>
                                </p>

                                <div id="div_Uploading" class="loading" style="display: none">
                                    <span><img src="/content/images/ui/loading.gif"/> </span>
                                    <span style="margin: 0 0 20px 10px">图像上传中，请稍候...</span>
                                </div>
                            </s:form>

                        <div class="r" id="div_Note" style="display: none">
                            <form name="imgform" action="/User/UploadFaceImg"
                                  method="post" enctype="multipart/form-data"
                                  target="hidden_frame"></form>
                            <p class="title"> 说明</p>

                            <p style="margin-top: 10px; color: #999;">请在左边的编辑窗口拖动和缩放你上传的图片
                                <br/>点击“保存头像”之后系统将使用中间高亮区<br/>域为你生成头像
                            </p>
                        </div>
                    </div>
                    <!--/上传头像-->
                </div>


            </div>
        </div>
    </div>
    <%@ include file="../common/scripts.jsp" %>
    <%@ include file="../common/script/umeditor.jsp" %>
    <%@ include file="../common/script/validform.jsp" %>
    <%@ include file="../common/script/fileupload.jsp" %>
    <script type="text/javascript">
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
                $("#preview-img").attr("src", "http://eshow.u.qiniudn.com/" + key + "!small.jpg");
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
