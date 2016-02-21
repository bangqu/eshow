<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<head>
<title>案例展示</title>
<script>
	jQuery(document).ready(function() {
		$('.carousel').carousel({
			interval : 2000
		});
	});
</script>
</head>
<body>
	<header id="header">
		<div class="hero-unit showcase">
			<div class="container">
				<h1 class="yahei">案例</h1>
			</div>
		</div>
	</header>
	<div class="container">
		<div class="row">
			<div class="span8">
				<ul class="demo">
					<li>
						<div class="screenshot-container">
							<a href=""><img width="160"
								src="http://www.daoqun.com/images/demo/d0.png"
								class="screenshot" > </a>
						</div>
						<div class="right">
							<h4>
								<a href="">银湾社区生活网</a> <span class="less-important small">www.yinwan.com</span>
							</h4>
							<a href="www.yinwan.com">社区生活服务平台</a> <a href="">上海</a> <br> <span
								class="less-important">简介：</span>“银湾社区生活网”是中国最大的业主生活综合服务平台，以其全地域、全行业、全免费、全开放的领先理念，立足于社区物业管理基础服务，以业主的物质和精神需求为导向，践行、深化“业主生活顾问”系列服务，以业主的“衣、食、住、行”为切入点，构筑社区服务体系，致力于成为社区生活方式倡导者。
						</div></li>
					<li>
						<div class="screenshot-container">
							<a href=""><img width="160"
								src="http://www.daoqun.com/images/demo/d4.png"
								class="screenshot" alt=" "> </a>
						</div>
						<div class="right">
							<h4>
								<a href="">街区淘</a> <span class="less-important small">jiequtao.com</span>
							</h4>
							<a href="http://www.jiequtao.com">街区淘</a> <a href="">无锡</a> <br> <span
								class="less-important">简介：</span>由无锡圆周率网络科技有限公司独立打造，是针对社区购物送货（服务）上门的网上交易平台，于2012年正式上线发布，致力于打造社区网络零售商圈，在商家和消费者之间提供一站式社区购物解决方案。
						</div></li>
					<li>
						<div class="screenshot-container">
							<a href=""><img width="160"
								src="http://www.daoqun.com/images/demo/d3.png"
								class="screenshot"  > </a>
						</div>
						<div class="right">
							<h4>
								<a href="">设计界</a> <span class="less-important small">shejijie.com.cn</span>
							</h4>
							<a href="">设计界</a> <a href="">无锡</a> <br> <span
								class="less-important">简介：</span>致力于汇聚中国创意设计力量，服务整个中国创意设计产业的新锐媒体，产业服务运营商及资源平台整合者。
						</div></li>
					<li>
						<div class="screenshot-container">
							<a href=""><img width="160"
								src="http://www.daoqun.com/images/bangqu/pic_a.jpg"
								class="screenshot" alt=" "> </a>
						</div>
						<div class="right">
							<h4>
								<a href="">帮趣网</a> <span class="less-important small">bangqu.com</span>
							</h4>
							<a href="h">帮趣网</a> <a href="">无锡</a> <br> <span
								class="less-important">简介：</span>帮趣网，帮助朋友 获得乐趣！贩卖别人之前，请先贩卖自己，分享自己的知识。 
当您写出来的知识帮到别人的时候，才能证明你，那么别人需要更深入时，可以向你咨询。
						</div></li>
				</ul>
				<%--
				<div class="pagination">
					<ul>
						<li class="disabled"><a href="#">«</a>
						</li>
						<li class="active"><a href="#">1</a>
						</li>
						<li><a href="#">2</a>
						</li>
						<li><a href="#">3</a>
						</li>
						<li><a href="#">4</a>
						</li>
						<li><a href="#">»</a>
						</li>
					</ul>
				</div>
				--%>
			</div>
		</div>
	</div>
</body>
