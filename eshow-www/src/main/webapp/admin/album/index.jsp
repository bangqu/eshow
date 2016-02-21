<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<head>
	<title>相册</title>
	<link rel="stylesheet" href="<c:url value='/admin/styles/album.css'/>"
		type="text/css" />
</head>
<body>
	<div class="container mt">
		<div class="row-fluid">
            <c:set var="current">album</c:set>
            <%@ include file="../left.jsp"%>
			<div class="span10">
				<ul class="breadcrumb">
					<li><a href="${ctx}/admin/index">首页</a> <span class="divider">/</span>
					</li>
					<li><a href="${ctx}/admin/album/">相册</a> <span class="divider">/</span></li>
					<li class="active">相册列表</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/album/add'/>"
								class="btn btn-primary"> 添加</a>
						</div>
						<h3 class="yahei">相册列表</h3>
					</div>
						<ul id="myTab" class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="<c:url value='/admin/album'/>">相册列表</a></li>
						</ul>


					<s:action name="album!search" id="albumList" executeResult="false">
						<s:param name="query.order">addTime</s:param>
						<s:param name="query.desc">true</s:param>
						<s:param name="query.pagesize">12</s:param>
					</s:action>
					<table class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th>#</th>
								<th>名称</th>
								<th>描述</th>
								<th>创建于</th>
								<th>数量(张)</th>
								<th>图片</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<s:action name="album!search" id="albumList"
								executeResult="false">
								<s:param name="query.order">addTime</s:param>
								<s:param name="query.desc">true</s:param>
								<s:param name="pagesize">12</s:param>
							</s:action>
							<s:iterator value="%{#albumList.albums}" status="rowStatus">
							
							<tr id="market20">
								<td>${id}</td>
								<td>${name }</td>
								<td>${description }</td>
								<td><s:date name='%{addTime}' format='yyyy-MM-dd' /></td>
								<td>${photoSize}</td>
								<td><a href="<c:url value='/admin/album/view/${id}'/>"><img
										width="120"
										src="${pageContext.request.contextPath}/upload/photo/${photo}"
										alt="${name}" /> </a>
								</td>
								<td><a href="<c:url value='/admin/album/edit/${id}'/>">修改</a> <a href="${ctx}/album!delete.action?id=${id}"
									onclick="deleteData('确定要删除该信息吗？','market',20);">删除</a>
								</td>
							</tr></s:iterator>
						</tbody>
					</table>
					<%@ include file="/common/page.jsp"%>


					<div id="celebrity">
						<s:action name="album!search" id="albumList" executeResult="false">
							<s:param name="query.order">addTime</s:param>
							<s:param name="query.desc">true</s:param>
							<s:param name="pagesize">12</s:param>
						</s:action>
						<ul>
							<s:iterator value="%{#albumList.albums}" status="rowStatus">
								<li id="album${id}" style="background-color: #f9f9f9"
									onmouseover="this.style.backgroundColor='#f9e0e0';"
									onmouseout="this.style.backgroundColor='#f9f9f9';">
									<div align="center">
										<a href="<c:url value='/admin/album/view/${id}'/>"><img
												width="120"
												src="${pageContext.request.contextPath}/upload/photo/${photo}"
												alt="${name}" /> </a>
									</div>
									<div class="cont" style="color: #999" align="center">
										${name}
										<br />
										创建于：
										<s:date name='%{addTime}' format='yyyy-MM-dd' />
										<br />
										<a>(${photoSize}张)</a>
										<c:if test="true">
											&nbsp;|&nbsp;<a href="<c:url value='/admin/album/edit/${id}'/>">修改</a>&nbsp;|&nbsp;
										<a href="${ctx}/album!delete.action?id=${id}"
												onclick="return deleteData('album',${id});">删除</a>
										</c:if>
									</div>
									<div class="c"></div>
								</li>
							</s:iterator>
						</ul>
						<%@ include file="/common/page.jsp"%>
					</div>
					</div>
					
					</div>
				</div>

			</div>
</body>

