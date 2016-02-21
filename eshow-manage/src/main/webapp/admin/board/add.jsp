<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
<title>日志分类</title>
<link rel="stylesheet" href="<c:url value='/admin/styles/board.css'/>"
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
					<li><a href="${ctx}/admin/topic/">话题管理</a> <span
						class="divider">/</span></li>
					<li class="active">板块添加</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/board/add'/>"
								class="btn btn-primary"> 添加</a>
						</div>
						<h3 class="yahei">话题板块添加</h3>
					</div>
					<ul id="myTab" class="nav nav-tabs">
						<li><a data-toggle="tab"
							href="<c:url value='/admin/topic/'/>">信息列表</a>
						</li>
						<li><a data-toggle="tab"
							href="<c:url value='/admin/topic/audit'/>">未审核</a>
						</li>
						<li><a data-toggle="tab"
							href="<c:url value='/admin/topic/mine'/>">我发表的话题</a>
						</li>
						<li><a data-toggle="tab"
							href="<c:url value='/admin/topic/replied'/>">我参与的话题</a>
						</li>
						<li><a data-toggle="tab"
							href="<c:url value='/admin/topic/workmate'/>">周围的话题</a>
						</li>
						<li class="active"><a data-toggle="tab"
							href="<c:url value='/admin/board'/>">话题板块</a>
						</li>
					</ul>
					<form class="form-horizontal" action="board!save" method="post">
						<fieldset>
							<div class="control-group">
								<label class="control-label" for="input01">话题板块</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="title"
										name="board.name"> 必填
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="textarea">描述</label>
								<div class="controls">
									<textarea class="input-xlarge" id="textarea" rows="3"
										style="width: 400px; height: 100px;" name="board.description"></textarea>
									必填
								</div>
							</div>
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">保存</button>
								<button class="btn" onclick="javascript:history.back();">取消</button>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

