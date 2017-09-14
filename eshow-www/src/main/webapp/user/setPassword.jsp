<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>重置密码</title>
    <meta name="description" content="EShow框架重置密码" />
    <meta name="keywords" content="EShow,EShow开源网站,开源框架,ssh,轻量级框架,重置密码" />
</head>
<style>
    body{background-color:#e1e5eb;}
</style>
<body>
<div class="log_inbox">
    <div class="log_in">
        <div class="log">
            <a href="${ctx}/"><img src="${dll}/www/images/log_in.png"></a>
        </div>
        <div class="set_pwd_bd">
            <s:form id="password_form" action="user!password.action" method="post" namespace="">
                <p class="form_top"><span>重置密码</span></p>
                <div class="log_inputs log_disdance">
                    <input class="input_border validate[required] validate[custom[onlyLetterNumber]]" type="password" id="password"
                           name="user.password" placeholder="请输入新密码"/>
                </div>
                <div class="log_inputs">
                    <input class="input_border validate[required] validate[equals[password]]" type="password" name="oldpasswod"
                           placeholder="请确认新密码"/>
                </div>
                <div class="set_pwd_tip">
                    <span>强烈建议密码同时包含字母、数字和标点符号。</span>
                </div>
                <div class="log_btn">
                    <input type="hidden" name="user.username" value="${param.username}">
                    <input type="hidden" name="redirect" value="/user/login"/>
                    <input class="btn_active input_btn" type="submit" value="下一步"/>
                </div>
            </s:form>
        </div>
    </div>
    <div class="log_footer">
        <span>Copyright © 2009 www.eshow.org.cn All rights reserved. ICP备案编号：苏ICP备10018847号</span>
    </div>
</div>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.js"></script>
<script type="text/javascript" src="${dll}/validate/jquery.validationEngine.min.js"></script>
<script type="text/javascript" src="${dll}/validate/jquery.validationEngine-zh_CN.js"></script>
<script>
    $('#password_form').validationEngine();
</script>
</body>
