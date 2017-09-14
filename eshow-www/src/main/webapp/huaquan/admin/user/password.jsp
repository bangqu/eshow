<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="user!view" id="view" executeResult="false">
</s:action>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Eshow_个人用户_修改密码</title>
		<link rel="stylesheet" href="<c:url value='/styles/profile.css'/>"
			type="text/css" />
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
		<div id="page-wrapper">
			<img alt="" src="../images/top-hr.png"
				style="height: 12px; margin-top: 10px; width: 980px;" />
			<table cellspacing="0" cellpadding="0"
				style="background: url(../images/bg-body.png) repeat-y top; width: 980px;">
				<tr>
					<td width="2"></td>
					<td valign="top"
						style="background: url(../images/bg-sec-12.png) repeat-x top; padding: 40px 40px; align: center;">
						<div>
							<div id="mainTop">
								<h3 style="margin-left: 10px;">
									<a href="<c:url value='/user'/>"
										style="cursor: pointer; text-decoration: none;">个人资料</a>
									<a href="<c:url value='/user/edit'/>"
										style="cursor: pointer; text-decoration: none;">完善资料</a>
									<a href="<c:url value='/user/setphoto'/>"
										style="cursor: pointer; text-decoration: none;">修改头像</a> 
										修改密码
									<br />
								</h3>
								<hr />
							</div>
							<s:form action="user!password.html" id="userForm" method="post"
								onsubmit="return validateForm();" validate="false">
								<input type="hidden" name="redirect" value="editpassword" />
								<input type="hidden" name="id" value="${view.user.id}" />
								<input type="hidden" name="user.username"
									value="${view.user.username}" />
								<input type="hidden" name="user.nickname"
									value="${view.user.nickname}" />
								<div id="profile_form">
									<ul>
										<li>
											<span class="l">旧&nbsp;&nbsp;密&nbsp;&nbsp;码：</span><span
												class="r"><input class="inputtext" name="oldPassword"
													id="oldPassword" style="width: 150px" maxlength="20"
													type="password" onblur="this.className='inputtext';"
													onfocus="this.className='inputtext2';" /> </span>
										</li>
										<li>
											<span class="l">新&nbsp;&nbsp;密&nbsp;&nbsp;码：</span><span
												class="r"><input class="inputtext"
													name="user.password" id="password" style="width: 150px"
													maxlength="20" type="password"
													onblur="this.className='inputtext';"
													onfocus="this.className='inputtext2';" /> </span>
										</li>
										<li>
											<span class="l">确认密码：</span><span class="r"><input
													class="inputtext" name="user.confirmPassword"
													id="confirmPassword" style="width: 150px" maxlength="20"
													type="password" onblur="this.className='inputtext';"
													onfocus="this.className='inputtext2';" /> </span>
										</li>
										<li>
											<span style="padding-left: 85px;"><input type="submit"
													class="botton" value="保存设置"
													onMouseOut="this.className='botton';"
													onMouseOver="this.className='botton2';" /> </span>
										</li>
									</ul>
								</div>
							</s:form>
						</div>
					</td>
					<td width="3"></td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0"
				style="background: url(../images/bg-btm-hr.png) repeat-y top; width: 980px; height: 9px;">
				<tr>
					<td></td>
				</tr>
			</table>
		</div>
	</body>
</html>
