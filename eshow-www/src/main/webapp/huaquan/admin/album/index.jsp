<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/huaquan/common/path.jsp" %>
<head>
    <title>相册管理</title>
    <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="${huaquan}/static/styles/admin.css">
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
                <h3 class="yahei">相册管理</h3>
                <p class="text-right">
                    <a href="add.jsp" class="btn btn-sm btn-primary">添加相册</a>
                </p>
            </div>
            <div class="com clearfix">

                <table class="table table-bordered">
                    <s:action name="album!search" var="albumList" executeResult="false">
                        <s:param name="query.website">huaquan</s:param>
                        <s:param name="query.enabled">true</s:param>
                        <s:param name="query.order">addTime</s:param>
                        <s:param name="query.desc">true</s:param>
                    </s:action>
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>相册封面</th>
                        <th>相册名称</th>
                        <th>相册描述</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="%{#albumList.albums}" status="rowStatus">
                        <tr id="album${id}">
                            <td>${id} </td>
                            <td >
                              <img src="${img}">
                            </td>
                            <td>${name}</td>
                            <td>${description}</td>
                            <td>
                                <a href="${huaquanmanage}/album/edit/${id}"
                                   class="btn btn-info btn-xs">修改</a>
                                <a href="javascript:;" class="btn btn-xs btn-default"
                                   onclick="return deleteData('确定要删除该相册吗？','album',${id});">删除</a>
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

