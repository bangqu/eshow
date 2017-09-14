<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>注册设置</title>
    <meta name="description" content="EShow开源框架注册设置" />
    <meta name="keywords" content="EShow,EShow开源网站,开源框架,ssh,轻量级框架,注册设置" />
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
        <div class="register_ensure_bd">
            <s:form id="signup_form" action="signup!save.action" method="post" namespace="">
                <p class="form_top"><span>注册设置</span></p>
                <div class="log_inputs log_disdance">
                    <input class="input_border validate[custom[email]] validate[required]" type="text" name="user.email"
                           name="email" placeholder="请输入邮箱"/>
                </div>
                <div class="log_inputs log_disdance">
                    <input class="input_border validate[required]" type="text" name="user.nickname"
                           placeholder="请输入昵称"/>
                </div>
                <div class="log_inputs log_disdance">
                    <input class="input_border validate[required]" type="password" id="password"
                           name="user.password" placeholder="请输入密码"/>
                </div>
                <div class="log_inputs">
                    <input class="input_border validate[equals[password]]" type="password" name="comfigPassword"
                           placeholder="请确认密码"/>
                </div>
                <div class="log_forget">
                    <input type="checkbox" required/>
                    <span>我已阅读同意遵守《<em>EShow服务条款</em>》</span>
                </div>
                <p class="log_btn">
                    <input type="hidden" value="${param.username}" name="user.username"/>
                    <a href=""><input class="btn_active input_btn" type="submit" value="登录"/></a>
                </p>
                <p class="form_footer reg_setline"><a href="${ctx}/user/login">已有账号直接登录</a></p>

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
    $('#signup_form').validationEngine();
</script>
</body>
</html>
