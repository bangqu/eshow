<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="../common/taglibs.jsp" %>
<%@ include file="../common/path.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
    <title>新闻中心</title>
    <meta name="keywords" content="新闻中心" />
    <meta name="description" content="新闻中心" />
    <link rel="stylesheet" href="../static/styles/index.css"type="text/css"/>
    <link rel="stylesheet" href="../static/styles/style.css" type="text/css" />
</head>
<body>
<%@ include file="../header.jsp" %>
<div id="main">
    <div id="content" style="">
        <div id="contact_banner">
        </div>

        <div id="postpath">
            <strong>当前页面：<a href="<c:url value='${huaquan}/index.jsp'/>" title="首页">首页</a>
                &raquo; 新闻中心</strong>
        </div>
        <div class="bd">
            <div id="post-80" class="page">
                <div class="entry-content">
                    <p>地址：江苏省江阴市月城镇工业园区花塘路<br />
                        联系人：徐 琪&nbsp;&nbsp;&nbsp; 许华唯 <br />
                        电话：0510-86880100<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0510-86891620 <br />
                        手机：徐&nbsp; 琪：13861638770</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;许华唯：13812130287<br />
                        邮编：214404<br />
                        Email：<a href="mailto:huaquan-000@163.com">huaquan-000@163.com</a><br />
                        网址：<a href="http://www.jshuaquan.com/">www.jshuaquan.com</a></p>

                </div>

            </div>

        </div>
        <div id="navigation">
        </div>
    </div>
    <div id="sidebar">

        <div class="sidebar_li">

            <div class="sidebar_li">
                <ul>
                    <li class="page_item ">
                        <a href="${huaquan}/about/" title="公司简介">公司简介</a>
                    </li>
                    <li class="page_item ">
                        <a href="${huaquan}/info/culture" title="企业文化">企业文化</a>
                    </li>
                    <li class="page_item ">
                        <a href="${huaquan}/info/company" title="下属公司">下属公司</a>
                    </li>

                </ul>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>

</div>

</body>
