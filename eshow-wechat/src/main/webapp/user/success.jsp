<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<head>
    <title>注册成功</title>
    <meta name="description" content="EShow框架注册成功" />
    <meta name="keywords" content="EShow,EShow开源网站,开源框架,ssh,轻量级框架,注册成功" />
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
        <div class="register_success_bd">
            <form id="register_success">
                <p class="form_top"><span>注册完成</span></p>
                <div class="success_tip">
                    <img src="${dll}/www/images/icon_success.png">
                    <span>恭喜您成功注册Eshow开源框架!</span>
                </div>
                <div class="log_btn">
                    <a href="${ctx}/user/login"><input class="btn_active success_btn" type="button" value="立即登录"/></a>
                </div>
            </form>
        </div>
    </div>
    <div class="log_footer">
        <span>Copyright © 2009 www.eshow.org.cn All rights reserved. ICP备案编号：苏ICP备10018847号</span>
    </div>
</div>
</body>
