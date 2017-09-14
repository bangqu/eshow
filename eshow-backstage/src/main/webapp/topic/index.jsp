<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/website.jsp" %>
<s:action name="topic!search" var="topicList" executeResult="false">
    <s:param name="query.enabled">true</s:param>
    <s:param name="query.website">${website}</s:param>
    <s:param name="query.order">addTime</s:param>
    <s:param name="query.desc">true</s:param>
    <s:param name="query.pagesize">10</s:param>
</s:action>

<head>
    <title>话题列表</title>
    <%@ include file="/common/style/validate.jsp" %>
</head>
<body>
<div class="home_wrapper ">
    <%@ include file="/include/left.jsp" %>
    <div class="home_content">
        <div class="home_list"  >
            <ul class="home_navbar clearfix ">
                <li><a href="${ctx}/topic">话题管理</a></li>
                <li><span>></span></li>
                <li>话题列表</li>
            </ul>
        </div>
        <!-- 内容部分 -->

        <div class="home_block clearfix">
            <div class="sort_cond">
                <form action="${ctx}/topic/" method="get" class="shaix">
                    <ul class="sort_left">
                        <li>
                            <span>话题名称：</span>
                            <input class="input_sm" type="text" value="${query.title}" name="query.title"
                                   placeholder="请输入话题名称"
                                   onFocus="if (placeholder =='请输入话题名称'){placeholder ='';this.style.color='#163547'}"
                                   onBlur="if (placeholder ==''){placeholder='请输入话题名称';this.style.color='#77848e'}"/>
                        </li>
                        <li>
                            <%--<div class="product_search">--%>
                            <%--<span>话题分类:</span>--%>
                            <%--<input type="hidden" name="query.categoryId" value="${query.categoryId}" id="categoryId">--%>
                            <%--<input class="search_txt mr30 input_name_down input_name_down_b classic" type="text"--%>
                            <%--value="${param.categoryName}" readonly/>--%>
                            <%--</div>--%>

                            <span>发布人:</span>
                            <input type="hidden" name="query.userId" value="${query.userId}" id="userId">
                            <input class="input_sm" type="text" name="userNickname" value="${param.userNickname}"
                                   placeholder="请输入发布人"
                                   onFocus="if (placeholder =='请输入发布人'){placeholder ='';this.style.color='#163547'}"
                                   onBlur="if (placeholder ==''){placeholder='请输入发布人';this.style.color='#77848e'}"/>
                        </li>
                    </ul>
                    <!-- 按钮 -->
                    <div class="col-sm-2 step_block">
                        <input class="btn btn-primary btn_xs btn_blue btn_dis btn_border" type="submit" value="查询"/>
                    </div>
                    <div class="col-sm-2 step_block">
                        <a href="${ctx}/board">
                            <input class="btn_1 btn_1_size2 mr10 btn btn-primary btn_xs btn_blue btn_dis btn_border"
                                   type="button" value="话题分类"/>
                        </a>
                    </div>
                    <div class="col-sm-2 step_block">
                        <a href="${ctx}/topic/add">
                            <input class="search_add_btn btn btn-primary btn_xs btn_blue btn_dis btn_border"
                                   type="button" value="发布话题"/>
                        </a>
                    </div>

                </form>

                <table class="table_dis table table-striped table-hover data-table table-bordered" id="topic">
                    <thead>
                    <tr>
                        <th class="table_bt"><span>话题名称</span></th>
                        <th class="table_bt"><span>推荐数</span></th>
                        <th class="table_bt"><span>阅读数</span></th>
                        <th class="table_bt"><span>评论数</span></th>
                        <th class="table_bt"><span>话题分类</span></th>
                        <th class="table_bt"><span>发布人</span></th>
                        <th class="table_bt"><span>发布时间</span></th>
                        <th class="table_bt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操&nbsp;&nbsp;&nbsp;作</span></th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="%{#topicList.topics}" status="rowStatus" var="topic">
                        <tr id="topic${id}">
                            <td><a href="">${util:preview(title,15)}</a></td>
                            <td><span>${recommendSize}</span></td>
                            <td><span>${readSize}</span></td>
                            <td><span>${recommendSize}</span></td>
                            <td><span>${topic.board.name}</span></td>
                            <td><span>${topic.user.nickname}</span></td>
                            <td><span><s:date name='%{addTime}' format='MM-dd HH:mm'/></span></td>
                            <td>
                                <a href="${ctx}/topic/edit/${id}" class="btn btn-xs btn-default">编辑</a>
                                <a href="javascript:;" onclick="return deleteData('确定要删除吗？','topic',${id});"
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
<script type="text/javascript">
    //    getTxt(".promoter_select_down .down_li_active", ".classic", "categoryId");
    getTxt(".public_select_down .down_li_active", ".input_public", "userId");
</script>
</body>

