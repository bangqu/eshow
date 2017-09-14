<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>修改密码</title>
</head>
<body>
<c:set var="current">login</c:set>
<div class="user_centerbox eshow_top">
    <div class="user_conter">
        <div class="user_txt">
            <ul>
                <li><a href="${ctx}/center/info">个人资料</a></li>
                <li><a href="${ctx}/center/photo">修改头像</a></li>
                <li><a class="active" href="">修改密码</a></li>
            </ul>
            <div class="user_bd">
                <s:form id="password_form" action="user!password.action" method="post" namespace="">
                    <input type="hidden" name="user.username" value="${authentication.username}">
                    <input type="hidden" name="redirect" value="/j_spring_security_logout"/>
                    <div class="user_bolck">
                        <span class="user_left">新密码</span>
                        <div class="user_right">
                            <input class="input_text validate[required]" type="password" id="password"
                                   name="user.password" placeholder="请输入新的密码"/>
                        </div>
                    </div>
                    <div class="user_bolck">
                        <span class="user_left">确认密码</span>
                        <div class="user_right">
                            <input class="input_text validate[required] validate[equals[password]]" type="password"
                                   placeholder="请再次输入新密码"/>
                        </div>
                    </div>
                    <div class="user_bolck user_btn">
                        <input class="make_sure" type="submit" value="确定"/>
                    </div>
                </s:form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.js"></script>
<script type="text/javascript" src="${dll}/validate/jquery.validationEngine.min.js"></script>
<script type="text/javascript" src="${dll}/validate/jquery.validationEngine-zh_CN.js"></script>
<script>
    $('#password_form').validationEngine();

    if (${current=='login'}) {
        $("[pr='login']").addClass("nav_active");
    }
</script>
</body>