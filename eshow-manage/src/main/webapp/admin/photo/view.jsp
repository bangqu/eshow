<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="photo!view" id="view" executeResult="false">
</s:action>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<c:if test="${param.id==null}">
	<script>location.href="<c:url value='/admin/album'/>";</script>
</c:if>
<c:if test="${view.photo.album==null}">
	<script>location.href="<c:url value='/admin/album'/>";</script>
</c:if>
<head>
	<title>${view.photo.name}图片</title>
	<link rel="stylesheet" href="<c:url value='/admin/styles/album.css'/>"
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
			new FormCheck('photoCommentForm');
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
					<li><a href="${ctx}/admin/photo/">图片管理</a> <span class="divider">/</span>
					</li>
					<li class="active">查看图片</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/photo/add'/>" class="btn btn-primary">发布</a>
						</div>
						<h3 class="yahei"><img src="<c:url value='/admin/images/app_list_album.gif'/>" />
							相册--${view.photo.name}</h3>
					</div>
					<div id="photo${view.photo.id}">
						<div style="margin: 10px 0 20px 0px">
							<span><a>相册：${view.photo.album.name}</a>
							</span>
							<span style="margin-left: 10px;"><a>评论:(${view.photo.commentSize})</a>
							</span>
							<span style="margin-left: 10px;"><a
								href="<c:url value='/admin/photo/edit/${view.photo.id}'/>">修改</a>
							</span>
							<span style="margin-left: 10px;"><a
								href="javascript:void(0);"
								onclick="return deleteData('photo',${view.photo.id});">删除</a> </span>
						</div>
						<div align="center">
							<img
								src="${pageContext.request.contextPath}/upload/photo/<s:date name='%{#view.photo.addTime}' format='yyyyMMdd' />/view/${view.photo.img}"
								alt="${view.photo.name}" />
						</div>
						<div style="margin-top: 5px;margin-bottom: 5px;">
							<div class="nav  bank">
								<p class="upload-time">
									照片描述：
									<span id="update_time"> ${view.photo.description} </span>
								</p>
							</div>
							<div class="nav  bank">
								<p class="upload-time">
									上传于:
									<span id="update_time"> <s:date
											name='%{#view.photo.addTime}' format='yyyy-MM-dd HH:mm' /> </span>
								</p>
								<p class="upload-time">
									作者:
									<span id="update_time">${view.photo.user.nickname}</span>
								</p>
							</div>
						</div>
						<div class="user-comment">
							<div class="replies">
								<div id="commContainer">
									<dl class="replies">
										<s:action name="photoComment!search" id="photoCommentList"
											executeResult="false">
											<s:param name="queryBean.photoId">${view.photo.id}</s:param>
											<s:param name="queryBean.desc">true</s:param>
										</s:action>
										<s:iterator value="%{#photoCommentList.photoComments}"
											status="rowStatus">
											<dd id="photoComment${id}">
												<a class="avatar" title="${user.nickname}"
													href="<c:url value='/user/index/${user.id}'/>"> <c:if
														test="${user.photo==null}">
														<img height="50" width="50" alt="${user.nickname}"
															class="avatar"
															src="${pageContext.request.contextPath}/images/base/album-50-50.jpg">
													</c:if> <c:if test="${user.photo!=null}">
														<img height="50" width="50" alt="${user.nickname}"
															class="avatar"
															src="${pageContext.request.contextPath}/upload/user/<s:date name='%{user.addTime}' format='yyyyMMdd' />/view/${user.id}-50-50.jpg">
													</c:if> </a>
												<div class="info">
													<span class="float-right"> <c:if
															test="${user.id==myid || view.photo.user.id==myid}">
															<a class="x" href="javascript:void(0)"
																onclick="deleteData('photoComment',${id});"></a>
														</c:if> </span><span class="author me"><a
														href="<c:url value='/user/index/${user.id}'/>">${user.nickname}</a>
													</span>
													<span class="time"><s:date name='%{addTime}'
															format='yyyy-MM-dd HH:mm:ss' /> </span>
												</div>
												<div class="reply">
													<p class="content">
														<span>${content}</span>
													</p>
												</div>
											</dd>
										</s:iterator>
									</dl>
								</div>
							</div>
							<s:form action="photoComment!save.html" id="photoCommentForm"
								method="post">
								<div class="commentalbum " id="comment">
									<input type="hidden" name="photoId" value="${view.photo.id}" />
									<s:action name="user!view" id="view" executeResult="false">
										<s:param name="id">${myid}</s:param>
									</s:action>
									<div class="user-avatar">
										<c:if test="${view.user.photo==null||myid=='anonymous'}">
											<img class="avatar"
												src="${pageContext.request.contextPath}/images/base/user50-50.jpg"
												alt="${view.user.nickname}">
										</c:if>
										<c:if test="${view.user.photo!=null}">
											<img class="avatar"
												src="${pageContext.request.contextPath}/upload/user/<s:date name='%{#view.user.addTime}' format='yyyyMMdd' />/view/${view.user.id}-50-50.jpg"
												alt="${view.user.nickname}" width="50" height="50">
										</c:if>
									</div>
									<div class="m-editor">
										<div>
											<textarea name="photoComment.content" id="inputBox"
												class="textarea text-input validate['required']"
												onblur="this.className='textarea';defaultText(this,'说点什么吧');"
												onfocus="this.className='textarea2';defaultText(this,'说点什么吧');"
												style="width: 380px; height: 50px;">说点什么吧</textarea>
										</div>
										<div style="margin-top: 8px;">
											<span><input type="submit" class="botton" value="发表评论"
													onmouseout="this.className='botton';"
													onmouseover="this.className='botton2';"
													onclick="cannotClick(this,'发表中...');" /> </span>
										</div>
									</div>
								</div>
							</s:form>
						</div>
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
							<img src="<c:url value='/admin/images/app_list_album.gif'/>" />
							相册--${view.photo.name}
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/album'/>">相册</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/photo'/>">图片列表</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/photo/add'/>">上传图片</a>
							</li>
						</ul>
					</div>
					<div id="photo${view.photo.id}">
						<div style="margin: 10px 0 20px 0px">
							<span><a>相册：${view.photo.album.name}</a>
							</span>
							<span style="margin-left: 10px;"><a>评论:(${view.photo.commentSize})</a>
							</span>
							<span style="margin-left: 10px;"><a
								href="<c:url value='/admin/photo/edit/${view.photo.id}'/>">修改</a>
							</span>
							<span style="margin-left: 10px;"><a
								href="javascript:void(0);"
								onclick="return deleteData('photo',${view.photo.id});">删除</a> </span>
						</div>
						<div align="center">
							<img
								src="${pageContext.request.contextPath}/upload/photo/<s:date name='%{#view.photo.addTime}' format='yyyyMMdd' />/view/${view.photo.img}"
								alt="${view.photo.name}" />
						</div>
						<div style="margin-top: 5px;margin-bottom: 5px;">
							<div class="nav  bank">
								<p class="upload-time">
									照片描述：
									<span id="update_time"> ${view.photo.description} </span>
								</p>
							</div>
							<div class="nav  bank">
								<p class="upload-time">
									上传于:
									<span id="update_time"> <s:date
											name='%{#view.photo.addTime}' format='yyyy-MM-dd HH:mm' /> </span>
								</p>
								<p class="upload-time">
									作者:
									<span id="update_time">${view.photo.user.nickname}</span>
								</p>
							</div>
						</div>
						<div class="user-comment">
							<div class="replies">
								<div id="commContainer">
									<dl class="replies">
										<s:action name="photoComment!search" id="photoCommentList"
											executeResult="false">
											<s:param name="queryBean.photoId">${view.photo.id}</s:param>
											<s:param name="queryBean.desc">true</s:param>
										</s:action>
										<s:iterator value="%{#photoCommentList.photoComments}"
											status="rowStatus">
											<dd id="photoComment${id}">
												<a class="avatar" title="${user.nickname}"
													href="<c:url value='/user/index/${user.id}'/>"> <c:if
														test="${user.photo==null}">
														<img height="50" width="50" alt="${user.nickname}"
															class="avatar"
															src="${pageContext.request.contextPath}/images/base/album-50-50.jpg">
													</c:if> <c:if test="${user.photo!=null}">
														<img height="50" width="50" alt="${user.nickname}"
															class="avatar"
															src="${pageContext.request.contextPath}/upload/user/<s:date name='%{user.addTime}' format='yyyyMMdd' />/view/${user.id}-50-50.jpg">
													</c:if> </a>
												<div class="info">
													<span class="float-right"> <c:if
															test="${user.id==myid || view.photo.user.id==myid}">
															<a class="x" href="javascript:void(0)"
																onclick="deleteData('photoComment',${id});"></a>
														</c:if> </span><span class="author me"><a
														href="<c:url value='/user/index/${user.id}'/>">${user.nickname}</a>
													</span>
													<span class="time"><s:date name='%{addTime}'
															format='yyyy-MM-dd HH:mm:ss' /> </span>
												</div>
												<div class="reply">
													<p class="content">
														<span>${content}</span>
													</p>
												</div>
											</dd>
										</s:iterator>
									</dl>
								</div>
							</div>
							<s:form action="photoComment!save.html" id="photoCommentForm"
								method="post">
								<div class="commentalbum " id="comment">
									<input type="hidden" name="photoId" value="${view.photo.id}" />
									<s:action name="user!view" id="view" executeResult="false">
										<s:param name="id">${myid}</s:param>
									</s:action>
									<div class="user-avatar">
										<c:if test="${view.user.photo==null||myid=='anonymous'}">
											<img class="avatar"
												src="${pageContext.request.contextPath}/images/base/user50-50.jpg"
												alt="${view.user.nickname}">
										</c:if>
										<c:if test="${view.user.photo!=null}">
											<img class="avatar"
												src="${pageContext.request.contextPath}/upload/user/<s:date name='%{#view.user.addTime}' format='yyyyMMdd' />/view/${view.user.id}-50-50.jpg"
												alt="${view.user.nickname}" width="50" height="50">
										</c:if>
									</div>
									<div class="m-editor">
										<div>
											<textarea name="photoComment.content" id="inputBox"
												class="textarea text-input validate['required']"
												onblur="this.className='textarea';defaultText(this,'说点什么吧');"
												onfocus="this.className='textarea2';defaultText(this,'说点什么吧');"
												style="width: 380px; height: 50px;">说点什么吧</textarea>
										</div>
										<div style="margin-top: 8px;">
											<span><input type="submit" class="botton" value="发表评论"
													onmouseout="this.className='botton';"
													onmouseover="this.className='botton2';"
													onclick="cannotClick(this,'发表中...');" /> </span>
										</div>
									</div>
								</div>
							</s:form>
						</div>
					</div>
				</div>
				<div class="c"></div>
			</div>
			<div class="c"></div>
			<div class="boxs3_rt"></div>
			<div class="boxs3_lb"></div>
			<div class="boxs3_rb"></div>
		</div>
	</div>
</body>

