<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="../common/path.jsp"%>
<head>
<%@ include file="../common/yunshipei.jsp"%>
<title>米乐鼠模特平台案例_到群软件</title>
<meta name="keywords" content="米乐鼠模特平台案例,到群软件" />
<meta name="description" content="米乐鼠模特平台案例,到群软件" />
<style>
	.topimg{border-bottom:1px solid #ddd;text-align:center}
	.m_info{border-bottom:1px solid #ddd;padding:50px;}
	.m_info h3,.m_show h3{padding-bottom: 10px;font-size: 20px;}
	.m_info h4{font-size: 22px;font-weight:  normal;}
	.m_show{padding:30px 50px;}
	.m_show p,.m_info p{font-size: 14px;line-height: 24px;margin-bottom: 5px;}
</style>
    <link rel="stylesheet" href="${daoqun}/styles/style.css"/>
</head>
<body>
	<c:set var="current">demo</c:set>
	<%@ include file="../common/header.jsp"%>
	<div class="wapper clearfix phone">
		<div class="mileshu">
			<div class="topimg">
				<img src="${daoqun}/images/mileshu/index.jpg"/>
			</div>
			<div class="m_info yahei">
				<h3>我们提供</h3>
				<p>架构设计+后台管理系统开发</p>
				<p>该项目充分参考了美空网，about.me。可以誉为模特界的about.me。欢迎模特、礼仪行业进行深度定制。</p>
			</div>
			<div class="m_show yahei">
				<h3>关于米乐网</h3>
			<p>	  米乐网旨在为模特打造一个展示、交流、学习、推荐的平台，注重挖掘中国各地区年轻而有潜质的青少年演艺人才，模特可以直接在本网站上传资料照片及简历，建立模特人才库。 </p>
				<p>
				通过米乐平台的模特可以获得绝佳的平面及影视拍摄工作机会，优秀模特有机会获得服装公司、影视制作公司、电视台、广告公司、演出公司、等所有艺术人才需求单位的青睐，从而走上星光大道。米乐网将成为了模特需求单位的首选资源平台。欢迎中外模特加入我们。</p>
			</div>
		 </div>
	</div>
    <%@ include file="../common/footer.jsp"%>
</body>
