<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<head>
<title>微博客</title>
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
					<li class="active">微博列表</li>
				</ul>

				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/twitter/add'/>" class="btn btn-primary">添加</a>
						</div>
						<h3 class="yahei">微博中心</h3>
					</div>
					<div class="navbar">
			          <div class="navbar-inner"> 
							<ul class="nav">
								<li class="active"><a href="<c:url value='/admin/twitter'/>">微博列表</a></li>
								<li><a href="<c:url value='/admin/twitter/mine'/>">我的微博</a></li>
								<li><a href="<c:url value='/admin/twitter/workmate'/>">别人的微博</a></li>
							</ul>
						</div>
					</div>
					<s:action name="twitter!search" id="twitterList"
						executeResult="false">
						<s:param name="query.order">addTime</s:param>
						<s:param name="query.desc">true</s:param>
					</s:action>
					<div id="friend">
						<s:iterator value="%{#twitterList.twitters}">
							<s:if test="%{#twitterList.twitters}==null">
								<div class="alert fade in">目前没有记录</div>
							</s:if> 
							<ul class="twtterul">
								<li id="twitter${id}">
									<span class="avatar"> <a
											href="<c:url value="/admin/twitter/workmate/${user.id}"/>">
												<c:if test="${user.photo==null}">
													<img
														src="${pageContext.request.contextPath}/images/base/user50-50.jpg"
														alt="${user.nickname}" width="50" height="50" />
												</c:if> <c:if test="${user.photo!=null}">
													<img
														src="${pageContext.request.contextPath}/upload/user/<s:date name='%{user.addTime}' format='yyyyMMdd' />/${user.photo}"
														alt="${user.nickname}" width="50" height="50" />
												</c:if> </a> </span> 
									<div class="cont">
										
												<div class="contxt">${content}</div>
												<div class="info">
										<span class="msg"><a
											href="<c:url value="/admin/user/view/${user.id}"/>">${user.nickname}</a>发表于：<s:date
												name='addTime' format="yyyy-MM-dd HH:mm" /> </span> <span
											class="tips"> <a
											href="<c:url value='/admin/twitter/view/${id}'/>">回复(${commentSize})</a>
										</span>
										<c:if test="true">
											<span class="tips fr"> <a
												href="<c:url value='/admin/twitter/edit/${id}'/>">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;
												<a href="${ctx }/twitter!delete.action?id=${id}"
												onclick="return deleteData('twitter',${id});">删除</a>
											</span>
										</c:if>
									</div>
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
</body>

