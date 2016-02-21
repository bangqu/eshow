<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="product!view" id="view" executeResult="false" />
<head>
<title>${view.product.name}</title>
</head>
<body>
	<div class="container mt">
		<div class="row-fluid">
			<s:include value="../left.jsp"></s:include>
			<div class="span10">
				<ul class="breadcrumb">
					<li><a href="${ctx}/admin/index">首页</a> <span class="divider">/</span>
					</li>
					<li><a href="${ctx}/product/index">产品管理</a> <span
						class="divider">/</span></li>
					<li class="active">查看产品</li>
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
					<div>
						<input type="hidden" name="id" value="${view.product.id}" />
						<div class="title">
							<span>${view.product.name}<br /> </span><span class="r"
								style=" color: #999; font-size: 12px;"><a
								href="<c:url value='/admin/product/edit/${view.product.id}'/>">修改</a>
							</span> <span style="font-weight: bold; color: #999; font-size: 12px;">&nbsp;&nbsp;${view.product.user.username}&nbsp;&nbsp;&nbsp;发布于${view.product.addTime}</span>
						</div>
						<br />
						<c:if test="${view.product.img != null}">
							<div align="center">
								<img src="${view.product.img}!middle.jpg" />
							</div>
						</c:if>
						<p>&nbsp;&nbsp;${view.product.content}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

