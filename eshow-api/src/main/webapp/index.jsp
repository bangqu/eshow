<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>首页</title>
</head>
<body>
API系统
<p>
    <c:out value="${requestScope.exception.message}"/>
</p>
</body>