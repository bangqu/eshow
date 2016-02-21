<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="title">用户管理</c:set>
<c:set var="title1">修改用户</c:set>
<s:action name="user!view" id="view" executeResult="false">
</s:action>
<head>
	<title>修改资料</title>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/profile.css'/>" type="text/css" />
</head>
<body>
	<div class="container mt">
		<div class="row-fluid">
			<s:include value="../left.jsp"></s:include>
			<div class="span10">
				<ul class="breadcrumb">
					<li><a href="${ctx}/admin/index">首页</a> <span class="divider">/</span>
					</li>
					<li><a href="${ctx}/admin/user/">${title}</a> <span class="divider">/</span></li>
					<li class="active">${title1}</li>
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
							<li  class="active"><a href="<c:url value='/admin/user/edit'/>">修改资料</a></li>
							<li><a href="<c:url value='/admin/user/password'/>">修改密码</a></li>
							<li><a href="<c:url value='/admin/user/setphoto'/>">修改头像</a></li>
			                </ul>
			              </div>
			            </div>


						<%@ include file="/common/messages.jsp"%>
						
						<input type="hidden" name="id" value="${view.user.id}" />
						<s:hidden name="user.username" value="%{#view.user.username}"></s:hidden>
						<s:hidden name="user.password" value="password"></s:hidden>
						<s:hidden name="user.confirmPassword" value="password"></s:hidden>
						<form class="form-horizontal" action="user!update" id="userForm" method="post" validate="false">
							<fieldset>
								<div class="control-group">
									<label class="control-label" for="input01" >登录名称</label>
									<div class="controls">
										<input type="text" class="input-xlarge" id="title" name="user.username" value="${view.user.username}">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="input01" >昵称</label>
									<div class="controls">
										<input type="text" class="input-xlarge" id="title" name="user.nickname" value="${view.user.nickname }">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="input01" >真实姓名</label>
									<div class="controls">
										<input type="text" class="input-xlarge" id="title" name="user.realname" value="${view.user.realname}">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="fileInput">头像更改</label>
									<div class="controls">
									<c:if test="${view.user.photo==null}">
										<a
											href="<c:url value='/admin/user/setphoto/${view.user.id}'/>"><img
											src="${pageContext.request.contextPath}/common/images/user50-50.jpg"
											alt="${view.user.nickname}" width="50" height="50" /> </a>
									</c:if>
									<c:if test="${view.user.photo!=null}">
										<a
											href="<c:url value='/admin/user/setphoto/${view.user.id}'/>"><img
											src="${pageContext.request.contextPath}/upload/user/<s:date name='%{#view.user.addTime}' format='yyyyMMdd' />/${view.user.photo}<%=Math.round(Math.random() * 100000)%>">
										</a>
									</c:if>
									<input class="input-file" id="fileInput" type="file" name="user.photo" value="${view.user.photo }">
									</div>
								</div>

							<div class="control-group">
								<label class="control-label" for="select01">性别</label>
								<div class="controls">
									<select id="male" style="width: 8em;" name="user.male">
										<option value="1" ${view.user.male?"selected='selected'":" "}>
											男</option>
										<option value="0" ${!view.user.male?"selected='selected'":" "}>
											女</option>

									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input01">出生日期</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="title"
										name="user.birthday" value="${view.user.birthday}">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input01">年龄</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="title"
										name="user.age" value="${view.user.age}">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="select01">血型</label>
								<div class="controls">
									<select id="bloodType" style="width: 8em;" name="user.bloodType">
										<option value="1" ${view.user.marital==1? "selected='selected'":""}>
											A型</option>
										<option value="2" ${view.user.marital==2? "selected='selected'":""}>
											B型</option>
										<option value="3" ${view.user.marital==3? "selected='selected'":""}>
											AB型</option>
										<option value="4" ${view.user.marital==4? "selected='selected'":""}>
											O型</option>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="select01">星座</label>
								<div class="controls">
									<select id="constellation" style="width: 8em;"
										name="user.constellation">
										<option value="1" ${view.user.constellation==1?
											"selected='selected'":""}>白羊座</option>
										<option value="2" ${view.user.constellation==2?
											"selected='selected'":""}>金牛座</option>
										<option value="3" ${view.user.constellation==3?
											"selected='selected'":""}>双子座</option>
										<option value="4" ${view.user.constellation==4?
											"selected='selected'":""}>巨蟹座</option>
										<option value="5" ${view.user.constellation==5?
											"selected='selected'":""}>狮子座</option>
										<option value="6" ${view.user.constellation==6?
											"selected='selected'":""}>处女座</option>
										<option value="7" ${view.user.constellation==7?
											"selected='selected'":""}>天秤座</option>
										<option value="8" ${view.user.constellation==8?
											"selected='selected'":""}>天蝎座</option>
										<option value="9" ${view.user.constellation==9?
											"selected='selected'":""}>射手座</option>
										<option value="10" ${view.user.constellation==10?
											"selected='selected'":""}>摩羯座</option>
										<option value="11" ${view.user.constellation==11?
											"selected='selected'":""}>水瓶座</option>
										<option value="12" ${view.user.constellation==12?
											"selected='selected'":""}>双鱼座</option>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="select01">属相</label>
								<div class="controls">
									<select id="birthAttrib" style="width: 8em;"
										name="user.birthAttrib">
										<option value="1" ${view.user.birthAttrib==1?
											"selected='selected'":""}>鼠</option>
										<option value="2" ${view.user.birthAttrib==2?
											"selected='selected'":""}>牛</option>
										<option value="3" ${view.user.birthAttrib==3?
											"selected='selected'":""}>虎</option>
										<option value="4" ${view.user.birthAttrib==4?
											"selected='selected'":""}>兔</option>
										<option value="5" ${view.user.birthAttrib==5?
											"selected='selected'":""}>龙</option>
										<option value="6" ${view.user.birthAttrib==6?
											"selected='selected'":""}>蛇</option>
										<option value="7" ${view.user.birthAttrib==7?
											"selected='selected'":""}>马</option>
										<option value="8" ${view.user.birthAttrib==8?
											"selected='selected'":""}>羊</option>
										<option value="9" ${view.user.birthAttrib==9?
											"selected='selected'":""}>猴</option>
										<option value="10" ${view.user.birthAttrib==10?
											"selected='selected'":""}>鸡</option>
										<option value="11" ${view.user.birthAttrib==11?
											"selected='selected'":""}>狗</option>
										<option value="12" ${view.user.birthAttrib==12?
											"selected='selected'":""}>猪</option>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="select01">婚烟状况</label>
								<div class="controls">
									<select id="marital" style="width: 8em;" name="user.marital">
										<option value="1" ${view.user.marital==1? "selected='selected'":""}>
											单身</option>
										<option value="2" ${view.user.marital==2? "selected='selected'":""}>
											已婚</option>
										<option value="3" ${view.user.marital==3? "selected='selected'":""}>
											恋爱</option>
										<option value="4" ${view.user.marital==4? "selected='selected'":""}>
											离异</option>
									</select>
								</div>
							</div>
								<div class="control-group">
									<label class="control-label" for="textarea">自我介绍</label>
									<div class="controls">
										<textarea class="input-xlarge" id="textarea" rows="3" name="user.intro">${view.user.intro }</textarea>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="textarea">爱好</label>
									<div class="controls">
										<textarea class="input-xlarge" id="textarea" rows="3" name="user.hobby">${view.user.hobby }</textarea>
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

