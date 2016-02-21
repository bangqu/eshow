<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="board!view" id="view" executeResult="false"></s:action>
<head>
	<title>话题板块</title>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/board.css'/>" type="text/css" />
</head>
<body>
<div class="container mt">
		<div class="row-fluid">
			<s:include value="../left.jsp"></s:include>
			<div class="span10">
				<ul class="breadcrumb">
					<li><a href="${ctx}/admin/index">首页</a> <span class="divider">/</span>
					</li>
					<li><a href="${ctx}/admin/topic/">话题管理</a> <span
						class="divider">/</span>
					</li>
					<li class="active">板块修改</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/board/add'/>"
								class="btn btn-primary"> 添加</a>
						</div>
						<h3 class="yahei">话题板块列表</h3>
					</div>

					<div class="navbar">
			              <div class="navbar-inner">
						<ul class="nav">
							<li><a href="<c:url value='/admin/topic/'/>">信息列表</a></li>
							<li><a href="<c:url value='/admin/topic/audit'/>">未审核</a></li>
							<li><a href="<c:url value='/admin/topic/mine'/>">我发表的话题</a></li>
							<li><a href="<c:url value='/admin/topic/replied'/>">我参与的话题</a></li>
								<li><a href="<c:url value='/admin/topic/workmate'/>">周围的话题</a></li>
							<li  class="active"><a href="<c:url value='/admin/board'/>">话题板块</a></li>
						</ul>
					</div>
				</div>
						<div id="securitiesTxt">
						<form class="form-horizontal" action="<c:url value='/admin/board/board!update'/>" method="post">
							<s:hidden name="id" value="%{#view.board.id}"></s:hidden>
						<fieldset>
							<div class="control-group">
								<label class="control-label" for="input01">话题板块</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="title"
										name="board.name" value="${view.board.name}">   必填
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="textarea">描述</label>
								<div class="controls">
									<textarea class="input-xlarge" id="textarea" rows="3"
										style="width: 400px; height: 100px;" name="board.description">${view.board.description}</textarea>   必填
								</div>
							</div>
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">修改</button>
								<button class="btn" onclick="javascript:history.back();">取消</button>
							</div>
						</fieldset>
						</form>
						<div class="c"></div>
					</div>
					</div>
				</div>
			</div>
		</div>
</body>

