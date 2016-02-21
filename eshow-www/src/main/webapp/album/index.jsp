<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
<title>相册</title>
<meta name="description" content="相册" />
<meta name="keywords" content="相册" />
</head>
<body>
	 

		<header id="header">
		<div class="hero-unit showcase">
			<div class="container">
				<h1 class="yahei">相册</h1>
			</div>
		</div>
	</header>

	 <div class="container">

		<div class="row">
	 
	 

<div class="span8">   
			<s:action name="album!search" id="albumList" executeResult="false">
				<s:param name="queryBean.desc">true</s:param>
				<s:param name="pagesize">9</s:param>
			</s:action>
			<ul class="newsimg">
				<s:iterator value="%{#albumList.albums}" status="rowStatus">
					<li><a href="view/${id}">
					 <img rc="${pageContext.request.contextPath}/upload/photo/<s:date name='%{addTime}' format='yyyyMMdd' />/${photo}" />
							<span>${name}
							</span>
							</a></li>
				</s:iterator>
			</ul>
		
	</div>


		<div class="span4" >
			<div class="sdbox">
				<h3 class="yahei">快速导航</h3>
				<ul class="cate">
					<li class="page_item  " ><a href="newPhoto.html" >最新相册</a></li>
					<li class="page_item  " ><a href="hotPhoto.html" >热门相册</a></li>
				</ul>
			</div>

		</div>
	</div>
	</div>
</body>
