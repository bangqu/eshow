<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="album!view" id="view" executeResult="false">
</s:action>
<head>
<title>${view.album.name}相册</title>
<link rel="stylesheet" href="<c:url value='/admin/styles/album.css'/>"
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
					<li><a href="${ctx}/admin/album/">相册中心</a> <span
						class="divider">/</span>
					</li>
					<li class="active">查看相册</li>
				</ul>

				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/album/add'/>"
								class="btn btn-primary"> 添加</a>
						</div>
						<h3 class="yahei">${view.album.name}相册</h3>
					</div>
					<ul id="myTab" class="nav nav-tabs">
						<li><a data-toggle="tab" href="<c:url value='/admin/album'/>">相册列表</a>
						</li>
						<li class="active"><a data-toggle="tab"
							href="<c:url value='/admin/album/view'/>">查看相册</a>
						</li>
						<li><a data-toggle="tab"
							href="<c:url value='/admin/album/edit'/>">修改相册</a>
						</li>
					</ul>
				</div>
				<div id="celebrity">
					<div class="subnav">
						<strong>${view.album.name}相册</strong>
					</div>
					<s:action name="photo!search" id="photoList" executeResult="false">
						<s:param name="query.albumId">${view.album.id}</s:param>
						<s:param name="query.order">addTime</s:param>
						<s:param name="query.desc">true</s:param>
						<s:param name="pagesize">12</s:param>
					</s:action>

					<ul>
						<s:iterator value="%{#photoList.photos}" status="rowStatus">
							<li style="background-color: #f9f9f9" id="photo${id}"
								onmouseover="this.style.backgroundColor='#f9e0e0';"
								onmouseout="this.style.backgroundColor='#f9f9f9';">
								<div>
									<a href="<c:url value='/admin/photo/view/${id}'/>"><img
										width="135"
										src="${pageContext.request.contextPath}/upload/photo/<s:date name='%{addTime}' format='yyyyMMdd' />/${img}"
										alt="${name}" /> </a>
								</div>
								<div class="cont" style="color: #999" align="center">
									${name} <br /> 上传于：
									<s:date name='%{addTime}' format='yyyy-MM-dd' />
									<br /> <a href="<c:url value='/admin/photo/view/${id}'/>">评论(${commentSize})</a>|
									<a href="<c:url value='/admin/photo/edit/${id}'/>">修改</a>| <a
										href="${ctx }/photo!delete.action?id=${id}"
										onclick="return deleteData('photo',${id});">删除</a>
								</div>
								<div class="c"></div></li>
						</s:iterator>
					</ul>
					<div class="c"></div>
					<%@ include file="/common/page.jsp"%>
					<div class="c"></div>
				</div>
			</div>
		</div>
	</div>
</body>

