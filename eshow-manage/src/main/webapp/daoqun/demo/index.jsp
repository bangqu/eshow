<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="../common/path.jsp"%>
<head>
<%@ include file="../common/yunshipei.jsp"%>
<title>案例展示_到群软件</title>
<meta name="keywords" content="案例展示,到群软件,芯依福,银湾社区生活网,API系,街区淘,汽车遥控器" />
<meta name="description" content="案例展示,到群软件,芯依福,银湾社区生活网,API系,街区淘,汽车遥控器" />
    <link rel="stylesheet" href="${daoqun}/styles/style.css"/>
</head>
<script src="${daoqun}/scripts/jquery-1.8.3.min.js"></script>
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
	<%@ include file="../common/header.jsp"%>
	<div class="wapper clearfix ">
		 
		 <ul class="demoul clearfix">
		 	<li>
			 	<a href="../demo/yinwan"><img src="../images/demo/d0.png"/>
			 		<p><span>银湾社区生活网<em>UI/UX/WEB Desgin</em></span>
			 		
			 		</p>
			 	</a>
		 	</li>
		 	<li>
			 	<a href="../demo/xinyifu"><img src="../images/demo/d1.png"/>
			 		<p>
			 		<span>芯依福<em>UI/UX/WEB Desgin</em></span>
			 		
			 		</p>
			 	</a>
		 	</li>
			<li>
			 	<a href="../demo/shejijie"><img src="../images/demo/d3.png"/>
			 		<p>
			 		<span>API系统
			 		<em>UI/UX/WEB Desgin</em>
			 		</span> 
			 		</p>
			 	</a>
		 	</li>
		 	<li>
			 	<a href="../demo/api"><img src="../images/demo/d2.png"/>
			 		<p>
			 		<span>API系统
			 		<em>UI/UX/WEB Desgin</em>
			 		</span> 
			 		</p>
			 	</a>
		 	</li>
			<li>
			 	<a href="../demo/jiequtao"><img src="../images/demo/d4.png"/>
			 		<p>
			 		<span>街区淘
			 		<em>UI/UX/WEB Desgin</em>
			 		</span> 
			 		</p>
			 	</a>
		 	</li>
			<li>
			 	<a href="../demo/qiche"><img src="../images/demo/d5.png"/>
			 		<p>
			 		<span>汽车遥控器
			 		<em>UI/UX/WEB Desgin</em>
			 		</span> 
			 		</p>
			 	</a>
		 	</li>
		 </ul>
	</div>
    <%@ include file="../common/footer.jsp"%>
</body>
