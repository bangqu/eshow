<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="../common/path.jsp"%>
<head>
<%@ include file="../common/yunshipei.jsp"%>
<title>OpenApi_到群软件</title>
<meta name="keywords" content="OpenApi,到群软件,移动互联网时代" />
<meta name="description" content="OpenApi,到群软件,移动互联网时代" />
    <link rel="stylesheet" href="${daoqun}/styles/style.css"/>
<style>
	 .banner img{width:100%;margin:20px 0;}
</style>
</head>
<body>
	<c:set var="current">demo</c:set>
	<%@ include file="../common/header.jsp"%>
	<div class="wapper clearfix phone">
		 <div class="banner">
			<img src="../images/api/1.jpg"> 
		 </div>
		 <p class="yahei">移动互联网时代，每个应用都需要后台API支撑，通过API，后台与APP开发者进行很好的沟通，还再用Word文档写API吗，OUT了！</p>
	</div>
    <%@ include file="../common/footer.jsp"%>
</body>
