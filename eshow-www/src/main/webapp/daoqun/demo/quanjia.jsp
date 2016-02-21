<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="../common/path.jsp"%>
<link rel="stylesheet" href="${daoqun}/styles/style.css"/>
<head>
<%@ include file="../common/yunshipei.jsp"%>
<title>全家房产案例_到群软件</title>
<meta name="keywords" content="全家房产案例，到群软件" />
<meta name="description" content="全家房产案例，到群软件" />
<style>
	.topimg{border-bottom:1px solid #ddd;text-align:center}
	.q_info{border-bottom:1px solid #ddd;padding:50px;}
	.q_info h3,.q_show h3{padding-bottom: 10px;font-size: 18px;}
	.q_info h4{font-size: 22px;font-weight:  normal;}
	.q_show{padding:30px 50px;}
	.q_show ul li img{width:220px;}
	.q_show ul li{width:220px;float: left;padding-right:20px;}
</style>
</head>
<body>
	<c:set var="current">demo</c:set>
	<%@ include file="../common/header.jsp"%>
	<div class="wapper clearfix phone">
		<div class="quanjia">
			<div class="topimg">
				<img src="${daoqun}/images/quanjia/index.jpg"/>
			</div>
			<div class="q_info yahei">
				<h3>我们提供的服务</h3>
				<h4>架构设计+后台管理系统开发+API接口系统+iPhone应用+Android应用</h4>
			</div>
			<div class="q_show yahei">
				<h3>手机app效果图</h3>
				<ul>
					<li><img src="${daoqun}/images/quanjia/p01.png"/></li>
					<li><img src="${daoqun}/images/quanjia/p02.png"/ ></li>
					<li><img src="${daoqun}/images/quanjia/p03.png"/></li>
					<li><img src="${daoqun}/images/quanjia/p04.png"/ ></li>
				</ul>
			</div>
		 </div>
	</div>
    <%@ include file="../common/footer.jsp"%>
</body>
