<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/huaquan/common/path.jsp" %>
<s:action name="album!view" var="view" executeResult="false"/>
<c:set var="myid">
    <authz:authentication operation='id'/>
</c:set>
<head>
    <title>${view.album.name}</title>
    <meta name="keywords" content="${view.album.name}"/>
    <meta name="description" content="${view.album.name}"/>
    <link rel="stylesheet" href="${huaquan}/styles/style.css" type="text/css"/>
</head>
<body>
<%@ include file="/huaquan/common/header.jsp" %>
<div id="main">
    <div id="content">
        <div id="postpath">
            <strong>当前页面：<a href="<c:url value='${huaquan}/'/>" title="首页">首页</a>
                &raquo; <a href="<c:url value='${huaquan}/album'/>" title="公司相册">公司相册</a>
                &raquo; ${view.album.name}</strong>
        </div>
        <div id="block-content">
            <s:action name="photo!search" id="photoList" executeResult="false">
                <s:param name="queryBean.albumId">${view.album.id}</s:param>
                <s:param name="query.website">huaquan</s:param>
                <s:param name="queryBean.order">addTime</s:param>
                <s:param name="queryBean.desc">true</s:param>
                <s:param name="pagesize">12</s:param>
            </s:action>
            <ul>
                <s:iterator value="%{#photoList.photos}" status="rowStatus">
                    <li>
                        <img src="${huaquan}/upload/photo/<s:date name='%{addTime}' format='yyyyMMdd' />${photo}"
                             alt="${name}"/>
                        <p>
                                ${description}
                        </p>
                    </li>
                </s:iterator>
            </ul>
        </div>
        <div id="post-80" class="page">
            <div class="entry-content">
                相册描述：${view.album.description}
            </div>
        </div>
    </div>
    <div id="sidebar">
        <div class="sidebar_li">
            <ul>
                <li class="page_item">
                    <a href="${huaquan}/album/view/1" title="公司概貌">公司概貌</a>
                </li>
                <li class="page_item">
                    <a href="${huaquan}/album/view/2" title="产品展示">产品展示</a>
                </li>
                <li class="page_item">
                    <a href="${huaquan}/album/view/3" title="荣誉证书">荣誉证书</a>
                </li>
            </ul>
        </div>
    </div>
    <%@ include file="/huaquan/common/footer.jsp" %>
</div>
</body>
