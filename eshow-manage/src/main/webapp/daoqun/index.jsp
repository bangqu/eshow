 <%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
 <%@ include file="common/path.jsp"%>
<head>
<%@ include file="common/yunshipei.jsp"%>
<title>首页_到群软件</title>
<meta name="keywords"
	content="无锡软件公司，无锡网络公司，无锡网站开发，无锡网页设计，到群软件，到群网，无锡软件工作室，无锡网站运营公司，无锡行业网站开发，商圈网站，无锡商业圈" />
<meta name="description"
	content="无锡到群软件科技有限公司，致力于网站运营，及高档营销展示型网站开发，并具有较多的项目开发经验" />
<script src="${daoqun}/scripts/jquery-1.8.3.min.js"></script>
<script src="${daoqun}/scripts/index_banner.js"></script>
<link rel="stylesheet" href="${daoqun}/styles/style.css"/>
</head>
<body>
	<c:set var="current">index</c:set>
	<%@ include file="common/header.jsp"%>
	<div class="wapper">
		<div class="slide" id="hero" style="height:540px;">
			<div class="prev">
				<div>
					<a class="slide-prev" href="javascript:;"><i></i> </a>
				</div>
			</div>
			<div class="next">
				<div>
					<a class="slide-next" href="javascript:;"><i></i> </a>
				</div>
			</div>
			<div class="slide-pager">
				<ul>
					<li class="sl-page current"><a href="javascript:;"><i></i>
					</a></li>
					<li class="sl-page"><a href="javascript:;"><i></i> </a>
					</li>
				</ul>
			</div>
			<div class="slide-content" timer="7000">
				<div class="slide-item visible">
					<div class="slide-image">
						<a href="http://www.daoqun.com/demo/yinwan"><b style="background-image: url(${daoqun}/images/banner_01.jpg); background-size: cover;"
							class="sl-img current first"></b></a>
					</div>
				</div>
				<div class="slide-item">
					<div class="slide-image">
						<b
							style="background-image: url(${daoqun}/images/banner_02.jpg); background-size: cover;"
							class="sl-img "></b>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="features wapper clearfix">
		<ul class="">
			<li><img class="b_ic_a" src="${daoqun}/images/tra.gif">
				<h3 class="yahei">最新动态</h3>
				<p>目前公司正在提供语音/照片/视频领域的移动互联网解决方案</p> <a href="">查看全文</a>
			</li>
			<li><img class="b_ic_b" src="${daoqun}/images/tra.gif">
				<h3 class="yahei">技术驱动</h3>
				<p>公司拥有资深架构师，公司80%的人员都是技术人才，我们是一家专注于技术的公司</p> <a href="">查看全文</a>
			</li>
			<li><img class="b_ic_c" src="${daoqun}/images/tra.gif">
				<h3 class="yahei">联系方式</h3>
				<p>我们在蠡湖创意产业园沏一杯茶，等您，直接电话136-5617-1020</p> <a
				href="contact">查看全文</a></li>
			<li class="end"><img class="b_ic_d" src="${daoqun}/images/tra.gif">
				<h3 class="yahei">加入我们</h3>
				<p>我们期待你的加入，为做一款成功的产品而奋斗。</p> <a href="job">查看全文</a>
			</li>
		</ul>
	</div>
    <%@ include file="common/footer.jsp"%>
</body>
