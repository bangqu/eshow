<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/yinwangroup/common/path.jsp" %>
<head>
    <title>新闻管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href=""/>
    <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="${yinwangroup}/styles/admin.css">
</head>
<body>
<%@ include file="/yinwangroup/admin/common/header.jsp" %>
<div class="container mt">
    <%@ include file="/yinwangroup/admin/common/left.jsp" %>
    <div class="cont">
        <ul class="breadcrumb">
            <li><a href="/eshow/yinwangroup/admin/index.jsp">首页</a>
            </li>
        </ul>
        <div class=" com">
            <div class="page-header">
                <h3 class="yahei">管理员</h3>

                <p class="text-right">
                    <a href="${yinwangroupmanage}/user/add.jsp" class="btn btn-sm btn-primary">添加</a>
                </p>
            </div>
            <div class="com clearfix">

                <table class="table table-bordered">
                    <s:action name="user!search" id="userList" executeResult="false">
                        <s:param name="query.enabled">true</s:param>
                        <s:param name="query.website">yinwangroup</s:param>
                        <s:param name="query.order">addTime</s:param>
                        <s:param name="query.desc">true</s:param>
                    </s:action>
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>用户名</th>
                        <th>昵称</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="%{#userList.users}" status="rowStatus">
                        <tr>
                            <td>${id} </td>
                            <td >${username}  </td>
                            <td>${nickname}</td>
                            <td>
                                <a href="${yinwangroupmanage}/user/edit/${id}"
                                   class="btn btn-info btn-xs">修改</a>
                                <a href="javascript:;" class="btn btn-xs btn-default"
                                   onclick="return deleteData('确定要删除该信息吗？','user',${id});">删除</a>
                            </td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
                <%@ include file="/yinwangroup/admin/common/page.jsp" %>
            </div>
        </div>
    </div>
</div>
<%@ include file="/yinwangroup/common/scripts.jsp" %>
<%@ include file="/yinwangroup/admin/common/footer.jsp" %>

</body>

