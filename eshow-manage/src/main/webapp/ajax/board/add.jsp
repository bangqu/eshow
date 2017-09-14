<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
		 contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/website.jsp" %>


<%@ include file="/common/script/validate.jsp" %>
<%@ include file="/common/style/validate.jsp" %>
<style>
	.layui-layer{height: 280px;width: 360px;}
</style>
<div class="revise_pwd">
	<form action="${ctx}/board!save.action" method="post" id="edit_form">
		<input type="hidden" name="redirect" value="/board/"/>
		<input type="text" name="board.website" value="${website}"/>

		<div class="revise_inputs">
			<label for="" class="revise_label"><span>*</span>分类名称：</label>
			<input type="text" class="revise_input validate[required]" name="board.name" value=""/>
		</div>
		<!-- <div class="revise_inputs">
			<label for="" class="revise_label"><span>*</span>描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述：</label>
			<textarea type="text" class="revise_input" name="board.description"></textarea>
		</div> -->

		<div class="revise_inputs">
			<label for="" class="revise_label"><span>*</span>描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述：</label>
			<input type="text" class="revise_input" name="board.description"/>
		</div>
 

		<%--<div class="revise_inputs">--%>
			<%--<label for="" class="revise_label"><span>*</span>网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;站：</label>--%>
			<%--<input type="text" class="revise_input" name="board.website" value=""/>--%>
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

