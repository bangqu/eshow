<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>后台</title>
</head>
<body>
<div class="am-cf admin-main">
    <%@ include file="left.jsp" %>
    <div class="admin-content" style="min-height:500px;">

        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong> /
                <small>统计中心</small>
            </div>
        </div>

        <ul class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list ">
            <li><a href="#" class="am-text-success"><span class="am-icon-btn am-icon-file-text"></span><br>新增页面<br>2300</a>
            </li>
            <li><a href="#" class="am-text-warning"><span
                    class="am-icon-btn am-icon-briefcase"></span><br>成交订单<br>308</a></li>
            <li><a href="#" class="am-text-danger"><span
                    class="am-icon-btn am-icon-recycle"></span><br>昨日访问<br>80082</a></li>
            <li><a href="#" class="am-text-secondary"><span class="am-icon-btn am-icon-user-md"></span><br>在线用户<br>3000</a>
            </li>
        </ul>
    </div>
</div>
<%@ include file="/admin/common/footer.jsp" %>
</body>

