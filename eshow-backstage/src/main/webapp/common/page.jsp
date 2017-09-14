<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<nav>
    <div class="page_txt fl">
        <span>显示 ${page.currentPage*page.pageSize-page.pageSize+1} 到 ${page.currentPage*page.pageSize} 项，共 ${page.size} 项</span>
    </div>
    <ul class="pagination fr">
        <li>
            <c:if test="${page.currentPage >1}">
                <a href="?${href}query.begin=${page.startPage}">上一页</a>
            </c:if>
            <c:if test="${page.currentPage <=1}">
                <a href="javascript:;">上一页</a>
            </c:if>
        </li>
        <c:forEach var="x" begin="${page.startPage}" end="${page.endPage}"
                   step="1">
            <c:if test="${x==page.currentPage}">
                <li class="active"><a href="#">${page.currentPage}</a></li>
            </c:if>
            <c:if test="${x!=page.currentPage}">
                <li><a href="?${href}query.begin=${x}">${x}</a></li>
            </c:if>
        </c:forEach>
        <li>
            <c:if test="${page.currentPage < page.totalPage}">
                <a href="?${href}query.begin=${page.endPage}">下一页</a>
            </c:if>
            <c:if test="${page.currentPage >= page.totalPage}">
                <a href="javascript:;">下一页</a>
            </c:if>
        </li>
    </ul>
</nav>



