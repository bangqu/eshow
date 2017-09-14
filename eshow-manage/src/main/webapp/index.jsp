<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>后台</title>
</head>
<body>


<!-- 内容 -->
<div class="home_wrapper">
    <!--左侧-->
    <%@ include file="/include/left.jsp" %>

    <div class="home_content">
        <div class="home_dis">

        </div>
    </div>
</div>
<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>

<%--<script>--%>
    <%--$(".user_exit").hover(function(){--%>
        <%--layer.open({--%>
            <%--type: 0,--%>
            <%--title:['退出登录','fontSize:16px;color:#163547;'],--%>
            <%--content:'您确认退出登录吗？'--%>
        <%--})--%>
    <%--});--%>

<%--</script>--%>
</body>

