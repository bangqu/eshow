<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
	<ul class="am-pagination am-fr admin-content-pagination">
		<c:if test="${page.currentPage >1}">
			<li class="am-disabled"><a href="?query.begin=${page.prePage}">上一页</a></li>
		</c:if>
		<c:forEach var="x" begin="${page.startPage}" end="${page.endPage}" step="1">
			<c:if test="${x==page.currentPage}">
				<li class="am-active"><a href="#">${x}</a></li>
			</c:if>
			<c:if test="${x!=page.currentPage}">
				<li> <a  href="?query.begin=${x}">${x}</a></li>
			</c:if>
		</c:forEach>
		<c:if test="${page.currentPage < page.totalPage}">
			<li><a  href="?query.begin=${page.nextPage}">下一页</a></li>
		</c:if>
	</ul>
