<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="title"></c:set>
<c:set var="title1">修改相片</c:set>
<s:action name="photo!view" id="view" executeResult="false" />
<head>
	<title>修改图片</title>
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
		new FormCheck('photoForm');
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
					<li><a href="${ctx}/admin/album/">相册</a> <span
						class="divider">/</span>
					</li>
					<li class="active">${title1}</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/photo/add'/>"
								class="btn btn-primary"> 添加</a>
						</div>
						<h3 class="yahei">查看相片</h3>
					</div>	
						<form class="form-horizontal" id="photoForm" action="photo!update" method="post"
							enctype="multipart/form-data">
							<input name="id" value="${view.photo.id }" type="hidden"/>
						<fieldset>
							<div class="control-group">
								<label class="control-label" for="input01">图片名称 </label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="title"
										name="photo.name" value="${view.photo.name}">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input01">图片描述 </label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="title"
										name="photo.description" value="${view.photo.description}">
								</div>
							</div>
								<div class="control-group">
									<label class="control-label" for="select01">选择相册</label>
									<s:action name="album!search" id="albumList"
										executeResult="false">
									</s:action>
									<div class="controls">
										<select id="albumId" name="albumId">
											<s:iterator value="%{#albumList.albums}" status="rowStatus">
												<option value="${id}"
													<c:if test="${view.photo.album.id==id}">selected='selected'</c:if>>
													${name}</option>
											</s:iterator>
										</select>
									</div>
								</div>
								<div class="control-group">
								<label class="control-label" for="fileInput">选择图片</label>
								<div class="controls">
									<input class="input-file" id="fileInput" type="file" name="photo.img">
									<span class="l"><c:if test="${view.photo.id!=null}">
										<img
											src="${pageContext.request.contextPath}/upload/photo/<s:date name='%{#view.photo.addTime}' format='yyyyMMdd' />/${view.photo.img}" />
									</c:if> </span>
								</div>
							</div>
							
							<div>
								<span class="l"><c:if test="${view.photo.id!=null}">
										<img
											src="${pageContext.request.contextPath}/upload/photo/<s:date name='%{#view.photo.addTime}' format='yyyyMMdd' />/${view.photo.img}" />
									</c:if> </span>
							</div>
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">修改</button>
								<button class="btn" onclick="javascript:history.back();">取消</button>
							</div>
						</fieldset>
					</form>
						
					</div>
					</div>
				</div>

			</div>
</body>
