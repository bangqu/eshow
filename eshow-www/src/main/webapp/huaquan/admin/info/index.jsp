<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/huaquan/common/path.jsp" %>
<head>
    <title>信息页管理</title>
    <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="${huaquan}/static/styles/admin.css">
</head>
<body>
<%@ include file="/huaquan/admin/common/header.jsp" %>
<div class="container mt">
    <%@ include file="/huaquan/admin/include/left.jsp" %>
    <div class="cont">
        <ul class="breadcrumb">
            <li><a href="${huaquanmanage}/">首页</a>
            </li>
        </ul>
        <div class=" com">
            <div class="page-header">
                <h3 class="yahei">信息页管理</h3>

                <p class="text-right">
                    <a href="add.jsp" class="btn btn-sm btn-primary">添加</a>
                </p>
            </div>
            <div class="com clearfix">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>信息URl</th>
                        <th>信息标题</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:action name="info!search" var="infoList" executeResult="false" namespace="">
                        <s:param name="query.website">huaquan</s:param>
                        <s:param name="query.enabled">true</s:param>
                    </s:action>
                    <s:iterator value="%{#infoList.infos}" status="rowStatus">
                        <tr id="info${id}">
                            <td>${id}</td>
                            <td>${url}</td>
                            <td>${title}</td>
                            <td><a href="${huaquanmanage}/info/edit/${id}"
                                   class="btn btn-primary btn-xs">编辑</a>
                                <a href="javascript:;" class="btn btn-xs btn-default"
                                   onclick="return deleteData('确定要删除该信息吗？','info',${id});">删除</a>
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
<%@ include file="/huaquan/admin/common/footer.jsp" %>
<%@ include file="/common/scripts.jsp" %>
</body>

