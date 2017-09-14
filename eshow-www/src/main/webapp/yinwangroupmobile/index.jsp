<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="format-detection" content="telephone=no">
        <title>银湾集团</title>
        <link rel="stylesheet" href="static/styles/css.css">
    </head>
    
    <body>
        <div class="header">
                <span data-href="index.jsp" class="logo"><img src="static/images/logo.png"> </span>
            <span class="mum" onclick="showside();"> </span>
        </div>
        <div  class="index_bd">
            <div class="indexbanner owl-theme" id="owl-demo" >
                <div class="">
                    <img src="static/images/banner1.png">
                </div>
                <div class="">
                    <img src="static/images/banner2.png">
                </div>
                <div class="">
                    <img src="static/images/banner3.png">
                </div>
            </div>

            <div class="hotnews">
                <span class="hd"><img src="static/images/news.png"> </span>
                <span class="more"><img src="static/images/ri.png"> </span>
                <s:action name="blog!search" var="blogList" executeResult="false" namespace="">
                    <s:param name="query.website">yinwangroup</s:param>
                    <s:param name="query.enabled">true</s:param>
                    <s:param name="query.order">addTime</s:param>
                    <s:param name="query.desc">true</s:param>
                    <s:param name="query.hasKeyword">true</s:param>
                    <s:param name="query.pagesize">1</s:param>
                </s:action>
                <s:subset source="blogList" start="0" count="1">
                <s:iterator var="blog" value="%{#blogList.blogs}" status="rowStatus">
                <a href="newsview?id=${blog.id}" class="tit">${util:preview(blog.title,false,12)}</a>
                </s:iterator>
                </s:subset>
            </div>

            <div class="servers">
               <ul class="clear">
                   <li data-href="v-app.jsp" style="background-image:url(static/images/i1.png);">
                       <h3>银湾云APP</h3>
                       <p>社区周边一手掌握</p>
                   </li>
                   <li data-href="v-sqshw.jsp"  style="background-image:url(static/images/i2.png);">
                       <h3>银湾社区生活网</h3>
                       <p>云社区,云物业,云服务</p>
                   </li>
                   <li data-href="v-sqcs.jsp"  style="background-image:url(static/images/i3.png);">
                       <h3>银湾商城</h3>
                       <p>社区O2O超市</p>
                   </li>
                   <li data-href="v-ywj.jsp"  style="background-image:url(static/images/i4.png);">
                       <h3>银湾家</h3>
                       <p>银湾智能家居</p>
                   </li>


                   <li data-href="v-wuye.jsp"  style="background-image:url(static/images/i5.png);">
                       <h3>银湾物业</h3>
                       <p>服务无限,价值无限</p>
                   </li>


                   <li data-href="v-sxy.jsp"  style="background-image:url(static/images/i6.png);">
                       <h3>银湾商学院</h3>
                       <p>物业企业一站式培训</p>
                   </li>

                   <li data-href="http://wanlixing.yinwan.com/m/"  style="background-image:url(static/images/i7.png);">
                       <h3>智慧社区万里行</h3>
                       <p>报完上架进社区，千万福利送业主</p>
                   </li>

                   <li data-href="v-wyjm.jsp" style="background-image:url(static/images/i8.png);">
                       <h3>中国物业加盟网</h3>
                       <p>加盟,合作,咨询,并购</p>
                   </li>
                   <li data-href="v-flb.jsp" style="background-image:url(static/images/i9.png);">
                       <h3>福利宝</h3>
                       <p>社区福利运营平台</p>
                   </li>

                   <li data-href="v-zwj.jsp" style="background-image:url(static/images/i10.png);">
                       <h3>住我家</h3>
                       <p>社区分散式公寓</p>
                   </li>

                   <li  data-href="v-lld.jsp" style="background-image:url(static/images/i11.png);">
                       <h3>邻里店</h3>
                       <p>B2B交易平台</p>
                   </li>

                   <li data-href="v-wuyetong.jsp" style="background-image:url(static/images/i12.png);">
                       <h3>物业通</h3>
                       <p>B2B交易平台</p>
                   </li>

                   <li data-href="v-rykj.jsp" style="background-image:url(static/images/i13.png);">
                       <h3>仁盈科技</h3>
                       <p>服务机器人行业应用平台</p>
                   </li>
                   <li data-href="v-jjh.jsp" style="background-image:url(static/images/i14.png);">
                       <h3>银湾爱心基金会</h3>
                       <p>关注公益献爱心</p>
                   </li>

                   <li data-href="v-yys.jsp" style="background-image:url(static/images/i15.png);">
                       <h3>银钥匙</h3>
                       <p>物业企业一站式服务平台</p>
                   </li>


                   <li data-href="https://fuwuqu.com" style="background-image:url(static/images/i16.png);">
                       <h3>服务区</h3>
                       <p>物业行业SAAS服务平台</p>
                   </li>



                   <li data-href="v-sq123.jsp" style="background-image:url(static/images/i17.png);">
                       <h3>社区123</h3>
                       <p>O2O生活服务导航</p>
                   </li>
                   <li data-href="v-efang.jsp" style="background-image:url(static/images/i18.png);">
                       <h3>E房通</h3>
                       <p>最新鲜的房产咨讯</p>
                   </li>

                   <li data-href="v-sqcs.jsp" style="background-image:url(static/images/i19.png);">
                       <h3>银湾O2O社区超市</h3>
                       <p>开放式社区购物平台</p>
                   </li>
                   <li data-href="http://www.yinwan.com/welcome/neigh" style="background-image:url(static/images/i20.png);">
                       <h3>邻里汇</h3>
                       <p>重新定义小区社交方式</p>
                   </li>
                   <li data-href="v-ywjqr.jsp" style="background-image:url(static/images/i21.png);">
                       <h3>银湾机器人</h3>
                       <p>物业服务机器人先行者</p>
                   </li>
                   <li data-href="v-o2oshg.jsp" style="background-image:url(static/images/i22.png);">
                       <h3>银湾智慧社区O2O生活馆</h3>
                       <p>社区综合服务体验馆</p>
                   </li>
                   <li data-href="v-app.jsp" style="background-image:url(static/images/i23.png);">
                       <h3>业主生活顾问</h3>
                       <p>让您的生活没有后顾之忧</p>
                   </li>
                   <li data-href="v-yincafe.jsp" style="background-image:url(static/images/i24.png);">
                       <h3>赢吧YinCafe</h3>
                       <p>社区休闲交流场所</p>
                   </li>

               </ul>
            </div>


            <div class="ibox">
                <div class="title"><span>今日银湾</span><span class="pr more"><a href="newslist.jsp">查看全部 ></a></span></div>
                <div class="newsbox">
                    <div class="cats">
                        <a href="newslist.jsp"  cid="11"  class="active">银湾要文</a>
                        <a href="newslist.jsp?query.keyword=上海银湾" cid="12" class="">上海银湾</a>
                        <a href="newslist.jsp?query.keyword=江西银湾" cid="13" class="">江西银湾</a>
                        <a href="newslist.jsp?query.keyword=广西银湾" cid="14" class="">广西银湾</a>
                    </div>
                    <dl>
                        <dt>
                            <s:action name="blog!search" var="blogList" executeResult="false" namespace="">
                                <s:param name="query.website">yinwangroup</s:param>
                                <s:param name="query.enabled">true</s:param>
                                <s:param name="query.order">addTime</s:param>
                                <s:param name="query.desc">true</s:param>
                                <s:param name="query.hasKeyword">true</s:param>
                                <s:param name="query.hasImg">true</s:param>
                                <s:param name="query.pagesize">1</s:param>
                            </s:action>
                            <s:subset source="blogList" start="0" count="1">
                                <s:iterator var="blog" value="%{#blogList.blogs}" status="rowStatus">
                                    <a href="newsview?id=${blog.id}"> <img src="${blog.img}">
                                        <Span>${blog.title}</Span>
                                    </a>
                                </s:iterator>
                            </s:subset>
                        </dt>
                        <dd>
                            <s:action name="blog!search" var="blogList" executeResult="false" namespace="">
                                <s:param name="query.website">yinwangroup</s:param>
                                <s:param name="query.enabled">true</s:param>
                                <s:param name="query.order">addTime</s:param>
                                <s:param name="query.desc">true</s:param>
                                <s:param name="query.hasKeyword">true</s:param>
                                <s:param name="query.hasImg">false</s:param>
                                <s:param name="query.pagesize">5</s:param>
                            </s:action>
                            <s:subset source="blogList" start="0" count="1">
                                <s:iterator var="blog" value="%{#blogList.blogs}" status="rowStatus">
                                    <a href="newsview?id=${blog.id}">${blog.title}</a>
                                </s:iterator>
                            </s:subset>
                        </dd>
                    </dl>

                    <div class="jincai clear">
                        <a href="piclist.jsp"><img src="static/images/ic1.png"><span>精彩图片</span> </a>
                        <a href="videolist.jsp"><img src="static/images/ic2.png"><span>精彩视频</span></a>
                    </div>
                </div>
            </div>
            <div class="ibox">
                <div class="title"><span>合作伙伴</span>
                  <!--<span class="pr more">  <a href="">查看全部 ></a></span>-->
                </div>
                <div class="hezuo clear">

                             <a href="http://www.suning.com" target="_blank" title="苏宁易购"><img src="./static/images/link/snyg.png"></a>
                             <a href="http://www.antgroup.com" target="_blank" title="蚂蚁金服"><img src="./static/images/link/myjf.png"></a>
                             <a href="http://www.tslsmart.com" target="_blank" title="特斯联"><img src="./static/images/link/tsl.png"></a>
                             <a href="http://www.chinaredstar.com" target="_blank" title="红星美凯龙"><img src="./static/images/link/hxmkl.png"></a>
                             <a href="http://www.zhongyu.com" target="_blank" title="中域"><img src="./static/images/link/zydx.png"></a>
                             <a href="http://www.liby.com.cn" target="_blank" title="立白"><img src="./static/images/link/lb.png"></a>


                </div>
            </div>
            <div class="ibox">
                <div class="title"><span>商务合作</span><span class="pr more"><a href="">查看全部 ></a></span></div>
                <div class="textlink clear">
                     <a href="jiameng.jsp">物业公司加盟</a>
                    <a href="jiameng.jsp">代理商加盟</a>
                    <a href="jiameng.jsp">商家加盟</a>
                    <a href="jiameng.jsp">银湾O2O社区超市</a>
                    <a href="jiameng.jsp">E房通</a>
                    <a href="jiameng.jsp">银湾机器人</a>
                    <a href="jiameng.jsp">邻里店</a>
                    <a href="jiameng.jsp">社区123</a>
                    <a href="jiameng.jsp">赢吧YinCafe</a>
                </div>
            </div>
            <div class="ibox">
                <div class="title"><span>关于银湾</span></div>
                <div class="textlink clear">
                    <a href="about.jsp">关于银湾集团</a>
                    <a href="contact.jsp">联系我们</a>
                    <a href="disclaimer.jsp">免责申明</a>
                </div>
            </div>
            <div class="ibox">
                <div class="title"><span>移动端APP</span></div>
                <div class="textlink clear">
                    <a href="http://www.yinwan.com/app/">银湾社区生活网APP</a>
                    <a href="https://www.fuwuqu.com/index.html#yz">物业贝贝APP</a>
                    <a href="http://www.yinwan.com/app/shop">银湾社区生活网商户版APP</a>

                    <a href="https://www.fuwuqu.com/index.html#wy">业主贝贝APP</a>
                </div>
            </div>



        </div>



        <div class="footer">
                <img src="static/images/flogo.png">
            <p>银湾集团©版权所有<br>
                Copyright1995-2017© yinwangroup.com Inc. All rights reserved</p>
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
                        <a href="about.htmk">关于银湾集团</a>
                        <a href="ontact.html">联系我们</a>
                        <a href="disclaimer.jsp">免责申明</a>
                    </dd>
                </dl>
            </div>
        </div>

        <script src="static/js/jquery.js"></script>
        <script src="static/js/jquery.cookie.js"></script>
        <script src="static/js/owl-carousel/owl.carousel.min.js"></script>
        <script src="static/js/a.js"></script>

    <script>
        $(document).ready(function() {
            $("#owl-demo").owlCarousel({

                navigation : false, // Show next and prev buttons
                slideSpeed : 300,
                paginationSpeed : 400,
                singleItem:true

            });

        });


    </script>

    </body>