<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><decorator:title/></title>
    <decorator:head/>
</head>
<body <decorator:getProperty property="body.id" writeEntireProperty="true"/> <decorator:getProperty property="body.class" writeEntireProperty="true"/>>
<decorator:body/>
</body>
</html>
