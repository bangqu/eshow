<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/huaquan/common/taglibs.jsp" %>
<%@ include file="/huaquan/common/path.jsp" %>
<div class="navbar navbar-fixed-top">
    <div class="container">
        <a class="brand yahei fl" href="${huaquanmanage}/">网站管理平台</a>
        <ul class="nav navbar-nav fl">
            <li class="active"><a href="${huaquan}/">首 页</a></li>
        </ul>
        <p class="navbar-text fr">
            欢迎： <a href="" class="navbar-link"><span> 管理员</span>
        </a>&nbsp;&nbsp; <a href="${huaquanmanage}/user/login" class="navbar-link">退出</a>
        </p>
    </div>
</div>