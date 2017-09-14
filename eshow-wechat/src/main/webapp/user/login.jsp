<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>登录</title>
    <meta name="description" content="EShow框架采用流行的J2EE轻量级框架（Struts2+Spring +Hibernate），基于国外开源框架Appfuse，我们可以简称Appfuse中文加强版。" />
    <meta name="keywords" content="EShow,EShow开源网站,开源框架,ssh,轻量级框架,登录" />
</head>
<style>
    body{background-color:#e1e5eb;}
</style>
<body>
<c:set var="current">login</c:set>
<div class="log_inbox">
    <div class="log_in">
        <div class="log">
            <a href="${ctx}/"><img src="${dll}/www/images/log_in.png"></a>
        </div>
        <div class="log_bd">
            <c:url var="loginUrl" value="/j_spring_security_check"/>
            <form id="log_form" class="log_top" action="${loginUrl}" method="post">
                <c:if test="${param.error != null}">
                    <p class="allot"><span><fmt:message key="errors.password.mismatch"/></span></p>
                </c:if>
                <div class="log_inputs log_disdance">
                    <input class="input_border validate[required] validate[custom[phone]]" type="text" id="username"
                           name="username" placeholder="请输入手机号"/>
                </div>
                <div class="log_inputs">
                    <input class="input_border validate[required] validate[custom[onlyLetterNumber]]" type="password"
                           id="password" name="password" placeholder="请输入密码"/>
                </div>
                <div class="log_forget">
                    <input type="checkbox" name="_spring_security_remember_me" id="rememberMe" checked="checked"/>
                    <span>记住密码</span>
                    <a href="${ctx}/user/forgetPassword">忘记密码</a>
                </div>
                <div class="log_btn">
                    <input class="input_btn btn_active" type="submit" value="登录"/>
                    <a href="${ctx}/user/signup"><input type="button" value="注册"/></a>
                </div>
            </form>
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
    $('#log_form').validationEngine();

    if(${current=='login'}){
        $("[pr='login']").addClass("nav_active");
    }
</script>
</body>