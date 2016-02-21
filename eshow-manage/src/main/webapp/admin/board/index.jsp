<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title>话题板块</title>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/board.css'/>" type="text/css" />
</head>
<body>
	<div class="am-cf admin-main"> 
            <c:set var="current">board</c:set>
            <%@ include file="../left.jsp"%> 


             <div class="admin-content">
        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg"><a href="${ctx}/admin/index">首页</a></strong> / 
                <small><a href="${ctx}/admin/topic/">话题管理</a></small>
                /
                <small>话题板块</small>
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
				 
						<s:action name="board!list" id="boardList" executeResult="false"></s:action>	
				<table class="am-table am-table-bordered am-margin-top">
					<thead>
						<tr>
							<th>#</th>
							<th>分类名称</th>
							<th>备注</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="%{#boardList.boards}" status="rowStatus">
							<tr id="market20">
								<td>${id }</td>
								<td><span class="l" style="font-size: 14px;"><a
										href="<c:url value='/admin/board/edit/${id}'/>" class="">${name}</a>
								</span></td>
								<td><span class="l c999">${description}</span>
								</td>
								<td><a class="am-btn am-btn-danger am-btn-xs" href="<c:url value='/admin/board/edit/${id}'/>">修改</a>
									<a class="am-btn am-btn-warning am-btn-xs" href="${ctx }/board!delete.action?id=${id}"
									onclick="deleteData('确定要删除该信息吗？','market',20);">删除</a>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				<%@ include file="/common/page.jsp"%>
					</div>
				
				</div>
			</div>
		</div>
		<%@ include file="/admin/common/footer.jsp"%>
</body>

