<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util" %>
<s:action name="blog!view" id="view" executeResult="false"></s:action>
<head>
    <title>${view.blog.title}</title>
    <meta name="keywords" content="${view.blog.title}"/>
    <meta name="description" content="${view.blog.title}"/>
    <link rel="stylesheet" href="<c:url value='/static/styles/style.css'/>"/>
</head>
<body>
<header id="header">
    <div class="hero-unit showcase">
        <div class="container">
            <h1 class="yahei">EShow平台友好开发计划</h1>
        </div>
    </div>
</header>


<div class="container">
    <div class="row">

        <div class="span8">

            <div class="post">
                <h3 class="yahei">
                    <a href="/blog/view/1">${view.blog.title}</a>
                </h3>
                <ul class="post-meta clearfix">
                    <li><i class="icon-calendar"></i> <a href=""><s:date
                            name='%{#view.blog.addTime}' format='yyyy-MM-dd'/></a></li>
                    <li><i class="icon-user"></i> <a href="">${view.blog.user.username}</a>
                    </li>
                    <li><i class="icon-folder-close"></i> <a href="">${view.blog.category.name}</a>
                    </li>
                </ul>
                <div class="text">
                    ${view.blog.content} &nbsp;&nbsp;&nbsp;&nbsp;
                    <small style="color: #"><font color="#23a726"> <a href="" class="lnk1">阅读更多</a>
                    </font></small>
                    <br>
                </div>
                <div class="title">
                    <small style="color: #23a726"> by 分类:${view.blog.category.name} </small>
                </div>
                <p>
                    <a href="<c:url value='/blog'/>" class="lnk1">&laquo;返回上一层</a>
                </p>
            </div>

            <s:action name="blog-comment!search" id="blogCommentList" executeResult="false" namespace="">
                <s:param name="query.blogId">${view.blog.id}</s:param>
                <s:param name="query.desc">true</s:param>
                <s:param name="query.order">addTime</s:param>
            </s:action>
            <s:iterator value="%{#blogCommentList.blogComments}"
                        status="rowStatus">
                <div class="commenta" id="blogComment${id}">
                    <div class="commenta_avatar">
                        <a href="<c:url value='/user/view?id=${user.id}'/>"> <c:if
                                test="${user.photo==null}">
                            <img
                                    src="${pageContext.request.contextPath}/images/base/user50-50.jpg"
                                    alt="${user.nickname}"/>
                        </c:if> <c:if test="${user.photo!=null}">
                            <img
                                    src="${pageContext.request.contextPath}/upload/user/<s:date name='%{#view.blog.user.addTime}' format='yyyyMMdd' />/${view.blog.user.photo}"
                                    alt="${user.nickname}" width="50" height="50"/>
                        </c:if> </a>
                    </div>
                    <div class="commenta_cont">
                        <div class="commenta_info">
								<span class="l">${name}&nbsp;&nbsp;${user.username}于 <s:date
                                        name='%{addTime}' format='yyyy-MM-dd HH:mm:ss'/> </span>
                            <c:if test="${user.id==myid}">
									<span class="r" style="margin-right: -100px;"> <a
                                            href="javascript:void(0);"
                                            onclick="return deleteData('blogComment',${id});" class="lnk2">删除</a>
									</span>
                            </c:if>
                        </div>
                        <div class="commenta_contxt">${content}</div>
                    </div>
                </div>
            </s:iterator>
            <div class="comment_textarea" id="replay" style="margin-top: 10px;">
                <s:form action="blog-comment!save.action" cssClass="" id="blogCommentForm"
                        method="post" namespace="">
                    <input name="blogId" type="hidden" value="${view.blog.id}"/>
                    <label>标题</label>
                    <input name="blogComment.name" class="inputtext"
                           maxlength="100" type="text"
                           onblur="this.className='inputtext'"
                           value="回复:${view.blog.title}"/>

                    <textarea class="inputtext text-input validate['required']"
                              class="textarea" name="blogComment.content" id="inputBox"></textarea>
                    <input type="submit" class="btn btn-info" value="发表" >
                </s:form>
            </div>
        </div>

        <div class="span4">
            <div class="sdbox">
                <h3 class="yahei">全部日志</h3>
                <ul class="cate">
                    <s:action name="category!list" id="categoryList"
                              executeResult="false">
                    </s:action>
                    <s:iterator value="%{#categoryList.categories}" status="rowStatus">
                        <c:if test="${id == param.id}">
                            <li class="page_item page-item-654 active ">
                                <a href="<c:url value='/blog/category/${id}'/>"
                                   class="lnk1 page_item page-item-654  ">${name} </a>
                            </li>
                        </c:if>
                        <c:if test="${id != param.id}">
                            <li class="page_item page-item-654 ">
                                <a href="<c:url value='/blog/category/${id}'/>" class="lnk1 ">${name}</a>
                            </li>
                        </c:if>
                    </s:iterator>
                </ul>
            </div>
        </div>
    </div>
</div>


</body>
