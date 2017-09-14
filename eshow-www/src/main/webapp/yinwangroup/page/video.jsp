<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="../common/path.jsp" %>
<s:action name="info!browse" id="view" executeResult="false">
    <s:param name="query.website">yinwangroup</s:param>
</s:action>
<head>
    <title>银湾集团_精彩视频</title>
    <meta name="keywords" content="view.info.title"/>
    <meta name="description" content="view.info.content"/>
    <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.js"></script>
    <link rel="stylesheet" href="${yinwangroup}/styles/all.css"/>
    <link rel="stylesheet" href="${yinwangroup}/styles/style.css"/>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<style>
    .video {
        margin-left: 60px;
    }
    .video li {
        width: 380px;
        height: 380px;
        float: left;
        margin-right: 60px;
    }
    .partner span:hover {
        background: red;
        color: #fff;
    }
</style>
<div class="wp clearfix mt25">
    <%@ include file="left.jsp" %>
    <div class="aboutr">
        <h3>精彩视频</h3>
        <div class="video">
            <li>
                <embed src="http://player.youku.com/player.php/sid/XNjY0NTk0NjAw/v.swf" allowFullScreen="true"
                       quality="high" width="380" height="330" align="middle" allowScriptAccess="always"
                       type="application/x-shockwave-flash"></embed>
                <span>家•银湾物业</span>
            </li>
            <li>
                <embed src="http://player.youku.com/player.php/sid/XNzg3MTQ2MDY0/v.swf" allowFullScreen="true"
                       quality="high" width="380" height="330" align="middle" allowScriptAccess="always"
                       type="application/x-shockwave-flash"></embed>
                <span>江西开车看房报道银湾智慧社区体验馆锦绣春天店</span>
            </li>
            <li>
                <embed src="http://player.youku.com/player.php/sid/XODE3NzkwMTA4/v.swf" allowFullScreen="true"
                       quality="high" width="380" height="330" align="middle" allowScriptAccess="always"
                       type="application/x-shockwave-flash"></embed>
                <span>《物业企业互联网实战兵法》高峰论坛（蚌埠站）</span>
            </li>
            <li>
                <embed src="http://player.youku.com/player.php/sid/XODI3NjU1NjQ4/v.swf" allowFullScreen="true"
                       quality="high" width="380" height="330" align="middle" allowScriptAccess="always"
                       type="application/x-shockwave-flash"></embed>
                <span>重庆开县东湖郡互联网银湾物业</span>
            </li>
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
