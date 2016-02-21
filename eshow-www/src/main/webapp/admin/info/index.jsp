<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="../common/website.jsp"%>
<head>
<title>信息</title>
<link rel="stylesheet" href="${ctx}/admin/styles/info.css" type="text/css" />
</head>
<body>
	<div class="am-cf admin-main">
        <c:set var="current">info</c:set>
        <%@ include file="../left.jsp"%>
			 <div class="admin-content">

    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg"><a href="${ctx}/admin/index">首页</a></strong> / <small><a href="${ctx}/admin/info/">信息中心</a> </small></div>
    </div>
      <div class="am-g">
      <div class="am-u-md-6 am-cf">
        <div class="am-fl am-cf">
          <div class="am-btn-toolbar am-fl">
            <div class="am-btn-group am-btn-group-xs">
                <a class="am-btn am-btn-default" href="${ctx}/admin/info/add.jsp"><span class="am-icon-plus"></span> 新增</a>
              <%--<button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>--%>
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
      <div class="am-u-md-12">
        <form class="am-form">
          <table class="am-table am-table-striped am-table-hover table-main">
            <thead>
              <tr> 
                <th class="table-id">ID</th>
                <th class="table-title">标题</th> 
                <th class="table-author">访问</th>
                <%--<th class="table-date"></th>--%>
                <th class="table-set">操作</th>
              </tr>
          </thead>
          <tbody>
        <s:action name="info!search" id="infoList" executeResult="false" namespace="">
            <s:param name="query.website">eshow</s:param>
            <s:param name="query.enabled">true</s:param>
            <%--<s:param name="query.order">addTime</s:param>--%>
            <s:param name="query.desc">true</s:param>
        </s:action>
          <s:iterator value="%{#infoList.infos}" status="rowStatus">
                <tr id="info${id}">
                    <td>${id}</td>
                    <td><span class="l" style="font-size: 14px;"><a href="<c:url value='/admin/info/view/${id}'/>" class="">${title}</a> </span></td>
                    <td><span class="l c999">${url}</span> </td>
                    <%--<td>${addTime}</td>--%>
                    <td>
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <a class="am-btn am-btn-default" href="${ctx}/admin/info/edit/${id}"><span
                                        class="am-icon-plus"></span> 编辑</a>
                                <a href="javascript:;" class="am-btn am-btn-default am-btn-xs am-text-danger"
                                   onclick="deleteData('确定要删除该信息吗？','info',${id});"><span
                                        class="am-icon-trash-o"></span> 删除
                                </a>
                            </div>
                        </div>
                    </td>

                </tr>
		</s:iterator>

          </tbody>
        </table>
            <%@include file="/admin/common/page.jsp" %>
          <hr>
          <p>注：.....</p>
        </form>
      </div>
    </div>
	</div>
</div>
	<%@ include file="/admin/common/footer.jsp"%>
</body>

