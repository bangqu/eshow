<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<head>
    <title>信息页列表</title>
    <%@ include file="/common/style/validate.jsp" %>
</head>
<body>
<div class="home_wrapper ">
    <%@ include file="/include/left.jsp" %>

    <s:action name="info!search" var="infoList" executeResult="false">
        <s:param name="query.enabled">true</s:param>
        <%--<s:param name="query.order">addTime</s:param>--%>
        <s:param name="query.desc">true</s:param>
        <s:param name="query.pagesize">20</s:param>
        <s:param name="query.website">${website}</s:param>
    </s:action>

    <div class="home_content">
        <div class="home_list" style="margin-top: 80px;">
            <ul class="home_navbar clearfix relative">
                <li><a href="${ctx}/info">网站信息</a></li>
                <li><span>></span></li>
            </ul>
        </div>
        <div class="home_dis clearfix">
            <div class="home_block clearfix product_cont">
                <%--搜索--%>

                <form action="${ctx }/info" method="get" class="shaix">
                    <div class="product_search_btns web_bottom">
                        <div class="productCategory_search product_search">
                            <ul class="sort_left">
                                <li>
                                    <span>信息页标题:</span>
                                    <input class="input_sm" type="text" placeholder="输入信息页标题" name="query.title" value="${query.title}"/>
                                </li>
                                <li>
                                    <input class="search_btn btn btn-primary btn_xs btn_blue btn_dis btn_border" type="submit" value="查询"/>
                                </li>

                                <%--<li>--%>
                                    <%--<div class="product_search_btns web_bottom">--%>
                                        <%--<div class="productCategory_search product_search">--%>
                                            <%--<span>产品分类名称：</span>--%>
                                            <%--<input class="input_sm" type="text" placeholder="请输入产品分类名称"--%>
                                                   <%--name="query.name" value="${query.name}"--%>
                                                   <%--onFocus="if (placeholder =='请输入产品分类名称'){placeholder ='';this.style.color='#163547'}"--%>
                                                   <%--onBlur="if (placeholder ==''){placeholder='请输入产品分类名称';this.style.color='#77848e'}"/>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</li>--%>

                            </ul>
                        </div>
                        <div class="product_add_btn">
                            <a href="${ctx}/info/add"><input class="search_add_btn btn btn-primary btn_xs btn_blue btn_dis btn_border" type="button" value="添加信息页"/></a>
                        </div>
                    </div>
                </form>

                    <%--<form action="${ctx }/productCategory/" method="get" class="shaix">--%>
                        <%--<ul class="sort_left">--%>
                            <%--<li>--%>
                                <%--<div class="product_search_btns web_bottom">--%>
                                    <%--<div class="productCategory_search product_search">--%>
                                        <%--<span>产品分类名称：</span>--%>
                                        <%--<input class="input_sm" type="text" placeholder="请输入产品分类名称"--%>
                                               <%--name="query.name" value="${query.name}"--%>
                                               <%--onFocus="if (placeholder =='请输入产品分类名称'){placeholder ='';this.style.color='#163547'}"--%>
                                               <%--onBlur="if (placeholder ==''){placeholder='请输入产品分类名称';this.style.color='#77848e'}"/>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<span>产品描述名称：</span>--%>
                                <%--<input class="input_sm" type="text" placeholder="请输入产品分类描述"--%>
                                       <%--name="query.description" value="${query.description}"--%>
                                       <%--onFocus="if (placeholder =='请输入产品分类描述'){placeholder ='';this.style.color='#163547'}"--%>
                                       <%--onBlur="if (placeholder ==''){placeholder='请输入产品分类描述';this.style.color='#77848e'}"/>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                        <%--<!--按钮 查询-->--%>
                        <%--<div class="fl">--%>
                            <%--<input class="search_btn fl btn btn-primary btn_xs btn_blue btn_dis btn_border" type="submit"--%>
                                   <%--value="查询"/>--%>
                        <%--</div>--%>
                        <%--<!--按钮 添加-->--%>
                        <%--<div class="product_add_btn">--%>
                            <%--<a href="${ctx}/productCategory/add"><input--%>
                                    <%--class="search_add_btn btn btn-primary btn_xs btn_blue btn_dis btn_border"--%>
                                    <%--type="button" value="添加产品分类"/></a>--%>
                        <%--</div>--%>
                    <%--</form>--%>

                <%--搜索 end--%>
                <table class="table_dis table table-striped table-hover data-table table-bordered" id="info">
                    <thead>
                    <tr>
                        <th class="table_bt"><span>序号</span></th>
                        <th class="table_bt"><span>标题</span></th>
                        <th class="table_bt"><span>访问</span></th>
                        <th class="table_bt" style= "text-align:center;"><span>操作</span></th>
                    </tr>

                    </thead>
                    <tbody>
                    <s:iterator value="%{#infoList.infos}" status="rowStatus" var="info">
                        <tr id="info${id}">
                            <td><span>${rowStatus.index+1}</span></td>
                            <td><a href="">${title}</a></td>
                            <td><span>${website}</span></td>
                            <td  align="center">
                                <a href="${ctx}/info/edit/${id}" class="btn btn-xs btn-default">编辑</a>
                                <a href="javascript:;" onclick="return deleteData('确定要删除吗？','info',${id});" class="btn btn-xs btn-danger">删除</a>

                                <%--<a href="${ctx}/productCategory/edit/${id}" class="btn btn-xs btn-default">编辑</a>--%>
                                <%--<a href="javascript:;" onclick="return deleteData('确定要删除吗？','productCategory',${id});"--%>
                                   <%--class="btn btn-xs btn-danger">删除</a>--%>

                            </td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>

            </div>
        </div>
        <!-- 页码 -->
        <%@ include file="/common/page.jsp" %>
    </div>
</div>
<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
<%@ include file="/common/script/validate.jsp" %>
</body>

