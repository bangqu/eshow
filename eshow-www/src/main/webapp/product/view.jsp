<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<s:action name="product!view" id="view" executeResult="false"></s:action>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<head>
	<title>${view.product.name}</title>
	<meta name="keywords" content="${view.product.name}" />
	<meta name="description" content="${view.product.name}" />
 
</head>
<body>
	<header id="header">
		<div class="hero-unit showcase">
			<div class="container">
				<h1 class="yahei">商品</h1>
			</div>
		</div>
	</header>

<div class="container ">
	 		<ul class="breadcrumb">
  <li><a href="#">首页</a> <span class="divider">/</span></li>
  <li><a href="#">Product</a> <span class="divider">/</span></li>
  <li class="active">View</li>
</ul>
		<div class="proudctview ">
			<p>谢谢大家支持帮趣网，如果喜欢帮趣网的小物件，可以提出申请，我们将根据您对帮趣网的贡献程度，把下面的小物件送给你</p>
			<p>&nbsp;</p>
			<p>
				<img src="${view.product.img}"  width="590" height="393">
			</p>
			<p>&nbsp;</p>

			<p>&nbsp;</p>
			<p>&nbsp;</p>
		</div>
		</div>
</body>