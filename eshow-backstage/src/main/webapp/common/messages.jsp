<%@ include file="/common/taglibs.jsp"%>
<%
	if (request.getAttribute("struts.valueStack") != null) {
%>
<%-- ActionError Messages - usually set in Actions --%>
<s:if test="hasActionErrors()">

	<script>
        ESUtils.alert('<s:iterator value="actionErrors"><s:property /></s:iterator>',"0","5");
	</script>

</s:if>

<%-- FieldError Messages - usually set by validation rules --%>
<s:if test="hasFieldErrors()">

		<script>
            ESUtils.alert('<s:iterator value="fieldErrors"><s:iterator value="value"><s:property /></s:iterator></s:iterator>',"0","5");
		</script>

</s:if>
<%
	}
%>

<%-- Success Messages --%>
<c:if test="${not empty messages}">

		<script>
            ESUtils.alert('<c:forEach var="msg" items="${messages}"><c:out value="${msg}" /></c:forEach>',"1","5");
		</script>

	<c:remove var="messages" scope="session" />
</c:if>

<%-- Error Messages (on JSPs, not through Struts --%>
<c:if test="${not empty errors}">
	<script>
        ESUtils.alert('<c:forEach var="error" items="${errors}"><c:out value="${error}" /></c:forEach>',"1","5");
	</script>

	<c:remove var="errors" scope="session" />
</c:if>