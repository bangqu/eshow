<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="../common/path.jsp"%>
<head>
<%@ include file="../common/yunshipei.jsp"%>
<title>街区淘_到群软件</title>
<meta name="keywords" content="街区淘,到群软件" />
<meta name="description" content="街区淘案例,到群软件" />
<style>
	 .banner img{width:100%}
</style>
    <link rel="stylesheet" href="${daoqun}/styles/style.css"/>
</head>
<body>
	<c:set var="current">demo</c:set>
	<%@ include file="../common/header.jsp"%>
	<div class="wapper clearfix phone">
		 <div class="banner">
			<img src="../images/jiequtao/01.jpg">
			<img src="../images/jiequtao/02.jpg"> 
		 </div>
	</div>
    <%@ include file="../common/footer.jsp"%>
</body>
