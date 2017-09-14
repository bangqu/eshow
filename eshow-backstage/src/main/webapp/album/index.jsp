<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/website.jsp" %>

<head>
    <title>相册列表</title>
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
                <li><a href="">相册列表</a></li>
            </ul>
        </div>

        <div class="home_dis clearfix">
            <div class="home_block clearfix product_cont">
                <div class="product_search_btns">
                    <div class="product_search">
                        <form action="${ctx}/album/" method="get" class="shaix">
                            <span>相册名称:</span>
                            <input class="input_sm" type="text" placeholder="输入相册名称"
                                   value="${query.name}" name="query.name"
                                   onFocus="if (placeholder =='输入相册名称'){placeholder ='';this.style.color='#163547'}"
                                   onBlur="if (placeholder ==''){placeholder='输入相册名称';this.style.color='#77848e'}"/>
                            <input class="search_btn btn btn-primary btn_xs btn_blue btn_dis btn_border" type="submit"
                                   value="查询"/>
                        </form>
                    </div>
                </div>
                <div class="log_block">
                    <ul class="log_classify edit_list">
                        <s:action name="album!search" var="albumList" executeResult="false">
                            <s:param name="query.enabled">true</s:param>
                            <s:param name="query.website">${website}</s:param>
                            <s:param name="query.order">addTime</s:param>
                            <s:param name="query.desc">true</s:param>
                            <s:param name="query.pagesize">10</s:param>
                        </s:action>
                        <s:iterator value="%{#albumList.albums}" status="rowStatus" var="album">
                            <li>
                                    <%--<div class="log_img">--%>
                                    <%--<img class="log_dis album_img" src="${img}">--%>
                                    <%--<p class="log_btxt album_title"><span>${name}</span></p>--%>
                                    <%--<p class="log_txt"><span><s:date name='%{addTime}' format='MM-dd HH:mm'/></span></p>--%>
                                    <%--<div class="log_bottom_tip album_avatar_box">--%>
                                    <%--<div class="log_tip_name album_avatar">--%>
                                    <%--<span class="log_name">${user.nickname}</span>--%>
                                    <%--<img src="${user.photo}">--%>
                                    <%--</div>--%>
                                    <%--</div>--%>
                                    <%--</div>--%>
                                <div class="album_block">
                                    <img class="album_img" src="${img}">

                                    <div class="album_title">
                                        <span>${name}</span>
                                    </div>
                                    <p><span><s:date name='%{addTime}' format='yyyy-MM-dd HH:mm'/></span></p>
                                </div>

                                <div class="album_avatar_box">
                                    <div class="album_avatar">
                                        <span class="log_name">${user.nickname}</span>
                                        <img src="${user.photo}">
                                    </div>
                                </div>
                                    <%--源码--%>
                                    <%--<dl class="album_img_hide btn-group list_edit_btn btn-group-sm">--%>
                                    <%--<dd class="edit_album btn btn-default">--%>
                                    <%--<i class="iconfont icon-iconfontdingdan f36"></i>--%>
                                    <%--<p class="f12">编辑相册</p>--%>
                                    <%--</dd>--%>
                                    <%--<dd class="delete_album btn btn-default">--%>
                                    <%--<i class="iconfont icon-iconfontdingdan f36"></i>--%>
                                    <%--<p class="f12">删除相册</p>--%>
                                    <%--</dd>--%>
                                    <%--</dl>--%>

                                    <%--孙涛写的--%>
                                    <%--<div class="list_edit">--%>
                                    <%--<div class="btn-group list_edit_btn btn-group-sm" role="group" aria-label="...">--%>
                                    <%--<button type="button" class="btn btn-default">--%>
                                    <%--<i class="iconfont icon-iconfontdingdan f36"></i>--%>
                                    <%--<p class="f12">编辑相册</p>--%>
                                    <%--</button>--%>
                                    <%--<button type="button" class="btn btn-default">--%>
                                    <%--<i class="iconfont icon-iconfontdingdan f36"></i>--%>
                                    <%--<p class="f12">删除相册</p>--%>
                                    <%--</button>--%>
                                    <%--</div>--%>
                                    <%--</div>--%>

                            </li>
                        </s:iterator>
                    </ul>
                    <!-- 页码 -->
                    <%@ include file="/common/page.jsp" %>
                </div>
            </div>
        </div>
        <%--<!-- 搜索 -->--%>
        <%--<form action="${ctx }/album/" method="get" class="shaix">--%>
        <%--<div class="product_search_btns web_bottom">--%>
        <%--<div class="album_search">--%>
        <%--<span>相册名称：</span>--%>
        <%--<input class="search_txt info_search" type="text" placeholder="请输入相册名称..."--%>
        <%--value="${query.name}" name="query.name"/>--%>
        <%--</div>--%>
        <%--<input class="search_btn" type="submit" value="查询"/>--%>
        <%--</div>--%>
        <%--</form>--%>
        <%--<!-- 搜索结束 -->--%>
    </div>
</div>
<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
<%@ include file="/common/script/validate.jsp" %>
<script>
    var album_w = 0;
    album_w = $(".log_classify li").width();
    $(".album_img_hide").css('width', album_w);
    $(window).resize(function () {
        var album_w = 0;
        album_w = $(".log_classify li").width();
        $(".album_img_hide").css('width', album_w);
    });
    // 弹出框颜色
    $(".album_img_hide dd").click(function () {
        $(this).css('color', '#e1e5eb');
        $(this).siblings().css('color', '#fff');
    });
</script>
</body>

