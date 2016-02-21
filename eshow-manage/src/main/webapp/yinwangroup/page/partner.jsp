<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="../common/path.jsp" %>
<s:action name="info!browse" id="view" executeResult="false">
    <s:param name="query.website">yinwangroup</s:param>
</s:action>
<head>
<title>银湾集团_合作伙伴</title>
<meta name="keywords" content="view.info.title" />
<meta name="description" content="view.info.content" />
<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.js"></script>

<link rel="stylesheet" href="${yinwangroup}/styles/all.css"/>
<link rel="stylesheet" href="${yinwangroup}/styles/style.css"/>

</head>
<body> 
<%@ include file="../include/header.jsp"%>
<style>
	 .partner{}
	 .partner span{background:#f5f5f5;display:inline-block;padding:5px 25px;border:1px solid #eee;margin:0 10px 10px 0;float: left;}
	 .partner span:hover{background:red;color:#fff;}
</style>

<div class="wp clearfix mt25">
	<%@ include file="left.jsp"%>

	 
	 <div class="aboutr">
		<h3>合作伙伴</h3> 
		<div class="partner">
				 
	<span>淮北市国利物业服务有限公司</span>
	<span>合肥华兴物业管理有限公司淮北分公司</span>
	<span>福州鑫九洲物业管理有限公司</span>
	<span>广州市开物物业管理有限公司湖南分司</span>
	<span>韶关市安居物业服务有限公司</span>
	<span>韶关市中和物业服务有限公司</span>
	<span>清远市齐力物业咨询服务中心</span>
	<span>桂林市润家物业服务有限公司</span>
	<span>桂林市恒安物业服务有限责任公司</span>
	<span>桂林市恒安物业服务有限责任公司</span>
	<span>贵州容一物业服务有限公司</span>
	<span>重庆巨亚物业管理有限公司</span>
	<span>郑州美城物业服务有限公司</span>
	<span>沧州珈华物业服务有限公司</span>
	<span>郑州美城物业服务有限公司</span>
	<span>信阳宋基华瑞置业有限公司</span>
	<span>信阳宋基华瑞置业有限公司</span>
	<span>长沙万商物业管理有限公司</span>
	<span>长沙双宁物业服务有限公司</span>
	<span>宁乡县嘉诚物业管理有限公司</span>
	<span>宁乡县物业管理协会</span>
	<span>宿迁晨宇物业管理有限公司</span>
	<span>江苏福达房地产开发有限公司</span>
	<span>南昌市华亮物业管理有限公司</span>
	<span>抚州市美辰物业管理有限公司</span>
	<span>抚州市湖景嘉园物业服务有限公司</span>
	<span>樟树市惠和物业管理有限公司</span>
	<span>樟树市房地产物业管理有限公司</span>
	<span>樟树市安泰物业管理有限公司</span>
	<span>九江市昌隆物业服务有限公司</span>
	<span>九江市荣江物业服务有限公司</span>
	<span>宜春市城投物业管理有限公司</span>
	<span>宜春市万佳物业管理有限公司</span>
	<span>江西亚琦置业投资有限公司</span>
	<span>赣州腾辉物业服务有限公司</span>
	<span>万邦超市（崔延春）</span>
	<span>山东南亚物业集团有限公司</span>
	<span>山东南亚物业集团有限公司</span>
	<span>陕西省安康市兴华建设集团物业管理有限公司</span>
	<span>上海农工商旺都物业管理有限公司 </span>
	<span>西安睿淏环保技术有限公司</span>
	<span>楚雄隆源物业服务有限责任公司</span>
	<span>云南垠瑞物业服务有限公司</span>
	<span>云南宏图嘉业物业服务有限公司</span>
	<span>云南立尚物业服务有限公司</span>
	<span>云南滇云康物业服务有限公司</span>
	<span>保山太保物业管理有限公司</span>
	<span>宁乡县红旺物业服务有限公司</span>
	<span>衢州润发物业管理有限公司</span>
	<span>浙江加州物业服务有限公司</span>
	<span>重庆展瑞物业管理有限公司</span>
	<span>重庆来勃物业管理有限公司</span>

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
