<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="category!view" id="view" executeResult="false"></s:action>
<head>
<title>日志分类</title>
<link rel="stylesheet" href="${ctx}/admin/styles/category.css"
	type="text/css" />
</head>
<body>
	<div class="container mt">
		<div class="row-fluid">
			<s:include value="../left.jsp"></s:include>
			<div class="span10">
				<ul class="breadcrumb">
					<li><a href="${ctx}/admin/index">首页</a> <span class="divider">/</span>
					</li>
					<li class="active">${title}</li>
				</ul>
				<s:include value="../title.jsp"></s:include>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/category/add'/>"
								class="btn btn-primary">发布</a>
						</div>
						<h3 class="yahei">
							<img src="<c:url value='/admin/images/app_list_blog.gif'/>" />
							分类管理——修改分类
						</h3>
					</div>
					<div id="edit">
						<s:form action="category!update.html" id="categoryForm"
							method="post">
							<input type="hidden" name="id" value="${view.category.id}" />
							<p>
								<span class="l">分类名称：</span><span class="r"><input
									class="inputtext text-input validate['required']"
									style="width: 150px;" class="inputtext" type="text"
									onblur="this.className='inputtext'"
									onfocus="this.className='inputtext2'" id="name"
									name="category.name" value="${view.category.name}" /> </span><span
									class="t"><font color="red">*</font>必填</span>
							</p>
							<p>
								<span class="l">备 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</span><span
									class="r"><textarea
										class="inputtext text-input validate['required']"
										class="textarea" style="width: 400px; height: 60px;"
										name="category.remark" id="inputBox"
										onblur="this.className='textarea'"
										onfocus="this.className='textarea2'" />${view.category.remark}</textarea>
								</span><span class="t"> <font color="red">*</font>必填</span>
							</p>
							<div class="c"></div>
							<div class="c h10"></div>
							<p>
								<span class="l"></span><span class="r"><input
									type="submit" class="botton" value="修改"
									onMouseOut="this.className='botton';"
									onMouseOver="this.className='botton2';" /> </span>
							</p>
						</s:form>
						<div class="c"></div>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>

