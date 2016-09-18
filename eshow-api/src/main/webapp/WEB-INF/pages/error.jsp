<%@ page language="java" isErrorPage="true" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<head>
    <title>Error</title>
</head>

<p>
<h2>Failure</h2>
<c:out value="${requestScope.exception.message}"/>
</p>

<a href="home" onclick="history.back();return false">&#171; Back</a>