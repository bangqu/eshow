<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>注册帐号</title>
    <meta name="description" content="EShow框架注册帐号" />
    <meta name="keywords" content="EShow,EShow开源网站,开源框架,ssh,轻量级框架,注册帐号" />
</head>
<style>
    body{background-color:#e1e5eb;}
</style>
<body>
<c:set var="current">signup</c:set>
<div class="log_inbox">
    <div class="log_in">
        <div class="log">
            <a href="${ctx}/"><img src="${dll}/www/images/log_in.png"></a>
        </div>
        <div class="log_bd">
            <s:form id="signup_form" action="user!check.action" method="post" namespace="">
                <p class="form_top"><span>注册账号</span></p>
                <c:if test="${not empty messages}">
                    <p class="allot"><span><c:forEach var="msg" items="${messages}">
			<c:out value="${msg}" />
			<br />
                        </c:forEach><c:remove var="messages" scope="session" /></p>
                </c:if>
                <div class="log_inputs log_disdance">
                    <input class="input_border validate[required] validate[custom[phone]" type="text"
                           placeholder="请输入手机号"
                           id="username" name="user.username"/>
                </div>
                <div class="log_inputs find_code-dis">
                    <input class="find_code validate[required]" type="text" name="code" placeholder="请输入验证码"/>
                    <input id="code" class="find_code_img" type="button" value="获取验证码"/>
                </div>
                <div class="log_btn">
                    <input type="hidden" name="redirect" value="/user/signup"/>
                    <input class="btn_active input_btn" type="submit" value="下一步"/>
                </div>
                <div class="find_cide_line"></div>
                <p class="form_footer"><a href="${ctx}/user/login">已有账号直接登录</a></p>
            </s:form>
        </div>

    </div>
    <div class="log_footer">
        <span>Copyright © 2009 www.eshow.org.cn All rights reserved. ICP备案编号：苏ICP备10018847号</span>
    </div>
</div>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.js"></script>
<script type="text/javascript" src="${dll}/validate/jquery.validationEngine.min.js"></script>
<script type="text/javascript" src="${dll}/validate/jquery.validationEngine-zh_CN.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
<script>
    $('#signup_form').validationEngine();
    var count=60;
    var t1=null;
    $("#code").on("click", function () {
        var mobile = $("#username").val();
        if (mobile == "") {
            layer.msg('手机号码不能为空');
        } else {
            $("#code").attr("disabled","disabled");
            $.ajax({
                type: "POST",
                url: '${ctx}/code!send.action',
                data: {
                    mobile: mobile,
                    type: "register"
                },
                cache: false,
                dataType: 'json',
                success: function (result) {
                    if (result.status == "1") {
                        layer.msg('验证码发送成功');
                    } else {
                        layer.msg('验证码发送失败');
                    }
                }
            });
            t1=setInterval(time, 1000);
        }
    });

    function time(){
        count--;
        if (count < 1) {
            enableBtn();
            count = 60;
            $("#code").val("获取验证码");
            clearInterval(t1);
        } else {
            $("#code").val(count + "秒");
        }
    }

    function enableBtn(){
        $("#code").removeAttr("disabled");
    }

    if(${current=='signup'}){
        $("[pr='signup']").addClass("nav_active");
    }
</script>
</body>
