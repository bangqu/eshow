<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="../common/path.jsp" %>
<s:action name="info!browse" id="view" executeResult="false">
    <s:param name="query.website">yinwangroup</s:param>
</s:action>
<head>
    <title>“创新驱动 联合图变” —首届中小型物业企业家峰会暨生态联盟发展论坛会场_银湾集团</title>
    <meta name="keywords" content="view.info.title"/>
    <meta name="description" content="view.info.content"/>
    <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.js"></script>
    <link rel="stylesheet" href="${yinwangroup}/styles/all.css"/>
    <link rel="stylesheet" href="${yinwangroup}/styles/style.css"/>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="wp clearfix mt25">
    <%@ include file="left.jsp" %>
    <div class="aboutr">
        <h3>“创新驱动 联合图变” —首届中小型物业企业家峰会暨生态联盟发展论坛会场</h3>
        <div class="showimg">
            <ul>
                <li>
                    <a sbimg href="javascript:;"><img src="http://img.bangqu.com/2016/12/24/1482560079285.jpg!middle.jpg"/>
                        <span>中国物业管理协会会长沈建忠</span>
                    </a>
                </li>
                <li>
                    <a sbimg href="javascript:;"><img src="http://img.bangqu.com/2016/12/24/1482560081137.jpg!middle.jpg"/>
                        <span>银湾集团董事长胡祝帮先生</span>
                    </a>
                </li>
                <li>
                    <a sbimg href="javascript:;"><img src="http://img.bangqu.com/2016/12/24/1482560085172.jpg!middle.jpg"/>
                        <span>银钥匙联盟创始人王伟先生</span>
                    </a>
                </li>
                <li>
                    <a sbimg href="javascript:;"><img src="http://img.bangqu.com/2016/12/24/1482560086776.jpg!middle.jpg"/>
                        <span>上海市物业管理协会执行会长李风</span>
                    </a>
                </li>
                <li>
                    <a sbimg href="javascript:;"><img src="http://img.bangqu.com/2016/12/24/1482560090565.jpg!middle.jpg"/>
                        <span>银钥匙联盟联合创始人杨兆兵先生</span>
                    </a>
                </li>
                <li>
                    <a sbimg href="javascript:;"><img src="http://img.bangqu.com/2016/12/24/1482560093849.jpg!middle.jpg"/>
                        <span>蚂蚁金服智慧社区总经理李天</span>
                    </a>
                </li>

                <li>
                    <a sbimg href="javascript:;"><img src="http://img.bangqu.com/2016/12/24/1482560096974.jpg!middle.jpg"/>
                        <span>深圳彩生活服务集团首席科学家张其亮</span>
                    </a>
                </li>
                <li>
                    <a sbimg href="javascript:;"><img src="http://img.bangqu.com/2016/12/24/66291482562085877.jpeg!middle.jpg"/>
                        <span>智慧社区万里行创始人雷林</span>
                    </a>
                </li>
                <li>
                    <a sbimg href="javascript:;"><img src="http://img.bangqu.com/2016/12/24/1482560103815.jpg!middle.jpg"/>
                        <span>论坛现场</span>
                    </a>
                </li>
                <li>
                    <a sbimg href="javascript:;"><img src="http://img.bangqu.com/2016/12/24/1482560071836.jpg!middle.jpg"/>
                        <span>论坛现场</span>
                    </a>
                </li>
                <li>
                    <a sbimg href="javascript:;"><img src="http://img.bangqu.com/2016/12/24/1482560074189.jpg!middle.jpg"/>
                        <span>论坛现场</span>
                    </a>
                </li>
                <li>
                    <a sbimg href="javascript:;"><img src="http://img.bangqu.com/2016/12/24/63221482562080663.jpeg!middle.jpg"/>
                        <span>论坛现场</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>
<script type="text/javascript">
    $(document).ready(function () {
        $("a[sbimg]").on("click", function () {
            var url = $(this).find("img").attr("src");
            $(".showbig").find("img").attr("src", url);
            $(".showbig").show();
        })

        $("a[close]").on("click", function () {
            var box = $(this).attr("vi");
            $("#" + box).hide();
        })
    });
</script>
<div class="showbig none" id="showbig">
    <a close vi="showbig" title="关闭">x</a>
    <img src="" width="600">
</div>
</body>
