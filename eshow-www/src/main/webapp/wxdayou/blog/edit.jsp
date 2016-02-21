<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<s:action name="category!search" id="categoryList" executeResult="false" />
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<s:action name="blog!view" id="view" executeResult="false" />
<s:action name="organization!search" id="organizationList"
	executeResult="false">
</s:action>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Language" content="zh-CN" />
		<meta name="description" content="日志" />
		<meta name="keywords" content="日志" />
		<title>新闻详细</title>
	</head>
	<body>
    <%@ include file="../common/header1.jsp" %>
		<table width="980" height="472" border="0" align="center"
			cellpadding="0" cellspacing="0">
			<tr>
				<td width="261" height="208" align="left" valign="top"
					background="../images/leftzbg.jpg">
					<table width="261" height="49" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td algin="left" style="padding: 15px;">
								<img src="../images/money2.jpg" width="218"
									height="74" />
							</td>
						</tr>
					</table>

					<table width="261" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<img src="../images/leftline.jpg" width="261" height="7" />
							</td>
						</tr>
					</table>
				</td>
				<td width="719" align="left" valign="top">
					<c:if test="${view.blog.category.id==1}">
					<table width="719" height="31" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="98" height="31" align="center"
								background="../images/titleabout.jpg" class="bold">
								新闻更新
							</td>
							<td width="556" background="../images/titlebg.jpg">
								&nbsp;
							</td>
							<td width="65" align="center" background="../images/titlebg.jpg">
								<a href="about.php"></a>
							</td>
						</tr>
					</table>
					<div >
						<s:form action="blog!update.html" method="post"
							cssClass="creat_form clearfix">
							<input type="hidden" name="id" value="${view.blog.id}" />
							<p>
								<label for="title">
									新闻标题：
								</label>
								<input type="text" id="title" name="blog.title"
									value="${view.blog.title}" maxlength="30" />
							</p>

							<p>
								
									新闻内容：<br/>
								
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<FCK:editor instanceName="blog.content">
									<jsp:attribute name="value">${view.blog.content}</jsp:attribute>
									<jsp:attribute name="width">600</jsp:attribute>
									<jsp:attribute name="height">400</jsp:attribute>
								</FCK:editor>
							</p>
							<div style="display:none">
								<p>
									<label class="creat_form_l" for="categoryId">
										分 类：
									</label>
									<s:action name="category!search" id="categoryList"
										executeResult="false">
										<s:param name="queryBean.top">true</s:param>
									</s:action>
									<select id="categoryId" name="blog.category.id">
										<s:iterator value="%{#categoryList.categories}"
											status="rowStatus">
											<option value="${id}">
												<c:if test="${view.blog.category.id==id}" >selected="selected"</c:if>
												${name}
											</option>
										</s:iterator>
									</select>
								</p>
							</div>	
							<p align="center">
								<input name="submit1" class="bt_sub3w" type="submit"
									value="修改成功" />
							</p>
						</s:form>
					</div>
					</c:if>
					
					<c:if test="${view.blog.category.id==2}">
					<table width="719" height="31" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="98" height="31" align="center"
								background="../images/titleabout.jpg" class="bold">
								报价中心:
							</td>
							<td width="556" background="../images/titlebg.jpg">
								&nbsp;
							</td>
							<td width="65" align="center" background="../images/titlebg.jpg">
								<a href="about.php"></a>
							</td>
						</tr>
					</table>
					<div >
						<s:form action="blog!update.html" method="post"
							cssClass="creat_form clearfix">
							<input type="hidden" name="id" value="${view.blog.id}" />
							<p>
								<label for="title">
									产品报价:
								</label>
								<input type="text" id="title" name="blog.title"
									value="${view.blog.title}" maxlength="30" />
							</p>

							<p>
								
									产品价格及价格说明：<br/>
								
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FCK:editor instanceName="blog.content">
									<jsp:attribute name="value">${view.blog.content}</jsp:attribute>
									<jsp:attribute name="width">600</jsp:attribute>
									<jsp:attribute name="height">400</jsp:attribute>
								</FCK:editor>
							</p>
							<div style="display:none">
								<p>
									<label class="creat_form_l" for="categoryId">
										分 类：
									</label>
									<s:action name="category!search" id="categoryList"
										executeResult="false">
										<s:param name="queryBean.top">true</s:param>
									</s:action>
									<select id="categoryId" name="blog.category.id">
										<s:iterator value="%{#categoryList.categories}"
											status="rowStatus">
											<option value="${id}">
												<c:if test="${view.blog.category.id==id}" >selected="selected"</c:if>
												${name}
											</option>
										</s:iterator>
									</select>
								</p>
							</div>	
							<p align="center">
								<input name="submit1" class="bt_sub3w" type="submit"
									value="修改成功" />
							</p>
						</s:form>
					</div>
					</c:if>
		</table>
    <%@ include file="../common/footer1.jsp" %>
	</body>
</html>
