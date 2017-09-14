<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<s:action name="user!search" var="userList" executeResult="false">
    <s:param name="query.enabled">true</s:param>
    <s:param name="query.order">addTime</s:param>
    <s:param name="query.website">${website}</s:param>
    <%--<s:param name="query.startAddTime">${param.startAddTime}</s:param>--%>
    <%--<s:param name="query.endAddTime">${param.endAddTime}</s:param>--%>
    <s:param name="query.desc">true</s:param>
    <s:param name="query.pagesize">10</s:param>
</s:action>
<head>
    <title>用户列表</title>
    <%@ include file="/common/style/validate.jsp" %>
    <link rel="stylesheet" type="text/css" href="${dll}/cxcalendar/css/jquery.cxcalendar.css">
</head>
<body>
<div class="home_wrapper ">
    <%@ include file="/include/left.jsp" %>
    <div class="home_content">
        <div class="home_list" >
                <ul class="home_navbar clearfix ">
                    <li><a href="${ctx}/">首页概况</a></li>
                    <li><span>></span></li>
                    <li>用户列表</li>
                </ul>
                <%--<div class="hide_btn absolute">--%>
                <%--<a href="${ctx}/product/add"><input class="search_add_btn btn btn-primary btn_xs btn_blue btn_dis btn_border" type="button" value="添加产品"/></a>--%>
                <%--</div>--%>
        </div>

        <div class="home_block clearfix">
            <div class="sort_cond">
                <%--搜索--%>
                <form action="${ctx}/user/" method="get" class="shaix">
                    <ul class="sort_left">
                        <li>
                            <span class="mr4">用户名:</span>
                            <input class="input_sm" type="text" placeholder="请输入用户昵称..."
                                   name="query.nickname" value="${query.nickname}"
                                   onFocus="if (placeholder =='请输入用户昵称...'){placeholder ='';this.style.color='#163547'}"
                                   onBlur="if (placeholder ==''){placeholder='请输入用户昵称...';this.style.color='#77848e'}"/>
                        </li>
                        <li>
                            <!-- 日历 -->
                            <span class="mr4">日期:</span>
                            <input id="date_before" type="text" class="input_sm calendar_bd"
                                   placeholder="请输入注册时期范围"
                                   name="startAddTime" value="${param.startAddTime}"/>
                            <span>-</span>
                            <input id="date_after" type="text" class="input_sm calendar_bd"
                                   placeholder="请输入注册时期范围"
                                   name="endAddTime" value="${param.endAddTime}"/>
                        </li>
                    </ul>

                    <!-- 按钮 -->
                    <div class="fl">
                        <input class="search_btn btn btn-primary btn_xs btn_blue btn_dis btn_border" type="submit"
                               value="查询"/>
                    </div>
                </form>

                <table class="table_dis table table-striped table-hover data-table table-bordered">
                    <thead>
                    <tr>
                        <th class="table_bt"><span>用户名</span></th>
                        <th class="filter"><span>注册时间</span></th>
                        <th class="table_bt"><span>发布话题</span></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <s:iterator value="%{#userList.users}" status="rowStatus" var="user">
                        <td>
                            <i class="iconfont icon-yonghuzhanghuguanli"></i>
                            <a href="">${nickname}</a>
                        </td>
                        <td><span><s:date name="%{addTime}" format="yyyy-MM-dd HH:mm"/></span></td>
                        <td><span>20</span></td>
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
<%--<script src="${dll}/My97DatePicker/WdatePicker.js"></script>--%>
<script src="${dll}/fileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="${dll}/fileupload/js/jquery.iframe-transport.js"></script>
<script src="${dll}/fileupload/js/jquery.fileupload.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#date_before').cxCalendar({
            type: 'datetime',
            format: 'YYYY-MM-DD HH:mm:ss'
        });
        $('#date_after').cxCalendar({
            type: 'datetime',
            format: 'YYYY-MM-DD HH:mm:ss'
        });
    })
</script>
</body>

