<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="format-detection" content="telephone=no">
        <title>银湾机器人</title>
        <script src="static/js/jquery.js"></script>
        <script src="static/js/a.js"></script>
        <link rel="stylesheet" href="static/styles/css.css">
        <style>
            .texbox{padding:15px;line-height: 1.4;font-size:14px;}
            .texbox p{margin:6px 0;}
            .c-img img{float: left}
        </style>
    </head>
    
    <body>
        <div class="header">
            <i onclick="window.history.back();" class="back"></i>
                <h3 class="name">银湾机器人</h3>
                 <span class="mum" onclick="showside();">   </span>
        </div>
        <div  class="c-img clear">
            <img src="static/images/in-rykj/ywjqr.png">
        </div>

            <div class="texbox clear">
                <h3>对运营商的价值</h3>
                <p>•	业务一键办理，方便快捷</p>
                <p>•	大数据分析，精准营销，提供定制般服务</p>
                <p>•	所有技能规范，统一程序设置，简化管理</p>
                <p>•	工作积极，任劳任怨，提高服务品质，分担运营压力</p>
                <h3>对酒店服务业的价值</h3>
                <p>•	专业服务，快速办理入住、退房</p>
                <p>•	云储存大脑，了解更多关于酒店及周边的推荐</p>
                <p>•	贴心服务，保护隐私，提升酒店智能化特色</p>
                <p>•	不知疲倦，常年无休，为酒店开源节流</p>
                <p>仁盈智慧商务机器人，还有更多行业应用领域等待开拓！</p>
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