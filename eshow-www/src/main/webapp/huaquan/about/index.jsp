<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="../common/taglibs.jsp" %>
<%@ include file="../common/path.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util" %>
<head>
    <title>公司简介</title>
    <meta name="keywords" content="公司简介" />
    <meta name="description" content="公司简介" />
    <link rel="stylesheet" href="../static/styles/index.css"type="text/css"/>
    <link rel="stylesheet" href="../static/styles/style.css" type="text/css" />
</head>
<body>
<%@ include file="../header.jsp" %>
<div id="main">
    <div id="content" style="">
        <div id="contact_banner">
        </div>

        <div id="postpath">
            <strong>当前页面：<a href="<c:url value='${huaquan}/'/>" title="首页">首页</a>
                &raquo; 公司简介</strong>
        </div>
        <div class="bd">
            <div id="post-80" class="page">
                <div class="entry-content">
                    江苏华权有色炉料有限公司位于沪苏锡常长三角经济繁荣中心地带——江苏省江阴市月城镇，公司周边交通顺畅，锡澄、沿江、沪宁三条高速环绕而过，312国道、锡澄公路及大运河从旁穿越。<br />
                    <br />
                    我公司创建于1993年3月，是一家以专业生产钒铁及销售钒铁、钼铁、铬系列、锰系列、镍板等铁合金有色金属的综合性销售公司。我公司下属一个贸易公司——江阴市华达钢铁炉料有限公司，一个生产厂家——新沂市华力复合金属材料有限公司，厂址位于江苏省新沂市瓦窑镇（徐连高速北侧、京沪高速西侧），为广大客户办理运输可谓是十分便利。<br />
                    我公司所生产的钒铁严格按照国际、国家标准执行生产，公司采用最新设备和国内先进生产工艺，检测项目齐全、精度高，年生产钒铁能力达3000吨，产品质量均达A级产品，并通过GB/T19001-2000 ISO9001:2000质量管理体系认证，是国内数家大中型钢厂的主要供货商。<br />
                    <br />
                    我公司坚持以质量为生命，诚信为根本，顾客为首要，管理为基础的经营理念真诚服务于广大客户， 通过多年努力逐步形成了华东地区首屈一指的代表性公司，获得了 “江苏省质量信得过企业”“AAA企业”等荣誉。在此，我们真诚的欢迎各大厂家及个人与我公司洽谈业务，携手共进，共创美好未来。<br />

                </div>

            </div>


        </div>
        <div id="navigation">
        </div>
    </div>
    <div id="sidebar">

        <div class="sidebar_li">

            <div class="sidebar_li">
                <ul>
                    <li class="page_item ">
                        <a href="${huaquan}/info/culture" title="企业文化">企业文化</a>
                    </li>
                    <li class="page_item ">
                        <a href="${huaquan}/info/company" title="下属公司">下属公司</a>
                    </li>
                    <li class="page_item ">
                        <a href="${huaquan}/contact/" title="联系我们">联系我们</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>

</body>
