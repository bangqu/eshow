<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
 contentType="text/html;charset=utf-8"%>
<div class="center" id='pagination'>
<c:if test="${page.currentPage >1}">
 <a href="?begin=${page.prePage}" class="button">上一页</a>
</c:if>
<c:if test="${page.currentPage < page.totalPage}">
 <a href="?begin=${page.nextPage}">下一页</a>
</c:if>
</div>
