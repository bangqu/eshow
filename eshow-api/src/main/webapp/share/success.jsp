<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="${dll}/api/frozenui/dist/css/frozen.css">
    <link rel="stylesheet" href="${dll}/api/styles/app_style.css">
</head>
<body>
<div class="pay_bd">
    <div class="sharlist">
        <ul>
            <li>
                <a href="mobile:weixin">
                    <img src="${dll}/api/images/shar1.png">

                    <p>微信朋友圈</p>
                </a>
            </li>
            <li>
                <a href="mobile:qq">
                    <img src="${dll}/api/images/shar0.png">

                    <p>QQ空间</p>
                </a>
            </li>
        </ul>
    </div>
</div>
</body>
</html>
