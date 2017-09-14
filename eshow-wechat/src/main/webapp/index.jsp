<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title>首页</title>
	<meta name="description" content="EShow框架采用流行的J2EE轻量级框架（Struts2+Spring +Hibernate），基于国外开源框架Appfuse，我们可以简称Appfuse中文加强版。" />
	<meta name="keywords" content="EShow,EShow开源网站,开源框架,ssh,轻量级框架" />
</head>
<body>
<!-- banner -->
<c:set var="current">index</c:set>
<div class="bannerbox eshow_top">
	<div class="banner">
		<div class="banner_bd">
			<div class="banner_hd">
				<span>覆盖Web,Android,iOS<em>一站式移动开发框架</em></span>
			</div>
			<p class="banner_tip">功能齐全，移动开发团队优秀选择</p>
			<div class="banner_btn">
				<input type="button" value="开始使用" onclick="window.open('https://github.com/bangqu','_blank')"/>
			</div>
		</div>
		<div class="frame">
			<p>支持多平台框架</p>
			<div class="frame_dis">
				<ul class="frame_block">
					<li>
						<p><a href="${ctx}/frame/web?active=frame"><img src="${dll}/www/images/web.png"></a></p>
						<p><a href="${ctx}/frame/web?active=frame">eshow web</a></p>
					</li>
					<li>
						<p><a href="${ctx}/frame/android?active=frame"><img src="${dll}/www/images/android.png"></a></p>
						<p><a href="${ctx}/frame/android?active=frame">eshow-android</a></p>
					</li>
					<li>
						<p><a href="${ctx}/frame/ios?active=frame"><img src="${dll}/www/images/ios.png"></a></p>
						<p><a href="${ctx}/frame/ios?active=frame">EShowIOS</a></p>
					</li>
					<li>
						<p><a href="${ctx}/frame/html5?active=frame"><img src="${dll}/www/images/h5.png"></a></p>
						<p><a href="${ctx}/frame/html5?active=frame">EShowUI</a></p>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- content -->
<div class="eshow_functionbox">
	<div class="eshow_function">
		<div class="function_dis">
			<div class="function_left"><img src="${dll}/www/images/technology.png"></div>
			<div class="fucntion_right">
				<p><span class="function_title">技术领先</span></p>
				<p><span>采用流行的J2EE轻量级框架（Struts2+Spring+Hibernate），基于国外开源框架Appfuse，我们可以简称Appfuse中文加强版。</span></p>
			</div>
		</div>
		<div class="function_dis clear_right">
			<div class="function_left"><img src="${dll}/www/images/simple.png"></div>
			<div class="fucntion_right">
				<p><span class="function_title">简单易用</span></p>
				<p><span>代码中的示例，都是开发最常用的的功能，为新手着想，非常简单，非常易用！</span></p>
			</div>
		</div>
		<div class="function_dis">
			<div class="function_left"><img src="${dll}/www/images/development.png"></div>
			<div class="fucntion_right">
				<p><span class="function_title">快速开发</span></p>
				<p><span>使用EShow框架开发，可以快速开发出中小型网站和APP应用。</span></p>
			</div>
		</div>
		<div class="function_dis clear_right">
			<div class="function_left"><img src="${dll}/www/images/source.png"></div>
			<div class="fucntion_right">
				<p><span class="function_title">完全开源</span></p>
				<p><span>基于Github完全开放EShow的每一个细节！</span></p>
			</div>
		</div>
		<div class="function_dis">
			<div class="function_left"><img src="${dll}/www/images/update.png"></div>
			<div class="fucntion_right">
				<p><span class="function_title">更新迅速</span></p>
				<p><span>全职与兼职团队会每一天更新EShow平台，使得EShow越来越好！</span></p>
			</div>
		</div>
		<div class="function_dis clear_right">
			<div class="function_left"><img src="${dll}/www/images/ideal.png"></div>
			<div class="fucntion_right">
				<p><span class="function_title">理想远大 </span></p>
				<p><span>让EShow平台成为移动开发团队入门者的必备学习框架，成为一个流行的移动开发框架。</span></p>
			</div>
		</div>
	</div>
</div>

<%@ include file="/common/scripts.jsp"%>
<script type="text/javascript">
	if(${current=='index'}){
		$("[pr='index']").addClass("nav_active");
	}
</script>
</body>
