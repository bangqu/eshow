<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
    <title>后台-登录</title>
    <link rel="stylesheet" type="text/css" href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/style.css">
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/base.css">
    <%@ include file="/common/style/validate.jsp" %>
</head>
<body>
<div class="log_inbox">
    <div class="log_in">
        <div class="log">
            <a href="${ctx}/"><img src="${dll}/manage/images/log_in.png"></a>
        </div>
        <div class="log_bd">
            <c:url var="loginUrl" value="/j_spring_security_check"/>
            <form id="log_form" class="log_top" action="${loginUrl}" method="post">
                <c:if test="${param.error != null}">
                    <p class="allot"><span><fmt:message key="errors.password.mismatch"/></span></p>
                </c:if>
                <div class="log_inputs log_disdance">
                    <input class="input_border validate[required]" type="text" placeholder="请输入用户名" id="username" name="username" onFocus="if (value =='请输入用户名'){value ='';this.style.color='#59708b'}" onBlur="if (value ==''){value='请输入用户名';this.style.color='#cdd3db'}"/>
                </div>
                <div class="log_inputs">
                    <input class="input_border  validate[required,custom[onlyLetterNumber]]" type="password" id="password" name="password"
                           onFocus="if (value =='请输入密码'){value ='';this.style.color='#59708b'}" onBlur="if (value ==''){value='请输入密码';this.style.color='#cdd3db'}"/>
                </div>
                <div class="log_forget">
                    <input type="checkbox" id="rememberMe"  name="_spring_security_remember_me" />
                    <span>记住密码</span>
                    <!-- <a href="home_user_find_pwd.html">忘记密码</a> -->
                </div>
                <div class="log_btn">
                    <input class="input_btn btn_active "  type="submit" value="登录"/>
                </div>
            </form>
        </div>
    </div>
    <div class="log_footer">
        <span>Copyright © 2009 www.eshow.org.cn All rights reserved. ICP备案编号：苏ICP备10018847号</span>
    </div>
</div>
<%@ include file="/common/scripts.jsp" %>
<%@ include file="/common/script/validate.jsp" %>
    <script> var wh=0;
    wh=$(window).innerHeight();
    $(".log_inbox").css('height',wh);
    $('#log_form').validationEngine();</script>
<script>
    $('#log_form').validationEngine();
</script>
</body>