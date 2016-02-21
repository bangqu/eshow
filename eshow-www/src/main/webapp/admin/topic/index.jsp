<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="user!view" id="view" executeResult="false" />
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<head>
	<title>讨论区</title>
</head>
<body>
<div class="am-cf admin-main"> 
            <c:set var="current">topic</c:set>
            <%@ include file="../left.jsp"%>
			  <div class="admin-content">
        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg"><a href="${ctx}/admin/index">首页</a></strong> / 
                <small><a href="${ctx}/admin/topic/">话题管理</a></small>
                /
                <small>话题列表</small>
            </div>
        </div>
			<div class="am-g">
      <div class="am-u-md-6 am-cf">
        <div class="am-fl am-cf">
          <div class="am-btn-toolbar am-fl">
            <div class="am-btn-group am-btn-group-xs">
             <a class="am-btn am-btn-default" href="<c:url value='/admin/topic/'/>">话题列表</a>
			<a class="am-btn am-btn-default" href="<c:url value='/admin/topic/audit'/>">未审核</a>
			<a class="am-btn am-btn-default" href="<c:url value='/admin/topic/mine'/>">我发表的话题</a>
			<a class="am-btn am-btn-default" href="<c:url value='/admin/topic/replied'/>">我参与的话题</a>
			<a class="am-btn am-btn-default" href="<c:url value='/admin/topic/workmate'/>">周围的话题</a>
			<a class="am-btn am-btn-default" href="<c:url value='/admin/board'/>">话题板块</a>
			<a href="<c:url value='/admin/topic/add'/>" class="am-btn am-btn-primary">添加</a>
            </div> 
          </div>
        </div>
      </div>
      <div class="am-u-md-3 am-cf">
        <div class="am-fr">
          <div class="am-input-group am-input-group-sm">
            <input type="text" class="am-form-field">
                <span class="am-input-group-btn">
                  <button class="am-btn am-btn-default" type="button">搜索</button>
                </span>
          </div>
        </div>
      </div>
    </div> 

				<div class="am-g"> 
					<div class="am-u-sm-12"> 
						<ul class="am-nav am-nav-tabs am-margin-top-sm"> 
							<li class="am-active"><a href="">全部</a></li>
							<s:action name="board!list" id="boardList" executeResult="false">
							</s:action>
							<s:iterator value="%{#boardList.boards}" status="rowStatus">
								<li><a href="<c:url value='/admin/topic/b/${id}?squence=1'/>">${name}</a></li>
							</s:iterator>
						</ul> 

						<table class="am-table  am-table-striped am-table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>分类</th>
									<th>标题</th>
									<th>作者</th>
									<th>更新时间</th>
									<th>浏览/回复</th>
									<th>推荐/收藏</th>
									<th>发表时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<s:action name="topic!search" id="topicList"
									executeResult="false">
									<s:param name="query.state">1</s:param>
									<s:param name="query.order">addTime</s:param>
									<s:param name="query.desc">true</s:param>
								</s:action>
								<s:iterator value="%{#topicList.topics}" status="rowStatus">
								<tr id="market20">
									<td>${id}</td>
									<td>${board.name}</td>
									<td><a href="<c:url value='/admin/topic/view/${id}'/>"
										title="${title}">${util:preview(title,10)}</a>
									</td>
									<td><a href="${ctx }/admin/topic/workmate/${user.id}">${user.nickname}</a></td>
									<td><s:date name='%{updateTime}'
											format='yyyy-MM-dd HH:mm' />
									</td>
									<td>${count}/${commentSize}</td>
									<td>6/0</td>
									<td><s:date name='%{addTime}' format='yyyy-MM-dd' />
									</td>
									<td><a href="${ctx }/admin/topic/edit/${id}">修改</a> <a
										href="${ctx }/topic!delete.action?id=${id}"
										onclick="deleteData('确定要删除该信息吗？','market',20);">删除</a>
									</td>
								</tr></s:iterator>
							</tbody>
						</table>
						<%@ include file="/common/page.jsp"%>
					</div>

				</div>
			</div> 
	</div>

		<%@ include file="/admin/common/footer.jsp"%>
</body>

