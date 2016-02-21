<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="blog!view" id="view" executeResult="false">
</s:action>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<head>
<title>${view.blog.title}日志</title>
<link rel="stylesheet" href="<c:url value='/admin/styles/blog.css'/>"
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
			new FormCheck('blogCommentForm');
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
					<li class="active">查看日志</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/blog/add'/>"
								class="btn btn-primary">添加</a>
						</div>
						<h3 class="yahei">查看日志</h3>
					</div>
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a data-toggle="tab"
							href="<c:url value='/admin/blog'/>">日志列表</a>
						</li>
						<li><a data-toggle="tab"
							href="<c:url value='/admin/blog/mine'/>">我的日志</a>
						</li>
						<li><a data-toggle="tab"
							href="<c:url value='/admin/blog/workmate'/>">同事的日志</a>
						</li>
					</ul>
					<div id="blogView">
						<div id="mainUse">
							<div>
								<a href="<c:url value='/admin/user/view/${view.blog.user.id}'/>"><img
									src="${pageContext.request.contextPath}/upload/user/<s:date name='%{#view.blog.user.addTime}' format='yyyyMMdd' />/${view.blog.user.photo}"
									width="50" height="50" /> </a>
							</div>
							<div class="subtitle">${view.blog.user.nickname }</div>
							<div class="submenu">
								<a href="/eshow/admin/twitter/workmate/${view.blog.user.id}">他的微博</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								<a href="/eshow/admin/blog/workmate/${view.blog.user.id}">他的日志</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								<a href="/eshow/admin/topic/workmate/${view.blog.user.id }">他的话题</a>
							</div>
						</div>
						<div class="info">
							${view.blog.title}
								<c:if test="true">
									<a href="<c:url value='/admin/blog/edit/${view.blog.id}'/>">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;
									<a href="${ctx }/blog!delete.action?id=${view.blog.id}"
										onclick="return deleteData('blog',${view.blog.id});">删除</a>&nbsp;&nbsp;
								</c:if>
						</div>
						<div class="tips">
							<span class="1"> 发表于:<s:date name='%{#view.blog.addTime}'
									format='yyyy-MM-dd HH:mm' /> </span>| <span class="2">更新于:<s:date
									name='%{#view.blog.updateTime}' format='yyyy-MM-dd HH:mm' /> </span>
							<span class="3">(分类： <c:if
									test="${view.blog.category.id==null}">[默认分类] </c:if> <c:if
									test="${view.blog.category.id!=null}">
									<a
										href="<c:url value="/admin/blog/c/${view.blog.category.id}"/>">${view.blog.category.name}</a>
								</c:if>)</span> <span class="r">评论(<span>${view.blog.commentSize}</span>)┊浏览(<span>${view.blog.count}</span>)
							</span>
						</div>
						<div class="conttxt">${view.blog.content}</div>
					</div>
					<div class="comment_textarea" id="replay" style="margin-top: 10px;">
						<form class="form-horizontal" action="blog-comment!save" id="blogCommentForm"
							method="post">
							<input name="blogId" type="hidden" value="${view.blog.id }" />
							
							<div class="control-group">
								<label class="control-label" for="input01">标题</label>
								<div class="controls">
									<input type="hidden" name="blogComment.blog.title" value="${view.blog.title }"/>
									<input type="text" class="input-xlarge" id="title"  value="回复:${view.blog.title }">
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="textarea">内容</label>
								<div class="controls">
									<textarea class="input-xlarge" id="textarea" rows="3"
										style="width: 600px; height: 100px;" name="blogComment.content"></textarea>
								</div>
							</div>
							
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">发表</button>
								<button class="btn" onclick="javascript:history.back();">取消</button>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>

