<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>

<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
    <title><decorator:title/>_EShow开源框架</title>
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/chosen.css">
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/simditor.css">
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/style.css">

    <decorator:head/>
</head>
<body <decorator:getProperty property="body.id" writeEntireProperty="true"/> <decorator:getProperty property="body.class" writeEntireProperty="true"/>>
<%@ include file="/common/header.jsp" %>
<decorator:body/>
<%--<%@ include file="/common/footer.jsp" %>--%>
</body>

