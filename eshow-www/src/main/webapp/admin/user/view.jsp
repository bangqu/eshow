<br><%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="user!view" id="view" executeResult="false">
    <s:param name="id">${myid}</s:param>
</s:action>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<head>
	<title>查看${view.user.nickname}的信息</title>
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
					<li><a href="${ctx}/admin/user/">用户管理</a> <span class="divider">/</span></li>
					<li class="active">查看用户</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/user/add'/>" class="btn btn-primary">添加</a>
						</div>
						<h3 class="yahei">用户管理</h3>
					</div>
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a data-toggle="tab"
							href="<c:url value='/admin/user'/>">用户列表</a></li>
						<li><a data-toggle="tab"
							href="<c:url value='/admin/user/edit'/>">修改资料</a></li>
						<li><a data-toggle="tab"
							href="<c:url value='/admin/user/password'/>">修改密码</a></li>
						<li><a data-toggle="tab"
							href="<c:url value='/admin/user/setphoto'/>">修改头像</a></li>
					</ul>
					<div id="profile_form" algin="center">
						<%@ include file="/common/messages.jsp"%>
						<br />
						<table border="1" bordercolor="red">
							<tr>
								<td rowspan="13" align="top">
									<span class="l">头像更改：</span><span class="r"> <c:if
											test="${view.user.photo==null}">
											<a href="<c:url value="/admin/user/setphoto/${view.user.id}"/>"><img
													src="${pageContext.request.contextPath}/common/images/user50-50.jpg"
													alt="${view.user.nickname}" /> </a>
										</c:if> <c:if test="${view.user.photo!=null}">
											<a href="<c:url value="/admin/user/setphoto/${view.user.id}"/>"><img
													src="${pageContext.request.contextPath}/upload/user/<s:date name='%{#view.user.addTime}' format='yyyyMMdd' />/${view.user.photo}<%=Math.round(Math.random() * 100000)%>"
													alt="${view.user.nickname}" width="50" height="50" /> </a>
										</c:if> </span>
								</td>
								<td width="300">
									<span class="l">注册邮箱：</span><span class="r">${view.user.username}</span>
								</td>
								<td width="300">
									<span class="l">姓名：</span><span class="r">${view.user.username
										}</span>
								</td>
							</tr>
							<tr>
								<td>
									<span class="l">昵称：</span><span class="r">${view.user.nickname
										} </span>
								</td>
								<td>
									<span class="l">性别：</span><span class="r">
										${view.user.male?"男":"女"}</span>
								</td>
							</tr>
							<tr>
								<td>
									<span class="l">出生日期：</span><span class="r">${view.user.birthday
										}</span>
								</td>
								<td>
									<span class="l">年龄：</span><span class="r">${view.user.age
										}</span>
								</td>
							</tr>
							<tr>
								<td>
									<span class="l">血型：</span><span class="r"><s:if
											test="%{#view.user.bloodType==1}">A型</s:if> <s:elseif
											test="%{#view.user.bloodType==2}">B型</s:elseif> <s:elseif
											test="%{#view.user.bloodType==3}">AB型</s:elseif> <s:elseif
											test="%{#view.user.bloodType==4}">O型</s:elseif> </span>
								</td>
								<td>
									<span class="l">星座：</span><span class="r"> <s:if
											test="%{#view.user.constellation==1}">白羊座</s:if> <s:elseif
											test="%{#view.user.constellation==2}">金牛座</s:elseif> <s:elseif
											test="%{#view.user.constellation==3}">双子座</s:elseif> <s:elseif
											test="%{#view.user.constellation==4}">巨蟹座</s:elseif> <s:elseif
											test="%{#view.user.constellation==5}">狮子座</s:elseif> <s:elseif
											test="%{#view.user.constellation==6}">处女座</s:elseif> <s:elseif
											test="%{#view.user.constellation==7}">天秤座</s:elseif> <s:elseif
											test="%{#view.user.constellation==8}">天蝎座</s:elseif> <s:elseif
											test="%{#view.user.constellation==9}">射手座</s:elseif> <s:elseif
											test="%{#view.user.constellation==10}">摩羯座</s:elseif> <s:elseif
											test="%{#view.user.constellation==11}">水瓶座</s:elseif> <s:elseif
											test="%{#view.user.constellation==12}">双鱼座</s:elseif> </span>
								</td>
							</tr>
							<tr>
								<td>
									<span class="l">属相：</span><span class="r"> <s:if
											test="%{#view.user.birthAttrib==1}">鼠</s:if> <s:elseif
											test="%{#view.user.birthAttrib==2}">牛</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==3}">虎</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==4}">兔</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==5}">龙</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==6}">蛇</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==7}">马</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==8}">羊</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==9}">猴</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==10}">鸡</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==11}">狗</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==12}">猪</s:elseif> </span>
								</td>
								<td>
									<span class="l">婚烟状况：</span><span class="r"> <s:if
											test="%{#view.user.marital==1}">单身</s:if> <s:elseif
											test="%{#view.user.marital==2}">已婚</s:elseif> <s:elseif
											test="%{#view.user.marital==3}">恋爱</s:elseif> <s:elseif
											test="%{#view.user.marital==4}">离异</s:elseif>
									</span>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<span class="l">自我介绍：</span><span>${view.user.intro }</span>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td colspan="2">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<span class="l">爱好：</span><span>${view.user.hobby }</span>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									&nbsp;
								</td>
							</tr>
						</table>
					</div>
					</div>
				</div>
			</div>
		</div>
</body>

