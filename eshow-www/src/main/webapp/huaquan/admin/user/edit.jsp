<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="user!view" id="view" executeResult="false">
</s:action>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Eshow_个人用户_完善资料</title>
		<link rel="stylesheet" href="<c:url value='/styles/profile.css'/>"
			type="text/css" />
		<link rel="stylesheet" type="text/css" media="all"
			href="<c:url value='/scripts/calendar/calendar-blue.css'/>"
			title="calendar-win2k-1" />
		<script type="text/javascript"
			src="<c:url value='/scripts/calendar/calendar.js'/>"></script>
		<script type="text/javascript"
			src="<c:url value='/scripts/calendar/lang/calendar-zh_utf8.js'/>"></script>
		<script type="text/javascript"
			src="<c:url value='/scripts/calendar/calendar-setup.js'/>"></script>
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
										完善资料
									<a href="<c:url value='/user/setphoto'/>"
										style="cursor: pointer; text-decoration: none;">修改头像</a>
									<a href="<c:url value='/user/editpassword'/>"
										style="cursor: pointer; text-decoration: none;">修改密码</a>
									<br />
								</h3>
								<hr />
							</div>
							<s:form action="user!update.html" id="userForm" method="post"
								validate="false">
								<input type="hidden" name="id" value="${view.user.id}" />
								<s:hidden name="user.username" value="%{#view.user.username}"></s:hidden>
								<s:hidden name="user.password" value="password"></s:hidden>
								<s:hidden name="user.confirmPassword" value="password"></s:hidden>
								<div id="profile_form">
									<ul>
										<li>
											<span class="l">用户名：</span><span class="r">${view.user.username}</span>
										</li>
										<li>
											<span class="l">真实姓名：</span><span class="r"><input
													class="inputtext" name="user.realname" id="realname"
													style="width: 150px" value="${view.user.realname}"
													maxlength="20" type="text"
													onblur="this.className='inputtext';"
													onfocus="this.className='inputtext2';" /> </span>
										</li>
										<li>
											<span class="l">昵称：</span><span class="r"><input
													class="inputtext" name="user.nickname" id="nickname"
													style="width: 150px" value="${view.user.nickname }"
													maxlength="20" type="text"
													onblur="this.className='inputtext';"
													onfocus="this.className='inputtext2';" /> </span>
										</li>
										<li>
											<span class="l">性别：</span><span class="r"><select
													id="male" style="width: 8em;" name="user.male">
													<option value="true" ${view.user.male?"selected='selected'":" "}>
														男
													</option>
													<option value="false"
														${!view.user.male?"selected='selected'":" "}>
														女
													</option>

												</select> </span>
										</li>
										<li>
											<span class="l">出生日期：</span><span class="r"> 
												<input
													class="inputtext" name="user.birthday" id="birthday"
													style="width: 100px" type="text"
													value="${view.user.birthday }" style="width:183px"
													onblur="this.className='inputtext'"
													onfocus="this.className='inputtext2'" />&nbsp; 
													<a
													href="javascript:;"><img
														id="triggerBirthdayTime"
														src="<c:url value='/scripts/calendar/img.gif'/>" border="0"
														align="middle"></a>
											</span>
										</li>
										<li>
											<span class="l">年龄：</span><span class="r"><input
													class="inputtext" name="user.age" id="age"
													style="width: 100px" value="${view.user.age }"
													maxlength="20" type="text"
													onblur="this.className='inputtext';"
													onfocus="this.className='inputtext2';" /> </span>
										</li>
										<li>
											<span class="l">血型：</span><span class="r"> <select
													id="bloodType" style="width: 8em;" name="user.bloodType">
													<option value="1" ${view.user.bloodType==1?
														"selected='selected'":""}>
														A型
													</option>
													<option value="2" ${view.user.bloodType==2?
														"selected='selected'":""}>
														B型
													</option>
													<option value="3" ${view.user.bloodType==3?
														"selected='selected'":""}>
														AB型
													</option>
													<option value="4" ${view.user.bloodType==4?
														"selected='selected'":""}>
														O型
													</option>
												</select> </span>
										</li>
										<li>
											<span class="l">星座：</span><span class="r"> <select
													id="constellation" style="width: 8em;"
													name="user.constellation">
													<option value="1" ${view.user.constellation==1?
														"selected='selected'":""}>
														白羊座
													</option>
													<option value="2" ${view.user.constellation==2?
														"selected='selected'":""}>
														金牛座
													</option>
													<option value="3" ${view.user.constellation==3?
														"selected='selected'":""}>
														双子座
													</option>
													<option value="4" ${view.user.constellation==4?
														"selected='selected'":""}>
														巨蟹座
													</option>
													<option value="5" ${view.user.constellation==5?
														"selected='selected'":""}>
														狮子座
													</option>
													<option value="6" ${view.user.constellation==6?
														"selected='selected'":""}>
														处女座
													</option>
													<option value="7" ${view.user.constellation==7?
														"selected='selected'":""}>
														天秤座
													</option>
													<option value="8" ${view.user.constellation==8?
														"selected='selected'":""}>
														天蝎座
													</option>
													<option value="9" ${view.user.constellation==9?
														"selected='selected'":""}>
														射手座
													</option>
													<option value="10" ${view.user.constellation==10?
														"selected='selected'":""}>
														摩羯座
													</option>
													<option value="11" ${view.user.constellation==11?
														"selected='selected'":""}>
														水瓶座
													</option>
													<option value="12" ${view.user.constellation==12?
														"selected='selected'":""}>
														双鱼座
													</option>
												</select> </span>
										</li>
										<li>
											<span class="l">生肖：</span><span class="r"> <select
													id="birthAttrib" style="width: 8em;"
													name="user.birthAttrib">
													<option value="1" ${view.user.birthAttrib==1?
														"selected='selected'":""}>
														鼠
													</option>
													<option value="2" ${view.user.birthAttrib==2?
														"selected='selected'":""}>
														牛
													</option>
													<option value="3" ${view.user.birthAttrib==3?
														"selected='selected'":""}>
														虎
													</option>
													<option value="4" ${view.user.birthAttrib==4?
														"selected='selected'":""}>
														兔
													</option>
													<option value="5" ${view.user.birthAttrib==5?
														"selected='selected'":""}>
														龙
													</option>
													<option value="6" ${view.user.birthAttrib==6?
														"selected='selected'":""}>
														蛇
													</option>
													<option value="7" ${view.user.birthAttrib==7?
														"selected='selected'":""}>
														马
													</option>
													<option value="8" ${view.user.birthAttrib==8?
														"selected='selected'":""}>
														羊
													</option>
													<option value="9" ${view.user.birthAttrib==9?
														"selected='selected'":""}>
														猴
													</option>
													<option value="10" ${view.user.birthAttrib==10?
														"selected='selected'":""}>
														鸡
													</option>
													<option value="11" ${view.user.birthAttrib==11?
														"selected='selected'":""}>
														狗
													</option>
													<option value="12" ${view.user.birthAttrib==12?
														"selected='selected'":""}>
														猪
													</option>
												</select> </span>
										</li>
										<li>
											<span class="l">婚烟状况：</span><span class="r"> <select
													id="marital" style="width: 8em;" name="user.marital">
													<option value="1" ${view.user.marital==1?
														"selected='selected'":""}>
														单身
													</option>
													<option value="2" ${view.user.marital==2?
														"selected='selected'":""}>
														已婚
													</option>
													<option value="3" ${view.user.marital==3?
														"selected='selected'":""}>
														恋爱
													</option>
													<option value="4" ${view.user.marital==4?
														"selected='selected'":""}>
														离异
													</option>
												</select> </span>
										</li>
										<li>
											<span class="l">自我介绍：</span>
											<textarea cols="60" rows="6" id="intro" name="user.intro">${view.user.intro}</textarea>

										</li>
										<li>
											<span class="l">爱好：</span>
											<textarea cols="60" rows="6" id="hobby" name="user.hobby">${view.user.hobby}</textarea>

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
		<script type="text/javascript">
	var MINUTE = 60 * 1000;
	var HOUR = 60 * MINUTE;
	var DAY = 24 * HOUR;

	Calendar.setup( {
		inputField : "birthday",
		button : "triggerBirthdayTime"
	});
	
</script>
	</body>
</html>
