<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="${dll}/www/script/js.js"></script>
<link rel="stylesheet" type="text/css" href="${dll}/validate/validationEngine.jquery.css">
<link rel="stylesheet" type="text/css" href="${dll}/cxcalendar/css/jquery.cxcalendar.css">
<script src="${dll}/cxcalendar/js/jquery.cxcalendar.min.js"></script>
<script src="${dll}/cxcalendar/js/jquery.cxcalendar.languages.js"></script>
<link rel="shortcut icon" href="favicon.ico">
<!-- 头部 -->
<div class="eshow_headbox">
    <div class="eshow_head">
        <div class="eshow_left">
            <a href="${ctx}/"><img src="${dll}/www/images/eshow_log.png"></a>
        </div>
        <div class="eshow_right">
            <ul class="nav_up">
                <li>
                    <a class="menu " pr="index" href="${ctx}/">首页</a>
                </li>
                <li><a class="menu " pr="frame" href="javascript:">框架</a>
                    <div class="nav_down">
                        <a href="${ctx}/frame/web">EShow Web</a>
                        <a href="${ctx}/frame/android">EShow Android</a>
                        <a href="${ctx}/frame/ios">EShow iOS</a>
                        <a href="${ctx}/frame/html5">EShow UI</a>
                        <a href="${ctx}/frame/admin">EShow Admin</a>
                    </div>
                </li>
                <li><a class="menu " pr="case" href="${ctx}/case/">案例</a></li>
                <li><a class="menu " pr="blog" href="${ctx}/blog/">开发日志</a></li>
                <li><a class="menu " pr="topic" href="${ctx}/topic/?boardId=">讨论区</a></li>
                <li><span>|</span></li>
                <c:if test="${pageContext.request.remoteUser == null}">
                    <li><a class="menu" pr="login" href="${ctx}/user/login">登录</a></li>
                    <li><a class="menu " pr="signup" href="${ctx}/user/signup">注册</a></li>
                </c:if>
                <c:if test="${pageContext.request.remoteUser != null}">
                    <li>
                        <a class="menu " pr="login" href="${ctx}/center/info">
                                <%--<img src="${authentication.photo}">--%>
                                ${authentication.nickname}
                        </a>
                        <div class="nav_down">
                            <a class="set_log" href="${ctx}/center/info">
                                <img src="${dll}/www/images/set.png">
                                <span>账号设置</span>
                            </a>
                            <a class="set_log" href="${ctx}/j_spring_security_logout">
                                <img src="${dll}/www/images/quit.png">
                                <span>退出登录</span>
                            </a>
                        </div>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</div>