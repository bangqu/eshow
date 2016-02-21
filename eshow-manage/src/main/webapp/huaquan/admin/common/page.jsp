<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<div class="pager">
	<div class="mainPager">
		<c:if test="${page.currentPage >1}">
			<a class="chn" href="?begin=${page.prePage}">上一页</a>
		</c:if>
		<c:forEach var="x" begin="${page.startPage}" end="${page.endPage}"
			step="1">
			<c:if test="${x==page.currentPage}">
				<span class="current">${x}</span>
			</c:if>
			<c:if test="${x!=page.currentPage}">
				<a class="chn" href="?begin=${x}">${x}</a>
			</c:if>
		</c:forEach>
		<c:if test="${page.currentPage < page.totalPage}">
			<a class="nextpage" href="?begin=${page.nextPage}">下一页</a>
		</c:if>
	</div>
</div>