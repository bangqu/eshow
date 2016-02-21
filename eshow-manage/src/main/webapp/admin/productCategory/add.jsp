<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="../common/website.jsp"%>
<head>
<title>添加产品分类</title>
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
					<li class="active">产品类型添加</li>
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
						<li><a data-toggle="tab" href="${ctx}/admin/product">
								产品列表</a>
						</li>
						<li class="active"><a data-toggle="tab"
							href="${ctx}/admin/productCategory"> 产品分类</a>
						</li>
					</ul>
					<s:form cssClass="form-horizontal" id="productCategoryForm" action="product-category!save" method="post">
						<input type="hidden" id="website" name="productCategory.website" value="${website}" />
						<div class="control-group">
							<label class="control-label" for="input01">分类名称</label>
							<div class="controls">
								<input type="text" class="input-xlarge"
									name="productCategory.name"></span><span class="t"><font
									color="red">*</font>必填</span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="textarea">产品描述</label>
							<div class="controls">
								<textarea class="input-xlarge" id="textarea" rows="3"
									name="productCategory.description"></textarea>
								<span class="t"><font color="red">*</font>必填</span>
							</div>
						</div>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">保存</button>
							<a class="btn" onclick="javascript:history.back();">取消</a>
						</div>
					</s:form>
				</div>
			</div>
		</div>
	</div>
</body>