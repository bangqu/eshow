<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="common/path.jsp"%>
<head>
<%@ include file="common/yunshipei.jsp"%>
<title>联系我们_到群软件</title>
<meta name="keywords" content="联系我们，到群软件" />
<meta name="description" content="联系我们，到群软件" />
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=S6mqljAtjGZzvmeVxrRR68rA"></script>
<style>#allmap{width:500px;height:300px;}
		p{margin-left:5px; font-size:14px;}</style>
    <link rel="stylesheet" href="${daoqun}/styles/style.css"/>
</head>
<body>
	<c:set var="current">contact</c:set>
	<%@ include file="common/header.jsp"%>
	<div class="wapper yahei context"> 
		 <h3>联系我们</h3> 
		<div class="rightContext">
				<h4>无锡到群软件科技有限公司</h4>
				<p class="msub colorlightGray">地址: 中国·无锡市 滨湖区滴翠路100号 创意产业园</p> 
				<p class="msub colorlightGray">联系人：leida</p>
				<p class="msub colorlightGray">公司业务： 136-5617-1020</p>
				<p class="msub colorlightGray last">邮箱：leida#daoqun.com (将#替换为@)</p> 
				 <p class="last"><div id="allmap"></div></p> 
			</div>

		 
	</div>
    <%@ include file="common/footer.jsp"%>
	<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(120.251621,31.551187);
	var marker = new BMap.Marker(point);  // 创建标注
	map.addOverlay(marker);              // 将标注添加到地图中
	map.centerAndZoom(point, 15);
	var opts = {
	  width : 200,     // 信息窗口宽度
	  height: 100,     // 信息窗口高度
	  title : "无锡到群软科技有限公司"  // 信息窗口标题 
	}
	var infoWindow = new BMap.InfoWindow("地址：中国·无锡市 滨湖区滴翠路100号 创意产业园", opts);  // 创建信息窗口对象 
	marker.addEventListener("click", function(){          
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	});
</script>
</body>
