<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="album!view" id="view" executeResult="false" />
<head>
	<title>修改相册</title>
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
					<li><a href="${ctx}/admin/album/">相册</a> <span class="divider">/</span></li>
					<li class="active">修改相册</li>
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
							<li  class="active"><a data-toggle="tab" href="<c:url value='/admin/album'/>">相册列表</a></li>
						</ul>
						<form class="form-horizontal" id="albumForm" action="album!update" method="post"
							cssClass="creat_form clearfix">
							<s:hidden name="id" value="%{#view.album.id}"></s:hidden>
							<div class="control-group">
								<label class="control-label" for="input01">相册名称</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="title"
										name="album.name" value="${view.album.name}">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input01">相册描述</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="title"
										name="album.description" value="${view.album.description}">
								</div>
							</div>
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">修改</button>
								<button class="btn" onclick="javascript:history.back();">取消</button>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
</body>
