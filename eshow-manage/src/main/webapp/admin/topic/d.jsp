<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<head>
	<title>讨论区</title>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/topic.css'/>" type="text/css" />
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
						class="divider">/</span>
					</li>
					<li class="active">话题列表</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/topic/add'/>" class="btn btn-primary">添加</a>
						</div>
						<h3 class="yahei">信息修改</h3>
						<ul id="myTab" class="nav nav-tabs">
							<li  class="active"><a data-toggle="tab"
								href="<c:url value='/admin/topic/'/>">话题列表</a></li>
							<li><a data-toggle="tab"
								href="<c:url value='/admin/topic/audit'/>">未审核</a></li>
							<li><a data-toggle="tab"
								href="<c:url value='/admin/topic/mine'/>">我发表的话题</a></li>
							<li><a data-toggle="tab"
								href="<c:url value='/admin/topic/replied'/>">我参与的话题</a></li>
								<li><a data-toggle="tab"
								href="<c:url value='/admin/topic/workmate'/>">周围的话题</a></li>
							<li><a data-toggle="tab"
								href="<c:url value='/admin/board'/>">话题板块</a></li>
						</ul>
					</div>
					<div id="analysis">
						<div class="subnav">
							<a href="<c:url value='/admin/topic/replied'/>">全部</a>
							<s:action name="board!list" id="boardList" executeResult="false"></s:action>
							<s:iterator value="%{#boardList.boards}" status="rowStatus">
								<c:if test="${id==param.id}">
									<strong>${name}</strong>
								</c:if>
								<c:if test="${id!=param.id}">
									<a href="<c:url value='/admin/topic/d/${id}'/>">${name}</a>
								</c:if>
							</s:iterator>
						</div>
						<table class="forum-table">
							<colgroup>
								<col width="17" />
								<col width="85" />
								<col />
								<col width="40" />
								<col width="100" />
								<col width="90" />
								<col width="70" />
								<col width="70" />
								<col width="90" />
							</colgroup>
							<tbody>
								<tr>
									<th></th>
									<th align="left">
										分类
									</th>
									<th align="left">
										标题
									</th>
									<th align="center">
										作者
									</th>
									<th align="center">
										更新时间
									</th>
									<th align="center">
										浏览/回复
									</th>
									<th align="center">
										推荐/收藏
									</th>
									<th>
										发表时间
									</th>
								</tr>
								<s:action name="topicComment!searchReply" id="topicCommentList">
									<s:param name="query.userId">${myid}</s:param>
									<s:param name="boardId">${param.id}</s:param>
									<s:param name="query.order">addTime</s:param>
									<s:param name="query.desc">true</s:param>
								</s:action>
								<s:iterator value="%{#topicCommentList.topicComments}"
									status="rowStatus">
									<tr onmouseover='this.style.backgroundColor ="#f9f9f9"'
										onmouseout='this.style.backgroundColor =""'>
										<td>
											<img src="<c:url value='/admin/images/icon_page.gif'/>" />
										</td>
										<td align="left">
											<em>${topic.board.name}</em>
										</td>
										<td>
											<a href="<c:url value='/admin/topic/view/${topic.id}'/>"
												title="${topic.title}">${util:preview(topic.title,22)}</a>
										</td>										
										<td align="center">
											<a href="/eshow/admin/topic/workmate/${topic.user.id}">${topic.user.username}</a>
										</td>
										<td align="center" style="font-size: 11px;">
											<s:date name='%{topic.updateTime}'
												format='yyyy-MM-dd HH:mm' />
										</td>
										<td align="center">
											${topic.count}/${topic.commentSize}
										</td>
										<td align="center">
											6/0
										</td>
										<td align="center" style="font-size: 11px;">
											<s:date name='addTime' format="yyyy-MM-dd" />
										</td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					<%@ include file="/common/page.jsp"%>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div id="main">
		<s:include value="../left.jsp"></s:include>
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<div id="mainTop">
						<h2>
							<img src="<c:url value='/admin/images/app_list_topic.gif'/>" />
							讨论区
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/topic'/>">讨论区</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/topic/audit'/>">未审核</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/topic/mine'/>">我发表的话题</a> </span>
							</li>
							<li class="on">
								<span class="txt6"><a
									href="<c:url value='/admin/topic/replied'/>">我参与的话题</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/board'/>">话题板块</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/topic/add'/>">发表话题</a>
							</li>
						</ul>
					</div>
					<div id="analysis">
						<div class="subnav">
							<a href="<c:url value='/admin/topic/replied'/>">全部</a>
							<s:action name="board!list" id="boardList" executeResult="false"></s:action>
							<s:iterator value="%{#boardList.boards}" status="rowStatus">
								<c:if test="${id==param.id}">
									<strong>${name}</strong>
								</c:if>
								<c:if test="${id!=param.id}">
									<a href="<c:url value='/admin/topic/d/${id}'/>">${name}</a>
								</c:if>
							</s:iterator>
						</div>
						<table class="forum-table">
							<colgroup>
								<col width="17" />
								<col width="85" />
								<col />
								<col width="40" />
								<col width="100" />
								<col width="90" />
								<col width="70" />
								<col width="70" />
								<col width="90" />
							</colgroup>
							<tbody>
								<tr>
									<th></th>
									<th align="left">
										分类
									</th>
									<th align="left">
										标题
									</th>
									<th align="center">
										作者
									</th>
									<th align="center">
										更新时间
									</th>
									<th align="center">
										浏览/回复
									</th>
									<th align="center">
										推荐/收藏
									</th>
									<th>
										发表时间
									</th>
								</tr>
								<s:action name="topicComment!searchReply" id="topicCommentList">
									<s:param name="query.userId">${myid}</s:param>
									<s:param name="boardId">${param.id}</s:param>
									<s:param name="query.order">addTime</s:param>
									<s:param name="query.desc">true</s:param>
								</s:action>
								<s:iterator value="%{#topicCommentList.topicComments}"
									status="rowStatus">
									<tr onmouseover='this.style.backgroundColor ="#f9f9f9"'
										onmouseout='this.style.backgroundColor =""'>
										<td>
											<img src="<c:url value='/admin/images/icon_page.gif'/>" />
										</td>
										<td align="left">
											<em>${topic.board.name}</em>
										</td>
										<td>
											<a href="<c:url value='/admin/topic/view/${topic.id}'/>"
												title="${topic.title}">${util:preview(topic.title,22)}</a>
										</td>										
										<td align="center">
											<a href="/eshow/admin/topic/workmate/${topic.user.id}">${topic.user.username}</a>
										</td>
										<td align="center" style="font-size: 11px;">
											<s:date name='%{topic.updateTime}'
												format='yyyy-MM-dd HH:mm' />
										</td>
										<td align="center">
											${topic.count}/${topic.commentSize}
										</td>
										<td align="center">
											6/0
										</td>
										<td align="center" style="font-size: 11px;">
											<s:date name='addTime' format="yyyy-MM-dd" />
										</td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					<%@ include file="/common/page.jsp"%>
					</div>
				</div>
				<input type="hidden" id="stype" value="" />
				<div class="c"></div>
			</div>
			<div class="c"></div>
			<div class="boxs3_rt"></div>
			<div class="boxs3_lb"></div>
			<div class="boxs3_rb"></div>
		</div>
	</div>
</body>

