<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<page:applyDecorator name="default">
	<head>
		<title><fmt:message key="404.title" /></title>
		<meta name="heading" content="<fmt:message key='404.title'/>" />
	</head>
	<body id="404" />
		<div id="middle">
			<div id="main">
				<div id="layoutmid">
					<p>
						<fmt:message key="404.message">
							<fmt:param>
								<c:url value="/index" />
							</fmt:param>
						</fmt:message>
						<%@ include file="/common/messages.jsp"%>
					</p>
					<p style="text-align: center; margin-top: 20px">
						<a href="<c:url value="/search!search.html?q=美女" />" title="搜索美女">
							<img src="<c:url value="/images/404.jpg"/>"
								alt="更多美女，嘿嘿，就去找美女群组哈" /> </a>
					</p>
				</div>
			</div>
		</div>
</page:applyDecorator>