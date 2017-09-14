<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>找回密码</title>
    <meta name="description" content="EShow框架找回密码" />
    <meta name="keywords" content="EShow,EShow开源网站,开源框架,ssh,轻量级框架,找回密码" />
</head>
<style>
    body{background-color:#e1e5eb;}
</style>
<body>
<div class="log_inbox">
    <div class="log_in">
        <div class="log">
            <a href="${ctx}/"><img src="${dll}/www/images/log_in.png"></a>
        </div>
        <div class="log_bd">
            <s:form id="find_form" action="user!find.action" method="post" namespace="">
                <p class="form_top"><span>找回密码</span></p>
                <c:if test="${not empty messages}">
                    <div style="text-align: center;">
                        <%@ include file="/common/messages.jsp" %>
                    </div>
                </c:if>
                <div class="log_inputs log_disdance">
                    <input class="input_border validate[required] validate[custom[phone]]" type="text" id="username" name="user.username" placeholder="请输入手机号"/>
                </div>
                <div class="log_inputs find_code-dis">
                    <input class="find_code validate[required]" type="text" name="code" placeholder="请输入验证码"/>
                    <input class="find_code_img" id="code" type="button" value="获取验证码"/>
                </div>
                <div class="log_btn">
                    <input type="hidden" name="redirect" value="/user/find"/>
                    <input class="btn_active input_btn" type="submit" value="下一步"/>
                </div>
                <div class="find_cide_line"></div>
                <div class="find_pwd_log">
                    <a class="find_pwd1_left" href="${ctx}/user/login">返回登录</a>
                    <a class="find_pwd1_right" href="${ctx}/user/signup">注册账号</a>
                </div>
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
    $('#find_form').validationEngine();
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
                    type: "change"
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
</script>
</body>