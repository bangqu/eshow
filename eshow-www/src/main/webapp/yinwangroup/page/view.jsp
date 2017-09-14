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
<div class="wp clearfix mt25">
    <%@ include file="left.jsp" %>
    <div class="aboutr">
        <h3>精彩视频</h3>
        <p>
            <embed src="http://player.youku.com/player.php/sid/XNjY0NTk0NjAw/v.swf" allowFullScreen="true"
                   quality="high" width="800" height="500" align="middle" allowScriptAccess="always"
                   type="application/x-shockwave-flash"></embed>
        </p>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
