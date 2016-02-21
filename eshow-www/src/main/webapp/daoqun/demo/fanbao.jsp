<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="../common/path.jsp"%>
<link rel="stylesheet" href="${daoqun}/styles/style.css"/>
<head>
<%@ include file="../common/yunshipei.jsp"%>
<title>翻宝网案例_到群软件</title>
<meta name="keywords" content="翻宝网案例,到群软件,商户" />
<meta name="description" content="翻宝网案例,到群软件,商户" />
<style>
	.topimg{border-bottom:1px solid #ddd;text-align:center}
	.f_info{border-bottom:1px solid #ddd;padding:50px 30px;}
	.f_info h3,.f_show h3{padding-bottom: 10px;font-size: 20px;}
	.f_info h4{font-size: 22px;font-weight:  normal;}
	.f_show{padding:30px 30px;}
	.f_show p,.f_info p{font-size: 14px;line-height: 24px;margin-bottom: 5px;}
	.f_show .p1{padding-top:10px;}
	.f_show .p1 li{width:160px;height:160px;float: left;margin-right:10px;}
	.f_show .p1 li img{width:160px;height:160px;}
	.f_show .p2{margin-top:40px;}
	.f_show .p2 li{width:510px;float:left;}
</style>
</head>
<body>
	<c:set var="current">demo</c:set>
	<%@ include file="../common/header.jsp"%>
	<div class="wapper clearfix phone">
		<div class="fanbao">
			<div class="topimg">
				<img src="${daoqun}/images/fanbao/index.jpg"/>
			</div>
			
			<div class="f_show yahei">
				<h3> 商户提供的奖品</h3>
				<ul class="p1 clearfix">
					<li><img src="${daoqun}/images/fanbao/p1.gif"/></li>
					<li><img src="${daoqun}/images/fanbao/p2.jpg"/ ></li>
					<li><img src="${daoqun}/images/fanbao/p3.jpg"/></li>
					<li><img src="${daoqun}/images/fanbao/p4.jpg"/ ></li>
					<li><img src="${daoqun}/images/fanbao/p5.gif"/ ></li>
					<li><img src="${daoqun}/images/fanbao/p6.gif"/ ></li>
				</ul>
				<ul class="p2 clearfix">
					<li><img src="${daoqun}/images/fanbao/banner1.jpg" width="500"/></li>
					<li><a href="${daoqun}/images/fanbao/info.swf"><img src="${daoqun}/images/fanbao/banner2.jpg" width="500"/></a></li> 
				</ul>
			</div>
		 </div>
	</div>
    <%@ include file="../common/footer.jsp"%>
</body>
