<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>个人资料</title>
</head>
<body>
<s:action name="user!view" var="view" executeResult="false">
    <s:param name="id">${authentication.id}</s:param>
</s:action>
<%@ include file="/common/messages.jsp" %>
<div class="user_centerbox eshow_top">
    <div class="user_conter">
        <div class="user_txt">
            <ul>
                <li><a class="active" href="">个人资料</a></li>
                <li><a href="${ctx}/center/photo">修改头像</a></li>
                <li><a href="${ctx}/center/password">修改密码</a></li>
            </ul>
            <s:form id="user_form" action="user!update.action" method="post" namespace="">
                <input type="hidden" name="id" value="${authentication.id}">
                <div class="user_bd">
                    <div class="user_bolck">
                        <span class="user_left">用户名</span>
                        <div class="user_right">
                            <span>${view.user.username}</span>
                        </div>
                    </div>
                    <div class="user_bolck">
                        <span class="user_left">真实姓名</span>
                        <div class="user_right">
                            <div class="user_right">
                                <input class="input_text" type="text" name="user.realname"
                                       value="${view.user.realname}"/>
                            </div>
                        </div>
                    </div>
                    <div class="user_bolck">
                        <span class="user_left">昵称</span>
                        <div class="user_right">
                            <input class="input_text" type="text" name="user.nickname" value="${view.user.nickname}"/>
                        </div>
                    </div>
                    <div class="user_bolck">
                        <span class="user_left">电话</span>
                        <div class="user_right">
                                ${view.user.username}
                        </div>
                    </div>
                    <div class="user_bolck">
                        <span class="user_left">性别</span>
                        <div class="user_right">
                            <div class="sex_btn">
                                <input type="radio" name="user.male" value="true"
                                       <c:if test="${view.user.male eq 'true'}">checked</c:if>/>
                                <span>男</span>
                            </div>
                            <div class="sex_btn">
                                <input type="radio" name="user.male" value="false"
                                       <c:if test="${view.user.male eq 'false'}">checked</c:if>/>
                                <span>女</span>
                            </div>
                        </div>
                    </div>

                    <div class="user_bolck">
                        <span class="user_left">出生年月</span>
                        <div class="user_right">
                            <div class="date_btn">
                                <input id="date_a" name="user.birthday" type="text" readonly
                                       value="${view.user.birthday}">
                            </div>
                        </div>
                    </div>
                    <div class="user_bolck user_textarea">
                        <span class="user_left">自我介绍</span>
                        <div class="user_right">
                            <textarea name="user.intro">${view.user.intro}</textarea>
                        </div>
                    </div>
                    <div class="user_bolck user_textarea user_btn">
                        <span class="user_left">我的爱好</span>
                        <div class="user_right">
                            <textarea name="user.hobby">${view.user.hobby}</textarea>
                        </div>
                    </div>
                    <div class="user_bolck user_btn">
                        <input class="make_sure" type="submit" value="确定"/>
                    </div>
                </div>
            </s:form>
        </div>
    </div>
</div>
<%@ include file="/common/scripts.jsp" %>
<script>
    // 默认
    $('#date_a').cxCalendar();
    if (${current=='login'}) {
        $("[pr='login']").addClass("nav_active");
    }
</script>
</body>