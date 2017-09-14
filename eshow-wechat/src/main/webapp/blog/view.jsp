<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<s:action name="blog!view" var="view" executeResult="false">
    <s:param name="id">${param.id}</s:param>
</s:action>
<head>
    <title>${view.blog.title}</title>
    <meta name="description" content="${view.blog.title}"/>
    <meta name="keywords" content="开发日志详情"/>
</head>
<body>
<!-- banner -->
<c:set var="current">blog</c:set>
<div class="doc_bannerbox eshow_top">
    <div class="doc_banner">
        <div class="doc_banner_cont">
            <p><span>开发日志</span></p>
            <p class="doc_top_input">
            <form action="${ctx}/blog/" method="get">
                <input type="hidden" name="active" value="blog">
                <p class="doc_top_input">
                    <input type="text" name="query.title" value="${query.title}"/>
                    <img src="${dll}/www/images/doc_search.png">
                </p>
            </form>
            </p>
        </div>
    </div>
</div>
<!-- content -->
<div class="doc_contentbox">
    <div class="doc_content">
        <div class="doc_cont_bd">
            <div class="doc_cont_left">
                <div class="doc_left_border">
                    <ul>
                        <li><a class="doc_li_title" href="">${view.blog.title}</a></li>
                        <li class="forum_icons">
                            <img src="${view.blog.user.photo}">
                            <p><em>${view.blog.user.username}</em>发布于 <a>${view.blog.category.name}</a></p>
                            <span><fmt:formatDate value="${view.blog.addTime}" pattern="yyyy-MM-dd:HH:mm"/></span>
                        </li>
                    </ul>
                    <div class="doc_describe">
                        <div class="doc_des_txt">
                            <span>${view.blog.content}</span>
                        </div>
                        <c:if test="${pageContext.request.remoteUser == null}">
                            <div class="doc_des_txt">
                                <div class="doc_des_hd">
                                    <strong>发表评论</strong>
                                </div>
                                <div class="doc_comment">
                                    <div class="doc_log"/>
                                    请先
                                    <a href="${ctx}/user/login">登录</a>后评论
                                </div>
                            </div>
                    </div>
                    </c:if>
                    <c:if test="${pageContext.request.remoteUser != null}">
                        <s:form id="blog_form" action="blog-comment!save.action" method="post" namespace="">
                            <input type="hidden" name="blogId" value="${param.id}">
                            <input type="hidden" name="redirect" value="blog/view/${param.id}">
                            <div class="doc_des_txt">
                                <div class="doc_des_hd">
                                    <strong>发表评论</strong>
                                </div>
                                <div class="doc_comment">
                                <textarea class="doc_log doc_textarea validate[required]" placeholder="评论内容..."
                                          name="blogComment.content"></textarea>
                                </div>
                                <div class="doc_des_btn doc_des_btn1">
                                    <input type="submit" value="发表评论"/>
                                </div>
                            </div>
                        </s:form>
                    </c:if>
                    <s:action name="blog-comment!search" var="blogCommentList" executeResult="false">
                        <s:param name="query.blogId">${param.id}</s:param>
                        <s:param name="query.order">addTime</s:param>
                        <s:param name="query.desc">true</s:param>
                    </s:action>
                    <c:if test="${fn:length(blogCommentList.blogComments)>0}">
                        <div class="doc_des_txt">
                            <div class="doc_des_hd">
                                <strong>所有评论</strong>
                            </div>
                            <div class="des_talks">
                                <s:iterator value="%{#blogCommentList.blogComments}" status="rowStatus"
                                            var="blogComment">
                                    <div class="doc_des_talk">
                                        <div class="doc_des_info">
                                            <div class="doc_info_left">
                                                <img src="${blogComment.user.photo}">
                                                <span class="info_tip">${blogComment.user.username}于</span>
                                            <span><fmt:formatDate value="${blogComment.addTime}"
                                                                  pattern="yyyy-MM-dd:HH"/></span>
                                            </div>
                                        </div>
                                        <div class="doc_info_cont">
                                            <span>${blogComment.content}</span>
                                        </div>
                                    </div>
                                </s:iterator>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <s:action name="category!list" var="categoryList" executeResult="false">
            <s:param name="query.enabled">true</s:param>
        </s:action>
        <div class="doc_cont_right">
            <ul class="doc_border">
                <li class="doc_hd"><span>开发日志</span></li>
                <s:iterator value="%{#categoryList.categories}" status="rowStatus" var="category">
                    <li <c:if test="${param.categoryId eq category.id}">class="doc_first_top"</c:if>><a
                            <c:if test="${param.categoryId eq category.id}">class="active"</c:if>
                            href="${ctx}/blog/?categoryId=${category.id}">${category.name}</a></li>
                </s:iterator>
            </ul>
        </div>
    </div>
</div>
</div>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.js"></script>
<script type="text/javascript" src="${dll}/validate/jquery.validationEngine.min.js"></script>
<script type="text/javascript" src="${dll}/validate/jquery.validationEngine-zh_CN.js"></script>

<script>
    $('#blog_form').validationEngine();

    if(${current=='blog'}){
        $("[pr='blog']").addClass("nav_active");
    }
</script>
</body>
