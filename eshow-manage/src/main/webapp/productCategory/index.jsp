<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<head>
    <title>产品列表</title>
    <%@ include file="/common/style/validate.jsp" %>
</head>
<body>
<div class="home_wrapper ">
    <%@ include file="/include/left.jsp" %>
    <div class="home_content">
        <div class="home_list">
            <ul class="home_navbar clearfix relative">
                <li><a href="${ctx}/">产品管理</a></li>
                <li><span>></span></li>
                <li><a href="${ctx}/board">产品分类</a></li>
                <div class="fr add_log_btn">
                    <a href="${ctx}/product"><input class="btn btn-primary" type="button" value="产品列表"/></a>
                </div>
            </ul>
        </div>

        <%--<s:action name="product-category!search" var="productCategoryList" executeResult="false">--%>
            <%--<s:param name="query.enabled">true</s:param>--%>
            <%--<s:param name="query.website">${website}</s:param>--%>
            <%--<s:param name="query.desc">true</s:param>--%>
            <%--<s:param name="query.pagesize">20</s:param>--%>
        <%--</s:action>    原来的--%>
        <s:action name="product-category!search" var="productCategoryList" executeResult="false">
            <s:param name="query.enabled">true</s:param>
            <%--<s:param name="query.order">sequence</s:param>--%>
            <s:param name="query.desc">false</s:param>
            <s:param name="query.pagesize">10</s:param>
        </s:action>
        <div class="home_block clearfix">
            <div class="sort_cond">
                <!-- 搜索 -->
                <form action="${ctx }/productCategory/" method="get" class="shaix">
                    <ul class="sort_left">
                        <li>
                            <div class="product_search_btns web_bottom">
                                <div class="productCategory_search product_search">
                                    <span>产品分类名称：</span>
                                    <input class="input_sm" type="text" placeholder="请输入产品分类名称"
                                           name="query.name" value="${query.name}"
                                           onFocus="if (placeholder =='请输入产品分类名称'){placeholder ='';this.style.color='#163547'}"
                                           onBlur="if (placeholder ==''){placeholder='请输入产品分类名称';this.style.color='#77848e'}"/>
                                </div>
                            </div>
                        </li>
                        <li>
                            <span>产品描述名称：</span>
                            <input class="input_sm" type="text" placeholder="请输入产品分类描述"
                                   name="query.description" value="${query.description}"
                                   onFocus="if (placeholder =='请输入产品分类描述'){placeholder ='';this.style.color='#163547'}"
                                   onBlur="if (placeholder ==''){placeholder='请输入产品分类描述';this.style.color='#77848e'}"/>
                        </li>
                    </ul>
                    <!--按钮 查询-->
                    <div class="fl">
                        <input class="search_btn fl btn btn-primary btn_xs btn_blue btn_dis btn_border" type="submit"
                               value="查询"/>
                    </div>
                    <!--按钮 添加-->
                    <div class="product_add_btn">
                        <a href="${ctx}/productCategory/add"><input
                                class="search_add_btn btn btn-primary btn_xs btn_blue btn_dis btn_border"
                                type="button" value="添加产品分类"/></a>
                    </div>
                </form>
            <%--</div>--%>


            <table class="table_dis table table-striped table-bordered table-hover data-table" id="productCategory">
                <thead>
                <tr>
                    <th class="table_bt"><span>序号</span></th>
                    <th class="table_bt"><span>名称</span></th>
                    <th class="table_bt"><span>描述</span></th>
                    <th class="table_bt"><span>&nbsp;&nbsp;&nbsp;&nbsp;操&nbsp;&nbsp;&nbsp;&nbsp;作</span></th>
                </tr>
                </thead>
                <tbody>
                <%--<s:iterator value="%{#productCategoryList.productCategories}" status="rowStatus" var="cat">--%>
                    <%--<li class="down_li_active" pr="${id}">${name}</li>--%>
                <%--</s:iterator>--%>
                <s:iterator value="%{#productCategoryList.productCategories}" status="rowStatus"
                            var="cat">
                    <tr>
                        <td><a href="">${id}</a></td>
                        <td><span>${name}</span></td>
                        <td><span>${description}</span></td>
                        <td>
                            <a href="${ctx}/productCategory/edit/${id}" class="btn btn-xs btn-default">编辑</a>
                            <a href="javascript:;" onclick="return deleteData('确定要删除吗？','productCategory',${id});"
                               class="btn btn-xs btn-danger">删除</a>

                        </td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>
        <!-- 页码 -->
        <%@ include file="/common/page.jsp" %>
    </div>
</div>
</div>
<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
<%@ include file="/common/script/validate.jsp" %>
</body>

