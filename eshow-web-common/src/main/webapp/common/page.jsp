<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8"%>
<div class="pagination" >
    <ul class="am-pagination am-pagination-centered" >
        <c:if test="${page.currentPage >1}">
            <li><a href="?${href}query.begin=${page.startPage}">«</a></li>
        </c:if>
        <c:if test="${page.currentPage <=1}">
            <li class="disabled"><a href="javascript:;">«</a></li>
        </c:if>
        <c:forEach var="x" begin="${page.startPage}" end="${page.endPage}"
                   step="1">
            <c:if test="${x==page.currentPage}">
                <li class="am-active"><a href="#">${page.currentPage}</a></li>
            </c:if>
            <c:if test="${x!=page.currentPage}">
                <li><a href="?${href}query.begin=${x}">${x}</a> </li>
            </c:if>
        </c:forEach>
        <c:if test="${page.currentPage < page.totalPage}">
            <li><a href="?${href}query.begin=${page.endPage}">»</a></li>
        </c:if>
        <c:if test="${page.currentPage >= page.totalPage}">
            <li class="disabled"><a href="javascript:;">»</a></li>
        </c:if>
    </ul>
</div>
