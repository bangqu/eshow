<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="user!view" id="view" executeResult="false">
</s:action>
<head>
	<title>修改密码</title>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/profile.css'/>" type="text/css" />
	<script>
		function validateForm()
		{
			if($("oldPassword").value.length == 0){
		            alert("请输入旧密码！");
		            $("oldPassword").focus();
		            return false;
		        }
		    if($("user.password").value.length == 0){
		            alert("请输入新密码！");
		            $("user.password").focus();
		            return false;
		        }
		    if($("user.confirmPassword").value.length == 0){
		            alert("请再次输入新密码！");
		            $("user.confirmPassword").focus();
		            return false;
		        }
		        if($("user.password").value!= $("user.confirmPassword").value){
		        	alert("确认新密码应和新密码相同！");
		            $("user.confirmPassword").focus();
		            return false;
		        }
		        return true;
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
					<li><a href="${ctx}/admin/user/">用户管理</a> <span class="divider">/</span></li>
					<li class="active">修改密码</li>
				</ul>


				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/user/add'/>" class="btn btn-primary">添加</a>
						</div>
						<h3 class="yahei">修改资料</h3>
					</div>

					<div class="navbar">
			          <div class="navbar-inner"> 
						<ul class="nav">
							<li><a href="<c:url value='/admin/user'/>">用户列表</a></li>
							<li><a href="<c:url value='/admin/user/edit'/>">修改资料</a></li>
							<li class="active"><a data-toggle="tab" href="<c:url value='/admin/user/password'/>">修改密码</a></li>
							<li><a href="<c:url value='/admin/user/setphoto'/>">修改头像</a></li>
						</ul>
					</div>
				</div>
						<%@ include file="/common/messages.jsp"%>
						<form class="form-horizontal"  action="user!password" id="userForm" method="post" validate="false">
							<input type="hidden" name="redirect" value="admin/user/" />
							<input type="hidden" name="id" value="${view.user.id}" />
							<input type="hidden" name="user.username"
								value="${view.user.username}" />
							<input type="hidden" name="user.nickname"
								value="${view.user.nickname}" />
							<fieldset>
								<div class="control-group">
									<label class="control-label" for="input01" >旧密码</label>
									<div class="controls">
										<input type="text" class="input-xlarge" name="oldPassword" id="oldPassword" >
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="input01" >新密码</label>
									<div class="controls">
										<input type="text" class="input-xlarge"  name="user.password" id="password">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="input01" >确认密码</label>
									<div class="controls">
										<input type="password" class="input-xlarge" name="user.confirmPassword"
											id="confirmPassword"  >
									</div>
								</div>
								<div class="form-actions">
									<button type="submit" class="btn btn-primary">保存</button>
									<button class="btn">取消</button>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>

