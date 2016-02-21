<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<s:action name="user!view" id="view" executeResult="false" namespace="">
    <s:param name="id">${myid}</s:param>
</s:action>
<head>
    <title>个人用户_查看${view.user.nickname}的信息</title>
    <link rel="stylesheet" href="${ctx}/static/styles/setting.css"/>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="setbox clearfix">
            <div class="tabsnav clearfix">
                <span> 个人资料</span>
                <a href="<c:url value='/setting/edit'/>"
                   style="cursor: pointer; text-decoration: none;">完善资料</a>
                <a href="<c:url value='/setting/photo'/>"
                   style="cursor: pointer; text-decoration: none;">修改头像</a>
                <a href="<c:url value='/setting/password'/>"
                   style="cursor: pointer; text-decoration: none;">修改密码</a>
            </div>
            <s:form name="signupForm" cssClass="form-horizontal">

                <div class="control-group">
                    <label class="control-label" >
                        用户头像:
                    </label>
                    <div class="controls">
                        <img src="${pageContext.request.contextPath}/upload/user/<s:date name='%{#view.user.addTime}' format='yyyyMMdd' />/${view.user.photo}">
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" >
                        用户名:
                    </label>
                    <div class="controls">
                            ${view.user.username}
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" >
                        真实姓名:
                    </label>
                    <div class="controls">
                            ${view.user.realname}
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" >
                        昵称:
                    </label>
                    <div class="controls">
                            ${view.user.nickname}
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" >
                        性别:
                    </label>
                    <div class="controls">
                        <s:if test="%{#view.user.male==true}">男</s:if>
                        <s:elseif test="%{#view.user.male==false}">女</s:elseif>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" >
                        出生年月:
                    </label>
                    <div class="controls">
                            ${view.user.birthday}
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" >
                        自我介绍:
                    </label>
                    <div class="controls">
                        <c:if test="${view.user.intro == null}"><font style="color:#F8F8F8;font-size:12px;">请立即去完善你的个人资料吧</font></c:if>
                        <c:if test="${view.user.intro != null}">${view.user.intro} </c:if>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" >
                        个人爱好:
                    </label>
                    <div class="controls">
                        <c:if test="${view.user.hobby == null}"><font style="color:#F8F8F8;font-size:12px;">请立即去完善你的个人资料吧</font></c:if>
                        <c:if test="${view.user.hobby != null}">${view.user.hobby}</c:if>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" >
                        注册邮箱:
                    </label>
                    <div class="controls">
                            ${view.user.username}
                    </div>
                </div>

            </s:form>


        </div>
    </div>
</div>
</body>
