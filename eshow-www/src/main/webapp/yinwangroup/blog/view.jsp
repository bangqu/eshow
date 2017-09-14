<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="../common/path.jsp" %>
<s:action name="blog!view" var="view" executeResult="false" namespace=""/>
<head>
    <title>${view.blog.title}_银湾集团</title>
    <meta name="keywords" content="${view.blog.title}"/>
    <meta name="description" content="view.blog.title"/>
    <link rel="stylesheet" href="${yinwangroup}/styles/all.css"/>
    <link rel="stylesheet" href="${yinwangroup}/styles/style.css"/>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="wp clearfix mt15">
    <%@ include file="left.jsp" %>
    <div class="main">
        <div class="break"></div>
        <div class="newsr">
            <div class="ti">
                <h2 class="yahei">${view.blog.title}</h2>
                <div class="time">
                    <span>时间：<s:date name='%{#view.blog.updateTime}' format='yyyy-MM-dd'/></span>
                    <span>文章来源：银湾社区</span>
                </div>
            </div>
            <div class="view">
                ${view.blog.content}
            </div>
        </div>
    </div>
    <%@ include file="right.jsp" %>
</div>
<%@ include file="../include/footer.jsp" %>
<script type="text/javascript">
    $(document).ready(function () {
    });
</script>
</body>

