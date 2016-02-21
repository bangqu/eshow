<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <meta name="description" content="注册"/>
    <meta name="keywords" content="注册"/>
    <title>注册帐号</title>
</head>
<body>
<div class="container">
    <div class="smbox">
        <h4>注册帐号</h4>
        <s:form name="signupForm" cssClass="form-horizontal" action="/signup.action" method="post">
            <div class="control-group">
                <label class="control-label">用户账户</label>

                <div class="controls">
                    <s:textfield
                            name="user.username"
                            cssClass="inputtext text-input validate['required']"
                            onblur="this.className='inputtext';"
                            onfocus="this.className='inputtext2';" maxlength="16"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">登录密码</label>

                <div class="controls">
                    <s:password
                            name="user.password"
                            cssClass="inputtext text-input validate['required']"
                            onblur="this.className='inputtext';"
                            onfocus="this.className='inputtext2';" maxlength="16"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">重复密码</label>

                <div class="controls">
                    <s:password
                            name="user.confirmPassword"
                            cssClass="inputtext text-input validate['required']"
                            onblur="this.className='inputtext';"
                            onfocus="this.className='inputtext2';" maxlength="16"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">用户昵称</label>

                <div class="controls">
                    <s:textfield
                            name="user.nickname"
                            cssClass="inputtext text-input validate['required']"
                            onblur="this.className='inputtext';"
                            onfocus="this.className='inputtext2';" maxlength="64"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">注册邮箱</label>

                <div class="controls">
                    <s:textfield
                            id="email" name="user.email"
                            cssClass="inputtext text-input validate['required','email']"
                            onblur="this.className='inputtext';"
                            onfocus="this.className='inputtext2';" maxlength="64"/>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <label>
                        <input
                                type="checkbox" id="read" style="border: 0;"
                                checked="checked"/>
                        我已阅读同意遵守，<a
                            href="${ctx}/info/terms" target="_blank">EShow服务条款</a> </label>
                    <input type="submit"
                           class="btn  btn-danger" value="注册"/>
                </div>
            </div>
        </s:form>
    </div>
</div>
</body>
