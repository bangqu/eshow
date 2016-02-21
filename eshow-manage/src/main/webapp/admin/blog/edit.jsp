<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="blog!view" id="view" executeResult="false" />
<head>
	<title>修改日志_${view.blog.title}</title>
	<link rel="stylesheet" href="<c:url value='/admin/styles/blog.css'/>"
		type="text/css" />
	<%@ include file="/common/validate.jsp"%>
	<script type="text/javascript">
	window.addEvent('domready', function() {
		new FormCheck('blogForm');
	});
</script>
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
					<li><a href="${ctx}/admin/blog/">日志管理</a> <span
						class="divider">/</span>
					</li>
					<li class="active">修改日志</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/blog/add'/>" class="btn btn-primary">添加</a>
						</div>
						<h3 class="yahei">修改日志</h3>
					</div>
					
					
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="<c:url value='/admin/blog'/>">日志列表</a></li>
						<li><a data-toggle="tab" href="<c:url value='/admin/blog/mine'/>">我的日志</a></li>
						<li><a data-toggle="tab" href="<c:url value='/admin/blog/workmate'/>">同事的日志</a></li>
					</ul>
					
					<form class="form-horizontal" action="blog!update" method="post"
						id="blogForm">
						<input type="hidden" name="id" value="${view.blog.id}" />
						<fieldset>
							<div class="control-group">
								<label class="control-label" for="input01">日志标题</label>
								<div class="controls">
									<input type="text"  class="input-xlarge" id="title"
										name="blog.title" value="${view.blog.title}">
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="select01">选择分类</label>
								<div class="controls">
									<s:action name="category!list" id="categoryList"
										executeResult="false" />
									<select name="categoryId">
										<s:iterator value="%{#categoryList.categories}"
											status="rowStatus">
											<option value="${id}"
												<c:if test="${view.blog.category.id==id}">selected="selected"</c:if>>
												${name}</option>
										</s:iterator>
									</select>
								</div>
							</div>


							<div class="control-group">
								<label class="control-label" for="textarea">内容</label>
								<div class="controls">
									<textarea class="input-xlarge" id="textarea" rows="3"
										style="width: 600px; height: 100px;" name="blog.content">${view.blog.content}</textarea>
								</div>
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

