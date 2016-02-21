<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<head>
	<title>我的话题</title>
	<link rel="stylesheet" href="<c:url value='/styles/topic.css'/>"
		type="text/css" />
	<script type="text/javascript"
		src="<c:url value='/scripts/delete.js'/>"></script>
</head>
<body>
<header id="header">
    <div class="hero-unit showcase">
        <div class="container">
            <h1 class="yahei">
                技术支持 <a class="btn btn-small btn-primary" href="${ctx}/topic/add">发布话题</a>
            </h1>
        </div>
    </div>
</header>
<div class="container">
    <div class="subnav">
        <ul class="nav nav-pills">
            <li ><a href="<c:url value='/topic'/>">全部话题</a></li>
            <s:action name="board!list" id="boardList" executeResult="false" namespace="">
                <s:param name="query.order">addTime</s:param>
                <s:param name="query.desc">true</s:param>
            </s:action>
            <s:iterator value="%{#boardList.boards}" status="rowStatus">
                <c:if test="${param.id == id}">
                    <li class="active"><a href="<c:url value="/topic/board/${id}"/>"
                                          style="color: #0187c5; text-decoration: none;" ><strong>${name}</strong> </a>
                    </li>
                </c:if>
                <c:if test="${param.id != id}">
                    <li>  <a href="<c:url value="/topic/board/${id}"/>"
                            >${name}
                    </a></li>
                </c:if>
            </s:iterator>
            <li>
                <a href="<c:url value='/topic/mine'/>">我的话题</a></li>
        </ul>

    </div>
    <div class="topic">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>主题</th>
                <th>分类</th>
                <th>回复</th>
                <th>发表时间</th>
                <th>浏览</th>
                <th>操作
                </th>
            </tr>
            </thead>
            <tbody>
            <s:action name="topic!search" id="topicList" executeResult="false">
                <s:param name="queryBean.userId">${myid}</s:param>
                <s:param name="queryBean.order">addTime</s:param>
                <s:param name="queryBean.desc">true</s:param>
            </s:action>
            <s:iterator value="%{#topicList.topics}" status="rowStatus">
                <tr>
                    <td><a href="view/${id }">${util:preview(title,50)}</a>
                    </td>
                    <td>${board.name}</td>

                <td >
                        ${commentSize}
                </td>
                <td >
                    <s:date name="addTime" format="yyyy-MM-dd"/>
                </td>
                <td>
                        ${count}
                </td>
                <td >
                    <a href="<c:url value='/topic/edit/${id}'/>" style="text-decoration:none;">修改</a> |
                    <a
                            href="javascript:void(0);"
                            onclick="return deleteData('topic',${id});" style="text-decoration:none;">删除</a>
                </td>
                </tr>
            </s:iterator>
            </tbody>
        </table>
        <%@ include file="/common/page.jsp"%>
    </div>
</div>


</body>
