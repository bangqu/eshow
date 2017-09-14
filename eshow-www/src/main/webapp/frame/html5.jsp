<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>EShowUI开源框架</title>
    <meta name="description" content="EShowIOS开源框架"/>
    <meta name="keywords" content="EShow,EShow开源网站,开源框架,ssh,轻量级框架,EShowUI开源框架"/>
</head>
<body>
<c:set var="current">frame</c:set>
<!-- banner -->
<div class="andr_bannerbox eshow_top">
    <div class="andr_banner">
        <div class="html_banner_hd">
            <p><span>EShowUI</span></p>
            <p><em>简单易用，轻量快捷，为移动端服务的前端框架</em></p>
        </div>
        <div class="html_banner_img">
            <img src="${dll}/www/images/html_icon.png">
        </div>
    </div>
</div>

<!-- content -->
<div class="html_contentbox">
    <div class="html_content">
        <div class="html_cont_block">
            <div class="html_cont_hd">
                <span>EShow简单实用</span>
            </div>
            <div class="html_cont_bd">
                <p>
                    基于FrozenUI开发，提供的CSS组件是目前QQ会员前端开发组所用的通用样式库。遵循手Q样式规范，基本样式使用离线包的方式减少请求，并提供快速接入的方案。EShow提供的一系列JavaScript插件，更优雅地在移动端上呈现更灵动的动画效果。</p>
            </div>
        </div>
        <div class="html_cont_block">
            <div class="html_cont_hd">
                <span>功能强大的组件</span>
            </div>
            <div class="html_cont_bd">
                <ul class="html_nav">
                    <li class="fl"><a class="nav_active" href="${dll}/ui/index.html">基础样式</a></li>
                    <li class="fl"><a class="" href="${dll}/ui/ui.html">UI组件</a></li>
                    <li class="fr"><a href="${dll}/ui/js.html">js插件</a></li>


                </ul>
                <div class="html_nav_img">
                    <img src="${dll}/www/images/html_dis.png">
                </div>
            </div>
        </div>
        <div class="html_cont_block">
            <div class="html_cont_hd">
                <span>icons</span>
            </div>
            <div class="html_cont_bd">
                <div class="html_icon_img">
                    <img src="${dll}/www/images/html_logo.png">
                </div>
                <%--
                      <ul class="html_icons">
                          <li><img src="${dll}/www/images/html_img1.png"></li>
                          <li><img src="${dll}/www/images/html_img2.png"></li>
                          <li><img src="${dll}/www/images/html_img3.png"></li>
                          <li><img src="${dll}/www/images/html_img4.png"></li>
                          <li class="html_clear_right"><img src="${dll}/www/images/html_img5.png"></li>
                          <li><img src="${dll}/www/images/html_img6.png"></li>
                          <li><img src="${dll}/www/images/html_img7.png"></li>
                          <li></li>
                          <li><img src="${dll}/www/images/html_img8.png"></li>
                          <li class="html_clear_right"><img src="${dll}/www/images/html_img9.png"></li>
                      </ul>
                  --%>
            </div>
        </div>
    </div>
</div>
<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript">
    if (${current=='frame'}) {
        $("[pr='frame']").addClass("nav_active");
    }
</script>
</body>
