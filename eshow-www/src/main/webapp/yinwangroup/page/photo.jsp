<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="../common/path.jsp" %>
<s:action name="info!browse" id="view" executeResult="false">
    <s:param name="query.website">yinwangroup</s:param>
</s:action>
<head>
<title>银湾集团_精彩图片</title>
<meta name="keywords" content="view.info.title" />
<meta name="description" content="view.info.content" />
<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.js"></script>

<link rel="stylesheet" href="${yinwangroup}/styles/all.css"/>
<link rel="stylesheet" href="${yinwangroup}/styles/style.css"/>

</head>
<body> 
<%@ include file="../include/header.jsp"%>
 

<div class="wp clearfix mt25">
	<%@ include file="left.jsp"%>

	 
	 <div class="aboutr">
		<h3>精彩图片</h3> 
		<div class="showimg">
				<ul> 
					<li>
						<a sbimg href="javascript:;"><img src="${yinwangroup}/images/pho/p1.JPG"/>
						<span>上海大市场会议</span>
						</a>
					</li>
					<li>
						<a sbimg href="javascript:;"><img src="${yinwangroup}/images/pho/p2.JPG"/>
						<span>上海大市场会议</span>
						</a>
					</li>
					<li>
						<a sbimg href="javascript:;"><img src="${yinwangroup}/images/pho/p3.JPG"/>
						<span>上海大市场会议</span>
						</a>
					</li>
					<li>
						<a sbimg href="javascript:;"><img src="${yinwangroup}/images/pho/p4.JPG"/>
						<span>上海大市场会议</span>
						</a>
					</li>
					<li>
						<a sbimg href="javascript:;"><img src="${yinwangroup}/images/pho/p5.JPG"/>
						<span>上海大市场会议</span>
						</a>
					</li>
					<li>
						<a sbimg href="javascript:;"><img src="${yinwangroup}/images/pho/p6.JPG"/>
						<span>上海大市场会议</span>
						</a>
					</li>
					
					<li>
						<a  sbimg href="javascript:;"><img src="${yinwangroup}/images/pho/b1.JPG"/>
						<span>2014.7北海商院开课</span>
						</a>
					</li>
					<li>
						<a sbimg href="javascript:;"><img src="${yinwangroup}/images/pho/b2.JPG"/>
						<span>2014.7北海商院开课</span>
						</a>
					</li>
					<li>
						<a sbimg href="javascript:;"><img src="${yinwangroup}/images/pho/t1.JPG"/>
						<span>接见台湾客人</span>
						</a>
					</li>
					<li>
						<a sbimg href="javascript:;"><img src="${yinwangroup}/images/pho/t2.JPG"/>
						<span>接见台湾客人</span>
						</a>
					</li> 
					<li>
						<a sbimg href="javascript:;"><img src="${yinwangroup}/images/pho/c1.JPG"/>
						<span>中秋晚会</span>
						</a>
					</li>
					<li>
						<a sbimg href="javascript:;"><img src="${yinwangroup}/images/pho/c2.JPG"/>
						<span>中秋晚会</span>
						</a>
					</li>
					
					<li>
						<a sbimg href="javascript:;"><img src="${yinwangroup}/images/pho/o2.JPG"/>
						<span>银湾社区超市</span>
						</a>
					</li>
					<li>
						<a sbimg href="javascript:;"><img src="${yinwangroup}/images/pho/o3.JPG"/>
						<span>银湾社区超市</span>
						</a>
					</li>
					<li>
						<a sbimg href="javascript:;"><img src="${yinwangroup}/images/pho/o4.JPG"/>
						<span>银湾社区超市</span>
						</a>
					</li>
				</ul>

		</div>
	 </div>
	 


</div>





<%@ include file="../include/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	$("a[sbimg]").on("click",function(){
		var url=$(this).find("img").attr("src"); 
		$(".showbig").find("img").attr("src",url);
		$(".showbig").show();
	})

	$("a[close]").on("click",function(){
		var box=$(this).attr("vi");
		$("#"+box).hide(); 
	})
});
</script>
<div class="showbig none" id="showbig">
	<a close vi="showbig" title="关闭">x</a>
	 <img src="" width="600">
	 
</div>

</body>
</body>
