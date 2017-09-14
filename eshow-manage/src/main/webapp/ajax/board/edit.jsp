<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/website.jsp" %>

<%@ include file="/common/script/validate.jsp" %>
<%@ include file="/common/style/validate.jsp" %>
<style>
    .layui-layer{height: 280px;width: 360px;}
</style>

<s:action name="board!view" var="view" executeResult="false">
    <s:param name="id">${param.boardId}</s:param>
</s:action>
<div class="revise_pwd">
    <form action="${ctx}/board!update.action" method="post" id="edit_form">
        <input type="hidden" name="id" value="${param.boardId}"/>
        <input type="text" name="board.website" value="${website}"/>
        <input type="hidden" name="redirect" value="/board/"/>
        <div class="revise_inputs">
            <label for="" class="revise_label"><span>*</span>分类名称：</label>
            <input type="text" class="revise_input validate[required]" name="board.name" value="${view.board.name}"/>
        </div>
        <!-- <div class="revise_inputs" style="border:1px solid red">
            <label for="" class="revise_label"><span>*</span>描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述：</label>
            <textarea class="revise_input" name="board.description">${view.board.description}</textarea>
        </div> -->
        <div class="revise_inputs">
            <label for="" class="revise_label"><span>*</span>描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述：</label>
            <input type="text" class="revise_input" name="board.description" value="${view.board.description}"/>
        </div>

        <%--<div class="revise_inputs">--%>
            <%--<label for="" class="revise_label"><span>*</span>网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;站：</label>--%>
            <%--<input type="text" class="revise_input" name="board.website" value="${view.board.website}"/>--%>
        <%--</div>--%>
        <div class="revise_btns">
            <input type="submit" value="修改"/>
        </div>
    </form>
</div>

<script>
$('#edit_form').validationEngine('attach', {
  promptPosition: 'topRight:-100,20',
  scroll:false
});
</script>
