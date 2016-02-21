<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="../common/path.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<head>
<%@ include file="../common/yunshipei.jsp"%>
<title>帮趣网_到群软件</title>
<meta name="keywords" content="帮趣网,到群软件" />
<meta name="description" content="帮趣网,到群软件" />
<link rel="stylesheet" href="${daoqun}/styles/bangqu.css" type="text/css" />
    <link rel="stylesheet" href="${daoqun}/styles/style.css"/>
</head>
<body>
	<c:set var="current">bangqu</c:set>
	<%@ include file="../common/header.jsp"%>
	<div class="wapper">
		<div class="m_intro yahei">
			<div class="i1">
				<img class="i1_logo" src="./images/bangqu/pic_logo.jpg">
				<p class="f_tac">
					帮趣网，帮助朋友 获得乐趣！贩卖别人之前，请先贩卖自己，分享自己的知识。 <br>
					当您写出来的知识帮到别人的时候，才能证明你，那么别人需要更深入时，可以向你咨询。
				</p>
				<p class="f_tac">
					邀请你熟悉的朋友，让他们也来到这里，既可以贩卖你的知识，他们分享知识后，你也能贩卖他们的知识。 <br>
					一个能分享知识的人，才真是一个力量无边的人。
				</p>
				<div class="img">
					<img src="./images/bangqu/pic_a.jpg">
				</div>
			</div>
			<div class="i0"></div>
			<div class="i2">
				<h2 class="yahei">帮趣到底可以做神马？</h2>
				<ul class="f-cb">
					<li class="odd first f-cb">
						<div class="img">
							<img src="./images/bangqu/pic_b.jpg">
						</div>
						<div class="txt">
							<h3>个人知识分享工具</h3>
							<div class="user f-cb">
								<div class="face">
									<a href="http://bangqu.com/sql" target="_blank"><img
										src="http://avatar.bangqu.com/2012/03/26/2.jpg!small"> </a>
								</div>
								<div class="info">
									<p>
										<strong>Sql</strong>
									</p>
									<p>热爱前端，热爱设计，对新鲜事物充满好奇心，有折腾的想法和精力，喜欢捣鼓各种互联网应用。</p>
									<p>个人职业：网页设计师·CSS设计师</p>
									<p>兴趣爱好：摄影</p>
									<p>常用标签:网页设计、前端开发、css</p>
									<p class="view">
										<a href="http://bangqu.com/sql" target="_blank" class="s-fc2">点击查看&gt;&gt;</a>
									</p>
								</div>
							</div>
						</div></li>
					<li class="even f-cb">
						<div class="img">
							<img src="./images/bangqu/pic_c.jpg">
						</div>
						<div class="txt">
							<h3>朋友关系管理系统FRM</h3>
							<div class="user f-cb">
								<div class="face">
									<a href="http://bangqu.com/leida" target="_blank"><img
										src="http://avatar.bangqu.com/2008/11/03/1.jpg!small"> </a>
								</div>
								<div class="info">
									<p>
										<strong>磊大</strong>
									</p>
									<p>通过帮趣朋友，管理自己有价值的朋友</p>
									<p>个人职业：互联网产品经理</p>
									<p>兴趣爱好：分享知识</p>
									<p>常用标签：Java、产品经理、移动互联网</p>
									<p class="view">
										<a href="http://bangqu.com/leida" target="_blank"
											class="s-fc2">点击查看&gt;&gt;</a>
									</p>
								</div>
							</div>
						</div></li>
					<li class="odd first f-cb">
						<div class="img">
							<img src="./images/bangqu/pic_d.jpg">
						</div>
						<div class="txt">
							<h3>出售自己服务技能</h3>
							<div class="user f-cb">
								<div class="face">
									<a href="http://bangqu.com/fantong" target="_blank"><img
										src="http://avatar.bangqu.com/2012/09/26/44.jpg!small">
									</a>
								</div>
								<div class="info">
									<p>
										<strong>范晓锋</strong>
									</p>
									<p>大师级的PPT设计，高质量UI设计。</p>
									<p>个人职业：视觉设计师</p>
									<p>兴趣爱好：陪女儿</p>
									<p>常用标签:PPT大师、UI设计、好爸爸</p>
									<p class="view">
										<a href="http://bangqu.com/fantong" target="_blank"
											class="s-fc2">点击查看&gt;&gt;</a>
									</p>
								</div>
							</div>
						</div></li>
					<li class="even f-cb">
						<div class="img">
							<img src="./images/bangqu/pic_e.jpg">
						</div>
						<div class="txt">
							<h3>朋友圈的问答系统</h3>
							<div class="user f-cb">
								<div class="face">
									<a href="http://bangqu.com/suri" target="_blank"><img
										src="http://avatar.bangqu.com/2012/06/12/10.jpg!small">
									</a>
								</div>
								<div class="info">
									<p>
										<strong>黄婷婷</strong>
									</p>
									<p>帮助朋友，帮助自己提出一些问题，请大家为小女子回答啦</p>
									<p>个人职业：Customer Service</p>
									<p>兴趣爱好：旅行、古筝、翻译</p>
									<p>常用标签：英语、日语、才女</p>
									<p class="view">
										<a href="http://bangqu.com/suri" target="_blank" class="s-fc2">点击查看&gt;&gt;</a>
									</p>
								</div>
							</div>
						</div></li>
				</ul>
			</div>
		</div>
	</div>
    <%@ include file="../common/footer.jsp"%>
</body>
