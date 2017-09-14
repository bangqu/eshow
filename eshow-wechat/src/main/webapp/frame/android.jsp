<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>eshow-android开源框架</title>
    <meta name="description" content="eshow-android开源框架"/>
    <meta name="keywords" content="EShow,EShow开源网站,开源框架,Android,Android开源框架,eshow-android开源框架"/>
</head>
<body>
<c:set var="current">frame</c:set>
<!-- banner -->
<div class="andr_bannerbox eshow_top">
    <div class="andr_banner">
        <div class="andr_banner_left">
            <p><span>eshow-android</span></p>
            <p><em>集成音乐播放<br/>地图定位<br/>
                在线支付等多个功能<br/>提供更便捷的开发流程</em></p>
        </div>
        <div class="andr_banner_right">
            <img src="${dll}/www/images/android_icon.png">
        </div>
    </div>
</div>
<!-- content -->
<div class="andr_contentbox">
    <div class="andr_content">
        <div class="andr_block">
            <div class="andr_log">
                <ul class="andr_txt andr_right_txt">
                    <li class="andr_title"><span>注册／登录</span></li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>完整的登录注册流程</span>
                    </li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>第三方登录绑定</span>
                    </li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>语音播报验证方式</span>
                    </li>
                </ul>
            </div>
        </div>

        <div class="andr_block">
            <div class="andr_music">
                <ul class="andr_txt andr_left_txt">
                    <li class="andr_title"><span>音乐播放</span></li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>侧重本地音乐播放的播放器</span>
                    </li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>本地歌曲管理清晰</span>
                    </li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>界面简单，易操作</span>
                    </li>
                </ul>
            </div>
        </div>

        <div class="andr_block">
            <div class="andr_form">
                <ul class="andr_txt andr_right_txt">
                    <li class="andr_title"><span>信息表单</span></li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>省市区选择器</span>
                    </li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>性别选择器</span>
                    </li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>时间选择器</span>
                    </li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>修改头像</span>
                    </li>
                </ul>
            </div>
        </div>

        <div class="andr_block">
            <div class="andr_postion">
                <ul class="andr_txt andr_left_txt andr_position_txt andr_menu1">
                    <li class="andr_title"><span>地图定位<em>基于百度地图开发</em></span></li>

                    <li class="andr_li">
                        <img src="${dll}/www/images/point.png">
					<span>精度高
					<ul class="andr_menu2">
                        <li><span>整体定位成功率高达99%</span></li>
                        <li><span>GPS：10m</span></li>
                        <li><span>WIFI：27m</span></li>
                        <li><span>基站：240m</span></li>
                        <li><span>整体精度：50m</span></li>
                    </ul>
					

					</span>
                    </li>
                    <li class="andr_li">
                        <img src="${dll}/www/images/point.png">
					<span>覆盖广
					<ul class="andr_menu2">
                        <li><span>整体定位成功率高达99%</span></li>
                        <li><span>GPS：10m</span></li>
                        <li><span>WIFI：27m</span></li>
                        <li><span>基站：240m</span></li>
                        <li><span>整体精度：50m</span></li>
                    </ul>
					</span>
                    </li>
                    <li class="andr_li andr_top">
                        <img src="${dll}/www/images/point.png">
					<span>流量小
					<ul class="andr_menu2">
                        <li><span>整体定位成功率高达99%</span></li>
                        <li><span>GPS：10m</span></li>
                        <li><span>WIFI：27m</span></li>
                        <li><span>基站：240m</span></li>
                        <li><span>整体精度：50m</span></li>
                    </ul>
					</span>
                    </li>
                    <li class="andr_li andr_top">
                        <img src="${dll}/www/images/point.png">
					<span>速度快
					<ul class="andr_menu2">
                        <li><span>整体定位成功率高达99%</span></li>
                        <li><span>GPS：10m</span></li>
                        <li><span>WIFI：27m</span></li>
                        <li><span>基站：240m</span></li>
                        <li><span>整体精度：50m</span></li>
                    </ul>

					</span>
                    </li>
                </ul>
            </div>
        </div>

        <div class="andr_block">
            <div class="andr_share">
                <ul class="andr_txt andr_right_txt">
                    <li class="andr_title"><span>分享</span></li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>基于ShareSDK开发</span>
                    </li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>微信好友、朋友圈分享</span>
                    </li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>QQ好友、空间分享</span>
                    </li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>微博分享</span>
                    </li>
                </ul>
            </div>
        </div>

        <div class="andr_block">
            <div class="andr_pay">
                <ul class="andr_txt andr_left_txt">
                    <li class="andr_title"><span>支付系统</span></li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>微信支付、支付宝支付、 银行卡支付</span>
                    </li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>聚合多个支付通道，提高支付成功率</span>
                    </li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>支持并兼容各个浏览器以及三大手机系统可跨平台使用</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<%@ include file="/common/scripts.jsp"%>
<script type="text/javascript">
    if(${current=='frame'}){
        $("[pr='frame']").addClass("nav_active");
    }
</script>
</body>
