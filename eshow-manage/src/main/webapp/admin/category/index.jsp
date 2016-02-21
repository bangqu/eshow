<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<head>
	<title>日志分类</title>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/category.css'/>" type="text/css" />
</head>
<body>
	<div class="container mt">
		<div class="row-fluid">
			<s:include value="../left.jsp"></s:include>
			<div class="span10">
				<ul class="breadcrumb">
					<li><a href="${ctx}/admin/index">首页</a> <span class="divider">/</span>
					</li>
					<li class="active" href="${ctx }/admin/category/">分类管理 <span class="divider">/</span></li>
					
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/category/add'/>" class="btn btn-primary">发布</a>
						</div>
						<h3 class="yahei">分类</h3>
					</div>
					<div id="categoryGroup">
						<s:action name="category!list" id="categoryList"
							executeResult="false">
						</s:action>
						<ul>
							<li style="color: #666; line-height: 14px; background: #f1f1f1;">
								<span class="l">分类名称</span><span class="l">备注</span>
							</li>
							<s:iterator value="%{#categoryList.categories}"	status="rowStatus">
								<li id="category${id}">
									<span class="l" style="font-size: 14px;"><a href="<c:url value="/admin/blog/c/${id}"/>">${name}</a></span><span
										class="l c999">${remark}</span><span
										class="r setting"><a
										href="<c:url value='/admin/category/edit/${id}'/>">修改</a> </span>
									<span class="r del"> <a href="javascript:void(0);"
										onclick="return deleteData('category',${id});">删除</a> </span>
								</li>
							</s:iterator>
						</ul>
					</div>
					</div>
				</div>

			</div>
		</div>
</body>

