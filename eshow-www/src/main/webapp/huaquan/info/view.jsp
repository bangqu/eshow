<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/huaquan/common/path.jsp" %>
<s:action name="info!browse" var="view" executeResult="false"/>
<head>
    <title>${view.info.title }</title>
    <meta name="keywords" content=${view.info.title}/>
    <link rel="stylesheet" href="${huaquan}/styles/style.css" type="text/css"/>
</head>
<body>
<div id="main">
    <div id="content">
        <div id="contact_banner">
        </div>
        <div id="postpath">
            <strong>当前页面：<a href="<c:url value='${huaquan}/'/>" title="首页">首页</a>
                &raquo; 联系我们</strong>
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
                <li class="page_item page-item-90">
                    <a href="rzyzz" title="认证与资质">认证与资质</a>
                </li>
                <li class="cat-item cat-item-3">
                    <a href="category/news.html" title="查看公司动态下的所有日志">公司动态</a>
                </li>
                <li class="page_item page-item-87">
                    <a href="gsjj.html" title="公司简介">公司简介</a>
                </li>
                <li class="page_item page-item-89">
                    <a href="qywh.html" title="企业文化">企业文化</a>
                </li>
                <li class="page_item page-item-79">
                    <a href="hr.html" title="人力资源">人力资源</a>
                </li>
                <li class="page_item page-item-80 current_page_item">
                    <a href="contact.html" title="联系我们">联系我们</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
