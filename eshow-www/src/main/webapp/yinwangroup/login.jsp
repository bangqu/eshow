<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="common/path.jsp" %>
<link rel="stylesheet" href="${yinwangroup}/styles/style.css"/>
<head>
    <title>登录</title>
    <meta name="descriptions" content="登录"/>
    <meta name="keywords" content="登录"/>
    <link rel="stylesheet" href="${yinwangroup}/styles/login.css">
</head>
<body>
<div class="header">
    <div class="wp clearfix">
        <div class="logo pl">
            <img src="./images/logo.png">
        </div>
        <div class="fl tss"> 登录银湾集团网站</div>
    </div>
</div>
<div class="container">
    <div class="smbox yahei">
        <h4 class="">登 录</h4>

        <form method="post" class="form-horizontal" id="loginForm"
              action="<c:url value='/user/login.jsp'/>"
              onsubmit="saveUsername(this);return validateForm(this)">
            <c:if test="${param.error != null}">
                <div class="alert fade in">
                    <fmt:message key="errors.password.mismatch"/>
                        <%--${sessionScope.ACEGI_SECURITY_LAST_EXCEPTION.message}--%>
                </div>
            </c:if>
            <br/>

            <div class="control-group">
                <label class="control-label" for="j_username">用户名</label>

                <div class="controls">
                    <input id="j_username" name="j_username" type="text"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="j_password">密码</label>

                <div class="controls">
                    <input type="password" name="j_password" id="j_password"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="j_password"></label>

                <div class="controls">
                    <label class="checkbox">
                        <input type="checkbox" name="_spring_security_remember_me" id="rememberMe" checked="checked"/>
                        让系统记住我 </label>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <input type="submit" name="login" class="yahei btn btn-primary"
                           value="&nbsp;&nbsp;登&nbsp;录&nbsp;&nbsp;"/>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="inr yahei">
    <p>银湾社区生活网 版权所有<br>
        沪ICP备14010855号-1 Copyright2013© yinwangroup.com Inc. All rights reserved
    </p>
</div>
</body>