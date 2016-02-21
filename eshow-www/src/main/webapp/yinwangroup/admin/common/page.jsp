<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<ul class="pagination pagination-sm">
    <c:if test="${page.currentPage >1}">
        <li><a class="chn" href="?query.begin=${page.prePage}">上一页</a></li>
    </c:if>
    <c:forEach var="x" begin="${page.startPage}" end="${page.endPage}"
               step="1">
        <c:if test="${x==page.currentPage}">
            <li><span class="current">${x}</span></li>
        </c:if>
        <c:if test="${x!=page.currentPage}">
            <li><a class="chn" href="?query.begin=${x}">${x}</a></li>
        </c:if>
    </c:forEach>
    <c:if test="${page.currentPage < page.totalPage}">
        <li><a class="nextpage" href="?query.begin=${page.nextPage}">下一页</a></li>
    </c:if>
</ul>


