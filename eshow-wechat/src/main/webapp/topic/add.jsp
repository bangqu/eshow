<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>发布话题</title>
</head>
<body>
<c:set var="current">topic</c:set>
<div class="forum_bannerbox eshow_top">
    <div class="forum_banner">
        <span class="issue_head">发布话题</span>
    </div>
</div>
<s:action name="board!list" var="boardList" executeResult="false">
    <s:param name="query.enabled">true</s:param>
</s:action>
<s:form id="signup_form" action="topic!save.action" method="post" namespace="">
    <div class="forum_contentbox">
        <div class="forum_content">
            <ul class="issue_bd">
                <li class="issue_left">
                    <div class="issue_up">
                        <span class="issue_caption">请选择板块</span>
                        <img src="${dll}/www/images/topic_arrow.png">
                        <ul class="issue_down">
                            <s:iterator value="%{#boardList.boards}" status="rowStatus" var="board">
                                <li><span>${board.name}</span></li>
                            </s:iterator>
                        </ul>
                    </div>
                </li>
                <li class="issue_right">
                    <input type="hidden" name="redirect" value="topic?active=topic">
                    <input type="hidden" id="boardId" name="boardId">
                    <input type="text" name="topic.title" placeholder="输入标题..." required/>
                </li>
            </ul>
            <div class="issue_bd">
                <textarea id="editor_id" name="topic.content"></textarea>
                <div class="issue_btns">
                    <div class="issue_btn_left">
                        <a href="${ctx}/topic?active=topic"><input type="button" value="取消"/></a>
                    </div>
                    <div class="issue_btn_right">
                        <input class="issue_active" type="submit" value="发布"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</s:form>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="${dll}/www/script/js.js"></script>

<script>
    $(".issue_down li").click(function () {
        $("#boardId").val($(this).find("input").val());
    })

    if(${current=='topic'}){
        $("[pr='topic']").addClass("nav_active");
    }
</script>
</body>