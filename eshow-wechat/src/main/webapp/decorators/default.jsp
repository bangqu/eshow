<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><decorator:title/>_EShow开源框架</title>
    <link rel="stylesheet" type="text/css" href="${dll}/www/styles/public.css">
    <link rel="stylesheet" type="text/css" href="${dll}/www/styles/style.css">
    <decorator:head/>
</head>
<body <decorator:getProperty property="body.id" writeEntireProperty="true"/> <decorator:getProperty property="body.class" writeEntireProperty="true"/>>
<%@ include file="/common/header.jsp" %>
<decorator:body/>
<%@ include file="/common/footer.jsp" %>
</body>

