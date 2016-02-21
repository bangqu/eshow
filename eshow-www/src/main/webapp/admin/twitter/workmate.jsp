<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="user!view" id="view" executeResult="false">
	<s:param name="id">${param.id}</s:param>
</s:action>
<head>
	<title>${view.user.nickname}微博客</title>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/twitter.css'/>" type="text/css" />
</head>
<body>
	<div class="container mt">
		<div class="row-fluid">
			<s:include value="../left.jsp"></s:include>
			<div class="span10">
				<ul class="breadcrumb">
					<li><a href="${ctx}/admin/index">首页</a> <span class="divider">/</span>
					</li>
					<li><a href="${ctx}/admin/twitter/">微博管理</a> <span
						class="divider">/</span>
					</li>
					<li class="active">${view.user.nickname}的微博</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="page-header">
							<div class="pull-right">
								<a href="<c:url value='/admin/twitter/add'/>"
									class="btn btn-primary">添加</a>
							</div>
							<h3 class="yahei">${view.user.nickname}的微博</h3>
						</div>
						<ul id="myTab" class="nav nav-tabs">
							<li><a data-toggle="tab" href="<c:url value='/admin/twitter'/>">微博列表</a></li>
							<li><a data-toggle="tab" href="<c:url value='/admin/twitter/mine'/>">我的微博</a></li>
							<li class="active"><a data-toggle="tab" href="<c:url value='/admin/twitter/workmate'/>">别人的微博</a></li>
						</ul>
						<s:action name="twitter!search" id="twitterList"
						executeResult="false">
						<s:param name="query.userId">${param.id}</s:param>
						<s:param name="query.order">addTime</s:param>
						<s:param name="query.desc">true</s:param>
					</s:action>
					<div id="workmate">
						<s:iterator value="%{#twitterList.twitters}">
							<s:if test="%{#twitterList.twitters}==null">
								<div class="mainMsg">
									目前没有记录
								</div>
							</s:if>
							<ul>
								<li>
									<div class="info1">
										<span class="msg"><a href="<c:url value="/admin/user/view/${user.id}"/>">${user.nickname}</a>发表于：<s:date name='addTime'
												format="yyyy-MM-dd HH:mm" /> </span>
										<span class="tips"> <a href="<c:url value='/admin/twitter/view/${id}'/>">回复(<span>${commentSize}</span>)</a> </span>
									</div>
									<div class="contxt">
										${content}
									</div>
								</li>
							</ul>
						</s:iterator>
						<%@ include file="/common/page.jsp"%>
					</div>
					</div>
					
				</div>

			</div>
		</div>
	</div>
</body>

