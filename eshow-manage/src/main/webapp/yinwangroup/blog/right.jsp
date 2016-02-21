<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="../common/path.jsp" %>
<link rel="stylesheet" href="${yinwangroup}/styles/style.css"/>
<div class="rbar">
    <div class="rbox bor mb10">
        <h5>银湾物业全国服务中心</h5>
        <s:action name="blog!search" id="blogKeywordList" executeResult="false">
            <s:param name="query.website">yinwangroup</s:param>
            <s:param name="query.order">count</s:param>
            <s:param name="query.desc">true</s:param>
            <s:param name="query.hasKeyword">true</s:param>
            <s:param name="query.pagesize">5</s:param>
        </s:action>
        <div class="new">
            <s:iterator value="%{#blogKeywordList.blogs}" status="rowStatus">
                <a href="${yinwangroup}/blog/?keyword=${keyword}">${keyword}服务中心</a>
            </s:iterator>
        </div>
    </div>
    <div class="">
        <img width="260" src="${yinwangroup}/images/img0.jpg"/>
    </div>
</div>
