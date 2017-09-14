<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/messages.jsp" %>

<head>
    <title>发现知识</title>
    <%@ include file="/common/style/validate.jsp" %>
</head>
<body>
<!-- banner -->
<c:set var="current">operation</c:set>
<c:set var="left">ad</c:set>

<div class="main">


    <div class="home_wrapper">
        <%@ include file="/include/left.jsp" %>

        <s:action name="post!search" var="postList" executeResult="false">
            <s:param name="query.enabled">true</s:param>
            <s:param name="query.order">addTime</s:param>
            <s:param name="query.desc">true</s:param>
            <s:param name="query.pagesize">20</s:param>
        </s:action>
        <div class="home_content">
            <div class="home_list">
                <ul class="home_navbar clearfix relative">
                    <li><span>表格</span></li>
                    <li><span>></span></li>
                    <li><span>表格2</span></li>
                    <div class="hide_btn absolute">
                        <%--<input class="btn btn-success btn_xs" type="button" value="发布话题" />--%>
                    </div>
                </ul>
            </div>
            <div class="home_block clearfix">
                <div class="sort_cond">
                    <form action="${ctx}/post/" method="get" class="shaix">
                        <ul class="sort_left">
                            <li>
                                <span class="mr4">标题:</span>
                                <input type="text" name="query.title" value="${query.title}" class="input_sm" placeholder="标题">
                            </li>
                            <li>
                                <input type="submit" class="btn btn-primary btn_xs btn_blue btn_dis btn_border"
                                       value="查询">
                            </li>
                        </ul>
                    </form>
                </div>

                <table class="table table-bordered table-striped table-hover data-table">
                    <thead>
                    <tr>
                        <th class="filter">标题</th>
                        <th class="nosort">内容</th>
                        <th class="nosort">类型</th>
                        <th class="nosort">标题栏图片</th>
                        <th class="nosort">浏览次数</th>
                        <th class="nosort">评论数</th>
                        <th class="nosort">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="%{#venueOrderList.venueOrders}" status="rowStatus" var="venueOrder">
                        <tr>
                            <td class="text-center"><input type="checkbox" value=""></td>
                            <td>${title}</td>
                            <td>${content}</td>
                            <td><c:if test="${type==1}">赛事</c:if>
                                <c:if test="${type==2}">动态</c:if>
                                <c:if test="${type==3}">知识</c:if></td>
                            <td><img class="sm" src="${post.img}!icon.jpg" style="width: 30px"></td>
                            <td>${viewCount}</td>
                            <td>${commentCount}</td>
                            <td><a href="${ctx}/post/edit/${id}" class="btn btn-xs btn-default">编辑</a>
                                    <%--<a href="" class="btn btn-xs btn-default">查看</a>--%>
                                <a href="javascript:;"onclick="return del('确定要删除吗？','post',${id});" class="btn btn-xs btn-danger">删除</a>
                            </td>
                        </tr>
                    </s:iterator>

                    </tbody>
                </table>


                <%@ include file="/common/page.jsp" %>

            </div>

        </div>
    </div>




    <%@ include file="/common/scripts.jsp" %>

    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="${dll}/manage/scripts/jquery.cxcalendar.min.js"></script>
    <script type="text/javascript" src="${dll}/manage/scripts/jquery.cxcalendar.languages.js"></script>
    <script type="text/javascript" src="${dll}/manage/scripts/chosen.jquery.js"></script>
    <!-- <script type="text/javascript" src="scripts/bootstrap.min.js"></script> -->
    <script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
    <!-- 富文本 -->
    <script src="${dll}/manage/scripts/module.min.js"></script>
    <script src="${dll}/manage/scripts/hotkeys.min.js"></script>
    <script src="${dll}/manage/scripts/uploader.min.js"></script>
    <script src="${dll}/manage/scripts/simditor.min.js"></script>
    <!-- 排序 -->
    <script type="text/javascript" src="${dll}/manage/scripts/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#btn_all").click(function () {
                $(":checkbox").attr("checked", true);   //设置所有复选框默认勾选
            });
            $("#btn_none").click(function () {
                $(":checkbox").attr("checked", false);   //设置所有复选框未勾选
            });

            $('#birth_start').cxCalendar({
                type: 'datetime',
                format: 'YYYY-MM-DD HH:mm:ss'
            });
            $('#birth_end').cxCalendar({
                type: 'datetime',
                format: 'YYYY-MM-DD HH:mm:ss'
            });
            $('.data-table').dataTable({
                "searching": false,  //是否允许Datatables开启本地搜索
                "paging": false,  //是否开启本地分页
                "lengthChange": false,  //是否允许用户改变表格每页显示的记录数
                "info": false,   //控制是否显示表格左下角的信息
                "columnDefs": [{
                    "targets": 'nosort',  //列的样式名
                    "orderable": false    //包含上样式名‘nosort’的禁止排序
                }],
                //跟数组下标一样，第一列从0开始，这里表格初始化时，第四列默认降序
                // "order": [4]  //asc升序   desc降序  "order": [[ 3, "desc" ]]默认第四列为降序排列
            });

        });

    </script>

</body>