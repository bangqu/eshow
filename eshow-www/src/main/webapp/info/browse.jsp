<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="info!browse" id="view" executeResult="false">
	<s:param name="query.url">${param.url}</s:param>
	<s:param name="query.website">eshow</s:param>
</s:action>
<head>
<title>${view.info.title}</title>
</head>
<body>
	<header id="header">
		<div class="hero-unit showcase">
			<div class="container">
				<h1 class="yahei">${view.info.title}</h1>
			</div>
		</div>
	</header>
	<div class="container">
		<div class="row">
			<div class="span12">${view.info.content}</div>
		</div>
	</div>
</body>
