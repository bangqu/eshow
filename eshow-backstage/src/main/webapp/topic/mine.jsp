<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<head>
	<title>我发表的话题</title>
	<link rel="stylesheet"
		href="<c:url value='/styles/topic.css'/>" type="text/css" />
</head>
<body>
	<div class="container mt">
		<div class="row-fluid">
			<s:include value="../left.jsp"></s:include>
			<div class="span10">
				<ul class="breadcrumb">
					<li><a href="${ctx}/index">首页</a> <span class="divider">/</span>
					</li>
					<li><a href="${ctx}/topic/">话题管理</a> <span
						class="divider">/</span>
					</li>
					<li class="active">我发表的话题列表</li>
				</ul>

				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/tipic/add'/>" class="btn btn-primary">  添加</a>
						</div>
						<h3 class="yahei"> 我发表的话题</h3>
					</div>

					<div class="navbar">
			              <div class="navbar-inner">
							<ul class="nav">
								<li><a href="<c:url value='/topic/'/>">话题列表</a></li>
								<li><a href="<c:url value='/topic/audit'/>">未审核</a></li>
								<li  class="active"><a data-toggle="tab" href="<c:url value='/topic/mine'/>">我发表的话题</a></li>
								<li><a href="<c:url value='/topic/replied'/>">我参与的话题</a></li>
								<li><a href="<c:url value='/topic/workmate'/>">周围的话题</a></li>
								<li><a href="<c:url value='/board'/>">话题板块</a></li>
							</ul>
						</div>
					</div>
				<div id="analysis">

						<div class="subnav">
							<strong>全部</strong>
							<s:action name="board!list" var="boardList" executeResult="false"></s:action>
							<s:iterator value="%{#boardList.boards}" status="rowStatus">
								<a href="<c:url value='/topic/b/${id}?squence=3&query.userId=${myid}'/>">${name}</a>
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
									<th>发表时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<s:action name="topic!search" var="topicList"
									executeResult="false">
									<s:param name="query.state">0</s:param>
									<s:param name="query.order">addTime</s:param>
									<s:param name="query.desc">true</s:param>
								</s:action>
								<s:iterator value="%{#topicList.topics}" status="rowStatus">
								<tr id="market20">
									<td>${id}</td>
									<td>${board.name}</td>
									<td><a href="<c:url value='/topic/view/${id}'/>"
										title="${title}">${util:preview(title,13)}</a>
									</td>
									<td><s:date name='%{updateTime}'
											format='yyyy-MM-dd HH:mm' />
									</td>
									<td>${count}/${commentSize}</td>
									<td><s:date name='%{addTime}' format='yyyy-MM-dd' />
									</td>
									<td><a href="${ctx }/topic/edit/${id}">修改</a> <a
										href="${ctx }/topic!delete.action?id=${id}"
										onclick="deleteData('确定要删除该信息吗？','market',20);">删除</a>
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

