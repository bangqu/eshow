<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="${dll}/api/frozenui/dist/css/frozen.css">
    <link rel="stylesheet" href="${dll}/api/styles/style.css">
</head>
<body>
<div class="pay_bd">
    <div class="pay-info margin-sm-top">
        <ul class="ui-list ui-list-text ui-border-tb">
            <li>
                <div class="ui-list-info">
                    <h4 class="ui-nowrap"><span>订单名称： </span><span class="color-gray" id="content">支持一下EShow框架</span></h4>
                </div>
            </li>
            <li>
                <div class="ui-list-info">
                    <h4 class="ui-nowrap"><span>订单总价： </span><span class="color-price" id="price">1</span></h4>
                </div>
            </li>
        </ul>
    </div>
    <div class="pay-chek">
        <div class="padding-sm">选择支付方式</div>
        <ul class="ui-list ui-border-tb">
            <%--<li class="ui-border-t active">--%>
                <%--<div class="ui-avatar">--%>
                    <%--<span style="background-image:url(${dll}/images/ic-p3.png)"></span>--%>
                <%--</div>--%>
                <%--<div class="ui-list-info">--%>
                    <%--<h4 class="ui-nowrap">银行卡支付</h4>--%>
                    <%--<p class="ui-nowrap">支持储蓄卡信用卡，无需开通网银</p>--%>
                <%--</div>--%>
                <%--<i class="ui-icon-checked"></i>--%>
            <%--</li>--%>
            <li class="ui-border-t active" sel="1">
                <div class="ui-avatar">
                    <span style="background-image:url(${dll}/api/images/ic-p2.png)"></span>
                </div>
                <div class="ui-list-info">
                    <h4 class="ui-nowrap">微信支付</h4>
                    <p class="ui-nowrap">微信5.0及以上版本</p>
                </div>
                <i class="ui-icon-checked"></i>
            </li>
            <li class="ui-border-t" sel="2">
                <div class="ui-avatar">
                    <span style="background-image:url(${dll}/api/images/ic-p4.png)"></span>
                </div>
                <div class="ui-list-info">
                    <h4 class="ui-nowrap">支付宝支付</h4>
                    <p class="ui-nowrap">推荐有支付宝账号的用户使用</p>
                </div>
                <i class="ui-icon-checked"></i>
            </li>
        </ul>
    </div>

    <div class="block margin-sm-top">
        <div class="ui-btn-wrap">
            <button class="ui-btn-lg ui-btn-danger" id="confirm">
                确认支付
            </button>
        </div>

    </div>

    <div class="margin-big-top text-center">
        <p class="color-gray">基于HTML5技术构建</p>
    </div>
</div>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
<script>
    $("[sel]").on("click",function(){
        $("[sel]").removeClass("active");
        var _pay=$(this).attr("sel");
        $(this).addClass("active");
    })

    $("#confirm").on("click", function () {
        if("正在提交"==$("#confirm").html()){
            return;
        }
        $("#confirm").html("正在提交").attr("disabled","disabled");
        var _content = $("#content").text();
        var _price = $("#price").text();
        var _channel=$("li.active").attr("sel");
        $.ajax({
            url: "${ctx}/order/save.json",
            type: "post",
            data: {
                "accessToken": "${param.accessToken}",
                "order.title": _content,
                "order.channel": _channel,
                "order.price": parseFloat(_price)
            },
            dataType: "json",
            success: function (result) {
                if (result.status == 1) {
                    var _amount = _price*100;
                    if (_channel == 1) {
                        var url = "/ping-pay!pay.action?order_type=order&channel=wx&order_no=" + result.no
                                + "&amount=" + _amount + "&subject=" + _content + "&body=" + _content;
                        app_pay(url);
                    } else if (_channel == 2) {
                        var url = "/ping-pay!pay.action?order_type=order&channel=alipay&order_no=" + result.no
                                + "&amount=" + _amount + "&subject=" + _content + "&body=" + _content;
                        app_pay(url);
                    }
                } else {
                    layer.open({content: result.msg, btn: ['确定']});
                }
            }
        });
    });

    function app_pay(url) {
        if (typeof PINGPP_IOS_SDK !== 'undefined') {
            PINGPP_IOS_SDK.callPay(url);
        } else if (typeof PINGPP_ANDROID_SDK !== 'undefined') {
            PINGPP_ANDROID_SDK.callPay(url);
        }
    }
</script>
</body>
</html>