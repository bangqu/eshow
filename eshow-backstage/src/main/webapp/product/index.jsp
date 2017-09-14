<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<head>
    <title>产品列表</title>
    <%@ include file="/common/style/validate.jsp" %>
</head>
<div class="home_wrapper ">
    <%@ include file="/include/left.jsp" %>
        <div class="home_content">
            <div class="home_list">
                <ul class="home_navbar clearfix relative">
                    <li><span>产品管理</span></li>
                    <li><span>></span></li>
                    <li><span>产品列表</span></li>
                </ul>
            </div>


        <s:action name="product!search" var="productList" executeResult="false">
            <s:param name="query.enabled">true</s:param>
            <s:param name="query.website">${website}</s:param>
            <s:param name="query.order">addTime</s:param>
            <s:param name="query.desc">true</s:param>
            <s:param name="query.pagesize">20</s:param>
        </s:action>

            <div class="home_block clearfix">
                <div class="sort_cond">
                <form action="${ctx }/product/" method="get" class="shaix">

                    <ul class="sort_left">
                        <li>
                            <span class="mr4">产品名称:</span>
                            <input class="input_sm" type="text" placeholder="请输入产品名称"
                                   name="query.name" value="${query.name}"
                                   onFocus="if (placeholder =='请输入产品名称'){placeholder ='';this.style.color='#163547'}"
                                   onBlur="if (placeholder ==''){placeholder='请输入产品名称';this.style.color='#77848e'}"/>
                            <%--<select name="dept" data-placeholder="请输入产品名称" style="width:210px;" id="dept" class="dept_select">--%>
                                <%--<option value="-1"></option>--%>
                                <%--<option value="产品1">产品1</option>--%>
                            <%--</select>--%>
                        </li>
                    </ul>

                    <%--<div class="product_search_btns web_bottom">--%>

                        <div class="col-sm-2 step_block">
                            <input class="btn btn-primary btn_xs btn_blue btn_dis btn_border" type="submit" value="查询"/>
                        </div>
                        <div class="col-sm-2 step_block">
                           <a href="${ctx}/product/add"> <input class="btn btn-primary btn_xs btn_blue btn_dis btn_border" type="button" value="添加产品"/></a>
                        </div>

                    <%--</div>--%>
                    <!-- 搜索结束 -->
                </form>
                <table class="table_dis table table-striped table table-bordered table-striped table-hover data-table" id="product">
                    <thead>
                    <tr>
                        <th class="table_bt"><span>序号</span></th>
                        <%--<th class="text-center nosort">--%>
                            <%--<span class="btn btn-xs btn-default" id="btn_all">全选</span>--%>
                            <%--<span class="btn btn-xs btn-default" id="btn_none">反选</span>--%>
                            <%--<input type="checkbox" id="btn_all"/>   多选框--%>
                        <%--</th>--%>

                        <th class="table_bt"><span>名称</span></th>
                        <th class="table_bt"><span>型号</span></th>
                        <th class="table_bt"><span>产品类型</span></th>
                        <th class="table_bt"><span>作者</span></th>
                        <th class="table_bt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操&nbsp;&nbsp;&nbsp;作</span></th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="%{#productList.products}" status="rowStatus" var="product">
                        <tr id="product${id}">
                            <td><a href="">${rowStatus.index+1}</a></td>
                            <%--<td class="text-center"> <input type="checkbox" value="${id}"></td>  多选框--%>
                            <td><span>${name}</span></td>
                            <td><span>${code}</span></td>
                            <td><span>${product.productCategory.name}</span></td>
                            <td><span>${product.user.nickname}</span></td>
                            <td>
                                <a href="${ctx}/product/edit/${id}" class="btn btn-xs btn-default">编辑</a>
                                <a  href="javascript:;" class="btn btn-xs btn-danger" onclick="return deleteData('确定要删除吗？','product',${id});">删除</a>
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
<%--<%@ include file="/common/script/validate.jsp" %>--%>
<script>
//    多选框全选
//    $("#btn_all").click(function(){
//        $(":checkbox").prop("checked",$(this).prop("checked"));
//    })

</script>

</body>

