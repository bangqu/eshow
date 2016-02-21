<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="../common/website.jsp"%>
<s:action name="product-category!view" id="view" executeResult="false"></s:action>
<head>
	<title>修改产品分类</title>
</head>
<body>
	<div class="container mt">
		<div class="row-fluid">
			<s:include value="../left.jsp"></s:include>
			<div class="span10">
				<ul class="breadcrumb">
					<li><a href="${ctx}/admin/index">首页</a> <span class="divider">/</span>
					</li>
					<li><a href="${ctx}/admin/productType/">产品类型管理</a> <span
						class="divider">/</span>
					</li>
					<li class="active">产品类型修改</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="${ctx}/admin/productCategory/add"
								class="btn btn-primary">添加</a>
						</div>
						<h3 class="yahei">产品类型添加</h3>
					</div>
					<ul id="myTab" class="nav nav-tabs">
						<li><a data-toggle="tab"
							href="<c:url value='/admin/product'/>"> 产品列表</a></li>
						<li class="active"><a data-toggle="tab"
							href="<c:url value='/admin/productCategory'/>"> 产品分类</a></li>
					</ul>
					<div id="securitiesTxt">
						<s:form cssClass="form-horizontal" id="productCategoryForm" action="product-category!update" method="post">
							<input type="hidden" name="id" value="${view.productCategory.id}" />
							<div class="control-group">
								<label class="control-label" for="input01">分类名称</label>
								<div class="controls">
									<input type="text" class="input-xlarge"
										name="productCategory.name" value="${view.productCategory.name}"><span class="t"><font
										color="red">*</font>必填</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="textarea">产品描述</label>
								<div class="controls">
									<textarea class="input-xlarge" id="textarea" rows="5" cols="60"
										name="productCategory.description">${view.productCategory.description}</textarea>
									<span class="t"><font color="red">*</font>必填</span>
								</div>
							</div>
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">修改</button>
								<button class="btn">取消</button>
							</div>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

