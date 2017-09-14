<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
		 contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/script/validate.jsp" %>
<%@ include file="/common/style/validate.jsp" %>
<%@ include file="/common/website.jsp" %>

<style>
	.layui-layer{height: 280px;width: 360px;}
</style>
<div class="revise_pwd">
	<form action="${ctx}/category!save.action" method="post" id="edit_form">
		<input type="hidden" name="redirect" value="/category/"/>
		<input type="hidden" name="category.website" value="${website}"/>
		<div class="revise_inputs">
			<label for="" class="revise_label"><span>*</span>分类名称：</label>
			<input type="text" class="revise_input validate[required]" name="category.name" value=""/>
		</div>
		<!-- <div class="revise_inputs">
			<label for="" class="revise_label"><span>*</span>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</label>
			<textarea type="text" class="revise_input" name="category.remark"></textarea>
		</div> -->

		<div class="revise_inputs">
			<label for="" class="revise_label"><span>*</span>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</label>
			<input type="text" class="revise_input" name="category.remark" />
		</div>


		<%--<div class="revise_inputs">--%>
			<%--<label for="" class="revise_label"><span>*</span>网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;站：</label>--%>
			<%--<input type="text" class="revise_input" name="category.website" value=""/>--%>
		<%--</div>--%>
		<div class="revise_btns">
			<input type="submit" value="添加"/>
		</div>
	</form>
</div>

<script>
$('#edit_form').validationEngine('attach', {
  promptPosition: 'topRight:-100,20',
  scroll:false
});
</script>
