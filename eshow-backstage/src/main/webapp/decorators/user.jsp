<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><decorator:title/></title>
    <%@ include file="/common/style/bootstrap.jsp" %>
    <link href="${dll}/manage/styles/style.css" rel="stylesheet"/>
    <%@ include file="/common/jquery.jsp" %>
    <decorator:head/>
</head>
<body
        <decorator:getProperty property="body.id" writeEntireProperty="true"/>
        <decorator:getProperty property="body.class" writeEntireProperty="true"/>>
<div class="navbar navbar-static-top" id="main-nav">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-target=".nav-collapse"
               data-toggle="collapse"> <span class="icon-bar"></span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> </a> <a
                class="logo" href="${ctx}/" title="Fleetio homepage"> <img alt="logo"
                                                                           width="155" height="22"
                                                                           src="${dll}/images/logo.png"/>
        </a>

            <div class="pull-right">
                <a class="btn btn-inverse  btn-mini" href="${ctx}/user/login" title="Log in to Fleetio">登录</a>
                <a class="btn btn-inverse btn-mini" href="${ctx}/user/signup">
                    注册</a>
            </div>

        </div>
    </div>
</div>
<decorator:body/>
<footer class="footer container">
    <p class="center">
        Copyright © 2009-2013 www.daoqun.com All rights reserved.
        &nbsp;&nbsp;&nbsp;&nbsp;合作伙伴： <a href="http://www.daoqun.net"
                                         target="_blank">帮趣网</a>
    </p>
</footer>
</body>
</html>
