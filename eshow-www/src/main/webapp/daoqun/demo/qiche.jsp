<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="../common/path.jsp"%>
<link rel="stylesheet" href="${daoqun}/styles/style.css"/>
<head>
<%@ include file="../common/yunshipei.jsp"%>
<title>汽车遥控器案例_到群软件</title>
<meta name="keywords" content="汽车遥控器案例，到群软件" />
<meta name="description" content="汽车遥控器案例，到群软件" />
<style> 
.clear:before,
.clear:after,
.wrapper:before,
.wrapper:after,
.format-status .entry-header:before,
.format-status .entry-header:after {
	display: table;
	content: "";
}
.w960{width:960px;margin:20px auto 0;} 
.banner{margin-top:5px;}
.info{padding:40px 0;}
.info h2{text-align: center;padding:10px 0;} 
.info-c li{width:200px;float:left;background:#ECF0F5;border-radius:8px;padding:20px 10px;margin:10px;}
.info-c li h3{text-align: center;}
.info-c li p{font-size: 13px;}
.info-c li div{width:102px;height:100px;margin:0 0 8px 50px;background: url(../images/qiche/info.png) no-repeat;}
.info-c li .icon1{background-position:}
.info-c li .icon2{background-position:-101px 0px;}
.info-c li .icon3{background-position:-201px 0px;}
.info-c li .icon4{background-position:-302px 0px;}
.info-c li .icon5{background-position:}
.info-c li .icon6{background-position:}
.dimg {padding:20px 0;}
.dimg li{width:220px;float:left;margin-right:10px;}
.dimg li img{width:220px;}
.text{padding:20px;}
.text p{text-indent: 20px;font-size:14px;line-height: 22px;}
.hdtop {height:230px;} 
.hdtop .showimg{border:1px solid #ddd;width:695px;height:240px;float:left;}
.hdtop .showimg img{width:695px;height:240px;}
.download{border:1px solid #ddd;width:243px;float: right;}
.download dt{border-bottom:1px solid #ddd;font-size:14px;padding:8px 10px;}
.download dd{padding:15px 15px 0;}
.download a{margin-bottom:15px;width:213px;height:48px;display:inline-block;background:url(../images/qiche/btn.gif);font-size:16px;line-height: 48px;text-indent:70px;color:#fff;}
.download a:hover{text-decoration: none;}
.download .ic-a2{background-position: 0 200px;}
.download .ic-a3{background-position: 0 100px;}
.download .ic-a1:hover{background-position: 0 250px;}
.download .ic-a2:hover{background-position: 0 150px;}
.download .ic-a3:hover{background-position: 0 50px;}
.tips{width:600px;margin:0 auto 20px;font-size:14px;text-align:center;color: #8a6d3b;
background-color: #fcf8e3;padding:5px 0;border-radius:5px;
border:1px solid #faebcc;}
</style>
</head>
<body>
	<c:set var="current">demo</c:set>
	<%@ include file="../common/header.jsp"%>
	<div class="wapper clearfix phone">
		 <div class="w960 clear">
		<div class="tips"><Strong>提示：</strong>本软件需要硬件设备支持,如有兴趣购买安装请联系QQ:149151419</div>
	<div class="hdtop">
		<div class="showimg">
			<ul><img src="../images/qiche/img.png"></ul>
		</div>
		<dl class="download">
			<dt>下载地址</dt>
			<dd>
			<a href="http://android.myapp.com/myapp/detail.htm?apkName=com.bangqu.qiche" class="ic-a1">Android</a>
			<a href="" class="ic-a2">Appstore</a>
			<a href="http://fir.im/kjgb" class="ic-a3">Iphone 第三方</a>
			</dd>
		</dl>
	</div>
	<div class="info clear">
		<h2>极客打造 开车神器</h2>
		<ul class="info-c clear">
			<li>
                <div class="icon1"></div>
                <h3>远程遥控</h3>
                <p>安装APP后，通过APP即可控制汽车，启动，熄火，夏天不怕车太热，冬天不再怕车冷！</p>
            </li>
            <li>
                <div class="icon2"></div>
                <h3>安全防护</h3>
                <p>报警功能，可自由设置报警灵敏度，自动关车门，提醒您车窗、车灯没关！</p>
            </li>
            <li>
                <div class="icon3"></div>
                <h3>爱车诊断</h3>
                <p>机油电压是否正常？爱车车况全面掌握，实时诊断爱车情况、定期获取爱车体检报告。</p>
            </li>
            <li>
                <div class="icon4"></div>
                <h3>实时定位</h3>
                <p>实时了解车子的位置，做到车在手中，无忧无虑！</p>
            </li> 
		</ul>
		
		<div class="text clear">
			<h2>汽车遥控产品介绍</h2>
			<p>汽车遥控产品是一款基于iOBD的手机客户端，拥有5大功能，远程遥控，安全防护，爱车诊断，实时定位。</p>
		</div>

		<div class="text clear">
			<h2>APP效果展示</h2>
			<ul class="dimg">
				<li><img src="../images/qiche/3.png"></li>
				<li><img src="../images/qiche/2.png"></li>
				<li><img src="../images/qiche/1.png"></li>
				<li><img src="../images/qiche/4.png"></li>
			</ul>
		</div>
	</div>
	 
</div>
	</div>
    <%@ include file="../common/footer.jsp"%>
</body>
