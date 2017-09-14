<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<s:action name="user!view" var="view" executeResult="false"/>
<head>
    <title>个人中心信息修改</title>
    <link rel="stylesheet" type="text/css" href="${dll}/cxcalendar/css/jquery.cxcalendar.css">
</head>
<div class="main">
<div class="home_wrapper ">
    <%@ include file="/include/left.jsp" %>
    <div class="home_content">
        <div class="home_list" style="margin-top:80px;">
            <ul class="home_navbar clearfix ">
                <li><a href="${ctx}/">首页</a></li>
                <li><span>></span></li>
                <li><a href="${ctx}/user/view">个人中心</a></li>
                <li><span>></span></li>
                <li><a href="">修改个人信息</a></li>
            </ul>
        </div>

        <div class="home_block">
            <div class="container-fluid">
                <div class="row">

                <s:form id="userForm" action="user!update.action" method="post" cssClass="form-horizontal"
                        namespace="">
                    <div class="col-sm-2 avatar_border">
                        <div class="avatar margin_center" style="overflow: hidden">
                            <img src="${view.user.photo}" id="preview-img" style="width: 100%;height: 100%">
                        </div>
                        <div class="avatar_btn">

                            <a href="javascript:;" class="upload_avar">
                                <input type="file" name="file" id="fileupload" value="上传头像">
                            </a>
                        </div>
                    </div>

        <%--                <img src="${view.user.photo}" id="preview-img">
                          <div class="user_bd avatar_bd">
                              <div class="avatar_left">

                                  <div class="avatar_content">
                                      <input id="upimg" type="hidden" name="user.photo">
                                      <input  id="fileupload" name="file" type="file" class="imgbtn"  value="上传头像">
                                      <div id="progress" class="progress">
                                      </div>
                                      <span>图片大小不能超过2M，支持 .jpeg .jpg .gif .bmp .png 格式</span>
                                  </div>
                              </div>
                          </div>        --%>
                    <div class="col-sm-10">
                    <input type="hidden" name="redirect" value="/user/view"/>
                    <input type="hidden" name="id" value="${view.user.id}"/>

                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label>账号：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <input  type="text"  class="input_sm" placeholder="请输入帐号"
                                        name="user.username" value="${view.user.username}" />
                            </div>
                        </div>
                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label>昵称：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <input type="text"  class="input_sm" placeholder="请输入昵称"
                                       name="user.nickname" value="${view.user.nickname}"/>
                                <span class="input_tip" hidden="hidden">昵称不能超过14个英文字符</span>
                            </div>
                        </div>
                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label>姓名：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <input type="text"  class="input_sm" placeholder="请输入姓名"
                                       value="${view.user.realname}" name="user.realname">
                            </div>
                        </div>

                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label>性别：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <div class="radio">
                                <div class="radius_radio border_lightBlue radius_radio_lightBlue fl">
                                    <input type="radio" <c:if test="${view.user.male==true}">checked="checked"</c:if> value="true" name="user.male"/>
                                </div>男
                                </div>

                                <div class="radio">
                                <div class="radius_radio border_lightBlue radius_radio_lightBlue fl order_radio_on">
                                    <input type="radio" <c:if test="${view.user.male==false}">checked="checked" </c:if> value="false"name="user.male"/>
                                </div>女
                                </div>
                        </div>
                    </div>
                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label>生日：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <input  type="text"  class="input_sm calendar_bd"  placeholder="请选择出生年月"
                                        id="birth" name="user.birthday"
                                       value="${view.user.birthday}"/>
                            </div>
                        </div>
                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label>邮箱：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <input type="text" class="input_sm" placeholder="请输入邮箱"
                                       name="user.email" value="${view.user.email}" />
                            </div>
                        </div>
                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label>简介：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <textarea class="textarea_lg" placeholder="不填写自动截取内容前225个字符"
                                          name="user.intro">${view.user.intro}</textarea>
                            </div>
                        </div>

                        <div class="row input_row">
                            <div class="col-xs-offset-2 col-xs-10">
                                <input type="submit" class="btn btn-primary btn_sm btn_blue btn_dis btn_border" value="修改"/>

                            </div>
                        </div>
                        </div>
                        </s:form>
                </div>
                </div>

            </div>
        </div>
    </div>
</div>
<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
<%@ include file="/common/script/validate.jsp" %>
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
                $("#preview-img").attr("src","http://eshow.u.qiniudn.com/" + data.result.key);
                $("#upimg").val("http://eshow.u.qiniudn.com/" + data.result.key);
            },
            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress').html(progress + '%');
            }
        }).prop('disabled', !$.support.fileInput)
                .parent().addClass($.support.fileInput ? undefined : 'disabled');
    });
    //生日
    $('#birth').cxCalendar();
    function select_radio(tabName,cssName){
        $(tabName).on('click',function(){

            if($(this).children().hasClass(cssName)){
                $(this).children().removeClass(cssName);
                $(this).siblings().children().addClass(cssName);
            }else {
                $(this).children().addClass(cssName);
                $(this).siblings().children().removeClass(cssName);
            }
        })
    };
    //性别
    select_radio(".radio","order_radio_on");
</script>
</body>

