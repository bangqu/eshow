<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%-- Put constants into request scope --%>
<appfuse:constants scope="request"/>
<div class="navbar navbar-static-top" id="main-nav">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-target=".nav-collapse"
               data-toggle="collapse"> <span class="icon-bar"></span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> </a>
            <a class="logo" href="${ctx}/" title="Fleetio homepage">
                <img alt="logo" width="155" height="22" src="${dll}/images/logo.png"/>
            </a>
            <div class="pull-right">
                <c:if test="${pageContext.request.remoteUser!= null}">
                <div class="inlg">
                欢迎：
                <a href="${ctx}/setting/index" class="red"> <security:authentication property="principal.nickname"/></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="${ctx}/setting/index" class="red">设置</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="fr" href="${ctx}/user/logout" class="navbar-link"><em class="fa fa-sign-out"></em> 退出</a>
                </div>
                </c:if>

                <c:if test="${pageContext.request.remoteUser == null}">
                <a class="btn btn-inverse btn-mini" href="${ctx}/user/login" title=""> 登录</a>
                <a class="btn btn-inverse btn-mini" href="${ctx}/user/signup"> 注册</a>
                </c:if>
            </div>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li class=""><a href="${ctx}/">首页</a></li>
                    <li class=""><a href="${ctx}/demo/">案例</a></li>
                    <li class=""><a href="${ctx}/blog/">开发日志</a></li>
                    <li class=""><a href="${ctx}/topic/">讨论区</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>