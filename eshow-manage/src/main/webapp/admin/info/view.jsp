<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="info!view" id="view" executeResult="false" />
<head>
	<title>${view.info.title}</title> 
	<meta name="description" content="相册" />
	<meta name="keywords" content="相册" />
</head>
<body>
	<div class="container mt">
		<div class="row-fluid">
			<s:include value="../left.jsp"></s:include>
			<div class="span10">
				<ul class="breadcrumb">
					<li><a href="${ctx}/admin/index">首页</a> <span class="divider">/</span></li>
					<li><a href="${ctx}/admin/info/">信息中心</a> <span class="divider">/</span></li>
					<li class="active">查看信息</li>
				</ul>
				<div class="well com"> 
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/info/add'/>"
								class="btn btn-primary"> 添加</a>
						</div>
						<h3 class="yahei">查看信息</h3>
					</div>
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="<c:url value='/admin/info'/>">信息列表</a>
					</li>
					</ul>
					<div id="accContent">
						<div class="title">
							<div class="span6">${view.info.title}</div>
							<div class="fr span3">
								<a href="<c:url value='/admin/info/edit/${view.info.id}'/>">修改</a> | <a href="javascript:window.history.back()">返回上一级</a>
							</div>
						</div>
						<div class="contxt">
							${view.info.content}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

