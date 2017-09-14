<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/yinwangroup/common/path.jsp" %>
<head>
    <title>银湾集团_新闻</title>
    <meta name="keywords" content="银湾集团"/>
    <meta name="description" content="银湾集团"/>
    <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.js"></script>
    <link rel="stylesheet" href="${yinwangroup}/styles/all.css"/>
    <link rel="stylesheet" href="${yinwangroup}/styles/style.css"/>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="wp clearfix mt15">
    <%@ include file="left.jsp" %>
    <div class="main">
        <div class="banner mb10"><img width="750" src="${yinwangroup}/images/img9.png"/></div>
        <div class="title yahei"><span>${keyword}新闻</span></div>
        <div class="newsr">
            <s:action name="blog!search" id="blogList3" executeResult="false">
                <s:param name="query.website">yinwangroup</s:param>
                <s:param name="query.order">addTime</s:param>
                <s:param name="query.keyword">${param.keyword}</s:param>
                <s:param name="query.desc">true</s:param>
            </s:action>
            <ul>
                <s:iterator value="%{#blogList3.blogs}" status="rowStatus">
                    <li>
                        <a href="${yinwangroup}/blog/view/${id}"> ${title}&nbsp;</a>
                        <span class="fr"><s:date name='addTime' format="yyyy-MM-dd HH:mm"/>
                    </li>
                </s:iterator>
            </ul>
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

