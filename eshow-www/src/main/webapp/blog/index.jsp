<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<s:action name="category!view" id="categoryList" executeResult="false" />
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<head>
<title>开发日志</title>
<meta name="keywords" content="开发日志" />
<meta name="description" content="开发日志" />

</head>
<body>
	<header id="header">
		<div class="hero-unit showcase">
			<div class="container">
				<h1 class="yahei">开发日志</h1>
			</div>
		</div>
	</header>
	<div class="container">
		<div class="row">
			<div class="span8">
				<div class="post">
					<s:action name="blog!search" id="blogList" executeResult="false">
						<s:param name="queryBean.categoryId">${param.id}</s:param>
						<s:param name="queryBean.order">addTime</s:param>
						<s:param name="queryBean.desc">true</s:param>
						<s:param name="pagesize">5</s:param>
					</s:action>
					<s:iterator value="%{#blogList.blogs}" status="rowStatus">
						<div class="post">
							<h3 class="yahei">
								<a href="<c:url value='/blog/view/${id}'/>">${title}</a>
							</h3>
							<ul class="post-meta clearfix">
								<li><i class="icon-calendar"></i> <a href=""><s:date
											name='%{addTime}' format='yyyy-MM-dd' />
								</a></li>
								<li><i class="icon-user"></i> <a href="">${user.username}</a>
								</li>
								<li><i class="icon-folder-close"></i> <a href="">${category.name}</a>
								</li>
							</ul>
							<div class="text">
								${util:preview(content,300)}&nbsp;&nbsp;&nbsp;&nbsp; <small
									style="color: #ffe69f"> <font color="#23a726"> <a
										href="<c:url value='/blog/view/${id}'/>" class="lnk1">阅读更多</a>
								</font> </small> <br />
							</div>
						</div>
					</s:iterator>
				</div>
				<%@ include file="/common/page.jsp"%>
			</div>
			<div class="span4">
				<div class="sdbox">
				<h3 class="yahei">全部日志</h3>
				<ul class="cate">
					<s:action name="category!list" id="categoryList"
						executeResult="false">
					</s:action>
					<s:iterator value="%{#categoryList.categories}" status="rowStatus">
						<li class="page_item page-item-654"><c:if
								test="${categoryList.category.id == id}">
								<a href="<c:url value='/blog/category/${id}'/>" class="lnk1"><font color="#23a726;">${name}</font> </a>
							</c:if> <c:if test="${categoryList.category.id != id}">
								<a href="<c:url value='/blog/category/${id}'/>" class="lnk1">${name}</a>
							</c:if></li>
					</s:iterator>
				</ul>
				</div>


			</div>
		</div>
	</div>

</body>
