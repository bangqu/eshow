<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title>创建相册</title>
	<link rel="stylesheet" href="<c:url value='/admin/styles/album.css'/>"
		type="text/css" />
	<link media="screen" type="text/css"
		href="<c:url value='/scripts/validate/theme/grey/formcheck.css'/>"
		rel="stylesheet" />
	<script type="text/javascript"
		src="<c:url value='/scripts/validate/lang/zh-CN.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/scripts/validate/formcheck.js'/>"></script>
	<script type="text/javascript">
		window.addEvent('domready', function() {
			new FormCheck('albumForm');
		});
    </script>
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
					<li class="active">添加相册</li>
				</ul>
				
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/album/add'/>"
								class="btn btn-primary"> 添加</a>
						</div>
						<h3 class="yahei">添加相册</h3>
					</div>
						<ul id="myTab" class="nav nav-tabs">
							<li  class="active"><a data-toggle="tab"
								href="<c:url value='/admin/album'/>">相册列表</a></li>
						</ul>
						<form class="form-horizontal" id="albumForm" action="album!save" method="post"
							cssClass="creat_form clearfix">
							<div class="control-group">
								<label class="control-label" for="input01">相册名称</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="title"
										name="album.name" >
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input01">相册描述</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="title"
										name="album.description">
								</div>
							</div>
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">添加</button>
								<button class="btn" onclick="javascript:history.back();">取消</button>
							</div>
						</form>
					</div>
					</div>
				</div>

			</div>
		</div>
</body>
