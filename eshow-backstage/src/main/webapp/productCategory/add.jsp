<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
		 contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
	<title>日志添加</title>

</head>
<body>
<div class="home_wrapper ">
	<%@ include file="/include/left.jsp" %>
	<div class="home_content">
		<div class="home_list" >
			<ul class="home_navbar clearfix ">
				<li><a href="${ctx}/">首页概述</a></li>
				<li><span>></span></li>
				<li><a href="${ctx}/productCategory">产品分类管理</a></li>
				<li><span>></span></li>
				<li>添加产品分类</li>
			</ul>
		</div>
		<div class="home_dis">
			<s:form id="productCategoryForm" action="product-category!save.action" method="post" cssClass="form-horizontal"
					namespace="">
				<input type="hidden" name="redirect" value="/productCategory/index"/>
				<input type="hidden" name="productCategory.website" value="${website}"/>

				<div class="home_block product_cont">
					<%--<div class="add_info clearfix">--%>
						<%--<p class="add_info_txt fl"><b class="color-red">*</b><span>产品分类名：</span></p>--%>
						<%--<input class="add_info_input fl log_input" type="text" placeholder="请输入产品分类名称..."--%>
							   <%--name="productCategory.name" />--%>
					<%--</div>--%>
					<div class="row input_row">
						<div class="col-xs-2 home_left">
							<label><span>*</span>产品分类名：</label>
						</div>
						<div  class="col-xs-10 home_right">
							<input class="form-control" type="text" placeholder="请输入产品分类名称..."
								   name="productCategory.name" />
						</div>
					</div>

					<%--<div class="add_info clearfix">--%>
						<%--<p class="add_info_txt fl"><b class="color-red">*</b><span>产品描述：</span></p>--%>
                    <%--<textarea class="add_info_input fl log_input" style="height: 300px;" placeholder="请输入产品描述..."--%>
							  <%--name="productCategory.description"></textarea>--%>
					<%--</div>--%>
					<div class="row input_row">
						<div class="col-xs-2 home_left">
							<label><span>*</span>产品描述：</label>
						</div>
						<div class="col-xs-10 home_right">
						<textarea class="form-control" style="height: 300px;" placeholder="请输入产品描述..."
								  name="productCategory.description"></textarea>
						</div>
					</div>

					<%--<div class="add_info clearfix">--%>
						<%--<p class="add_info_txt fl"><b class="color-red">*</b><span>网站：</span></p>--%>
						<%--<input class="add_info_input fl log_input" type="text" placeholder="请输入网站..."--%>
							   <%--name="productCategory.website" />--%>
					<%--</div>--%>

					<div class="row input_row">
						<div class="col-xs-offset-2 col-xs-10">
							<input type="submit" class="btn btn-primary btn_sm btn_blue btn_dis btn_border"
								   value="发布"/>
							<input type="button" class="btn btn-default btn_sm" value="取消" onclick="javascript:history.back()"/>
						</div>
					</div>
					<%--<div class="add_log_btn">--%>
						<%--<input class="release_btn" type="submit" value="发布"/>--%>
						<%--<a href="${ctx}/productCategory/index"><span>取消</span></a>--%>
					<%--</div>--%>
				</div>
			</s:form>
		</div>
	</div>
</div>
<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
</body>

