<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Language" content="zh-CN" />
		<meta name="description" content="相册" />
		<meta name="keywords" content="相册" />
		<title>相册</title>
	</head>
	<body>
    <%@ include file="common/header.jsp" %>
		<div id="tldemo" style="display: none; position: absolute;">
			<img src="images/index/tl_demo.gif" />
		</div>
		<div class="s_top">
			<div class="s_logo">
				<a href=""><img
						src="images/indexlogo.gif" border="0" /> </a>
			</div>
			<div class="s_nav">
				<a href="blog.jsp" class="sub"><img
						src="images/menu_01.jpg" alt="日志" width="120"
						height="67" border="0" /> </a>
				<a href="album.jsp" class="sub"><img
						src="images/menu2_02.jpg" alt="相册" width="109"
						height="67" border="0" /> </a>
				<a href="club.jsp" class="sub"><img
						src="images/menu_03.jpg" alt="咨询社区" width="110"
						height="67" border="0" /> </a>
				<a href="service.jsp" class="sub"><img
						src="images/menu_04.jpg" alt="服务项目" width="116"
						height="67" border="0" /> </a>
				<a href="user.jsp" class="sub"><img
						src="images/menu_05.jpg" alt="员工档案" width="119"
						height="67" border="0" /> </a>
			</div>
			<div id="search2">
				<div class="login">
					<c:if test="${pageContext.request.remoteUser == null}">
						<a href="login.jsp">[登录]</a>
						<a href="signup.jsp">[注册]</a>
					</c:if>
					<c:if test="${pageContext.request.remoteUser != null}">
				欢迎：
         		<a
							href="<c:url value='/user/index/${pageContext.request.remoteUser}'/>"><authz:authentication
								operation="username" /> </a>
						<a href="ogout.jsp">退出</a>
					</c:if>
				</div>
				<input name="text" type="text" class="searchinput" value="" />
				<input name="button" type="button" class="searchbtn" />
				<div class="clear"></div>
			</div>
		</div>
		<div class="heng">
			<ul class="submenu">
				<li>
					<a href="newPhoto.html" class="sub">最新相册</a>
				</li>
				<li>
					<a href="hotPhoto.html" class="sub">热门相册</a>
				</li>
			</ul>
		</div>
		<div class="s_main">
			<div class="s_left3">
				<s:action name="album!search" id="albumList" executeResult="false">
					<s:param name="queryBean.desc">true</s:param>
					<s:param name="pagesize">9</s:param>
				</s:action>
				<ul class="newsImgHighlight">
					<s:iterator value="%{#albumList.albums}" status="rowStatus">
						<li>
							<a href="view/${id}"> <img
									src="${pageContext.request.contextPath}/upload/photo/<s:date name='%{addTime}' format='yyyyMMdd' />/${photo}" />
								<br />${name}</a>
						</li>
					</s:iterator>
				</ul>
			</div>
			<div class="s_right77">
				<div class="newsRightCol">
					<h2>
						快速导航
					</h2>
					<ul>
						<li>
							<a href="newPhoto.html" class="abzi">最新相册</a>
						</li>
						<li>
							<a href="hotPhoto.html" class="abzi">热门相册</a>
						</li>
					</ul>
					<div class="jiantou">
						<img src="images/brand/brand_17.gif" />
					</div>
				</div>
				<div class="newsRightCol">
					<h2>
						最新评论
					</h2>
					<ul>
						<li>
							<a href="#" class="abzi">为什么今年沙宣主推BOB头呢？大家发表下看法...</a>
						</li>
						<li>
							<a href="#" class="abzi">小弟秀下自己的粗作・请不要给砖头……谢谢 </a>
						</li>
						<li>
							<a href="#" class="abzi"> 来评论一下上海最有人气的发型师的作品吧！</a>
						</li>
					</ul>
					<div class="jiantou">
						<img src="images/brand/brand_17.gif" />
					</div>
				</div>
			</div>
		</div>
        <%@ include file="common/footer.jsp" %>
	</body>
</html>
