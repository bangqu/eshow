<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="common/path.jsp"%>
<head>
<%@ include file="common/yunshipei.jsp"%>
<title>移动互联网_到群软件</title>
<meta name="keywords" content="移动互联网，到群软件" />
<meta name="description" content="移动互联网，到群软件" />
</head>
<script src="${daoqun}/scripts/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="${daoqun}/styles/style.css"/>
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
	<c:set var="current">demo</c:set>
	<%@ include file="common/header.jsp"%>
	<div class="wapper clearfix phone">
		<h3 class="yahei text-center">那些曾经开发的网站与APP</h3>
		<div class="core clearfix">
			<h3 class="yahei">APP应用类</h3>
			<div class="clearfix">
			<div class="fl list yahei">
				<a href=""><img src="${daoqun}/images/app/baobao.jpg" width="200"
					height="300"> </a>
				<h6>
					<a class="black" href="">帮趣宝宝</a>
				</h6>
				<p>
					<span class="color7f">一款通过照片+语音的宝宝学习应用</span>
				</p>
			</div>
			<div class="fl list yahei">
				<a href=""><img src="${daoqun}/images/app/wawa.jpg" width="200"
					height="300"> </a>
				<h6>
					<a class="black" href="">娃娃</a>
				</h6>
				<p>
					<span class="color7f">高端母婴导购APP</span>
				</p>
			</div>
			<div class="fl list yahei">
				<a href=""><img src="${daoqun}/images/app/bukuai.jpg" width="200"
					height="300"> </a>
				<h6>
					<a class="black" href="">捕快</a>
				</h6>
				<p>
					<span class="color7f">基于移动互联网的本地化生活搜索工具</span>
				</p>
			</div>
			<div class="fl list yahei">
				<a href=""><img src="${daoqun}/images/app/jiequtao.jpg" width="200"
					height="300"> </a>
				<h6>
					<a class="black" href="">街区淘</a>
				</h6>
				<p>
					<span class="color7f">小区生活服务平台</span>
				</p>
			</div>
			</div>
			<p class="clearfix tip yahei">以做自己产品的心态做好每一个案例。我们将客户需求，技术架构，用户体验融入应用的每一个细节，提高产品价值。</p>
		</div>
		<div class="core clearfix">
			<h3 class="yahei">网站开发类</h3>
			<div class="clearfix">
			<div class="fl list yahei">
				<a href=""><img src="${daoqun}/images/web_1.jpg" width="250"
					> </a>
				<h6>
					<a class="black" href="">帮趣网</a>
				</h6>
				<p>
					<span class="color7f">社会化知识服务平台</span>
				</p>
			</div>
			<div class="fl list yahei">
				<a href=""><img src="${daoqun}/images/web_2.jpg" width="250" > </a>
				<h6>
					<a class="black" href="">街区淘</a>
				</h6>
				<p>
					<span class="color7f">这里有为你送货（服务）上门的商家</span>
				</p>
			</div>
			<div class="fl list yahei">
				<a href=""><img src="${daoqun}/images/web_1.jpg" width="250" >  </a>
				<h6>
					<a class="black" href="">HiNet旅游网</a>
				</h6>
				<p>
					<span class="color7f">基于移动互联网的本地化生活搜索工具</span>
				</p>
			</div>
			
			</div>
			<p class="clearfix tip yahei">以做自己产品的心态做好每一个案例。我们将客户需求，技术架构，用户体验融入应用的每一个细节，提高产品价值。</p>
		</div>
	</div>
    <%@ include file="common/footer.jsp"%>
</body>
