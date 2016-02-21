<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
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
		<meta name="description" content="日志" />
		<meta name="keywords" content="日志" />
		<title>产品添加</title>
	</head>
	<body>
    <%@ include file="../common/header1.jsp" %>
		<table width="980" height="472" border="0" align="center"
			cellpadding="0" cellspacing="0">
			<tr>
				<td width="261" height="208" align="left" valign="top"
					background="<c:url value='/images/leftzbg.jpg'/>">
					<table width="261" height="49" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td algin="left" style="padding: 15px;">
								<img src="<c:url value='/images/money2.jpg'/>" width="218"
									height="74" />
							</td>
						</tr>
					</table>

					<table width="261" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<img src="<c:url value='images/leftline.jpg'/>" width="261" height="7" />
							</td>
						</tr>
					</table>
				</td>
				<td width="719" align="left" valign="top">
					<table width="719" height="31" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="98" height="31" align="center"
								background="<c:url value='/images/titleabout.jpg'/>" class="bold">
								产品添加
							</td>
							<td width="556" background="<c:url value='/images/titlebg.jpg'/>">
								&nbsp;
							</td>
							<td width="65" align="center" background="<c:url value='/images/titlebg.jpg'/>">
								<a href="about.php"></a>
							</td>
						</tr>
					</table>

					<div class="group_creat clearfix">
						<s:form action="blog!save.html" method="post"
							cssClass="creat_form clearfix">

							<p>
								<label for="title">
									产品名：
								</label>
									
								<input type="text" id="title" name="blog.title" value=""
									maxlength="100" />
							</p>
							<p>
								<label for="content">
									产品价格及价格说明：
								</label><FCK:editor instanceName="blog.content">
									<jsp:attribute name="value">&nbsp;</jsp:attribute>
									<jsp:attribute name="width">600</jsp:attribute>
									<jsp:attribute name="height">400</jsp:attribute>
								</FCK:editor>
							</p>
							<div style="display:none" >
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
											<option value="2"
												<c:if test="${param.categoryId==2}" >selected="selected"</c:if>>
												${name}
											</option>
										</s:iterator>
									</select>
								</p>
							</div>
							<p class="acts">
								<input name="submit1" type="submit" value="提 交" />
							</p>
						</s:form>
					</div>
		</table>
    <%@ include file="../common/footer1.jsp" %>
	</body>
</html>
