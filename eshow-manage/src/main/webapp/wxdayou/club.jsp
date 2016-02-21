<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<s:action name="category!search" id="categoryList" executeResult="false" />
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Language" content="zh-CN" />
		<meta name="description" content="社区" />
		<meta name="keywords" content="社区" />
		<title>社区</title>
	</head>
	<body>
    <%@ include file="common/header.jsp" %>
		新闻添加
			<div class="ContentBai">
						
						<div>
							<div class="ContentBai">
								<s:action name="blog!search" id="newBlogList"
									executeResult="false">
									<s:param name="order">addTime</s:param>
									<s:param name="desc">true</s:param>
								</s:action>
								<s:iterator value="%{#newBlogList.blogs}" status="rowStatus">
									<div class="bwContent">
										<div class="ContentPic">
											<a href="user/data/${user.username}"><img
													src="<c:url value='images/small.jpg'/>" border="0" /> </a>
										</div>
										<div class="ContenZi">
											<h2>
												<a href="<c:url value='/user/data/${user.username}'/>"><font
													color="#025CA8">${user.username}</font> </a><span
													class="Contentlz">写了新日记</span>${title}
											</h2>
											<p>
												${addTime }
											</p>
											<p>
												用户${id}
											</p>
											<p>
												<a href="view/${id}" class="ab">${util:preview(content)}
												</a>
											</p>
											<p>
												<a href="<c:url value='/club/${userId}'/>">详细</a>
											</p>
										</div>
									</div>
								</s:iterator>
							</div>
							<div class="Leftys">
								<%@ include file="/common/page.jsp"%>
							</div>
							<div class="Peoplekuang"></div>
						</div>
						<div class="mianmbot"></div>
					</div>
    <%@ include file="common/footer.jsp" %>
	</body>
</html>
