<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="user!view" id="view" executeResult="false" />
<head>
	<title>Eshow_个人用户_查看${view.user.nickname}的信息</title>
	<link rel="stylesheet" href="<c:url value='/styles/user.css'/>"
		type="text/css" />
</head>
<body>
	<div id="page-wrapper">
		<img alt="" src="<c:url value='/images/top-hr.png'/>"
			style="height: 12px; margin-top: 10px; width: 980px;" />
		<table cellspacing="0" cellpadding="0"
			style="background: url(<c:url value ='/images/bg-body.png'/>) repeat-y top; width: 980px;">
			<tr>
				<td width="2"></td>
				<td valign="top"
					style="background: url(<c:url value ='/images/bg-sec-12.png'/>) repeat-x top; padding: 40px 40px; align: center;">
					<div>
						<div id="mainTop">
							<h3 style="margin-left: 10px;">
								${view.user.nickname}的资料
								<a href="<c:url value='/user/setphoto'/>" style="cursor: pointer;">修改头像</a>
								<a href="<c:url value='/user/edit'/>" style="cursor: pointer;">完善资料</a>
								<a href="<c:url value='/user/editpassword'/>"
									style="cursor: pointer;">修改密码</a>
								<br />
							</h3>
							<hr />
						</div>
						<%@ include file="/common/messages.jsp"%>
						<br />
						<s:form name="signupForm" theme="xhtml">
							<div id="register"
								style="marign: 20px 20px 20px 20px; width: 800px;">
								<ul class="txtul">
									<li>
										<span class="l">用&nbsp;户&nbsp;名：</span>
										<span class="r"> ${view.user.username} </span>
									</li>
									<li>
										<span class="l">真实姓名：</span>
										<span class="r"> ${view.user.realname} </span>
									</li>
									<li>
										<span class="l">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</span>
										<span class="r"> ${view.user.nickname} </span>
									</li>
									<li>
										<span class="l">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</span>
										<span class="r"> <s:if test="%{#view.user.male==true}">男</s:if>
											<s:elseif test="%{#view.user.male==false}">女</s:elseif> </span>
									</li>
									<li>
										<span class="l">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</span>
										<span class="r"> ${view.user.age} </span>
									</li>
									<li>
										<span class="l">出生年月：</span>
										<span class="r"> ${view.user.birthday} </span>
									</li>
									<li>
										<span class="l">注册邮箱：</span>
										<span class="r"> ${view.user.email} </span>
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
			style="background: url(<c:url value ='/images/bg-btm-hr.png'/>) repeat-y top; width: 980px; height: 9px;">
			<tr>
				<td></td>
			</tr>
		</table>
	</div>
</body>
