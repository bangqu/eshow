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

        <div class="fr home_avatar">
            <c:if test="${pageContext.request.remoteUser!= null}">
            <div class="home_avatar_up">
             <img class="home_avatar" src="${authentication.photo}!icon.jpg" />
                <span>${authentication.nickname}</span>
            </div>
                    <i class="iconfont icon-xialajiantou"></i>
                <div class="home_avatar_down">
                    <a class="user_sel" href="${ctx}/user/view">
                        <i class="iconfont icon-wode"></i>
                        <span>个人中心</span>
                    </a>
                    <a class="user_sel" href="${ctx}/user/password">
                        <i class="iconfont icon-fankui"></i>
                        <span>修改密码</span>
                    </a>
                    <a class="user_sel" href="${ctx}/user/logout">
                        <i class="iconfont icon-tuichu"></i>
                        <span class="user_exit">退出登录</span>
                    </a>
                </div>
            </c:if>
        </div>
</div>