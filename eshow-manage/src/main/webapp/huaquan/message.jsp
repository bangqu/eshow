<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>欢迎</title>
    <meta name="heading" content="到群"/>
    <meta name="menu" content="到群"/>
</head>
<body id="index"/>
<s:textfield label="群组关键字" cssClass="text medium" name="group.name"></s:textfield>
 <s:submit cssClass="button" value="搜索" />
<div>热门群组</div>
<div>新加群组</div>
<div>Mini群组</div>
<div>Mini群组的文章列表</div>
<div>公告推荐（右边）</div>
<div>团队动态（右边）</div>
<div>刚刚发生的（右边）</div>
<div>登录之后的顺序调整，及内容变动（增加我的群组，刚刚发生的放在其下面，）</div>
