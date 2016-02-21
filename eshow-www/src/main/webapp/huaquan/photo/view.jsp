<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="photo!view" id="view" executeResult="false" />
<head>
	<title>${view.photo.name }</title>
	<meta name="keywords" content=${view.photo.name } />
</head>
<body>
	<div id="content">

		<div id="contact_banner">
		</div>
		<div id="postpath">
			<strong>当前页面：<a href="<c:url value='/'/>" title="首页">首页</a>
				&raquo; <a href="<c:url value='/album'/>" title="公司相册">公司相册</a>
				&raquo; <a
				href="<c:url value='/album/view/${view.photo.album.id}'/>"
				title="${view.photo.album.name}">${view.photo.album.name}</a>
				&raquo; ${view.photo.name}</strong>
			<c:if test="${pageContext.request.remoteUser != null}">
				<a href="<c:url value='/admin/photo/edit/${view.photo.id}'/>">修改</a>
			</c:if>
		</div>

		<div id="post-80" class="page">
			<div class="entry-content">
				<img
					src="${pageContext.request.contextPath}/upload/photo/<s:date name='%{#view.photo.addTime}' format='yyyyMMdd' />/view/${view.photo.img}"
					alt="${name}" />
				<br />
				描述：${view.photo.description}
			</div>

		</div>
		<!-- .post -->

	</div>
	<!-- #content -->

	<div id="sidebar">

		<div class="sidebar_li">
			<ul>
				<s:action name="album!list" id="albumList" executeResult="false">
				</s:action>
				<s:iterator value="%{#albumList.albums}" status="rowStatus">
					<li class="page_item">
						<a href="<c:url value='/album/view/${id}'/>" title="${name}">${name}</a>
					</li>
				</s:iterator>
			</ul>
		</div>
	</div>
	<!-- #sidebar -->
</body>
