<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<head>
	<title>讨论区</title>
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
							<a href="<c:url value='/admin/tipic/add'/>" class="btn btn-primary">  添加</a>
						</div>
						<h3 class="yahei">信息修改</h3>
						<div class="navbar">
			              <div class="navbar-inner">
						<ul class="nav">
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
				</div>
					</div>


					<div id="analysis">
						<div class="subnav yahei">
							<c:if test="${param.squence==1}">
								<a href="<c:url value='/admin/topic'/>">全部</a>
							</c:if>
							<c:if test="${param.squence==2}">
								<a href="<c:url value='/admin/topic/audit'/>">全部</a>
							</c:if>
							<c:if test="${param.squence==3}">
								<a href="<c:url value='/admin/topic/mine'/>">全部</a>
							</c:if>
							<c:if test="${param.squence==4}">
								<a href="<c:url value='/admin/topic/replied'/>">全部</a>
							</c:if>
							<s:action name="board!list" id="boardList" executeResult="false"></s:action>
							<s:iterator value="%{#boardList.boards}" status="rowStatus">
								<c:if test="${id==param.id}">
									<strong>${name}</strong>
								</c:if>
								<c:if test="${id!=param.id}">
									<a href="<c:url value='/admin/topic/b/${id}?squence=${param.squence}'/>">${name}</a>
								</c:if>
							</s:iterator>
						</div>
						<c:if test="${param.squence ==1}">
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
									<th align="center"></th>
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
								
								<s:action name="topic!search" id="topicList"
									executeResult="false">
									<s:param name="query.state">1</s:param>
									<s:param name="query.boardId">${param.id}</s:param>
									<s:param name="query.order">addTime</s:param>
									<s:param name="query.desc">true</s:param>
								</s:action>								
								<s:iterator value="%{#topicList.topics}" status="rowStatus">
									<tr onmouseover='this.style.backgroundColor ="#f9f9f9"'
										onmouseout='this.style.backgroundColor =""'>
										<td>
											<img src="<c:url value='/admin/images/icon_page.gif'/>" />
										</td>
										<td align="left">
											<em>${board.name}</em>
										</td>
										<td>
											<a href="<c:url value='/admin/topic/view/${id}'/>"
												title="${title}">${util:preview(title,22)}</a>
										</td>
										<td align="right">
											<img src="<c:url value='/admin/images/icon_zjh.gif'/>" />
											&nbsp;
										</td>
										<td align="center">
											<a href="/eshow/admin/topic/workmate/${user.id}">${user.nickname}</a>
										</td>
										<td align="center" style="font-size: 11px;">
											<s:date name='%{updateTime}'
												format='yyyy-MM-dd HH:mm' />
										</td>
										<td align="center">
											${count}/${commentSize}
										</td>
										<td align="center">
											6/0
										</td>
										<td align="center" style="font-size: 11px;">
											<s:date name='%{addTime}'
												format='yyyy-MM-dd' />
										</td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
						</c:if>						
						<c:if test="${param.squence ==3}">
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
									<th align="center" width="120">
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
									<th align="center">
										操作
									</th>
								</tr>
								<s:action name="topic!search" id="topicList"
									executeResult="false">
									<s:param name="query.userId">${myid}</s:param>
									<s:param name="query.boardId">${param.id}</s:param>
									<s:param name="query.order">addTime</s:param>
									<s:param name="query.desc">true</s:param>
								</s:action>
								<s:iterator value="%{#topicList.topics}" status="rowStatus">
									<tr onmouseover='this.style.backgroundColor ="#f9f9f9"'
										onmouseout='this.style.backgroundColor =""' id="topic${id}">
										<td>
											<img src="<c:url value='/admin/images/icon_page.gif'/>" />
										</td>
										<td align="left">
											<em>${board.name}</em>
										</td>
										<td>
											<a href="<c:url value='/admin/topic/view/${id}'/>"
												title="${title}">${util:preview(title,22)}</a>
										</td>
										<td align="center" style="font-size: 11px;">
											<s:date name='%{updateTime}'
												format='yyyy-MM-dd HH:mm' />
										</td>
										<td align="center">
											${count}/${commentSize}
										</td>
										<td align="center">
											6/0
										</td>
										<td align="center" style="font-size: 11px;">
											<s:date name='addTime' format="yyyy-MM-dd" />
										</td>
										<td align="center">
											<a
											href="<c:url value='/admin/topic/edit/${id}'/>">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
											href="${ctx }/topic!delete.action?id=${id}"
											onclick="return deleteData('topic',${id});">删除</a>&nbsp;&nbsp; 										
											</td>
									</tr>
								</s:iterator>
								</tbody>
						</table>
						</c:if>								
					<%@ include file="/common/page.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

