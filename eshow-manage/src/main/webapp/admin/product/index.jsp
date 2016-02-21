<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util" %>
<%@ include file="../common/website.jsp" %>
<head>
    <title>产品</title>
</head>
<body>
<div class="am-cf admin-main">
    <c:set var="current">product</c:set>
    <%@ include file="../left.jsp"%>
    <div class="admin-content">
        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong> /
                <small>产品中心</small>
            </div>
        </div>
        <div class="am-g">
            <div class="am-u-md-6 am-cf">
                <div class="am-fl am-cf">
                    <div class="am-btn-toolbar am-fl">
                        <div class="am-btn-group am-btn-group-xs">
                            <a class="am-btn am-btn-default" href="${ctx}/admin/product/add"><span class="am-icon-plus"></span> 新增</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="am-u-md-3 am-cf">
                <div class="am-fr">
                    <div class="am-input-group am-input-group-sm">
                        <input type="text" class="am-form-field">
                <span class="am-input-group-btn">
                  <button class="am-btn am-btn-default" type="button">搜索</button>
                </span>
                    </div>
                </div>
            </div>
        </div>
        <s:action name="product!search" id="productList" executeResult="false" namespace="">
            <s:param name="query.website">${website}</s:param>
            <s:param name="query.enabled">true</s:param>
            <s:param name="query.order">addTime</s:param>
            <s:param name="query.desc">true</s:param>
        </s:action>
        <div class="am-g">
            <div class="am-u-md-12">
                <form class="am-form">
                    <table class="am-table am-table-striped am-table-hover table-main">
                        <thead>
                        <tr>
                            <th class="table-check"><input type="checkbox"></th>
                            <th class="table-id">ID</th>
                            <th class="table-title">标题</th>
                            <th class="table-type">型号</th>
                            <th class="table-author">作者</th>
                            <th class="table-date">修改日期</th>
                            <th class="table-set">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="%{#productList.products}" status="rowStatus">
                            <tr id="product${id}">
                                <td><input type="checkbox"></td>
                                <td>${id}</td>
                                <td><a href="#">${name}</a></td>
                                <td>${code}</td>
                                <td>${user.nickname}</td>
                                <td>${addTime}</td>
                                <td>
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <a class="am-btn am-btn-default" href="${ctx}/admin/product/edit.jsp?id=${id}"><span
                                                    class="am-icon-plus"></span> 编辑</a>
                                            <a href="javascript:;" class="am-btn am-btn-default am-btn-xs am-text-danger"
                                               onclick="deleteData('确定要删除该信息吗？','product',${id});"><span
                                                    class="am-icon-trash-o"></span> 删除
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </s:iterator>
                        </tbody>

                    </table>
                    <%@include file="/admin/common/page.jsp" %>
                    <hr>
                    <p>注：.....</p>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="/admin/common/footer.jsp" %>
</body>

