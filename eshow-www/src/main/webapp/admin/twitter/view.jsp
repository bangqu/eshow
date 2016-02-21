<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<s:action name="twitter!view" id="view" executeResult="false"></s:action>
<c:if test="${view.twitter.id==null}">
	<script>location.href="<c:url value='/admin/twitter'/>";</script>
</c:if>
<head>
<title>微博客</title>
<link rel="stylesheet" href="<c:url value='/admin/styles/twitter.css'/>"
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
			new FormCheck('twitterCommentForm');
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
					<li><a href="${ctx}/admin/twitter/">微博管理</a> <span
						class="divider">/</span></li>
					<li class="active">查看微博</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/twitter/add'/>"
								class="btn btn-primary">添加</a>
						</div>
						<h3 class="yahei">查看微博</h3>
					</div>
					<ul id="myTab" class="nav nav-tabs">
						<li><a data-toggle="tab"
							href="<c:url value='/admin/twitter'/>">微博列表</a>
						</li>
						<li class="active"><a data-toggle="tab"
							href="<c:url value='/admin/twitter/view'/>">查看微博</a>
						</li>
						<li><a data-toggle="tab"
							href="<c:url value='/admin/twitter/mine'/>">我的微博</a>
						</li>
						<li><a data-toggle="tab"
							href="<c:url value='/admin/twitter/workmate'/>">别人的微博</a>
						</li>
					</ul>




					<div id="twitter${view.twitter.id}">
						<div id="workmate">
							<div id="top">微博详细</div>
							<ul>
								<li><span> <a
										href="/eshow/admin/twitter/workmate/${view.twitter.user.id}">
											<c:if test="${view.twitter.user.photo==null}">
												<img
													src="${pageContext.request.contextPath}/images/base/user50-50.jpg"
													alt="${user.nickname}" width="50" height="50" />
											</c:if> <c:if test="${view.twitter.user.photo!=null}">
												<img
													src="${pageContext.request.contextPath}/upload/user/<s:date name='%{#view.twitter.user.addTime}' format='yyyyMMdd' />/${view.twitter.user.photo}"
													alt="${view.twitter.user.nickname}" width="50" height="50" />
											</c:if> </a> </span>
									<div class="info">
										<span class="msg"> <a
											href="<c:url value='/admin/user/view/${user.id }'/>">${view.twitter.user.nickname}</a>&nbsp;&nbsp;于
											<s:date name='%{#view.twitter.addTime}'
												format="yyyy-MM-dd HH:mm" />&nbsp;&nbsp;发表 </span> <span
											class="tips"> <a
											href="<c:url value='/admin/twitter/view/${view.twitter.id}'/>">回复(<span
												id="count2823">${view.twitter.commentSize}</span>)</a> </span>
										<c:if test="true">
											<span class="tips"> <a
												href="<c:url value='/admin/twitter/edit/${view.twitter.id}'/>">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
												href="${ctx }/twitter!delete.action?id=${view.twitter.id }"
												onclick="return deleteData('twitter',${view.twitter.id});">删除</a>&nbsp;&nbsp;|&nbsp;&nbsp;
											</span>
										</c:if>
									</div>
									<div class="contxt1">${view.twitter.content}</div></li>
							</ul>
							<s:action name="twitter-comment!search" id="twitterCommentList"
								executeResult="false">
								<s:param name="query.twitterId">${view.twitter.id }</s:param>
								<s:param name="query.desc">true</s:param>
							</s:action>
							<s:iterator value="%{#twitterCommentList.twitterComments}"
								status="rowStatus">
								<div class="commenta" id="twitterComment${id}">
									<div class="commenta_avatar">
										<a href="/eshow/admin/twitter/workmate/${user.id }"> <c:if
												test="${user.photo==null}">
												<img
													src="${pageContext.request.contextPath}/images/base/user50-50.jpg"
													alt="${user.nickname}" width="50" height="50" />
											</c:if> <c:if test="${user.photo!=null}">
												<img
													src="${pageContext.request.contextPath}/upload/user/<s:date name='%{user.addTime}' format='yyyyMMdd' />/${user.photo}"
													alt="${user.nickname}" width="50" height="50" />
											</c:if> </a>
									</div>
									<div class="commenta_cont">
										<div class="commenta_info">
											<span class="l"><a
												href="<c:url value='/admin/user/view/${user.id}'/>">${user.nickname}</a>
												于 <s:date name='addTime' format="yyyy-MM-dd HH:mm" /> 回复</span>
											<c:if test="true">
												<span class="r"> <a href="${ctx }/twitter-comment!delete.action?id=${id}"
													onclick="return deleteData('twitterComment',${id});">
														删除</a> </span>
											</c:if>
										</div>
										<div class="commenta_contxt">${content}</div>
									</div>
								</div>
							</s:iterator>
							<div style="margin-left:80px;">
								<form action="twitter-comment!save" id="twitterCommentForm"
									method="post">
									<input type="hidden" name="twitterId"
										value="${view.twitter.id}" />
									<div>
										<textarea class="inputtext text-input validate['required']"
											name="twitterComment.content"
											onblur="this.className='textarea'"
											onfocus="this.className='textarea2'" id="inputBox"
											style="width: 400px; height: 80px;"></textarea>
										<p style="margin-top: 5px;">
											<input type="submit" class="botton" value="发表"
												onMouseOut="this.className='botton';"
												onMouseOver="this.className='botton2';" />
										</p>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>

