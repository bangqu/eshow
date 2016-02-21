<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<head>
<title>讨论区</title>
<meta name="keywords" content="讨论区,网站技术支持，java开发面向对象技术支持" />
<meta name="description" content="讨论区,网站技术支持，java开发面向对象技术支持" />
</head>
<body>
	<header id="header">
		<div class="hero-unit showcase">
			<div class="container">
				<h1 class="yahei">
					技术支持 <a class="btn btn-small btn-primary" href="${ctx}/topic/add">发布话题</a>
				</h1>
			</div>
		</div>
	</header>
	<div class="container">
		<div class="subnav">
			<ul class="nav nav-pills">
				<li ><a href="<c:url value='/topic'/>">全部话题</a></li>
				<s:action name="board!list" id="boardList" executeResult="false" namespace="">
					<s:param name="query.order">addTime</s:param>
					<s:param name="query.desc">true</s:param>
				</s:action>
				<s:iterator value="%{#boardList.boards}" status="rowStatus">
					<li><a href="<c:url value="/topic/board/${id}"/>"
						style="color: #0187c5; text-decoration: none;">${name} </a>
					</li>
				</s:iterator>
				<li><a href="<c:url value='/topic/mine'/>">我的话题</a></li>
			</ul>

		</div>
		<div class="topic">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>主题</th>
						<th>分类</th>
						<th>作者</th>
						<th>回复</th>
						<th>浏览</th>
						<th>发表时间</th>
					</tr>
				</thead>
				<tbody>
					<s:action name="topic!search" id="topicList" executeResult="false" namespace="">
						<s:param name="query.order">addTime</s:param>
						<s:param name="query.desc">true</s:param>
					</s:action>
					<s:iterator value="%{#topicList.topics}" status="rowStatus">
						<tr>
							<td><a href="view/${id }">${util:preview(title,50)}</a>
							</td>
							<td>${board.name}</td>
							<td><a href="<c:url value='/user/view?id=${user.id}'/>">${user.nickname}</a>
							</td>
							<td>${commentSize}</td>
							<td>${count}</td>
							<td><small><s:date name="addTime"
										format="yyyy-MM-dd HH:mm" /> </small></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			<%@ include file="/common/page.jsp"%>
		</div>
	</div>

</body>
