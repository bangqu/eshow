<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/huaquan/common/path.jsp" %>
<s:action name="info!browse" var="view" executeResult="false">
    <s:param name="info.website">huaquan</s:param>
</s:action>
<head>
    <title>${view.info.title }</title>
    <meta name="keywords" content=${view.info.title }/>
    <link rel="stylesheet" href="${huaquan}/styles/style.css" type="text/css"/>
</head>
<body>
<%@ include file="/huaquan/common/header.jsp" %>
<div id="main">
    <div id="content">
        <div id="contact_banner">
        </div>
        <div id="postpath">
            <strong>当前页面：<a href="<c:url value='${huaquan}/'/>" title="首页">首页</a>
                &raquo; ${view.info.title}</strong>
        </div>
        <div id="post-80" class="page">
            <div class="entry-content">
                ${view.info.content}
            </div>
        </div>
    </div>
    <div id="sidebar">

        <div class="sidebar_li">
            <ul>
                <li class="page_item ">
                    <a href="<c:url value='${huaquan}/about/'/>" title="公司简介">公司简介</a>
                </li>
                <li class="page_item ">
                    <a href="<c:url value='${huaquan}/info/culture'/>" title="企业文化">企业文化</a>
                </li>
                <li class="page_item ">
                    <a href="<c:url value='${huaquan}/info/company'/>" title="下属公司">下属公司</a>
                </li>
                <li class="page_item ">
                    <a href="<c:url value='${huaquan}/contact/'/>" title="联系我们">联系我们</a>
                </li>
            </ul>
        </div>
    </div>
    <%@ include file="/huaquan/common/footer.jsp" %>
</div>
</body>
