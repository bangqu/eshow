<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="category!view" var="view" executeResult="false"></s:action>
<head>
<title>日志分类</title>
<link rel="stylesheet" href="${ctx}/styles/category.css"
	type="text/css" />
</head>

<body>

<div class="main">
	<div class="home_header">
		<div class="home_logo fl">
			<a href="">
				<img src="http://127.0.0.1:8080/eshow-static/manage/images/stage_log.png">
			</a>
		</div>

		<div class="home_nav fl">
			<a href="${ctx}/" class="active">首页</a>
		</div>

		<div class="fr home_avatar">
			<div class="home_avatar_up">
				<img src="http://127.0.0.1:8080/eshow-static/manage/images/header.png">
				<span>admin</span>
				<img src="http://127.0.0.1:8080/eshow-static/manage/images/avatar_narrow.png">
			</div>
		</div>
	</div>

	<div class="home_wrapper">
		<div class="home_sider fl">
			<%@ include file="/include/boardLeft.jsp" %>
		</div>
		<div class="home_content">
			<div class="home_block">
				<div class="container-fluid">
					<div>
						<ul class="home_navbar clearfix ">
							<li><a>信息页</a></li>
							<li><span>></span></li>
							<li><a>话题管理</a></li>
							<li><span>></span></li>
							<li><a>话题列表</a></li>
							<li><span>></span></li>
							<li><a>板块管理</a></li>
							<li><span>></span></li>
							<li><a>相册管理</a></li>
							<li><span>></span></li>
							<li><a>图片管理</a></li>
							<li><span>></span></li>
							<li><a>注销</a></li>
							<li><span>></span></li>
						</ul>
					</div>

					<form>
						<s:hidden name="id" value="%{#view.board.id}"></s:hidden>
						<fieldset>
							<div class="row input_row">
								<div class="col-xs-2 home_left">
									<label><span>*</span>分类名称：</label>
								</div>
								<div class="col-xs-10 home_right">
									<input class="input_md" type="text" placeholder="请输入相关分类信息..".
										   name="info.title" value="${view.category.name}" />
									<span class="input_tip">必填！</span>
								</div>
							</div>

							<div class="row input_row">
								<div class="col-xs-2 home_left">
									<label><span>*</span>备注：</label>
								</div>
								<div class="col-xs-10 home_right">
									<textarea class="form-control" id="editor"  placeholder="请输入相关备注信息...">${view.category.remark}</textarea>
									<span class="input_tip">必填！</span>
								</div>
							</div>
							<div class="row input_row">
								<div class="col-xs-offset-2 col-xs-10">
									<input type="submit" class="btn btn-primary btn_sm btn_blue btn_dis btn_border"
										   value="修改"/>
									<input type="button" class="btn btn-default btn_sm" value="取消" onclick="javascript:history.back();"/>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
			<%--<s:include value="../left.jsp"></s:include>--%>

			<%--<div class="navbar">--%>
			<%--<div class="navbar-inner">--%>
			<%--<ul class="breadcrumb">--%>
			<%--<li><a href="<c:url value='/topic/'/>">信息列表</a></li>--%>
			<%--<li><a href="<c:url value='/topic/audit'/>">未审核</a></li>--%>
			<%--<li><a href="<c:url value='/topic/mine'/>">我发表的话题</a></li>--%>
			<%--<li><a href="<c:url value='/topic/replied'/>">我参与的话题</a></li>--%>
			<%--<li><a href="<c:url value='/topic/workmate'/>">周围的话题</a></li>--%>
			<%--<li  class="active"><a href="<c:url value='/board'/>">话题板块</a></li>--%>
			<%--</ul>--%>
			<%--</div>--%>
			<%--</div>--%>
		</div>
	</div>
</div>

<%@ include file="/common/scripts.jsp" %>
<%--<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>--%>
<script type="text/javascript" src="${dll}/manage/scripts/chosen.jquery.js"></script>
<!-- <script type="text/javascript" src="scripts/bootstrap.min.js"></script> -->
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<!-- 富文本 -->
<script src="${dll}/manage/scripts/module.min.js"></script>
<script src="${dll}/manage/scripts/hotkeys.min.js"></script>
<script src="${dll}/manage/scripts/uploader.min.js"></script>
<script src="${dll}/manage/scripts/simditor.min.js"></script>
<script type="text/javascript">
	$(function(){
		var editor = new Simditor({
			textarea: $('#editor')
		});
		editor;

	});
</script>

</body>

<%--<body>--%>
	<%--<div class="container mt">--%>
		<%--<div class="row-fluid">--%>
			<%--<s:include value="../left.jsp"></s:include>--%>
			<%--<div class="span10">--%>
				<%--<ul class="breadcrumb">--%>
					<%--<li><a href="${ctx}/index">首页</a> <span class="divider">/</span>--%>
					<%--</li>--%>
					<%--<li class="active">${title}</li>--%>
				<%--</ul>--%>
				<%--<s:include value="../title.jsp"></s:include>--%>
				<%--<div class="well com">--%>
					<%--<div class="page-header">--%>
						<%--<div class="pull-right">--%>
							<%--<a href="<c:url value='/category/add'/>"--%>
								<%--class="btn btn-primary">发布</a>--%>
						<%--</div>--%>
						<%--<h3 class="yahei">--%>
							<%--<img src="<c:url value='/images/app_list_blog.gif'/>" />--%>
							<%--分类管理——修改分类--%>
						<%--</h3>--%>
					<%--</div>--%>
					<%--<div id="edit">--%>
						<%--<s:form action="category!update.html" id="categoryForm"--%>
							<%--method="post">--%>
							<%--<input type="hidden" name="id" value="${view.category.id}" />--%>
							<%--&lt;%&ndash;<p>&ndash;%&gt;--%>
								<%--&lt;%&ndash;<span class="l">分类名称：</span><span class="r"><input&ndash;%&gt;--%>
									<%--&lt;%&ndash;class="inputtext text-input validate['required']"&ndash;%&gt;--%>
									<%--&lt;%&ndash;style="width: 150px;" class="inputtext" type="text"&ndash;%&gt;--%>
									<%--&lt;%&ndash;onblur="this.className='inputtext'"&ndash;%&gt;--%>
									<%--&lt;%&ndash;onfocus="this.className='inputtext2'" id="name"&ndash;%&gt;--%>
									<%--&lt;%&ndash;name="category.name" value="${view.category.name}" /> </span><span&ndash;%&gt;--%>
									<%--&lt;%&ndash;class="t"><font color="red">*</font>必填</span>&ndash;%&gt;--%>
							<%--&lt;%&ndash;</p>&ndash;%&gt;--%>

							<%--<div class="col-xs-2 home_left">--%>
								<%--<label><span>*</span>分类名称：</label>--%>
							<%--</div>--%>
							<%--<div class="col-xs-10 home_right">--%>
								<%--<input class="input_md" type="text" placeholder="请输入相关话题信息..".--%>
									   <%--name="info.title" value="${view.category.name}" />--%>
								<%--必填--%>
							<%--</div>--%>
							<%--<div class="col-xs-2 home_left">--%>
								<%--<label><span>*</span>备注：</label>--%>
							<%--</div>--%>

							<%--<div class="col-xs-10 home_right">--%>
							<%--<textarea class="form-control" style="height: 400px;width: 700px" placeholder="请输入相关备注信息..."--%>
							<%--name="info.content" id="content">${view.category.remark}</textarea>必填--%>
							<%--</div>--%>

							<%--<div class="row input_row">--%>
								<%--<div class="col-xs-offset-2 col-xs-10">--%>
									<%--<input type="submit" class="btn btn-primary btn_sm btn_blue btn_dis btn_border"--%>
										   <%--value="修改"/>--%>
								<%--</div>--%>
							<%--</div>--%>

							<%--&lt;%&ndash;<div class="row input_row">&ndash;%&gt;--%>
							<%--&lt;%&ndash;<div class="col-xs-2 home_left">&ndash;%&gt;--%>
							<%--&lt;%&ndash;<label><span>*</span>描述：</label>&ndash;%&gt;--%>
							<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
							<%--&lt;%&ndash;<div class="col-xs-10 home_right">&ndash;%&gt;--%>
							<%--&lt;%&ndash;<textarea class="form-control" style="height: 400px;width: 700px" placeholder="请输入相关描述信息信息..."&ndash;%&gt;--%>
							<%--&lt;%&ndash;name="info.content" id="content">${view.board.description}</textarea>必填&ndash;%&gt;--%>
							<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
							<%--&lt;%&ndash;</div>&ndash;%&gt;--%>

							<%--&lt;%&ndash;<div class="row input_row">&ndash;%&gt;--%>
							<%--&lt;%&ndash;<div class="col-xs-offset-2 col-xs-10">&ndash;%&gt;--%>
							<%--&lt;%&ndash;<input type="submit" class="btn btn-primary btn_sm btn_blue btn_dis btn_border"&ndash;%&gt;--%>
							<%--&lt;%&ndash;value="修改"/>&ndash;%&gt;--%>
							<%--&lt;%&ndash;<input type="button" class="btn btn-default btn_sm" value="取消" onclick="javascript:history.back();"/>&ndash;%&gt;--%>
							<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
							<%--&lt;%&ndash;</div>&ndash;%&gt;--%>

							<%--&lt;%&ndash;<p>&ndash;%&gt;--%>
								<%--&lt;%&ndash;<span class="l">备 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</span><span&ndash;%&gt;--%>
									<%--&lt;%&ndash;class="r"><textarea&ndash;%&gt;--%>
										<%--&lt;%&ndash;class="inputtext text-input validate['required']"&ndash;%&gt;--%>
										<%--&lt;%&ndash;class="textarea" style="width: 400px; height: 60px;"&ndash;%&gt;--%>
										<%--&lt;%&ndash;name="category.remark" id="inputBox"&ndash;%&gt;--%>
										<%--&lt;%&ndash;onblur="this.className='textarea'"&ndash;%&gt;--%>
										<%--&lt;%&ndash;onfocus="this.className='textarea2'" />${view.category.remark}</textarea>&ndash;%&gt;--%>
								<%--&lt;%&ndash;</span><span class="t"> <font color="red">*</font>必填</span>&ndash;%&gt;--%>
							<%--&lt;%&ndash;</p>&ndash;%&gt;--%>
							<%--&lt;%&ndash;<div class="c"></div>&ndash;%&gt;--%>
							<%--&lt;%&ndash;<div class="c h10"></div>&ndash;%&gt;--%>
							<%--&lt;%&ndash;<p>&ndash;%&gt;--%>
								<%--&lt;%&ndash;<span class="l"></span><span class="r"><input&ndash;%&gt;--%>
									<%--&lt;%&ndash;type="submit" class="botton" value="修改"&ndash;%&gt;--%>
									<%--&lt;%&ndash;onMouseOut="this.className='botton';"&ndash;%&gt;--%>
									<%--&lt;%&ndash;onMouseOver="this.className='botton2';" /> </span>&ndash;%&gt;--%>
							<%--&lt;%&ndash;</p>&ndash;%&gt;--%>
						<%--</s:form>--%>

						<%--&lt;%&ndash;<div class="row input_row">&ndash;%&gt;--%>
							<%--&lt;%&ndash;<div class="col-xs-2 home_left">&ndash;%&gt;--%>
								<%--&lt;%&ndash;<label><span>*</span>话题板块：</label>&ndash;%&gt;--%>
							<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
							<%--&lt;%&ndash;<div class="col-xs-10 home_right">&ndash;%&gt;--%>
								<%--&lt;%&ndash;<input class="input_md" type="text" placeholder="请输入相关话题信息..".&ndash;%&gt;--%>
									   <%--&lt;%&ndash;name="info.title" value="${view.board.name}" />&ndash;%&gt;--%>
								<%--&lt;%&ndash;必填&ndash;%&gt;--%>
							<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
						<%--&lt;%&ndash;</div>&ndash;%&gt;--%>

						<%--&lt;%&ndash;<div class="row input_row">&ndash;%&gt;--%>
							<%--&lt;%&ndash;<div class="col-xs-2 home_left">&ndash;%&gt;--%>
								<%--&lt;%&ndash;<label><span>*</span>描述：</label>&ndash;%&gt;--%>
							<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
							<%--&lt;%&ndash;<div class="col-xs-10 home_right">&ndash;%&gt;--%>
                            			<%--&lt;%&ndash;<textarea class="form-control" style="height: 400px;width: 700px" placeholder="请输入相关描述信息信息..."&ndash;%&gt;--%>
												  <%--&lt;%&ndash;name="info.content" id="content">${view.board.description}</textarea>必填&ndash;%&gt;--%>
							<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
						<%--&lt;%&ndash;</div>&ndash;%&gt;--%>

						<%--<div class="c"></div>--%>
					<%--</div>--%>
				<%--</div>--%>
			<%--</div>--%>

		<%--</div>--%>
	<%--</div>--%>
<%--</body>--%>

