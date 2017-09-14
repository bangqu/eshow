<br>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<s:action name="user!view" var="view" executeResult="false"/>

<head>
    <title>查看${view.user.nickname}的信息</title>

</head>
<body>
<div class="home_wrapper ">
    <%@ include file="/include/left.jsp" %>
    <div class="home_content">
        <div class="home_list" style="margin-top:80px;">
            <ul class="home_navbar clearfix ">
                <li><a href="${ctx}/">首页</a></li>
                <li><span>></span></li>
                <li><a href="">个人中心</a></li>
            </ul>
        </div>
        <%--<div class="home_dis clearfix">--%>
        <%--<div class="home_block clearfix product_cont">--%>
        <%--<ul class="detail_avatar">--%>
        <%--<li><img src="${view.user.photo}"></li>--%>
        <%--<li class="detail_info">--%>
        <%--<p>${view.user.nickname}［账号：${view.user.username}］</p>--%>
        <%--<p>注册时间：<s:date name='%{#view.user.addTime}' format='yyyy-MM-dd HH:mm'/></p>--%>
        <%--</li>--%>
        <%--</ul>--%>
        <%--<ul class="detail_info">--%>
        <%--<li class="clearfix">--%>
        <%--<p class="detail_name"><span>姓名：</span></p>--%>
        <%--<p><span>${view.user.realname}</span></p>--%>
        <%--</li>--%>
        <%--<li class="clearfix">--%>
        <%--<p class="detail_name"><span>性别：</span></p>--%>
        <%--<p><span>--%>
        <%--<c:if test="${view.user.male==true}">男</c:if>--%>
        <%--<c:if test="${view.user.male==false}">女</c:if>--%>
        <%--</span></p>--%>
        <%--</li>--%>
        <%--<li class="clearfix">--%>
        <%--<p class="detail_name"><span>生日：</span></p>--%>
        <%--<p><span><s:date name='%{#view.user.birthday}' format='yyyy-MM-dd'/></span></p>--%>
        <%--</li>--%>
        <%--<li class="clearfix">--%>
        <%--<p class="detail_name"><span>年龄：</span></p>--%>
        <%--<p><span>${view.user.age}</span></p>--%>
        <%--</li>--%>
        <%--<li class="clearfix">--%>
        <%--<p class="detail_name"><span>手机号码：</span></p>--%>
        <%--<p><span>${view.user.username}</span></p>--%>
        <%--</li>--%>
        <%--<li class="clearfix">--%>
        <%--<p class="detail_name"><span>电子邮件：</span></p>--%>
        <%--<p><span>${view.user.email}</span></p>--%>
        <%--</li>--%>
        <%--&lt;%&ndash;<li class="clearfix">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<p class="detail_name"><span>常住城市：</span></p>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<p><span>无锡</span></p>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
        <%--<li class="clearfix">--%>
        <%--<p class="detail_name"><span>个性签名：</span></p>--%>
        <%--<p><span>${view.user.intro}</span></p>--%>
        <%--</li>--%>
        <%--<li> <a href="${ctx}/user/edit"><input class="btn btn-info" type="button" value="修改个人信息"/> </a></li>--%>
        <%--</ul>--%>
        <div class="home_block">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-2 avatar_border">
                        <div class="avatar margin_center" style="overflow: hidden">
                            <img src="${view.user.photo}" style="width: 100%;height: 100%" >
                        </div>
                        <div class="avatar_btn">
                        </div>
                    </div>

                    <div class="col-sm-10">
                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label>昵称：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <input type="text" class="input_md" readonly="readonly"
                                       value="${view.user.nickname}"/>
                            </div>
                        </div>
                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label>账号：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <input type="text" class="input_md" readonly="readonly"
                                       value="${view.user.username}"/>
                            </div>
                        </div>
                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label>注册时间：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <input type="text" class="input_md" readonly="readonly"
                                       value="<s:date name='%{#view.user.addTime}' format='yyyy-MM-dd HH:mm'/>"/>
                            </div>
                        </div>
                        </li>


                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label>姓名：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <input type="text" class="input_md" readonly="readonly"
                                       value="${view.user.realname}"/>
                            </div>
                        </div>

                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label>性别：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <input type="text" class="input_md" readonly="readonly"
                                       value="<c:if test="${view.user.male==true}">男</c:if>
                                       <c:if test="${view.user.male==false}">女</c:if>"/>
                            </div>
                        </div>

                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label>生日：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <input type="text" class="input_md" readonly="readonly"
                                       value="<s:date name='%{#view.user.birthday}' format='yyyy-MM-dd'/>"/>
                            </div>
                        </div>

                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label>年龄：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <input type="text" class="input_md" readonly="readonly"
                                       value="${view.user.age}"/>
                            </div>
                        </div>

                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label>手机号码：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <input type="text" class="input_md" readonly="readonly"
                                       value="${view.user.username}"/>
                            </div>
                        </div>

                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label>电子邮件：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <input type="text" class="input_md" readonly="readonly"
                                       value="${view.user.email}"/>
                            </div>
                        </div>

                        <%--<li class="clearfix">--%>
                        <%--<p class="detail_name"><span>常住城市：</span></p>--%>
                        <%--<p><span>无锡</span></p>--%>
                        <%--</li>--%>

                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label>个性签名：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <input type="text" class="input_md" readonly="readonly"
                                       value="${view.user.intro}"/>
                            </div>
                        </div>

                        <div class="row input_row">
                            <%--<a href="${ctx}/user/edit">--%>
                            <%--<input class="btn btn-info" type="button" value="修改个人信息"/>--%>
                            <%--</a>--%>
                            <div class="col-xs-offset-2 col-xs-10">
                                <a href="${ctx}/user/edit">
                                    <input class="btn btn-info" type="button" value="修改个人信息"/>
                                </a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


        </div>
    </div>
</div>
<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
<%@ include file="/common/script/validate.jsp" %>
</body>

