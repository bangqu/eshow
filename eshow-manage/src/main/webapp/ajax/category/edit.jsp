<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/website.jsp" %>

<%@ include file="/common/script/validate.jsp" %>
<%@ include file="/common/style/validate.jsp" %>
<style>
    .layui-layer{height: 280px;width: 360px;}
</style>


<s:action name="category!view" var="view" executeResult="false">
    <s:param name="id">${param.categoryId}</s:param>
</s:action>
<div class="revise_pwd">
    <form action="${ctx}/category!update.action" method="post" id="edit_form">
        <input type="hidden" name="id" value="${param.categoryId}"/>
        <input type="hidden" name="category.website" value="${website}"/>
        <input type="hidden" name="redirect" value="/category/"/>
        <div class="revise_inputs">
            <label for="" class="revise_label"><span>*</span>分类名称：</label>
            <input type="text" class="revise_input validate[required]" name="category.name" value="${view.category.name}"/>
        </div>
        <!-- <div class="revise_inputs">
            <label for="" class="revise_label"><span>*</span>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</label>
            <textarea type="text" class="revise_input" name="category.remark">${view.category.remark}</textarea>
        </div> -->

        <div class="revise_inputs">
            <label for="" class="revise_label"><span>*</span>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</label>
            <input type="text" class="revise_input" name="category.remark" value="${view.category.remark}"/>
        </div>


        <%--<div class="revise_inputs">--%>
            <%--<label for="" class="revise_label"><span>*</span>网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;站：</label>--%>
            <%--<input type="text" class="revise_input" name="category.website" value="${view.category.website}"/>--%>
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
