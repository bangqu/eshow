<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="format-detection" content="telephone=no">
        <title>银湾社区生活网</title>
        <script src="static/js/jquery.js"></script>
        <script src="static/js/a.js"></script>
        <link rel="stylesheet" href="static/styles/css.css">
        <style>
            .topbanner{height:160px;width:100%;background-size:cover;background-position: center}
.texinfo{background:rgba(255,255,255,.9);border:1px solid #ddd;margin:-30px auto 20px;width:80%;line-height:1.3;z-index:11222;font-size:14px;padding:15px;border-radius: 10px;}
        </style>
    </head>
    
    <body>
        <div class="header">
            <i onclick="window.history.back();" class="back"></i>
                <h3 class="name">银湾社区生活网</h3>
                 <span class="mum" onclick="showside();">   </span>
        </div>
        <div  class="c-img ">
                <div class="topbanner" style="background-image:url(static/images/in-sqshw/img1.png)">

                </div>
                <div class="texinfo">
                    <p>
                        “银湾社区生活网”是中国最大的业主生活综合服务平台，以其全地域、全行业、全免费、全开放的
                        领先理念，立足于社区物业管理基础服务，以业主的物质和精神需求为导向，践行、深化“业主生活顾问
                        ”系列服务，以业主的“衣、食、住、行”为切入点，构筑社区服务体系，致力于成为社区生活方式倡导者。</p><p>
                        为每一位业主提供更优质的、全方位的便捷服务；为每一个物业公司提供系统化管理工具、创造更多盈利渠道；为每一个商家提供社区移动电商经营平台。目标在未来的三年内成为5亿中国业主的手机标准配置、成为中国7万家物业公司的好帮手。
                    </p>
                </div>

            <img src="static/images/in-sqshw/img2.png">
            <img src="static/images/in-sqshw/img3.png">
            <img src="static/images/in-sqshw/img4.png">
        </div>





        <div class="sidebar ">
            <div class="hd"><img src="static/images/logo.png"> <i onclick="closeside();">x</i></div>
            <div class="comm">
                <dl>
                    <dt>
                        <span>银湾集团</span>
                    </dt>
                    <dd class="clear">
                        <a href="v-app.jsp">银湾云APP</a>
                        <a href="v-sqshw.jsp">银湾社区生活网</a>
                        <a href="v-sqcs.jsp"  >银湾商城</a>
                        <a href="v-ywj.jsp">银湾家</a>
                        <a href="v-wuye.jsp">银湾物业</a>
                        <a href="v-sxy.jsp">银湾商学院</a>
                        <a href="http://wanlixing.yinwan.com/m/">智慧社区万里行</a>
                        <a href="v-wyjm.jsp">中国物业加盟网</a>
                        <a href="v-flb.jsp">福利宝</a>
                        <a href="v-zwj.jsp">住我家</a>
                        <a href="v-lld.jsp">邻里店</a>
                        <a href="v-wuyetong.jsp">物业通</a>
                        <a href="v-rykj.jsp">仁盈科技</a>
                        <a href="v-jjh.jsp">银湾爱心公益基金会</a>
                        <a href="v-yys.jsp">银钥匙</a>
                        <a href="https://fuwuqu.com">服务区</a>
                        <a href="v-sq123.jsp" >社区123</a>
                        <a href="v-efang.jsp">E房通</a>
                        <a href="v-sqcs.jsp">银湾O2O社区超市</a>
                        <a href="v-sqshw.jsp">邻里汇</a>
                        <a href="v-ywjqr.jsp">银湾机器人</a>
                        <a href="v-o2oshg.jsp">智慧社区O2O生活馆</a>
                        <a href="v-app.jsp" >业主生活顾问</a>
                        <a href="v-yincafe.jsp">赢吧YinCafe</a>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <span>关于银湾</span>
                    </dt>
                    <dd class="clear">
                        <a href="about.jsp">关于银湾集团</a>
                        <a href="contact.jsp">联系我们</a>
                        <a href="disclaimer.jsp">免责申明</a>
                    </dd>
                </dl>
            </div>
        </div>

        <script src="static/js/jquery.js"></script>
        <script src="static/js/jquery.cookie.js"></script>
        <script src="static/js/a.js"></script>


    </body>