<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>

<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
    <title><decorator:title/>_EShow开源框架</title>

    <link href="${dll}/backstage/css/bootstrap.min.css" rel="stylesheet">
    <link href="${dll}/backstage/font-awesome/css/font-awesome.css" rel="stylesheet">
    <!-- Toastr style -->
    <link href="${dll}/backstage/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="${dll}/backstage/css/animate.css" rel="stylesheet">
    <link href="${dll}/backstage/css/style.css" rel="stylesheet">
    <link href="${dll}/backstage/css/admin.css" rel="stylesheet">
    <decorator:head/>
</head>
<body <decorator:getProperty property="body.id" writeEntireProperty="true"/> <decorator:getProperty property="body.class" writeEntireProperty="true"/>>
<%@ include file="/common/header.jsp" %>
<decorator:body/>
</body>

