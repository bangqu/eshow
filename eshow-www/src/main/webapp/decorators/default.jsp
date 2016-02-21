<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>

<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><decorator:title/>_EShow开源框架</title>
    <%@ include file="/common/style/bootstrap.jsp" %>
    <link href="${ctx}/static/styles/style.css" rel="stylesheet"/>
    <%@ include file="/common/jquery.jsp" %>
    <script src="${dll}/bootstrap/js/bootstrap-carousel.js"></script>
    <decorator:head/>
</head>
<body <decorator:getProperty property="body.id" writeEntireProperty="true"/> <decorator:getProperty property="body.class" writeEntireProperty="true"/>>
<%@ include file="/common/header.jsp" %>
<decorator:body/>
<%@ include file="/common/footer.jsp" %>
</body>

