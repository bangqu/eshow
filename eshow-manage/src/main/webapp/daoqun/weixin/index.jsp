<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
<title>移动互联网_到群软件</title>
<%@ include file="../common/yunshipei.jsp"%>
<meta name="keywords" content="移动互联网，到群软件" />
<meta name="description" content="移动互联网，到群软件" />
</head>
<script src="./scripts/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="./styles/style.css"/>
<script>
	$(function() {
		$("div [id^='tabcc_']").each(function(i, ob) {
			$(ob).find('a').bind('click', function() {
				$(ob).find('a').removeClass('on');
				$(this).addClass('on');
				var cid = $(this).attr('cid');
				$(ob).siblings('div').hide();
				$(ob).siblings("div[id='courseList_" + cid + "']").show();
			});
		});
	});
</script>
<body>
	<c:set var="current">app</c:set>
	<%@ include file="common/header.jsp"%>
	<div class="wapper clearfix phone">
		<h3 class="yahei text-center">语音/照片/视频领域APP解决方案</h3>
		<div class="core clearfix">
			<div class="c_box yahei" id="tabcc_0">
				<a href="javascript:;" cid="01" class="on"> <img
					src="./images/app/voice-btn.png"> <span>语音</span> </a> <a
					href="javascript:;" cid="02"> <img
					src="./images/app/photo-btn.png"> <span>照片</span> </a> <a
					href="javascript:;" cid="03"> <img
					src="./images/app/video-btn.png"> <span>视频</span> </a>
			</div>
			<div id="courseList_01">
				<div class="text clearfix">
					<h3 class="yahei">语音类</h3>
					<p style="width:700px;" class="fl">专注语音，提供包含声音滤镜类应用开发。</p>
					<p style="width:700px;" class="fl">&nbsp;</p>
					<p style="width:700px;" class="fl">团队长期从事语音类应用开发，在包含语音采集，回音消除，噪声抑制，静音监测，编码，网络传输，解码，抖动缓冲，混音，滤镜具有经验积累。</p>
					<img src="./images/app/voice-right.jpg" class="fr">
				</div>
				<div class="text clearfix">
					<dl class="fl">
						<dt class="yahei">为客户提供</dt>
						<dd>iPhone、Android、iPad等版本开发。</dd>
					</dl>
					<dl class="fr">
						<dt class="yahei">更多了解</dt>
						<dd>请索取我们的PPT详细介绍文件。</dd>
					</dl>
				</div>
			</div>
			<div id="courseList_02" class="none">
				<div class="text clearfix">
					<h3 class="yahei">照片类</h3>
					<p style="width:700px;" class="fl">专注照片，提供包含图片滤镜类应用开发</p>
					<p style="width:700px;" class="fl">&nbsp;</p>
					<p style="width:700px;" class="fl">可实现LOMO，黑白，复古，哥特，锐色，淡雅，胶片，都市，下午茶，NYC，重庆森林，时刻，静默，乡村，怀旧，光阴，1Q84，湖水，迷失等等滤镜效果。</p>
					<img src="./images/app/photo-right.jpg" class="fr">
				</div>
				<div class="text clearfix">
					<dl class="fl">
						<dt class="yahei">为客户提供</dt>
						<dd>iPhone、Android、iPad等版本开发。</dd>
					</dl>
					<dl class="fr">
						<dt class="yahei">更多了解</dt>
						<dd>请索取我们的PPT详细介绍文件。</dd>
					</dl>
				</div>
			</div>
			<div id="courseList_03" class="none">
				<div class="text clearfix">
					<h3 class="yahei">视频类</h3>
					<p style="width:700px;" class="fl">专注视频，提供包含视频滤镜处理类应用开发。</p>
					<p style="width:700px;" class="fl">&nbsp;</p>
					<p style="width:700px;" class="fl">可实现LOMO，黑白，复古，哥特，锐色，淡雅，胶片，都市，下午茶，NYC，重庆森林，时刻，静默，乡村，怀旧，光阴，1Q84，湖水，迷失等等滤镜效果。</p>
					<img src="./images/app/video-right.jpg" class="fr">
				</div>
				<div class="text clearfix">
					<dl class="fl">
						<dt class="yahei">为客户提供</dt>
						<dd>iPhone、Android、iPad等版本开发。</dd>
					</dl>
					<dl class="fr">
						<dt class="yahei">更多了解</dt>
						<dd>请索取我们的PPT详细介绍文件。</dd>
					</dl>
				</div>
			</div>
		</div>
		<h3 class="yahei text-center">后台+接口开发</h3>
		<div class="text clearfix">
			<h3 class="yahei">后端架构</h3>
			<p>轻量级框架拥有积累7年的EShow开源框架（www.eshow.org.cn），采用业界主流的S2SH框架。</p>
			<p>高负载、高性能框架拥有实际解决案例，可当面沟通。</p>
			<p>&nbsp;</p>
			<h3 class="yahei">API接口</h3>
			<p>定义合理，接口调用编辑的API接口开发方案。</p>
			<p>&nbsp;</p>
		</div>
		<h3 class="yahei text-center">客户案例</h3>
		<div class="core clearfix">
			<div class="fl list yahei">
				<a href=""><img src="./images/app/baobao.jpg" width="200"
					height="300"> </a>
				<h6>
					<a class="black" href="">帮趣宝宝</a>
				</h6>
				<p>
					<span class="color7f">一款通过照片+语音的宝宝学习应用</span>
				</p>
			</div>
			<div class="fl list yahei">
				<a href=""><img src="./images/app/wawa.jpg" width="200"
					height="300"> </a>
				<h6>
					<a class="black" href="">娃娃</a>
				</h6>
				<p>
					<span class="color7f">高端母婴导购APP</span>
				</p>
			</div>
			<div class="fl list yahei">
				<a href=""><img src="./images/app/bukuai.jpg" width="200"
					height="300"> </a>
				<h6>
					<a class="black" href="">捕快</a>
				</h6>
				<p>
					<span class="color7f">基于移动互联网的本地化生活搜索工具</span>
				</p>
			</div>
			<p class="clearfix">以做自己产品的心态做好每一个案例。我们将客户需求，技术架构，用户体验融入应用的每一个细节，提高产品价值。</p>
		</div>
	</div>
</body>
