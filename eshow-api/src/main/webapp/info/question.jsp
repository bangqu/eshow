<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0">
    <title>常见问题</title>
    <link rel="stylesheet" href="${dll}/api/frozenui/dist/css/frozen.css">
    <link rel="stylesheet" href="${dll}/api/styles/style.css">
</head>
<body>
<div class="question_bd">
    <ul class="ui-list ui-list-text ui-border-tb margin-sm-top">
        <li class="ui-border-t">
            <a href="${ctx}/question/intro" class="ui-list-info">
                <h4 class="ui-nowrap">1. EShow是什么?</h4>
            </a>
        </li>
        <li class="ui-border-t">
            <a href="${ctx}/question/effect" class="ui-list-info">
                <h4 class="ui-nowrap">2. EShow能解决什么问题?</h4>
            </a>
        </li>
    </ul>
</div>
</body>
</html>
