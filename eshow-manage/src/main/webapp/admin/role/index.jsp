<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title>角色管理</title>
	<link rel="stylesheet" href="<c:url value='/admin/styles/role.css'/>"
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
					<li><a href="${ctx}/admin/role/">角色管理</a> <span class="divider">/</span></li>
					<li class="active">角色列表</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/role/add'/>"
								class="btn btn-primary"> 添加</a>
						</div>
						<h3 class="yahei">角色列表</h3>
					</div>
					<ul id="myTab" class="nav nav-tabs">
						<li><a data-toggle="tab" href="<c:url value='/admin/system'/>"> 网络参数</a></li>
						<li class="active"><a data-toggle="tab" href="<c:url value='/admin/role/index'/>"> 角色管理</a></li>
					</ul>
					<s:action name="role!list" id="roleList" executeResult="false">
							</s:action>
					<table class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th>#</th>
								<th>角色代码</th>
								<th>角色描述</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="%{#roleList.roles}" status="rowStatus">
								<tr id="market20">
									<td><span class="l" style="font-size: 14px;"><a
											href="<c:url value='/admin/info/view/${id}'/>" class="">${id}</a>
									</span></td>
									<td><span class="l c999">${name}</span>
									</td>
									<td><span class="l c999">${description}</span>
									</td>
									<td><a href="<c:url value='/admin/role/edit/${id}'/>">修改</a>
										<a href="javascript:void(0);"
										onclick="deleteData('确定要删除该信息吗？','market',20);">删除</a>
									</td>
								</tr>
							</s:iterator>

						</tbody>
					</table>
					<%@ include file="/common/page.jsp"%>
				</div>
			</div>
		</div>
	</div>
</body>

