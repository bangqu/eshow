<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Language" content="zh-CN" />
	</head>
	<body>
    <%@ include file="common/header.jsp"%>
		<c:if test="${not empty messages}">
			<div class="message" id="successMessages" align="center" style="font-size: 16px;color:red;">
				<c:forEach var="msg" items="${messages}">
					<c:out value="${msg}" />
					<br />
				</c:forEach>
			</div>
			<div align="center" style="font-size: 14px;">
				3秒后跳转
			</div>
			<c:remove var="messages" scope="session" />
		</c:if>
		<script>
		function delayURL()
		{
			window.location.href = "<c:url value='/'/>";
		}
		setTimeout("delayURL()",3000) //毫秒
		
		</script>
        <%@ include file="common/footer.jsp"%>
	</body>
</html>
