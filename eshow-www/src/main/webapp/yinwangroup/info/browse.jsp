<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="../common/path.jsp" %>
<s:action name="info!browse" var="view" executeResult="false">
    <s:param name="info.website">yinwangroup</s:param>
</s:action>
<head>
    <title>银湾集团_${view.info.title}</title>
    <meta name="keywords" content="${view.info.title}"/>
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
        <h3>${view.info.title}</h3>
        <p>${view.info.content}</p>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>
<script type="text/javascript">
    $(document).ready(function () {
    });
</script>
</body>
