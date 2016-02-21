<%@ include file="/common/taglibs.jsp"%>
<%
	if (request.getAttribute("struts.valueStack") != null) {
%>
<%-- ActionError Messages - usually set in Actions --%>
<s:if test="hasActionErrors()">
	<div class="error" id="errorMessages">
		<s:iterator value="actionErrors">
			<s:property />
			<br />
		</s:iterator>
	</div>
</s:if>

<%-- FieldError Messages - usually set by validation rules --%>
<s:if test="hasFieldErrors()">
	<div class="error" id="errorMessages">
		<s:iterator value="fieldErrors">
			<s:iterator value="value">
				<s:property />
				<br />
			</s:iterator>
		</s:iterator>
	</div>
</s:if>
<%
	}
%>

<%-- Success Messages --%>
<c:if test="${not empty messages}">
	<div class="message" id="successMessages">
		<c:forEach var="msg" items="${messages}">
			<c:out value="${msg}" />
			<br />
		</c:forEach>
	</div>
	<c:remove var="messages" scope="session" />
</c:if>

<%-- Error Messages (on JSPs, not through Struts --%>
<c:if test="${not empty errors}">
	<div class="error" id="errorMessages">
		<c:forEach var="error" items="${errors}">
			<c:out value="${error}" />
			<br />
		</c:forEach>
	</div>
	<c:remove var="errors" scope="session" />
</c:if>