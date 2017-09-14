<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<head>
    <title>订单列表</title>
    <%@ include file="/common/style/validate.jsp" %>
</head>
<body>
<div class="home_wrapper ">
    <%@ include file="/include/left.jsp" %>
    <div class="home_content">
        <div class="home_list">
            <ul class="home_navbar clearfix ">
                <li><a href="${ctx}/">首页概况</a></li>
                <li><span>></span></li>
                <li><a href="">订单管理</a></li>
            </ul>
        </div>

        <s:action name="order!search" var="orderList" executeResult="false">
            <%--<s:param name="query.enabled">true</s:param>--%>
            <%--<s:param name="query.order">sequence</s:param>--%>
            <s:param name="query.desc">false</s:param>
            <%--<s:param name="query.pagesize">20</s:param>--%>
        </s:action>
        <div class="home_block clearfix">
            <div class="sort_cond">
                <ul class="count_list">
                    <li>
                        <a href="">
                            <span class="count_icon"></span>
                            <br>
                            本月订单数
                            <br>
                            20
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <span class="count_icon"></span>
                            <br>
                            本月收入／元
                            <br>
                            20
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <span class="count_icon"></span>
                            <br>
                            总订单数
                            <br>
                            0
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <span class="count_icon"></span>
                            <br>
                            总收入／元
                            <br>
                            34
                        </a>
                    </li>
                </ul>
            </div>
            <div class="home_dis clearfix clear">
                <div class="home_block  product_cont clear clearfix">
                    <table class="table_dis table table-striped table-hover data-table table-bordered">
                        <thead>
                        <tr>
                            <th class="table_bt"><span>订单号</span></th>
                            <th class="table_bt"><span>支付方式</span></th>
                            <th class="table_bt"><span>支付账号</span></th>
                            <th class="table_bt"><span>金额/元</span></th>
                            <th class="table_bt"><span>支付时间</span></th>
                            <th class="table_bt"><span>用户</span></th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="%{#orderList.orders}" status="rowStatus" var="order">
                            <tr>
                                <td><span>${no}</span></td>
                                <td><span>${channel}</span></td>
                                <td><span>${pingId}</span></td>
                                <td><span>${price}</span></td>
                                <td><span><s:date name='%{addTime}' format='MM-dd HH:mm'/></span></td>

                                <td>
                                    <i class="iconfont icon-wodefabutiezi"></i>
                                    <a href=""><span>${order.user.nickname}</span></a>
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
</div>
<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
<%@ include file="/common/script/validate.jsp" %>
<script type="text/javascript">
    getTxt(".promoter_select_down .down_li_active", ".classic", "categoryId");
    getTxt(".public_select_down .down_li_active", ".input_public", "userId");
</script>
</body>

