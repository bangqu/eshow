<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%-- Put constants into request scope --%>
<appfuse:constants scope="request"/>
<!-- 头部 -->

<div class="home_header">
        <div class="home_text fl">
            <a href="${ctx}/">EShow后台管理EShow</a>
        </div>

        <div class="home_nav">
            <a href="${ctx}/" class="active">首页概况</a>
            <a href="${ctx}/financial/" >财务系统</a>
            <a href="${ctx}/shoporder/">订单中心</a>
            <a href="${ctx}/provider/">供应商</a>
        </div>

    <c:if test="${pageContext.request.remoteUser!= null}">
        <div class="user-info">
    <div class="dropdown profile-element">
        <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="${authentication.photo}!icon.jpg" >
                             </span>
            <a data-toggle="dropdown" class="dropdown-toggle" href="#" aria-expanded="false">
                            <span class="clear">  <span class="text-muted text-xs block">${authentication.nickname} <b class="caret"></b></span> </span> </a>
            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                <li><a href="${ctx}/user/view">个人资料</a></li>
                <li><a href="${ctx}/user/password">修改密码</a></li>
                <li class="divider"></li>
                <li><a href="${ctx}/user/logout">退出</a></li>
            </ul>
        </div>
    </div>
        </div>
    </c:if>
</div>