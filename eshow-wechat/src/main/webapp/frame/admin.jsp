<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>EShow Admin开源框架</title>
    <meta name="description" content="EShow Admin开源框架"/>
    <meta name="keywords" content="EShow,EShow开源网站,开源框架,ssh,轻量级框架,EShowUI开源框架"/>
</head>
<body>
<c:set var="current">frame</c:set>
<!-- banner -->
<div class="admin_banner clear">
    <div class="admin_wp">
        <div class="info fl">
            <h4>EShow Admin</h4>
            <span>做一个不需要改动的后台管理系统风格</span>
            <a href="${ctx}/admin/ui.html" class="welcome_btn">效果演示</a>
        </div>
        <div class="rimg fr">
            <img src="${dll}/www/images/admin_img1.png">
        </div>
    </div>
</div>

<!-- content -->
<div class="bg admin_bd">
    <div class="admin_wp my_icons">
        <div class="info">
            <h3>后台模块齐全</h3>
        </div>
        <div class="list clearfix">
            <a href="${ctx}/admin/ui.html">
                <img src="${dll}/www/images/admin_ic1.png">
                <span>菜单</span>
            </a>
            <a href="${ctx}/admin/ui.html">
                <img src="${dll}/www/images/admin_ic2.png">
                <span>表格</span>
            </a>
            <a href="${ctx}/admin/ui.html">
                <img src="${dll}/www/images/admin_ic3.png">
                <span>表单</span>
            </a>
            <a href="${ctx}/admin/ui.html">
                <img src="${dll}/www/images/admin_ic4.png">
                <span>图标</span>
            </a>
            <a href="${ctx}/admin/ui.html">
                <img src="${dll}/www/images/admin_ic5.png">
                <span>按钮</span>
            </a><a href="#">
            <img src="${dll}/www/images/admin_ic6.png">
            <span>通知</span>
        </a>
            <a href="${ctx}/admin/ui.html">
                <img src="${dll}/www/images/admin_ic7.png">
                <span>弹出层</span>
            </a>
            <a href="${ctx}/admin/ui.html">
                <img src="${dll}/www/images/admin_ic8.png">
                <span>更多</span>
            </a>
        </div>
    </div>
</div>

<div class="bge admin_bd">
    <div class="admin_wp my_cod">

        <div class="info">
            <h3 class="hds">开发标准化</h3>
            <p>让我们用最快的速度搭建，不断完善的后台风格框架</p>
        </div>

        <img src="${dll}/www/images/admin_img2.png">
    </div>
</div>

<div class=" admin_bd">
    <div class="admin_wp my_cod">

        <div class="info">
            <h3 class="hds">组件深度集成</h3>
            <p>
                我们选择最好最广泛的组件进行集成,集成的组件与EShow框架完美交互</p>
        </div>

        <img src="${dll}/www/images/admin_img4.png">
    </div>
</div>

<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript">
    if (${current=='frame'}) {
        $("[pr='frame']").addClass("nav_active");
    }
</script>
</body>
