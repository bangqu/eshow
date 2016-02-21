<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="../common/path.jsp" %>
<link rel="stylesheet" href="${yinwangroup}/styles/style.css"/>
    <div class="side">
        <ul class="sinav">
            <li><a href="" class="gif">银湾集团</a></li>
            <li>
                <a href="" class="gif"><span>热门新闻</span></a>
                <s:action name="blog!search" id="blogList" executeResult="false">
                    <s:param name="query.website">yinwangroup</s:param>
                    <s:param name="query.order">count</s:param>
                    <s:param name="query.desc">true</s:param>
                    <s:param name="query.pagesize">5</s:param>
                </s:action>
                <s:iterator value="%{#blogList.blogs}" status="rowStatus">
                    <p>
                        <a href="${yinwangroup}/blog/view/${id}" title="${title}"> ${util:preview(title,8)}&nbsp;</a>
                    </p>
                </s:iterator>
            </li>
            <li>
                <a href="" class="gif">最新新闻 NEW10</a>
                <s:action name="blog!search" id="blogList2" executeResult="false">
                    <s:param name="query.website">yinwangroup</s:param>
                    <s:param name="query.order">addTime</s:param>
                    <s:param name="query.desc">true</s:param>
                </s:action>
                <s:iterator value="%{#blogList2.blogs}" status="rowStatus">
                    <p>
                        <a href="${yinwangroup}/blog/view/${id}" title="${title}" >${util:preview(title,8)}&nbsp;</a>
                    </p>
                </s:iterator>

            </li>
        </ul>
    </div>

