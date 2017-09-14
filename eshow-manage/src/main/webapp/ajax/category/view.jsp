<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<s:action name="category!view" var="view" executeResult="false">
    <s:param name="id">${param.categoryId}</s:param>
</s:action>
<div class="revise_pwd">
    <form action="${ctx}/category!update.action" method="post">
        <input type="hidden" name="id" value="${param.categoryId}"/>
        <input type="hidden" name="redirect" value="/category/"/>
        <div class="revise_inputs">
            <label for="" class="revise_label"><span>*</span>分类名称：</label>
            <input type="text" class="revise_input" name="category.name" value="${view.category.name}" readonly/>
        </div>
        <!-- <div class="revise_inputs">
            <label for="" class="revise_label"><span>*</span>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</label>
            <textarea type="text" class="revise_input" name="category.remark" readonly>${view.category.remark}</textarea>
        </div> -->

        <div class="revise_inputs">
            <label for="" class="revise_label"><span>*</span>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</label>
            <input type="text" class="revise_input" name="category.remark" readonly value="${view.category.remark}"/>
        </div>

        <div class="revise_inputs">
            <label for="" class="revise_label"><span>*</span>网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;站：</label>
            <input type="text" class="revise_input" name="category.website" value="${view.category.website}" readonly/>
        </div>
        <div class="revise_btns">
            <input type="submit" value="修改"/>
        </div>
    </form>
</div>
