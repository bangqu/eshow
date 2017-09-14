<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/huaquan/common/path.jsp" %>
<head>
    <title>华权后台管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href=""/>
    <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="${huaquan}/static/styles/admin.css"/>
</head>
<body>
<%@ include file="/huaquan/admin/common/header.jsp" %>
<div class="container mt">
    <%@ include file="/huaquan/admin/include/left.jsp" %>
    <div class="cont">
        <ul class="breadcrumb">
            <li><a href="${huaquan}/admin/">后台首页</a>
            </li>
        </ul>
        <div class="well com">
            <div class="page-header">
                <h3 class="yahei">后台首页</h3>
            </div>
            <div class="com clearfix">
                <div class="clearfix">
                    <p>
                        <span>欢迎：管理员</span>
                    </p>

                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/huaquan/admin/common/footer.jsp" %>
</body>

