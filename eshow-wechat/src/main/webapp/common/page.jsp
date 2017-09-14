<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<div class="forum_pages">
    <ul>
        <c:if test="${page.currentPage >1}">
            <li><a href="?${href}query.begin=${page.startPage}">上一页</a></li>
        </c:if>
        <c:if test="${page.currentPage <=1}">
            <li class="previous"><a href="javascript:;">上一页</a></li>
        </c:if>
        <c:forEach var="x" begin="${page.startPage}" end="${page.endPage}"
                   step="1">
            <c:if test="${x==page.currentPage}">
                <li class="click"><a href="#">${page.currentPage}</a></li>
            </c:if>
            <c:if test="${x!=page.currentPage}">
                <li><a href="?${href}query.begin=${x}">${x}</a></li>
            </c:if>
        </c:forEach>
        <c:if test="${page.currentPage < page.totalPage}">
            <li><a href="?${href}query.begin=${page.endPage}">下一页</a></li>
        </c:if>
        <c:if test="${page.currentPage >= page.totalPage}">
            <li class="next"><a href="javascript:;">下一页</a></li>
        </c:if>
    </ul>
</div>
