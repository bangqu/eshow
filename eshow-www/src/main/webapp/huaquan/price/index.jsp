<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/huaquan/common/path.jsp" %>
<head>
    <title>报价中心_江苏华权有色炉料有限公司</title>
    <meta name="keywords" content="报价中心"/>
    <link rel="stylesheet" href="${huaquan}/static/styles/style.css" type="text/css"/>
</head>
<body>
<%@ include file="/huaquan/common/header.jsp" %>
<div id="main">
    <div id="content">
        <div id="contact_banner">
        </div>

        <div id="postpath">
            <strong>当前页面：<a href="<c:url value='${huaquan}/'/>" title="首页">首页</a>
                &raquo; 报价中心</strong>
        </div>
        <s:action name="info!browse" var="infoList" executeResult="false" namespace="">
            <s:param name="info.url">price</s:param>
            <s:param name="info.website">huaquan</s:param>
        </s:action>
        <div id="price_lv2" style="WIDTH: 960px; HEIGHT: 569px">
            <p>
                ${infoList.info.content}
            </p>
        </div>
    </div>
    <div id="sidebar">
        <div class="contact">
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
    </div>
    <%@ include file="/huaquan/common/footer.jsp" %>
</div>
</body>
