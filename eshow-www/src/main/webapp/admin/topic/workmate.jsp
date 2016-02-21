<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="user!view" id="view" executeResult="false">
	<s:param name="id">${param.id}</s:param>
</s:action>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<head>
<title>${view.user.nickname}的话题</title>
<link rel="stylesheet" href="<c:url value='/admin/styles/topic.css'/>"
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
					<li class="active">${view.user.nickname }话题</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/tipic/add'/>"
								class="btn btn-primary"> 添加</a>
						</div>
						<h3 class="yahei">${view.user.nickname }的话题</h3>
					</div>

					<div class="navbar">
			              <div class="navbar-inner">
								<ul class="nav">
									<li><a href="<c:url value='/admin/topic/'/>">话题列表</a></li>
									<li><a href="<c:url value='/admin/topic/audit'/>">未审核</a></li>
									<li><a href="<c:url value='/admin/topic/mine'/>">我发表的话题</a></li>
									<li><a href="<c:url value='/admin/topic/replied'/>">我参与的话题</a></li>
									<li class="active"><a href="<c:url value='/admin/topic/workmate'/>">周围的话题</a></li>
									<li><a  href="<c:url value='/admin/board'/>">话题板块</a>
									</li>
								</ul>
							</div>
						</div>
					<div id="analysis">
						<div class="subnav">
							<strong>全部</strong>
							<s:action name="board!list" id="boardList" executeResult="false"></s:action>
							<s:iterator value="%{#boardList.boards}" status="rowStatus">
								<a
									href="<c:url value='/admin/topic/workmate?query.boardId=${id}'/>">${name}</a>
							</s:iterator>
						</div>
						<table class="table table-striped table-bordered table-condensed">
							<thead>
								<tr>
									<th>#</th>
									<th>分类</th>
									<th>标题</th>
									<th>更新时间</th>
									<th>浏览/回复</th>
									<th>推荐/收藏</th>
									<th>发表时间</th>
								</tr>
							</thead>
							<tbody>
								<s:action name="topic!search" id="topicList"
									executeResult="false">
									<s:param name="query.state">1</s:param>
									<s:param name="query.order">addTime</s:param>
									<s:param name="query.desc">true</s:param>
								</s:action>
								<s:iterator value="%{#topicList.topics}" status="rowStatus">
								<tr id="market20">
									<td>${id}</td>
									<td>${board.name}</td>
									<td><a href="<c:url value='/admin/topic/view/${id}'/>"
										title="${title}">${util:preview(title,10)}</a>
									</td>
									<td><s:date name='%{updateTime}'
											format='yyyy-MM-dd HH:mm' />
									</td>
									<td>${count}/${commentSize}</td>
									<td>6/0</td>
									<td><s:date name='%{addTime}' format='yyyy-MM-dd' />
									</td>
								</tr></s:iterator>
							</tbody>
						</table>
						<%@ include file="/common/page.jsp"%>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>

