<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
<title>微博</title>
<link rel="stylesheet" href="<c:url value='/admin/styles/twitter.css'/>"
	type="text/css" />
<%@ include file="/common/validate.jsp"%>
<script type="text/javascript">
		window.addEvent('domready', function() {
			new FormCheck('twitterForm');
		});
    </script>
<script type="text/javascript">
　　function checkLength(which) {
　　var maxChars = 200;
　　if (which.value.length > maxChars)
　　which.value = which.value.substring(0,maxChars);
　　var curr = maxChars - which.value.length;
　　document.getElementById("chLeft").innerHTML = curr.toString();
    }
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
					<li class="active">添加微博</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/twitter/add'/>"
								class="btn btn-primary">添加</a>
						</div>
						<h3 class="yahei">添加微博</h3>
					</div>
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a data-toggle="tab"
							href="<c:url value='/admin/twitter'/>">微博列表</a></li>
						<li><a data-toggle="tab"
							href="<c:url value='/admin/twitter/mine'/>">我的微博</a></li>
						<li><a data-toggle="tab"
							href="<c:url value='/admin/twitter/workmate'/>">别人的微博</a></li>
					</ul>
					<form action="twitter!save" id="twitterForm" method="post">
						<div id="top">
							心情点滴，我要记录...(<span id="chLeft">200</span>/200字内)
						</div>
						<div style="padding-top: 10px;">
							<textarea class="inputtext text-input validate['required']"
								class="textarea" style="width: 400px; height: 80px;"
								name="twitter.content" id="inputBox" cols="" rows=""
								onkeyup="checkLength(this);" onblur="this.className='textarea'"
								onfocus="this.className='textarea2'" /></textarea>
							<br />
						</div>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">发表</button>
							<button class="btn" onclick="javascript:history.back();">取消</button>
						</div>
					 </form>
				</div>
				<div id="content"></div>

			</div>

		</div>
	</div>

</body>

