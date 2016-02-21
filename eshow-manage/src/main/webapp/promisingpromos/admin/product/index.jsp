<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="../../common/path.jsp" %>
<head>
    <title>Promisingpromos_产品管理</title>
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
            <li><a href="${promisingpromosadmin}/">首页</a>
            </li>
        </ul>
        <div class=" com">
            <div class="page-header">
                <h3 class="yahei">产品管理</h3>

                <p class="text-right">
                    <a href="${promisingpromosadmin}/product/add" class="btn btn-sm btn-primary">添加</a>
                </p>
            </div>
            <div class="com clearfix">

                <table class="table table-bordered">
                    <s:action name="product!search" id="productList" executeResult="false">
                        <s:param name="query.website">promisingpromos</s:param>
                        <s:param name="query.enabled">true</s:param>
                        <s:param name="query.order">addTime</s:param>
                        <s:param name="query.desc">true</s:param>
                    </s:action>
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>产品名</th>
                        <th>价格</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="%{#productList.products}" status="rowStatus">
                        <tr id="product${id}">
                            <td>${id} </td>
                            <td align="left" valign="middle" width="400px"
                                white-space:nowrap>
                                    ${name}
                            </td>
                            <td>${price}</td>
                            <td>
                                <a href="${promisingpromosadmin}/product/edit/${id}"
                                   class="btn btn-info btn-xs">修改</a>
                                <a href="javascript:;" class="btn btn-xs btn-default"
                                   onclick="return deleteData('确定要删除该信息吗？','product',${id});">删除</a>
                            </td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
                <%@ include file="/promisingpromos/admin/common/page.jsp" %>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/scripts.jsp" %>
</body>
