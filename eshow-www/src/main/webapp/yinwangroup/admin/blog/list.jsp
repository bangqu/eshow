<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/yinwangroup/common/path.jsp" %>
<head>
    <title>API接口管理</title>
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
            <li><a href="/admin/">首页</a></li>
            <li><span class="divider"></span>项目管理</li>
        </ul>
        <div class=" com">
            <script type="text/javascript">
    $("#messages").fadeIn(400).delay(3000).hide(0);
</script><div class="page-header">
                <h3 class="yahei">项目管理</h3>

                <p class="text-right">
                    <a href="/admin/project/add" class="btn btn-sm btn-primary">添加项目</a>
                </p>
            </div>
            <div class="com clearfix">
                <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>项目编码</th>
                            <th>项目名称</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr title="银湾物业版">
                                <td>4</td>
                                <td>yinwancompany</td>
                                <td>银湾物业版</td>
                                <td>
                                    <a class="btn btn-xs btn-default" href="/admin/category/project/4">接口类别</a>
                                    <a class="btn btn-xs btn-default" href="/admin/api/project/4">接口管理</a>
                                    <a class="btn btn-xs btn-default" href="/admin/project/edit/4">编辑项目</a>
                                </td>
                            </tr>
                        <tr title="银湾商户版">
                                <td>3</td>
                                <td>yinwanshop</td>
                                <td>银湾商户版</td>
                                <td>
                                    <a class="btn btn-xs btn-default" href="/admin/category/project/3">接口类别</a>
                                    <a class="btn btn-xs btn-default" href="/admin/api/project/3">接口管理</a>
                                    <a class="btn btn-xs btn-default" href="/admin/project/edit/3">编辑项目</a>
                                </td>
                            </tr>
                        <tr title="银湾社区生活网">
                                <td>2</td>
                                <td>yinwan</td>
                                <td>银湾社区生活网</td>
                                <td>
                                    <a class="btn btn-xs btn-default" href="/admin/category/project/2">接口类别</a>
                                    <a class="btn btn-xs btn-default" href="/admin/api/project/2">接口管理</a>
                                    <a class="btn btn-xs btn-default" href="/admin/project/edit/2">编辑项目</a>
                                </td>
                            </tr>
                        <tr title="应用推，公司核心产品，专为推广员打造">
                                <td>1</td>
                                <td>yingyongtui</td>
                                <td>应用推</td>
                                <td>
                                    <a class="btn btn-xs btn-default" href="/admin/category/project/1">接口类别</a>
                                    <a class="btn btn-xs btn-default" href="/admin/api/project/1">接口管理</a>
                                    <a class="btn btn-xs btn-default" href="/admin/project/edit/1">编辑项目</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <ul class="pagination pagination-sm">
    <li><span class="current">1</span></li>
        </ul>


</div>
        </div>
    </div>
</div>

<%@ include file="/yinwangroup/admin/common/footer.jsp" %>
</body>

