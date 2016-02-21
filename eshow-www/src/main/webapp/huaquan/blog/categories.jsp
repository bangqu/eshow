<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="../common/taglibs.jsp" %>
<%@ include file="../common/path.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<s:action name="category!view" id="view" executeResult="false" />
	<head>
		<title>${view.category.name}_新闻中心</title>
		<meta name="keywords" content="${view.category.name}_新闻中心" />
		<meta name="description" content="${view.category.name}_新闻中心" />
        <link rel="stylesheet" href="../static/styles/index.css"type="text/css"/>
        <link rel="stylesheet" href="../static/styles/style.css" type="text/css" />
	</head>
	<body>
    <%@ include file="../header.jsp" %>
    <div id="main">
		<div id="content">
			<div id="products_banner"></div>
			<div id="postpath">
				<strong>当前页面：<a href="<c:url value='${huaquan}/'/>" title="首页">首页</a>
					&raquo; <a href="<c:url value='${huaquan}/blog'/>" title="首页">新闻中心</a>&raquo;
					${view.category.name}</strong>
			</div>
			<div class="bd">
				<ul>
					<s:action name="blog!search" id="blogList" executeResult="false">
						<s:param name="queryBean.categoryId">${view.category.id}</s:param>
                        <s:param name="query.website">huaquan</s:param>
						<s:param name="queryBean.order">addTime</s:param>
						<s:param name="queryBean.desc">true</s:param>
						<s:param name="pagesize">10</s:param>
					</s:action>
					<s:iterator value="%{#blogList.blogs}" status="rowStatus">
						<li>
							<span class="time"><s:date name='%{addTime}'
									format='yyyy-MM-dd' /> </span><a
								href="<c:url value='${huaquan}/blog/view/${id}'/>" rel="bookmark">
								${title}</a>
						</li>
					</s:iterator>
				</ul>
			</div>
			<div id="navigation">
			</div>
		</div>
        <div id="sidebar">

            <div class="sidebar_li">
                <ul>
                    <li class="page_item">
                        <a href="${huaquan}/blog/categories/8" title="公司新闻">公司新闻</a>
                    </li>
                    <li class="page_item">
                        <a href="${huaquan}/blog/categories/9" title="行业新闻">行业新闻</a>
                    </li>
                    <li class="page_item">
                        <a href="${huaquan}/info/prize/" title="报价中心">报价中心</a>
                    </li>
                </ul>

            </div>
        </div>
        <%@ include file="../footer.jsp" %>
    </div>
    </body>
</html>