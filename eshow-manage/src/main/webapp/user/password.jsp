    <%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
             contentType="text/html;charset=utf-8" %>
        <%@ include file="/common/taglibs.jsp" %>
        <s:action name="user!view" var="view" executeResult="false"/>
        <input type="hidden" name="id" value="${view.user.id}"/>

        <head>
        <title>修改密码</title>
        </head>
        <body>

        <div class="home_wrapper ">
        <%@ include file="/include/left.jsp" %>
        <div class="home_content">
            <div class="home_list" >
                <ul class="home_navbar clearfix ">
                    <li><a href="${ctx}/">首页</a></li>
                    <li><span>></span></li>
                    <li><a href="${ctx}/user/view">个人中心</a></li>
                    <li><span>></span></li>
                    <li><a href="">修改密码</a></li>
                </ul>
            </div>


        <div class="home_dis">
        <div class="home_block product_cont">



        <s:form id="password_form" action="user!password.action" method="post" namespace="">
            <input type="hidden" name="user.username" value="${authentication.username}">
            <input type="hidden" name="redirect" value="/user/view"/>




            <div class="row input_row">
                <div class="col-xs-2 home_left">
                    <label><span>*</span>新密码：</label>
                </div>
                <div  class="col-xs-10 home_right">
                    <input type="password" class="add_info_input fl validate[required] input_md"
                           id="password" name="user.password" placeholder="请输入新的密码">
                </div>
            </div>


            <div class="row input_row">
                <div class="col-xs-2 home_left">
                    <label><span>*</span>确认密码：</label>
                </div>
                <div  class="col-xs-10 home_right">
                    <input type="password"
                           class="add_info_input fl validate[required] validate[equals[password]] input_md"
                           id="exampleInputPassword1" placeholder="请再次输入新密码">
                </div>
            </div>


            <div class="row input_row">
                <div class="col-xs-offset-2 col-xs-10">
                    <input type="button" class="btn btn-primary btn_sm btn_blue btn_dis btn_border"
                           value="发布"/>
                    <input type="button" class="btn btn-default btn_sm" value="取消" onclick="javascript:history.back()"/>
                </div>
            </div>

        </s:form>
        </div>
        </div>
        </div>
        </div>
        <%@ include file="/common/scripts.jsp" %>
        <%@ include file="/common/script/validate.jsp" %>
        <script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
        <script type="text/javascript" src="${dll}/layer/layer.js"></script>
        <%@ include file="/common/style/validate.jsp" %>

        <script>
        $('#password_form').validationEngine();
        </script>
        </body>

