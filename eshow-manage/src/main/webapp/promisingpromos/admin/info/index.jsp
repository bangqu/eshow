<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="../../common/path.jsp" %>
<head>
    <title>Promisingpromos_信息页管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href=""/>
    <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="${promisingpromosadmin}/styles/admin.css">
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="container mt">
    <%@ include file="../common/left.jsp" %>
    <div class="cont">
        <ul class="breadcrumb">
            <li><a href="../../admin/">首页</a>
            </li>
        </ul>
        <div class=" com">
            <script type="text/javascript">
                $("#messages").fadeIn(400).delay(3000).hide(0);
            </script>
            <div class="page-header">
                <h3 class="yahei">信息页管理</h3>

                <p class="text-right">
                    <a href="${promisingpromosadmin}/info/add" class="btn btn-sm btn-primary">添加</a>
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
                    <s:action name="info!search" id="infoList" executeResult="false" namespace="">
                        <s:param name="query.website">promisingpromos</s:param>
                        <s:param name="query.enabled">true</s:param>
                    </s:action>
                    <s:iterator value="%{#infoList.infos}" status="rowStatus">
                        <tr id="info${id}">
                            <td>${id} </td>
                            <td>${url}</td>
                            <td>${title}</td>
                            <td><a href="${promisingpromosadmin}/info/edit/${id}"
                                   class="btn btn-primary btn-xs">编辑</a>
                                <a href="javascript:;" class="btn btn-xs btn-default"
                                   onclick="return deleteData('确定要删除该信息吗？','info',${id});">删除</a>
                            </td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
                <%@ include file="../common/page.jsp" %>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/scripts.jsp" %>
</body>

