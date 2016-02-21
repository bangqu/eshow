<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
<title>相册</title>
<link rel="stylesheet" href="${ctx}/admin/styles/album.css"
	type="text/css" />
</head>
<body>
	<div class="container mt">
		<div class="row-fluid">
            <c:set var="current">photo</c:set>
            <%@ include file="../left.jsp"%>
			<div class="span10">
				<ul class="breadcrumb">
					<li><a href="${ctx}/admin/index">首页</a> <span class="divider">/</span>
					</li>
					<li><a href="${ctx}/admin/album/">相册</a> <span class="divider">/</span>
					</li>
					<li class="active">图片列表</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/photo/add'/>"
								class="btn btn-primary"> 添加</a>
						</div>
						<h3 class="yahei">图片列表</h3>
					</div>
					<div id="celebrity">
						<s:action name="photo!search" id="photoList" executeResult="false">
							<s:param name="query.order">addTime</s:param>
							<s:param name="query.desc">true</s:param>
							<s:param name="pagesize">20</s:param>
						</s:action>
						<ul>
							<s:iterator value="%{#photoList.photos}" status="rowStatus">
								<li style="background-color: #f9f9f9"
									onmouseover="this.style.backgroundColor='#f9e0e0';"
									onmouseout="this.style.backgroundColor='#f9f9f9';"
									id="photo${id}">
									<div align="center">
										<a href="<c:url value='/admin/photo/view/${id}'/>"><img
											width="120"
											src="${pageContext.request.contextPath}/upload/photo/<s:date name='%{addTime}' format='yyyyMMdd' />/${img}"
											alt="${name}" /> </a>
									</div>
									<div class="cont" style="color: #999;" align="center">
										<s:date name='%{addTime}' format='yyyy-MM-dd' />
										<br /> ${name} <br /> <a
											href="<c:url value='/admin/photo/edit/${id}'/>">修改</a>| <a
											href="${ctx }/photo!delete.action?id=${id}"
											onclick="return deleteData('photo',${id});">删除</a>
									</div>
									<div class="c"></div></li>
							</s:iterator>
						</ul>
						<div class="c"></div>
						<%@ include file="/common/page.jsp"%>
						<div class="c"></div>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>

