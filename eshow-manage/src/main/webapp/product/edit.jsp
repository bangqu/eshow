<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
		 contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<s:action name="product!view" var="view" executeResult="false"/>
<s:action name="product-category!search" var="productCategoryList" executeResult="false">
	<s:param name="query.enabled">true</s:param>
	<s:param name="query.website">${website}</s:param>
	<s:param name="query.order">sequence</s:param>
	<s:param name="query.desc">false</s:param>
	<s:param name="query.pagesize">20</s:param>
</s:action>
<head>
	<title>产品添加</title>

</head>
<body>
<div class="home_wrapper ">
	<%@ include file="/include/left.jsp" %>
	<div class="home_content">
		<div class="home_list" style="margin-top:80px;">
			<ul class="home_navbar clearfix ">
				<li><a href="">首页概述</a></li>
				<li><span>></span></li>
				<li><a href="">产品管理</a></li>
				<li><span>></span></li>
				<li><a href="">修改产品</a></li>
			</ul>
		</div>
		<div class="home_dis">
			<s:form id="productForm" action="product!update.action" method="post" cssClass="form-horizontal"
					namespace="">
				<input type="hidden" name="redirect" value="/product/"/>
				<input type="hidden" name="product.website" value="${website}"/>
				<input type="hidden" name="id" value="${view.product.id}"/>

				<div class="home_block product_cont">
					<div class="row input_row">
						<div class="col-xs-2 home_left">
							<label><span>*</span>产品名称：</label>
						</div>
						<div  class="col-xs-10 home_right">
							<input class="form-control" type="text" placeholder="请输入产品名称..."
								   name="product.name" value="${view.product.name}"/>
						</div>
					</div>

					<div class="row input_row">
						<div class="col-xs-2 home_left">
							<label><span>*</span>产品分类：</label>
						</div>

						<%--<input type="hidden" name="productCategoryId" id="productCategoryId" value="${view.product.productCategory.id}">--%>

						<%--<div class="col-xs-2 home_left">--%>
							<%--<label>${view.product.productCategory.name}</label>--%>
						<%--</div>--%>
						<div class="col-sm-10">
							<select name="boardId" id="boardId" class="form-control">
									<%--<option>请选择</option>--%>
								<s:iterator value="%{#productCategoryList.productCategories}"  var="cat">
									<option  value="${id}"
											 <s:if test="%{id == #view.product.productCategory.id}">selected="selected"</s:if>
											>${name}</option>

								</s:iterator>
							</select>
						</div>
					</div>

					<div class="row input_row">
						<div class="col-xs-2 home_left">
							<label><span>*</span>产品内容：</label>
						</div>
						<div class="col-xs-10 home_right">
                        <textarea class="form-control" style="height: 400px;width: 700px" placeholder="请输入产品名称..."
								  name="product.content" id="content">${view.product.content}</textarea>
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

<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
<%@ include file="/common/script/umeditor.jsp" %>

<script>


	$(".release_btn").click(function () {
		layer.open({
			type: 0,
			title: ['发布话题', 'fontSize:16px;color:#163547;'],
			content: '您确认发布该话题吗？',
			btn: ['取消', '确认']
		})
	});
	var ue = UM.getEditor('content', {
		lang: /^zh/.test(navigator.language || navigator.browserLanguage || navigator.userLanguage) ? 'zh-cn' : 'en',
		langPath: UMEDITOR_CONFIG.UMEDITOR_HOME_URL + "lang/",
		focus: true
	});
</script>
</body>

