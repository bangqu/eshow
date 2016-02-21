<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="title">用户管理</c:set>
<c:set var="title1">用户列表</c:set>
<head>
	<title>用户列表</title>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/user.css'/>" type="text/css" />
</head>
<body>
	<div class="container mt">
		<div class="row-fluid">
			<s:include value="../left.jsp"></s:include>
			<div class="span10">
				<ul class="breadcrumb">
					<li><a href="${ctx}/admin/index">首页</a> <span class="divider">/</span>
					</li>
					<li><a href="${ctx}/admin/user/">${title}</a> <span class="divider">/</span></li>
					<li class="active">${title1}</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/user/add'/>" class="btn btn-primary">添加</a>
						</div>
						<h3 class="yahei">用户管理</h3>
					</div>
					<div class="navbar">
			          <div class="navbar-inner"> 
							<ul id="myTab" class="nav">
								<li class="active"><a href="<c:url value='/admin/user'/>">用户列表</a></li>
								<li><a href="<c:url value='/admin/user/edit'/>">修改资料</a></li>
								<li><a href="<c:url value='/admin/user/password'/>">修改密码</a></li>
								<li><a href="<c:url value='/admin/user/setphoto'/>">修改头像</a></li>
							</ul>
						</div>
					</div>
					<s:action name="user!search" id="userList" executeResult="false">
						<s:param name="query.pagesize">10</s:param>
					</s:action>
					<table class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th>用户ID</th>
								<th>用户名</th>
								<th>账户状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="%{#userList.users}" status="rowStatus">
								<tr id="market20">
									<td><span class="l" style="font-size: 14px;"><a
											href="<c:url value='/admin/user/view/${id}'/>" class="">${id}</a>
									</span></td>
									<td><span class="l" style="font-size: 14px;"><a
											href="<c:url value='/admin/user/view/${id}'/>" class="">${username}</a>
									</span></td>
									<td><span class="l" style="font-size: 14px;"><a  class=""><span  class="label label-success"><s:if test="%{enabled}">可用</s:if><s:else>不可用</s:else></span></a>
									</span></td>
									<td><a href="<c:url value='/admin/user/edit/${id}'/>">修改</a>
										<a href="${ctx }/user!delete.action?id=${id}"
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

