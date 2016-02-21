<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="topic!view" id="view" executeResult="false"></s:action>
<head>
<title>${view.topic.title }</title>
<meta name="keywords" content="${view.topic.title }" />
<meta name="description" content="${view.topic.title }" />
<link rel="stylesheet" href="${dll}/styles/topic.css" type="text/css" />
<script type="text/javascript" src="<c:url value='/scripts/delete.js'/>"></script>
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
                    <li ><a href="<c:url value='/topic/view'/>">全部话题</a></li>
                    <s:action name="board!list" id="boardList" executeResult="false" namespace="">
                        <s:param name="query.order">addTime</s:param>
                        <s:param name="query.desc">true</s:param>
                    </s:action>
                    <s:iterator value="%{#boardList.boards}" status="rowStatus">
                        <c:if test="${param.id == id}">
                            <li class="active"><a href="<c:url value="/topic/board/${id}"/>"
                                                  style="color: #0187c5; text-decoration: none;" ><strong>${name}</strong> </a>
                            </li>
                        </c:if>
                        <c:if test="${param.id != id}">
                            <li>  <a href="<c:url value="/topic/board/${id}"/>"
                                    >${name}
                            </a></li>
                        </c:if>
                    </s:iterator>
                    <li>
                        <a href="<c:url value='/topic/mine'/>">我的话题</a></li>
                </ul>

		</div>
					<div>
						<div class="fullWidth">
							 
							<div class="skyWrap">
								  
								<div class="forumview" style="margin:-20px 0px 0px -2px">
									<div class="skyWrap">
										<div class="forumview threadview forum">
											<div id="twittersUser">
												<div id="twitterTop" style="margin-bottom:20px;">
													${view.topic.title}</div>
												<ul style="margin-left:15px;margin-top: 10px;">
													<li>
														<div class="info">
															<span class="msg">${view.topic.user.nickname}&nbsp;于&nbsp;<s:date
																	name='%{#view.topic.addTime}' format="yyyy-MM-dd HH:mm" />&nbsp;&nbsp;
																分类:${view.topic.board.name} </span> <span class="tips">
																<a href="<c:url value='/topic/view/${view.topic.id}'/>"
																style="text-decoration:none;">回复(<span
																	id="count2823">${view.topic.commentSize}</span>)</a> </span>
															<c:if test="${view.topic.user.id==myid}">
																<span class="tips"> <a
																	href="<c:url value='/topic/edit/${view.topic.id}'/>"
																	class="lnk1">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
																	href="javascript:void(0);"
																	onclick="return deleteData('topic',${view.topic.id});"
																	class="lnk1">删除</a>&nbsp;&nbsp;|&nbsp;&nbsp; </span>
															</c:if>
														</div> <br />
														<div class="l" style="margin-bottom:70px">
															<ul>
																<li style="float:left;border:0px;"><c:if
																		test="${view.topic.user.photo==null}">
																		<a
																			href="<c:url value="/user/view?id=${view.topic.user.id}"/>"
																			style="text-decoration: none;"><img
																			src="${pageContext.request.contextPath}/images/base/user50-50.jpg"
																			alt="${view.topic.user.nickname}" width="50"
																			height="50" /> </a>
																	</c:if> <c:if test="${view.topic.user.photo!=null}">
																		<a
																			href="<c:url value="/user/view?id=${view.topic.user.id}"/>"
																			style="text-decoration: none;"><img
																			src="${pageContext.request.contextPath}/upload/user/<s:date name='%{#view.topic.user.addTime}' format='yyyyMMdd' />/${view.topic.user.photo}"
																			alt="${view.topic.user.nickname}" width="50"
																			height="50" /> </a>
																	</c:if>
																</li>
																<li style="float:left;display: block;">
																	${view.topic.content}</li>
															</ul>
														</div>
													</li>
												</ul>
												<div class="reply" style="clear: both"
													style="margin-left:5px;">
													<s:action name="topic-comment!search" id="topicCommentList"
														executeResult="false">
														<s:param name="queryBean.topicId">${view.topic.id }</s:param>
														<s:param name="queryBean.order">addTime</s:param>
														<s:param name="queryBean.desc">true</s:param>
													</s:action>
													<s:iterator value="%{#topicCommentList.topicComments}"
														status="rowStatus">
														<div class="commenta" id="topicComment${id}">
															<div class="commenta_avatar">
																<c:if test="${user.photo==null}">
																	<a href="<c:url value='/user/view?id=${user.id}'/>"
																		style="text-decoration: none;"><img
																		src="${pageContext.request.contextPath}/images/base/user50-50.jpg"
																		alt="${user.username }" width="50" height="50" /> </a>
																</c:if>
																<c:if test="${user.photo!=null}">
																	<a href="<c:url value='/user/view?id=${user.id}'/>"><img
																		src="${pageContext.request.contextPath}/upload/user/<s:date name='%{user.addTime}' format='yyyyMMdd' />/${user.photo}"
																		alt="${user.username}" width="50" height="50" /> </a>
																</c:if>
															</div>
															<div class="commenta_cont">
																<div class="commenta_info">
																	<span> <a
																		href="<c:url value='/user/view?id=${user.id }'/>"
																		class="lnk1">${user.nickname}</a> 于 <s:date
																			name='addTime' format="yyyy-MM-dd HH:mm" /> </span>
																	<c:if
																		test="${view.topic.user.id==myid || user.id==myid}">
																		<span class="tips" style="margin-top:-5px;"> <a
																			href="javascript:void(0);"
																			onclick="return deleteData('topicComment',${id});"
																			class="lnk1">删除</a> </span>
																	</c:if>
																</div>
																<div class="commenta_contxt">${content}</div>
															</div>
														</div>
													</s:iterator>
													<div class="comment_textarea" id="replay">
														<s:form action="topicComment!save.html"
															id="topicCommentForm" method="post">
															<input type="hidden" name="topicId"
																value="${view.topic.id}" />
															<br />
															<br />
															<div>
																<strong>回复:</strong> <input type="text"
																	name="topicComment.name" value="回复:${view.topic.title}"
																	style="width: 300px;" maxlength="100">
															</div>
															<br />
															<div>
																<script type="text/javascript">
														    KE.show({
														        id : 'ke-text'
														    });
														</script>
																<textarea id="ke-text" name="topicComment.content"
																	style="width: 600px; height: 200px;"></textarea>
															</div>
															<div class="button">
																<!-- 
														<p style="float: left">
															<span style="margin-left: 90px"></span>总共字数：
															<span style="color: Blue; margin-right: 20px">200</span>
														</p>
														 -->
																<div style="padding: 5px 0;">
																	<span class="r"><input type="submit"
																		class="botton" value="发表"
																		onMouseOut="this.className='botton';"
																		onMouseOver="this.className='botton2';" /> </span>
																</div>
															</div>
														</s:form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
		 
	</div>
</body>