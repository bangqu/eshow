<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<s:action name="topic!view" var="view" executeResult="false">
    <s:param name="id">${param.id}</s:param>
</s:action>
<head>
    <title>${view.topic.title}</title>
    <meta name="description" content="EShow开源网站讨论区话题详情"/>
    <meta name="keywords" content="EShow,EShow开源网站,开源框架,ssh,轻量级框架,讨论区话题详情"/>
</head>
<body>
<c:set var="current">topic</c:set>
<div class="forum_bannerbox eshow_top">
    <div class="forum_banner">
        <div class="forum_detail_title">
            <ul class="forum_detail_list">
                <li><a href="${ctx}/topic?active=topic">讨论区</a></li>
                <li><span>&nbsp;>&nbsp;</span></li>
                <li><a href="${ctx}/topic?active=topic&boardId=${view.topic.board.id}">${view.topic.board.name} </a>
                </li>
                <li><span>&nbsp;>&nbsp;</span></li>
                <li class="forum_detail_current"><span>话题详情</span></li>
            </ul>
            <div class="forum_detail_bigtitle">
                <span>${view.topic.title}</span>
            </div>
            <div class="forum_detail_img">
                <img src="${view.topic.user.photo}">
                <span>${view.topic.user.username} 发布于 <fmt:formatDate value="${view.topic.addTime}" pattern="yyyy-MM-dd:HH:mm"/></span>
            </div>
        </div>
    </div>
</div>
<!-- content -->
<div class="doc_contentbox">
    <div class="doc_content">
        <div class="forum_cont_bd">
            <div class="doc_describe">
                <div class="doc_des_txt doc_line">
                    <ol class="doc_des_list">
                        <li><span>${view.topic.content}</span></li>
                    </ol>
                    <div class="forum_recommend" id="recommend">
                        <span>推荐</span>
                    </div>
                </div>
                <c:if test="${pageContext.request.remoteUser == null}">
                <div class="doc_des_txt">
                    <div class="doc_des_hd">
                        <strong>讨论区</strong>
                    </div>
                    <div class="doc_comment">
                        <div class="doc_log"/>
                        请先
                        <a href="${ctx}/user/login">登录</a>后评论
                    </div>
                </div>
            </div>
            </c:if>
            <c:if test="${pageContext.request.remoteUser != null}">
                <s:form id="topic_form" action="topic-comment!save.action" method="post" namespace="">
                    <input type="hidden" name="topicId" value="${param.id}">
                    <input type="hidden" name="redirect" value="topic/detail?active=topic&id=${param.id}">
                    <div class="doc_des_txt">
                        <div class="doc_des_hd">
                            <strong>讨论区</strong>
                        </div>
                        <div class="doc_des_comment">
                            <textarea placeholder="评论内容..." name="topicComment.content" class="validate[required]"/></textarea>
                        </div>
                        <div class="doc_des_btn doc_des_btn1">
                            <input type="submit" value="发表评论"/>
                        </div>
                    </div>
                </s:form>
            </c:if>

            <s:action name="topic-comment!search" var="topicCommentList" executeResult="false">
                <s:param name="query.topicId">${param.id}</s:param>
                <s:param name="query.order">addTime</s:param>
                <s:param name="query.desc">true</s:param>
            </s:action>
            <c:if test="${fn:length(topicCommentList.topicComments)>0}">
                <div class="doc_des_txt">
                    <div class="doc_des_hd">
                        <strong>所有评论</strong>
                    </div>
                    <div class="des_talks">
                        <s:iterator value="%{#topicCommentList.topicComments}" status="rowStatus" var="topicComment">
                            <div class="doc_des_talk">
                                <div class="doc_des_info">
                                    <div class="doc_info_left">
                                        <img src="${topicComment.user.photo}">
                                        <span class="info_tip">${topicComment.user.nickname}于</span>
                                    <span><fmt:formatDate value="${topicComment.addTime}" pattern="yyyy-MM-dd:HH"/></span>
                                    </div>
                                </div>
                                <div class="doc_info_cont">
                                    <span>${topicComment.content}</span>
                                </div>
                            </div>
                        </s:iterator>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</div>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.js"></script>
<script type="text/javascript" src="${dll}/validate/jquery.validationEngine.min.js"></script>
<script type="text/javascript" src="${dll}/validate/jquery.validationEngine-zh_CN.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>

<script>
    $('#topic_form').validationEngine();
    $("#recommend").on("click", function () {
        $.ajax({
            url: "${ctx}/topic!recommend.action",
            type: "post",
            data: {
                "id": "${param.id}"
            },
            dataType: "json",
            success: function (result) {
                if (result.status == 1) {
                    layer.open({content: result.msg});
                } else {
                    layer.open({content: result.msg, btn: ['确定']});
                }
            }
        });
    });

    if(${current=='topic'}){
        $("[pr='topic']").addClass("nav_active");
    }
</script>
</body>