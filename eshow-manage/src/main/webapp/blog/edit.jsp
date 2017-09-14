<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
		 contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<s:action name="blog!view" var="view" executeResult="false"/>
<s:action name="category!search" var="categoryList" executeResult="false">
	<s:param name="query.enabled">true</s:param>
	<s:param name="query.order">sequence</s:param>
	<s:param name="query.desc">false</s:param>
	<s:param name="query.pagesize">20</s:param>
	<s:param name="query.website">${website}</s:param>
</s:action>
<head>
	<title>日志修改</title>
</head>
<body>

<div class="home_wrapper ">
	<%@ include file="/include/left.jsp" %>
	<div class="home_content">
		<div class="home_list" >
			<ul class="home_navbar clearfix ">
				<li><a href="${ctx}/">首页概述</a></li>
				<li><span>></span></li>
				<li><a href="${ctx}/blog">日志管理</a></li>
				<li><span>></span></li>
				<li>修改日志</li>
			</ul>
		</div>
		<div class="home_dis">
			<s:form id="blogForm" action="blog!update.action" method="post" cssClass="form-horizontal"
					namespace="">
				<input type="hidden" name="redirect" value="/blog/"/>
				<input type="hidden" name="id" value="${view.blog.id}"/>
				<input type="hidden" name="blog.website" value="${website}"/>

				<%--<div class="home_block product_cont">--%>

					<%--<div class="add_info clearfix col-md-7">--%>
						<%--<p class="add_info_txt fl"><b class="color-red">*</b><span>日志名称：</span></p>--%>
						<%--<input class="add_info_input fl log_input" type="text" placeholder="请输入日志名称..."--%>
							   <%--name="blog.title" value="${view.blog.title}"/>--%>
					<%--</div>--%>

					<%--<div class="add_info clearfix">--%>
						<%--<p class="add_info_txt fl"><b class="color-red">*</b><span>日志分类：</span></p>--%>

						<%--<input type="hidden" name="categoryId" id="categoryId" placeholder="请选择分类" value="${view.blog.category.id}">--%>

						<%--<div class="add_info_input fl input_name_down input_name_down_b classic">--%>
							<%--<span>${view.blog.category.name}</span>--%>
						<%--</div>--%>

					<%--</div>--%>

					<%--<div class="add_info clearfix">--%>
						<%--<p class="add_info_txt fl"><b class="color-red">*</b><span>日志内容：</span></p>--%>
                    <%--<textarea class="" style="height: 400px;width: 700px" placeholder="请输入日志名称..."--%>
							  <%--name="blog.content" id="content">${view.blog.content}</textarea>--%>
					<%--</div>--%>




					<%--<div class="add_log_btn">--%>
						<%--<input class="release_btn" type="submit" value="发布"/>--%>
						<%--<input type="button" class="browse_btn" value="预览"/>--%>
						<%--<button class="btn" onclick="javascript:history.back();">取消</button>--%>
					<%--</div>--%>
				<%--</div>--%>
				<div class="home_block product_cont">
					<div class="row input_row">
						<div class="col-xs-2 home_left">
							<label><span>*</span>日志名称：</label>
						</div>
						<div  class="col-xs-10 home_right">
							<input class="form-control" type="text" placeholder="请输入日志名称..."
								   name="blog.title" value="${view.blog.title}"/>
						</div>
					</div>

					<div class="row input_row">
						<div class="col-xs-2 home_left">
							<label><span>*</span>日志分类：</label>
						</div>

						<%--<input type="hidden" name="categoryId" id="categoryId" value="${view.blog.category.id}">--%>

						<%--<div class="col-xs-2 home_left">--%>
							<%--<label>${view.blog.category.name}</label>--%>
						<%--</div>--%>
						<div class="col-sm-10">
							<select name="boardId" id="boardId" class="form-control">
									<%--<option>请选择</option>--%>
								<s:iterator value="%{#categoryList.categories}"  var="board">
									<option  value="${id}"
											 <s:if test="%{id == #view.blog.category.id}">selected="selected"</s:if>
											>${name}</option>

								</s:iterator>
							</select>
						</div>
					</div>

					<div class="row input_row">
						<div class="col-xs-2 home_left">
							<label><span>*</span>日志内容：</label>
						</div>
						<div class="col-xs-10 home_right">
                            <textarea class="form-control" style="height: 400px;width: 700px" placeholder="请输入日志内容..."
									  name="blog.content" id="content">${view.blog.content}</textarea>
						</div>

					</div>

					<div class="row input_row">
						<div class="col-xs-offset-2 col-xs-10">
							<input type="submit" class="btn btn-primary btn_sm btn_blue btn_dis btn_border"
								   value="发布"/>
							<input type="button" class="btn btn-primary btn_sm btn_blue btn_dis btn_border"
								   value="预览"/>
							<input type="button" class="btn btn-default btn_sm" value="取消" onclick="javascript:history.back()"/>
						</div>
					</div>
				</div>
			</s:form>
		</div>
	</div>
</div>
<div class="downmenu_hides">
	<ul class="promoter_select_down">
		<li class="promoter_down_li">
			<input type="text" placeholder='输入您要搜索的分类'/>
		</li>
		<s:action name="category!search" var="categoryList" executeResult="false">
			<s:param name="query.enabled">true</s:param>
			<s:param name="query.order">sequence</s:param>
			<s:param name="query.desc">false</s:param>
			<s:param name="query.pagesize">20</s:param>
			<s:param name="query.website">${website}</s:param>
		</s:action>
		<s:iterator value="%{#categoryList.categories}" status="rowStatus" var="category">
			<li class="down_li_active" pr="${id}">${name}</li>
		</s:iterator>

	</ul>
</div>
<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
<%@ include file="/common/script/umeditor.jsp" %>

<script>

	getTxt(".promoter_select_down .down_li_active", ".classic", "categoryId");



	var ue = UM.getEditor('content', {
		lang: /^zh/.test(navigator.language || navigator.browserLanguage || navigator.userLanguage) ? 'zh-cn' : 'en',
		langPath: UMEDITOR_CONFIG.UMEDITOR_HOME_URL + "lang/",
		focus: true
	});

</script>
</body>

