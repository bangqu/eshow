<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<s:action name="topic!view" id="view" executeResult="false" />
<head>
<title>${view.topic.title}</title>
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
					<li class="active">查看话题</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/tipic/add'/>"
								class="btn btn-primary"> 添加</a>
						</div>
						<h3 class="yahei">我参与的话题</h3>
					</div>
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a data-toggle="tab"
							href="<c:url value='/admin/topic/'/>">话题列表</a>
						</li>
						<li><a data-toggle="tab"
							href="<c:url value='/admin/topic/audit'/>">未审核</a>
						</li>
						<li><a data-toggle="tab"
							href="<c:url value='/admin/topic/mine'/>">我发表的话题</a>
						</li>
						<li><a data-toggle="tab"
							href="<c:url value='/admin/topic/replied'/>">我参与的话题</a>
						</li>
						<li><a data-toggle="tab"
								href="<c:url value='/admin/topic/workmate'/>">周围的话题</a></li>
						<li><a data-toggle="tab" href="<c:url value='/admin/board'/>">话题板块</a>
						</li>
					</ul>
					<div id="mainarea">
						<div id="mainarea_bg">
							<div id="content">
								<div id="analysisView">
									<div id="mainUse">
										<div class="avatar">
											<c:if test="${view.topic.user.photo==null}">
												<a
													href="<c:url value="/admin/user/view/${view.topic.user.username}"/>"><img
													src="${pageContext.request.contextPath}/images/base/user50-50.jpg"
													alt="${view.topic.user.nickname}" width="50" height="50" />
												</a>
											</c:if>
											<c:if test="${view.topic.user.photo!=null}">
												<a
													href="<c:url value="/admin/user/view/${view.topic.user.username}"/>"><img
													src="${pageContext.request.contextPath}/upload/user/<s:date name='%{#view.topic.user.addTime}' format='yyyyMMdd' />/${view.topic.user.photo}"
													alt="${view.topic.user.nickname}" width="50" height="50" />
												</a>
											</c:if>
										</div>
										<div class="subtitle">
											<table>
												<tr>
													<td align="left" width="150">
														${view.topic.user.username}</td>
													<td width="480"></td>
													<td align="right"><a href="javascript:history.go(-1);">返回上一页</a>
													</td>
												</tr>
											</table>
										</div>
										<div class="submenu">
											<a
												href="<c:url value='/admin/topic/workmate/${view.topic.user.id}'/>">他的话题</a>
										</div>
										<div class="upPage">
											<c:if test="${view.topic.state==0}">
												<input type="button" class="botton" value="审核通过"
													onmouseout="this.className='botton';"
													onmouseover="this.className='botton2';"
													onclick="javascript:location.href='<c:url value='/admin/topic/topic!state?id=${view.topic.id}&topic.state=1&topic.title=title&topic.content=content'/>'" />
												<input type="button" class="botton_close1" value="审核不通过"
													onmouseout="this.className='botton_close1';"
													onmouseover="this.className='botton_close2';"
													onclick="javascript:location.href='<c:url value='/admin/topic/topic!state?id=${view.topic.id}&topic.state=2'/>'" />
											</c:if>
										</div>
									</div>
									<div class="info">
										<h3>&nbsp; ${view.topic.title}</h3>
										<span class="r" style="color: #999"><s:date
												name='%{#view.topic.updateTime}' format='yyyy-MM-dd HH:mm' />
										</span>
										<div class="c"></div>
										<div class="l">
											发表于
											<s:date name='%{#view.topic.addTime}'
												format='yyyy-MM-dd HH:mm' />
											&nbsp;&nbsp;&nbsp;&nbsp;(分类：${view.topic.board.name})
										</div>
										<div class="r">
											<a href="/eshow/admin/topic/edit/${view.topic.id}">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;
											<a href="<c:url value='/admin/topic/view/${view.topic.id}'/>">回复</a>
										</div>
										<div class="c"></div>
									</div>
									<div class="tips">
										<span class="r">评论(<span id="count814">${view.topic.commentSize}</span>)┊浏览(${view.topic.count})
										</span>
										<div class="c"></div>
									</div>
									<div class="conttxt">
										${view.topic.content} <br />
									</div>
									<div id="comment0" class="comment"></div>
								</div>
							</div>
							<c:if test="${view.topic.state==1}">
								<s:action name="topic-comment!search" id="topicCommentList"
									executeResult="false">
									<s:param name="query.topicId">${view.topic.id }</s:param>
									<s:param name="query.order">addTime</s:param>
									<s:param name="query.desc">true</s:param>
								</s:action>
								<s:iterator value="%{#topicCommentList.topicComments}"
									status="rowStatus">
									<div class="commenta" id="comDiv5244">

										<div class="commenta_avatar">
											<a
												href="<c:url value='/admin/topic/workmate/${view.topic.user.id}'/>"><img
												src="${pageContext.request.contextPath}/upload/user/<s:date name='%{user.addTime}' format='yyyyMMdd' />/${user.photo}"
												alt="${user.username }" width="50" height="50" /> </a>
											${user.username }
										</div>
										<div class="commenta_cont">
											<div class="commenta_info">
												<span class="l">${name} 于 <s:date name="addTime"
														format="yyyy-MM-dd hh:mm" />回复</span> <span class="r"> <a
													href="<c:url value='topic-comment!delete.action?id=${id}'/>"
													onclick="return window.confirm('真的需要删除该信息吗?');"> 删除</a> </span>
											</div>
											<div class="commenta_contxt">${content}</div>
											<div class="comment_reply"></div>
										</div>
									</div>
								</s:iterator>
								<div class="comment_textarea" id="replay">
									<form action="topic-comment!save" id="topicCommentForm" method="post">
										<input name="topicId" type="hidden" value="${view.topic.id }" />
										<input type="hidden" name="topicComment.name" value="回复：${view.topic.title }"/>
										<br /> <br /> 标题: <input class="inputtext" style="width: 300px;" maxlength="100"
											type="text" onblur="this.className='inputtext'"
											value="回复:${view.topic.title }" />
										<div>&nbsp;</div>
										<div>
											<textarea class="textarea" name="topicComment.content"
												onkeyup="javascript:KeyupComment()"
												id="topicComment.content" cols="" rows=""
												onblur="this.className='textarea'"
												onfocus="this.className='textarea2'"></textarea>
										</div>
										<div class="button">
											<p style="float: left">
												<span style="margin-left: 90px"></span>总共字数： <span
													style="color: Blue; margin-right: 20px">200</span>剩余字数： <span
													id="CommentRestCharCount" style="color: Blue">200</span>
											</p>
											<div style="padding: 5px 0;">
												<span class="r"><input type="submit" class="botton"
													value="发表" onMouseOut="this.className='botton';"
													onMouseOver="this.className='botton2';" /> </span>
											</div>
										</div>
										<div class="c h5"></div>
									</form>
								</div>
							</c:if>
						</div>
						<c:if test="${view.topic.state==1}">
							<div id="articeBottom">
								<%@ include file="/common/page.jsp"%>
							</div>
						</c:if>
					</div>
				</div>

			</div>
		</div>
	</div>
	</div>
</body>
