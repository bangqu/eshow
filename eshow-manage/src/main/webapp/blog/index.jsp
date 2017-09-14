<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>日志列表</title>
    <%@ include file="/common/style/validate.jsp" %>
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/chosen.css">
    <link rel="stylesheet" href="${dll}/manage/styles/jquery.cxcalendar.css">
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/simditor.css">
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/style.css">
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/layer.css">
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/select2.css">
</head>
<body>
<div class="home_wrapper ">
    <%@ include file="/include/left.jsp" %>
    <div class="home_content">
        <div class="home_list" >
            <ul class="home_navbar clearfix ">
                <li><a href="">日志管理</a></li>
                <li><span>></span></li>
                <li><a href="">日志列表</a></li>
            </ul>
        </div>

        <s:action name="blog!search" var="blogList" executeResult="false">
            <s:param name="query.website">${website}</s:param>
            <s:param name="query.enabled">true</s:param>
            <s:param name="query.order">addTime</s:param>
            <s:param name="query.desc">true</s:param>
            <s:param name="query.pagesize">20</s:param>
        </s:action>
        <div class="home_block clearfix">
            <div class="sort_cond">
                <form action="${ctx }/blog/" method="get" class="shaix">
                    <ul class="sort_left">
                        <li>

                            <span>日志名称：</span>
                            <input class="input_sm" type="text" value="${query.title}" name="query.title"
                                   placeholder="请输入日志名称"
                                   onFocus="if (placeholder =='请输入日志名称'){placeholder ='';this.style.color='#163547'}"
                                   onBlur="if (placeholder ==''){placeholder='请输入日志名称';this.style.color='#77848e'}"/>
                        </li>
                        <li>
                            <span>日志分类:</span>
                            <select class="js-example-basic-single"  value="${query.categoryId}" id="categoryId" name="query.categoryId" style="width:210px;" class="dept_select">
                            </select>
                            <input class="input_sm" type="hidden" value="${param.categoryName}" />
                        </li>
                        <li>
                            <span>发布人:</span>
                            <select class="js-example-basic-single"  value="${query.userId}" id="userId" name="query.userId" style="width:210px;" class="dept_select">
                            </select>
                            <input class="input_sm" type="hidden" placeholder="请选择发布人"
                                   value="${param.userNickname}" name="userNickname"/>
                        </li>
                        <!-- 按钮 -->
                        <li>
                            <input type="submit" class="btn btn-primary btn_xs btn_blue btn_dis btn_border" value="查询">
                        </li>
                        <li>
                            <a href="${ctx}/blog/add"><input
                                class="search_btn btn btn-primary btn_xs btn_blue btn_dis btn_border"
                                type="button" value="发布日志"/> </a>
                        </li>
                    </ul>
                    <br/>
                    <br/>

                    <%--<div class="col-sm-2 step_block">--%>
                        <%--<a href="${ctx}/blog/add"><input--%>
                                <%--class="search_btn btn btn-primary btn_xs btn_blue btn_dis btn_border"--%>
                                <%--type="button" value="发布日志"/> </a>--%>
                    <%--</div>--%>
                </form>
                <table class="table_dis table table-striped table-hover data-table table-bordered" id="blog">
                    <thead>
                    <tr>
                        <th class="table_bt"><span>话题名称</span></th>
                        <th class="table_bt"><span>推荐数</span></th>
                        <th class="table_bt"><span>阅读数</span></th>
                        <th class="table_bt"><span>评论数</span></th>
                        <th class="table_bt"><span>话题分类</span></th>
                        <th class="table_bt"><span>发布人</span></th>
                        <th class="table_bt"><span>发布时间</span></th>
                        <th class="table_bt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操&nbsp;&nbsp;&nbsp;作</span></th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="%{#blogList.blogs}" status="rowStatus" var="blog">
                        <tr id="blog${id}">
                            <td><a href="">${util:preview(title,15)}</a></td>
                            <td><span>200</span></td>
                            <td><span>${blog.count}</span></td>
                            <td><span>${blog.commentSize}</span></td>
                            <td><span>${blog.category.name}</span></td>
                            <td><span>${blog.user.nickname}</span></td>
                            <td><span><s:date name='%{addTime}' format='MM-dd HH:mm'/></span></td>
                            <td>
                                <a href="${ctx}/blog/edit/${id}" class="btn btn-xs btn-default">编辑</a>
                                <a href="javascript:;" onclick="return deleteData('确定要删除吗？','blog',${id});"
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
    <%--<div class="downmenu_hides">--%>
        <%--<ul class="promoter_select_down">--%>
            <%--<li class="promoter_down_li">--%>
                <%--<input type="text" placeholder="输入您要搜索的分类"/>--%>
            <%--</li>--%>
            <%--<s:action name="category!search" var="categoryList" executeResult="false">--%>
                <%--<s:param name="query.enabled">true</s:param>--%>
                <%--<s:param name="query.order">sequence</s:param>--%>
                <%--<s:param name="query.desc">false</s:param>--%>
                <%--<s:param name="query.pagesize">20</s:param>--%>
            <%--</s:action>--%>
            <%--<s:iterator value="%{#categoryList.categories}" status="rowStatus" var="cat">--%>
                <%--<li class="down_li_active" pr="${id}">${name}</li>--%>
            <%--</s:iterator>--%>
        <%--</ul>--%>
        <%--<ul class="public_select_down">--%>
            <%--<s:action name="user!search" var="userList" executeResult="false">--%>
                <%--<s:param name="query.enabled">true</s:param>--%>
                <%--<s:param name="query.order">addTime</s:param>--%>
                <%--<s:param name="query.desc">true</s:param>--%>
                <%--<s:param name="query.pagesize">10</s:param>--%>
            <%--</s:action>--%>
            <%--<s:iterator value="%{#userList.users}" status="rowStatus" var="us">--%>
                <%--<li class="down_li_active" pr="${id}">${nickname}</li>--%>
            <%--</s:iterator>--%>
        <%--</ul>--%>
    <%--</div>--%>
</div>
<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
<%@ include file="/common/script/validate.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/select2.full.min.js"></script>
<script type="text/javascript">
//    getTxt(".promoter_select_down .down_li_active", ".classic", "categoryId");
//    getTxt(".public_select_down .down_li_active", ".input_public", "userId");
$(document).ready(function() {
//            $(".js-example-basic-single").select2();
    $("#categoryId").select2({
        ajax: {
            type:'GET',
            url: "${ctx}/category!page.action?query.website=${website}",
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    q: params.term, // search term 请求参数
                    page: params.page
                };
            },
            processResults: function (data, params) {
                params.page = params.page || 1;
                return {
                    results: data.beans,//itemList
                    pagination: {
                        more: (params.page * 30) < data.total_count
                    }
                };
            },
            cache: true
        },
        placeholder:'请选择',//默认文字提示
        language: "zh-CN",
        tags: true,//允许手动添加
        allowClear: true,//允许清空
        escapeMarkup: function (markup) { return markup; }, // 自定义格式化防止xss注入
        minimumInputLength: 1,//最少输入多少个字符后开始查询
        templateResult: formatRepo,
        formatResult: function formatRepo(repo){return repo;}, // 函数用来渲染结果
        formatSelection: function formatRepoSelection(repo){
            $("#categoryName").val(repo.text);
            return repo.text;
        } // 函数用于呈现当前的选择
    });

    $("#userId").select2({
        ajax: {
            type:'GET',
            url: "${ctx}/user!page.action?query.website=${website}",
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    q: params.term, // search term 请求参数
                    page: params.page
                };
            },
            processResults: function (data, params) {
                params.page = params.page || 1;
                return {
                    results: data.beans,//itemList
                    pagination: {
                        more: (params.page * 30) < data.total_count
                    }
                };
            },
            cache: true
        },
        placeholder:'请选择',//默认文字提示
        language: "zh-CN",
        tags: true,//允许手动添加
        allowClear: true,//允许清空
        escapeMarkup: function (markup) { return markup; }, // 自定义格式化防止xss注入
        minimumInputLength: 1,//最少输入多少个字符后开始查询
        templateResult: formatRepo,
        formatResult: function formatRepo(repo){return repo;}, // 函数用来渲染结果
        formatSelection: function formatRepoSelection(repo){
            $("#userNickname").val(repo.text);
            return repo.text;
        } // 函数用于呈现当前的选择
    });
});

/* 这里2个函数是用于查询到内容后，显示在select2的下拉框里面 */
function formatRepo (repo) {
    if (repo.loading) return repo.text;
    var markup = '<div class="clearfix">' +
            '<div class="col-sm-20">' + repo.text + '</div>' +
            '</div>';

    return markup;
}
</script>
</body>

