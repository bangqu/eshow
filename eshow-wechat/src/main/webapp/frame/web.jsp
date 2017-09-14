<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>EShow Java Web开源框架</title>
    <meta name="description" content="EShow Web开源框架" />
    <meta name="keywords" content="EShow,EShow开源网站,开源框架,ssh,轻量级框架,EShow Web" />
</head>
<body>
<!-- banner -->
<c:set var="current">frame</c:set>
<div class="andr_bannerbox eshow_top">
    <div class="andr_banner">
        <div class="andr_banner_left">
            <p><span>eshow web</span></p>
            <p><em>基于Appfuse的Web2.0开源S2SH框架</em></p>
        </div>
        <div class="andr_banner_right">
            <img src="${dll}/www/images/web_icon.png">
        </div>
    </div>
</div>
<!-- content -->
<div class="andr_contentbox">
    <div class="andr_content">
        <div class="andr_block">
            <div class="web_design">
                <ul class="andr_txt web_right_txt1">
                    <li class="andr_title"><span>巨人肩膀</span></li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>采用流行的J2EE轻量级框架(Struts2+Spring+Hibernate)基于国外开源框架Appfuse，我们可以简称Appfuse中文加强版。</span>
                    </li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>站在巨人的肩膀上，不重复发明轮子，优化适合我们的轮子</span>
                    </li>
                </ul>
            </div>
        </div>

        <div class="andr_block">
            <div class="web_flow">
                <ul class="andr_txt web_left_txt">
                    <li class="andr_title"><span>注册/登录流程</span></li>
                    <li>
                        <div class="flow_li_left">
                            <img src="${dll}/www/images/point.png">
                            <img class="flow_img_top" src="${dll}/www/images/point.png">
                        </div>
                        <div class="flow_li_right">
                            <p>手机注册 > 验证码，确认密码 > 注册完成（可以使用） > 填写账户资料>第三方绑定</p>
                            <p>找回密码>填写手机号码>验证码，确认密码>找回成功</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div class="andr_block">
            <div class="web_input">
                <ul class="andr_txt web_right_txt input_right">
                    <li class="andr_title"><span>输入框</span></li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>输入框样式</span>
                    </li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>输入框验证</span>
                    </li>
                </ul>
            </div>
        </div>

        <div class="andr_block">
            <div class="web_upload">
                <ul class="andr_txt web_left_txt upload_left">
                    <li class="andr_title"><span>上传文件</span></li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>上传图片</span>
                    </li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>上传视频</span>
                    </li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>上传音频</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="andr_block">
            <div class="web_compatible">
                <ul class="andr_txt web_right_txt compatible_right">
                    <li class="andr_title"><span>兼容性</span></li>
                    <li>
                        <img src="${dll}/www/images/point.png">
                        <span>兼容IE6\7\9、谷歌浏览器等</span>
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
