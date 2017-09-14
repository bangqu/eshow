<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<s:action name="board!view" var="view" executeResult="false">
    <s:param name="id">${param.boardId}</s:param>
</s:action>
<div class="revise_pwd">
    <form action="${ctx}/board!update.action" method="post">
        <input type="hidden" name="id" value="${param.boardId}"/>
        <input type="hidden" name="redirect" value="/board/"/>
        
        <div class="revise_inputs">
            <label for="" class="revise_label"><span>*</span>分类名称：</label>
            <input type="text" class="revise_input" name="board.name" value="${view.board.name}" readonly/>
        </div>

        <!-- <div class="revise_inputs">
            <label for="" class="revise_label"><span>*</span>描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述：</label>
            <textarea class="revise_input" name="board.description" readonly>${view.board.description}</textarea>
        </div> -->

        <div class="revise_inputs">
            <label for="" class="revise_label"><span>*</span>描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述：</label>
            <input type="text" class="revise_input" name="board.description" value="${view.board.description}" readonly/>
        </div>

        <div class="revise_inputs">
            <label for="" class="revise_label"><span>*</span>网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;站：</label>
            <input type="text" class="revise_input" name="board.website" value="${view.board.website}" readonly/>
        </div>

    </form>
</div>
