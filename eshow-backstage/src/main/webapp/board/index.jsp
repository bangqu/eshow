<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/website.jsp" %>

<head>
    <title>话题分类</title>

</head>
<body>

<div class="home_wrapper "  >
    <%@ include file="/include/left.jsp" %>
    <div class="home_content" >
        <div class="home_list home_navbar clearfix" >
            <ul class="fl">
                <li><a href="${ctx}/">首页概况</a></li>
                <li><span>></span></li>
                <li><a href="${ctx}/board">话题分类</a></li>
            </ul>

            <div class="fr add_log_btn">
                <a href="${ctx}/topic"><input class="btn btn-primary" type="button" value="话题列表"/></a>
            </div>
        </div>
        <s:action name="board!search" var="boardList" executeResult="false">
            <s:param name="query.website">${website}</s:param>
            <s:param name="query.enabled">true</s:param>
            <s:param name="query.order">sequence</s:param>
            <s:param name="query.desc">false</s:param>
            <s:param name="query.pagesize">20</s:param>
        </s:action>

        <%--<li class="topic_li" id="board${id}">--%>
        <%--<h5 class="list_title">${name}</h5>--%>

        <%--<p class="tiezi">--%>
        <%--<i class="iconfont icon-wodefabutiezi f30 color-blue"></i>--%>
        <%--<span class="f24 color-blue">200</span>--%>
        <%--</p>--%>

        <%--<p><span class="color-gray_blue">帖子总数</span></p>--%>

        <%--<div class="set_topic list_edit">--%>
        <%--<dl>--%>
        <%--<dd class="check_topic" pr="${id}">--%>
        <%--<i class="iconfont icon-iconfontdingdan f36"></i>--%>

        <%--<p class="f12">查看话题</p>--%>
        <%--</dd>--%>
        <%--<dd class="edit_topic" pr="${id}">--%>
        <%--<i class="iconfont icon-iconfontdingdan f36"></i>--%>

        <%--<p class="f12">编辑分类</p>--%>
        <%--</dd>--%>
        <%--<dd class="delete_topic" pr="${id}" onclick="return deleteData('确定要删除吗？','board',${id});">--%>
        <%--<i class="iconfont icon-iconfontdingdan f36"></i>--%>
        <%--<p class="f12">删除分类</p>--%>
        <%--</dd>--%>
        <%--</dl>--%>
        <%--</div>--%>
        <%--</li>--%>

        <!-- 内容部分 -->
        <dl class="edit_list">
            <s:iterator value="%{#boardList.boards}" status="rowStatus" var="board">
                <dd>
                    <div class="list_content">
                        <div>
                            <span class="list_icon list_icon_blue">${rowStatus.count}</span>
                            <span class="list_title">${name}</span>
                        </div>
                        <div class="list_tip">
                            <p>帖子总数:200</p>
                        </div>
                    </div>
                    <div class="list_edit">
                        <div class="btn-group list_edit_btn btn-group-sm" role="group" aria-label="...">
                            <button type="button" onclick="location.href='${ctx}/board/add/${id}'" class="btn btn-default">查看话题</button>
                            <button type="button" onclick="location.href='${ctx}/board/edit/${id}'" class="btn btn-default">编辑分类</button>
                            <button type="button" class="btn btn-default">删除分类</button>
                        </div>
                    </div>
                </dd>
            </s:iterator>
                    <li  style="list-style-type:none;">
                        <div class="album_icon add_img" style="width:100%;height:125px" onclick="window.location.href= '${ctx}/board/add'">
                            <img src="${dll}/manage/images/add_img.png">
                            <p>添加话题分类</p>
                        </div>
                    </li>
             </dl>
        </ul>
    </div>
    <!-- 内容部分结束 -->
</div>
</div>
<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
<script>

    var topic_w = 0;
    topic_w = $(".topic_li").width();
    $(".set_topic dl").css('width', topic_w);
    $(window).resize(function () {
        var topic_w = 0;
        topic_w = $(".topic_li").width();
        $(".set_topic dl").css('width', topic_w);
    });
    // 弹出框颜色
    $(".set_topic dl dd").click(function () {
        $(this).css('color', '#e1e5eb');
        $(this).siblings().css('color', '#fff');
    });

    //查看分类
    $(".check_topic").click(function () {
        var _boardId = $(this).attr("pr");
        layer.open({
            type: 1,
            title: ['查看分类', 'fontSize:16px;color:#163547;'],
            content: "..",
            success: function (layero, index) {
                var htm = eshow.ctx + "/ajax/board/view.jsp?boardId=" + _boardId + "&index=" + index;
                $.get(htm, function (result) {
                    $("#layui-layer" + index).find(".layui-layer-content").html(result);
                });

            }
        });
    });

    //修改分类
    $(".edit_topic").click(function () {
        var _boardId = $(this).attr("pr");
        layer.open({
            type: 1,
            title: ['编辑分类', 'fontSize:16px;color:#163547;'],
            content: "..",
            success: function (layero, index) {
                var htm = eshow.ctx + "/ajax/board/edit.jsp?boardId=" + _boardId + "&index=" + index;
                $.get(htm, function (result) {
                    $("#layui-layer" + index).find(".layui-layer-content").html(result);
                });

            }
        });
    });

    //添加分类
    $(".classify_add").click(function () {
        layer.open({
            type: 1,
            title: ['添加分类', 'fontSize:16px;color:#163547;'],
            content: "..",
            success: function (layero, index) {
                var htm = eshow.ctx + "/ajax/board/add.jsp?index=" + index;
                $.get(htm, function (result) {
                    $("#layui-layer" + index).find(".layui-layer-content").html(result);
                });

            }
        });
    });
</script>
</body>

