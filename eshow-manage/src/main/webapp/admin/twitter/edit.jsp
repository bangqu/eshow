<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="twitter!view" id="view" executeResult="false"></s:action>
<head>
	<title>微博客</title>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/twitter.css'/>" type="text/css" />
	<%@ include file="/common/validate.jsp"%>
	<script type="text/javascript">
		window.addEvent('domready', function() {
			new FormCheck('twitterForm');
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
						class="divider">/</span>
					</li>
					<li class="active">修改微博</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/twitter/add'/>" class="btn btn-primary">添加</a>
						</div>
						<h3 class="yahei">修改微博</h3>
					</div>
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="<c:url value='/admin/twitter'/>">微博列表</a></li>
						<li><a data-toggle="tab" href="<c:url value='/admin/twitter/mine'/>">我的微博</a></li>
						<li><a data-toggle="tab" href="<c:url value='/admin/twitter/workmate'/>">别人的微博</a></li>
					</ul>
					<div id="content">
						<s:form  class="form-horizontal" action="twitter!update.html" id="twitterForm"
							method="post">
							<input type="hidden" name="id" value="${view.twitter.id}" />
							<div id="top">
								心情点滴，我要记录...（200字内）
							</div>
							<div style="padding-top: 10px;">
								<textarea class="inputtext text-input validate['required']" style="width: 400px; height: 80px;"
									name="twitter.content" id="inputBox" onkeyup="keyup(200)"
									onblur="this.className='textarea'"
									onfocus="this.className='textarea2'" />${view.twitter.content}</textarea>
							</div>
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">修改</button>
								<button class="btn" onclick="javascript:history.back();">取消</button>
							</div>
						</s:form>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>

