<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/huaquan/common/taglibs.jsp" %>
<%@ include file="/huaquan/common/path.jsp" %>
<head>
    <title>新闻页管理</title>
    <link rel="stylesheet" href="${huaquan}/static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${huaquan}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${huaquan}/static/styles/admin.css">
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container mt">
    <%@ include file="../left.jsp" %>
    <div class="cont">
        <ul class="breadcrumb">
            <li><a href="${huaquanmanage}/">首页</a>
            </li>
        </ul>
        <div class=" com">
            <div class="page-header">
                <h3 class="yahei">新闻页管理</h3>

                <p class="text-right">
                    <a href="add.jsp" class="btn btn-sm btn-primary">添加</a>
                </p>
            </div>
            <div class="com clearfix">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>新闻标题</th>
                        <th>新闻内容</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:action name="blog!search" id="blogList" executeResult="false" namespace="">
                        <s:param name="query.website">huaquan</s:param>
                        <s:param name="query.enabled">true</s:param>
                    </s:action>
                    <s:iterator value="%{#blogList.blogs}" status="rowStatus">
                        <tr id="blog${id}">
                            <td>${id}</td>
                            <td>${title}</td>
                            <td>${content}</td>
                            <td><a href="${huaquanmanage}/blog/edit/${id}"
                                   class="btn btn-primary btn-xs">编辑</a>
                                <a href="javascript:;" class="btn btn-xs btn-default"
                                   onclick="return deleteData('确定要删除该信息吗？','blog',${id});">删除</a>
                            </td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
                <%@ include file="/common/page.jsp" %>
            </div>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>
<%@ include file="/huaquan/common/scripts.jsp" %>
</body>
