<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>开发日志</title>
    <meta name="description" content="EShow开源框架开发日志"/>
    <meta name="keywords" content="EShow,EShow开源网站,开源框架,团队日志,技术日志,开发日志"/>
</head>
<body>
<!-- banner -->
<c:set var="current">blog</c:set>
<s:action name="blog!search" var="blogList" executeResult="false">
    <s:param name="query.enabled">true</s:param>
    <s:param name="query.categoryId">${param.categoryId}</s:param>
    <s:param name="query.website">eshow</s:param>
    <s:param name="query.order">addTime</s:param>
    <s:param name="query.desc">true</s:param>
</s:action>
<div class="doc_bannerbox eshow_top">
    <div class="doc_banner">
        <div class="doc_banner_cont">
            <p><span>开发日志</span></p>
            <form action="${ctx}/blog/" method="get">
                <input type="hidden" name="active" value="blog">
                <p class="doc_top_input">
                    <input type="text" name="query.title" value="${query.title}"/>
                    <img src="${dll}/www/images/doc_search.png">
                </p>
            </form>
        </div>
    </div>
</div>
<!-- content -->
<div class="doc_contentbox">
    <div class="doc_content">
        <div class="doc_cont_bd">
            <div class="doc_cont_left">
                <div class="doc_left_border">

                    <c:if test="${fn:length(blogList.blogs)>0}">
                        <s:iterator value="%{#blogList.blogs}" status="rowStatus" var="blog">
                            <ul class="doc_ul_first">
                                <li><a href="${ctx}/blog/view/${blog.id}">${blog.title}</a></li>
                                <li><span>${util:preview(blog.content,true,40)}...</span>
                                </li>
                                <li class="forum_icons">
                                    <img src="${blog.user.photo}">
                                    <p><em>${blog.user.username}</em>发布于 <a href="${ctx}/blog/?categoryId=${blog.category.id}">${blog.category.name}</a>
                                    </p>
                                    <span><fmt:formatDate value="${blog.addTime}" pattern="yyyy-MM-dd:HH:mm"/></span>
                                </li>
                            </ul>
                        </s:iterator>
                    </c:if>
                </div>
                <c:if test="${fn:length(blogList.blogs)>0}">
                    <c:set var="href">categoryId=${param.categoryId}&query.title=${query.title}&</c:set>
                    <%@include file="/common/page.jsp" %>
                </c:if>
                <c:if test="${fn:length(blogList.blogs)==0}">
                    <div class="empty_img">
                        <img src="${dll}/www/images/empty.png">
                        <p><span>对不起，没有搜索到开发日志...</span></p>
                    </div>
                </c:if>
            </div>
            <s:action name="category!list" var="categoryList" executeResult="false">
                <s:param name="query.enabled">true</s:param>
            </s:action>
            <div class="doc_cont_right">
                <ul class="doc_border">
                    <li class="doc_hd"><span>开发日志</span></li>
                    <s:iterator value="%{#categoryList.categories}" status="rowStatus" var="category">
                        <li class="doc_first_top "><a
                                <c:if test="${param.categoryId eq category.id}">class="active"</c:if> href="${ctx}/blog/?categoryId=${category.id}">${category.name}</a>
                        </li>
                    </s:iterator>
                </ul>
            </div>
        </div>
    </div>
</div>
<%@ include file="/common/scripts.jsp"%>
<script type="text/javascript">
    if(${current=='blog'}){
        $("[pr='blog']").addClass("nav_active");
    }
</script>
</body>
