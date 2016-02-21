<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<s:action name="productCategory!view" id="view" executeResult="false">
</s:action>
<head>
<title>${view.productCategory.name}_产品</title>
<link rel="stylesheet" href="<c:url value='/admin/styles/product.css'/>"
	type="text/css" />
</head>
<body>
	<div class="container mt">
		<div class="row-fluid">
			<s:include value="../left.jsp"></s:include>
			<div class="span10">
				<ul class="breadcrumb">
					<li><a href="${ctx}/admin/index">首页</a> <span class="divider">/</span>
					</li>
					<li><a href="${ctx}/admin/product/">产品管理</a> <span
						class="divider">/</span>
					</li>
					<li class="active">产品列表</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/product/add'/>"
								class="btn btn-primary">添加</a>
						</div>
						<h3 class="yahei">产品列表</h3>
					</div>
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a data-toggle="tab"
							href="<c:url value='/admin/product'/>"> 产品列表</a>
						</li>
						<li><a data-toggle="tab"
							href="<c:url value='/admin/productCategory'/>"> 产品分类</a>
						</li>
					</ul>
					<div id="celebrityList">
						<s:action name="product!search" id="productList"
							executeResult="false">
							<s:param name="query.productCategoryId">${param.id}</s:param>
							<s:param name="query.order">addTime</s:param>
							<s:param name="query.desc">true</s:param>
							<s:param name="query.enabled">true</s:param>
						</s:action>
						<ul>
							<s:iterator value="%{#productList.products}" status="rowStatus" var="product">
								<li class="productlist" id="product${id}">
									<div class="avatar">
										<c:if test="${product.img == null}">
											
										</c:if>
										<c:if test="${product.img != null}">
											<a href="${ctx}/product/view/${id}"><img src="${img}!small.jpg" width="80" height="80" /></a>
										</c:if>
									</div>
									<div class="list-content">
										<h4>${name}</h4>
										<div class="contxt">
											${util:preview(content,100)}
											<a href="${ctx}/admin/product/view/${id}">查看全文</a>
										</div>
										<div class="time">
											分类:
											<c:if test="${productCategory.name == null}">
											无&nbsp;&nbsp;|&nbsp;&nbsp;
											</c:if>
											<c:if test="${productCategory.name != null}">
											${productCategory.name}&nbsp;&nbsp;|&nbsp;&nbsp;
											</c:if>
											${user.nickname}&nbsp;&nbsp;发表于
											<s:date name='%{addTime}' format='yyyy-MM-dd HH:mm:ss' />
											<span class="del fr"> <i class="icon-pencil"></i> <a
												href="${ctx}/admin/product/edit/${id }">修改</a>
												&nbsp;&nbsp;|&nbsp;&nbsp;<i class="icon-trash"></i> <a
												href="${ctx}/product!delete.action?id=${id}"
												onclick="return deleteData('product',${id});">删除</a> </span>
										</div>
									</div>
								</li>
							</s:iterator>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

