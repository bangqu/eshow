<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/yinwangroup/common/path.jsp" %>
<head>
    <title>添加管理员</title>
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
            <li><a href="${yinwangroupmanage}/">首页</a></li>
            <li><a href="${yinwangroupmanage}/blog/">管理员管理</a></li>
            <li>添加管理员</li>
        </ul>
        <div class="com">
            <div class="page-header">
                <h3 class="yahei">添加管理员</h3>
            </div>
            <div class="com clearfix">
                <s:form cssClass="form-horizontal" name="userForm" id="userForm" action="user!add.action" namespace=""
                        method="post">
                    <input type="hidden" name="redirect" value="${yinwangroupmanage}/user/">
                    <input type="hidden" name="user.website" value="yinwangroup">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>

                        <div class="col-sm-8">
                            <input type="text" data-errormessage="用户名不能为空" class="form-control" value="" id="username"
                                   name="user.username">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">密码</label>

                        <div class="col-sm-8">
                            <input type="password" data-errormessage="密码不能为空" class="form-control" value=""
                                   id="password" name="user.password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">确认密码</label>

                        <div class="col-sm-8">
                            <input type="password" data-errormessage="密码不能为空" class="form-control" value=""
                                   id="confirmPassword" name="user.confirmPassword">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">昵称</label>

                        <div class="col-sm-8">
                            <input type="text" data-errormessage="昵称不能为空" class="form-control" value=""
                                   id="nickname" name="user.nickname">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">添加</button>
                            <button type="button" onclick="window.history.go(-1);" class="btn">取消</button>
                        </div>
                    </div>
                </s:form>
            </div>
        </div>
    </div>
</div>
<%@ include file="/yinwangroup/admin/common/footer.jsp" %>
<%@ include file="../../common/scripts.jsp" %>
</body>

