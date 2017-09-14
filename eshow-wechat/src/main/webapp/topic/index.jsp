<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>讨论区</title>
    <meta name="description" content="EShow开源网站讨论区"/>
    <meta name="keywords" content="EShow,EShow开源网站,开源框架,ssh,轻量级框架,讨论区"/>
</head>
<body>
<!-- banner -->
<c:set var="current">topic</c:set>
<div class="forum_bannerbox eshow_top">
    <div class="forum_banner">
        <form action="${ctx}/topic/" method="get">
            <div class="forum_title">
                <span>今天，有什么心得感悟分享给大家呢？</span>
                <c:if test="${pageContext.request.remoteUser != null}">
                    <a href="${ctx}/topic/add"><input class="forum_input_left" type="button" value="发布话题"/></a>
                </c:if>
                <c:if test="${pageContext.request.remoteUser == null}">
                    <a href="${ctx}/user/login"><input class="forum_input_left" type="button" value="发布话题"/></a>
                </c:if>
                <input type="hidden" name="active" value="topic">
                <p class="forum_input_right">
                    <input type="text" placeholder="搜索一下话题..." name="query.title" value="${query.title}">
                    <img src="${dll}/www/images/search.png">
                </p>
            </div>
        </form>
    </div>
</div>

<div class="forum_contentbox">
    <div class="forum_content">
        <div class="forum_hd">
            <ul>
                <li style="border-left: 1px solid #e1e5eb;"><a
                        <c:if test="${param.boardId eq ''}">class="active"</c:if>
                        href="${ctx}/topic/?boardId=">全部话题</a></li>
                <s:action name="board!list" var="boardList" executeResult="false">
                    <s:param name="query.enabled">true</s:param>
                </s:action>
                <s:iterator value="%{#boardList.boards}" status="rowStatus" var="board">
                    <li><a href="${ctx}/topic/?boardId=${board.id}"
                           <c:if test="${param.boardId eq board.id}">class="active"</c:if>>${board.name}</a></li>
                </s:iterator>
                <li class="forum_hd_right"><a href="home_forum_mytopic.html">我的话题</a></li>
            </ul>
        </div>
        <div class="forum_bdbox">
            <s:action name="topic!search" var="topicList" executeResult="false">
                <s:param name="query.enabled">true</s:param>
                <s:param name="query.boardId">${param.boardId}</s:param>
                <s:param name="query.order">addTime</s:param>
                <s:param name="query.desc">true</s:param>
            </s:action>
            <c:if test="${fn:length(topicList.topics)>0}">
                <s:iterator value="%{#topicList.topics}" status="rowStatus" var="topic">
                    <div class="forum_bd">
                        <ol>
                            <li>
                                <p>${topic.commentSize}</p>
                                <p>评论</p>
                            </li>
                            <li class="forum_recommed">
                                <p class="dell">${topic.recommendSize}</p>
                                <p>推荐</p>
                            </li>
                            <li>
                                <p>${topic.count}</p>
                                <p>阅读</p>
                            </li>
                        </ol>
                        <ul>
                            <li class="forum_icons">
                                <img src="${topic.user.photo}">
                                <span>${topic.user.username}</span>
                                <span><fmt:formatDate value="${topic.addTime}" pattern="yyyy-MM-dd HH:mm"/></span>
                                <span>发表了</span>
                            </li>
                            <li><a href="${ctx}/topic/view/${topic.id}">${topic.title}</a></li>
                        </ul>
                    </div>
                </s:iterator>
                <c:set var="href">boardId=${param.boardId}&query.title=${query.title}&</c:set>
                <%@include file="/common/page.jsp" %>
            </c:if>
            <c:if test="${fn:length(topicList.topics)==0}">
                <div class="empty_img">
                    <img src="${dll}/www/images/empty.png">
                    <p><span>对不起，没有搜索到话题...</span></p>
                </div>
            </c:if>
        </div>
    </div>
</div>
<%@ include file="/common/scripts.jsp"%>
<script type="text/javascript">
    if(${current=='topic'}){
        $("[pr='topic']").addClass("nav_active");
    }
</script>
</body>