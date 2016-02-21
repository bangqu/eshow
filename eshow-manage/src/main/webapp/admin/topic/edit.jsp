<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<s:action name="topic!view" id="view" executeResult="false" />
<head>
	<title>讨论区</title>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/topic.css'/>" type="text/css" />
	<script type="text/javascript" charset="utf-8"
		src="<c:url value="/components/kindeditor/kindeditor.js"/>"></script>
	<script type="text/javascript">
    KE.show({
        id : 'ke-text'
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
					<li><a href="${ctx}/admin/topic/">话题修改</a> <span
						class="divider">/</span>
					</li>
					<li class="active">话题管理</li>
				</ul>

				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/topic/add'/>" class="btn btn-primary">添加</a>
						</div>
						<h3 class="yahei">信息修改</h3>
					</div>
					<div class="navbar">
			              <div class="navbar-inner">
						<ul class="nav">
							<li  class="active"><a href="<c:url value='/admin/topic/'/>">话题列表</a></li>
							<li><a href="<c:url value='/admin/topic/audit'/>">未审核</a></li>
							<li><a href="<c:url value='/admin/topic/mine'/>">我发表的话题</a></li>
							<li><a href="<c:url value='/admin/topic/replied'/>">我参与的话题</a></li>
							<li><a href="<c:url value='/admin/board'/>">话题板块</a></li>
								<li><a href="<c:url value='/admin/topic/workmate'/>">周围的话题</a></li>
							<li><a href="<c:url value='/admin/topic/add'/>">发表话题</a></li>
						</ul>
					</div>
				</div>
						<form class="form-horizontal" action="topic!update" method="post"
							cssClass="creat_form clearfix">
							<input type="hidden" name="id" value="${view.topic.id}" />
							<div class="control-group">
								<label class="control-label" for="input01">话题标题</label>
								<div class="controls">
									<input type="text" class="input-xlarge"
										name="topic.title" value="${view.topic.title }">
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="select01">话题分类</label>
								<s:action name="board!search" id="boardList"
									executeResult="false"/>
								<div class="controls">
									<select id="boardId" name="boardId">
									<s:iterator value="%{#boardList.boards}"
										status="rowStatus">
										<option value="${id}"
											<c:if test="${view.topic.board.id==id}">selected="selected"</c:if>>
											${name}
										</option>
									</s:iterator>
								</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="textarea">话题内容</label>
								<div class="controls">
									<textarea class="input-xlarge" id="textarea" rows="3" name="topic.content">${view.topic.content}</textarea>
								</div>
							</div>
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">修改</button>
								<button class="btn">取消</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>

