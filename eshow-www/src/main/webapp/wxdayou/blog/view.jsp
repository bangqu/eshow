<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<s:action name="category!search" id="categoryList" executeResult="false" />
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>

<s:action name="blog!view" id="view" executeResult="false" />
<script type="javaScript">

</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Language" content="zh-CN" />
		<meta name="description" content="新闻" />
		<meta name="keywords" content="新闻" />
		<title>新闻详细</title>
	</head>
	<body>
    <%@ include file="../common/header1.jsp" %>
		<table width="980" height="472" border="0" align="center"
			cellpadding="0" cellspacing="0">
			<tr>
				<td width="261" height="208" align="left" valign="top"
					background="../images/leftzbg.jpg">
					<c:if test="${view.blog.category.id==1}">
					<table width="261" height="49" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td algin="left" style="padding: 15px;">
								<img src="../images/1-news.jpg" width="218"
									height="74" />
							</td>
						</tr>
					</table>
					</c:if>
					
					<c:if test="${view.blog.category.id==2}">
					<table width="261" height="49" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td algin="left" style="padding: 15px;">
								<img src="../images/money2.jpg" width="218"
									height="74" />
							</td>
						</tr>
					</table>
					</c:if>
					<table width="261" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<img src="../images/leftline.jpg" width="261"
									height="7" />
							</td>
						</tr>
					</table>
					<c:if test="${view.blog.category.id==1}">
					<table width="261" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="34" align="right">
								<img src="../images/small2.jpg" width="16"
									height="14" />
							</td>
							<td width="227" align="lef't" style="padding-left: 10px;">

								<a href="../blog.jsp "> 返回新闻列表</a>
							</td>
						</tr>
					</table>
					</c:if>
					<c:if test="${view.blog.category.id==2}">
					<table width="261" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="34" align="right">
								<img src="../images/small2.jpg" width="16"
									height="14" />
							</td>
							<td width="227" align="lef't" style="padding-left: 10px;">

								<a href="../product.jsp"> 返回产品列表</a>
							</td>
						</tr>
					</table>
					</c:if>

					<c:if test="${pageContext.request.remoteUser != null}">
						<c:if test="${view.blog.category.id==1}">
							<table width="261" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="34" align="right">
										<img src="../images/small2.jpg" width="16"
											height="14" />
									</td>
									<td width="227" align="lef't" style="padding-left: 10px;">

										<a href="../blog/edit?id=${view.blog.id}">新闻更新</a>
									</td>
								</tr>
							</table>
							<table width="261" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="34" align="right">
										<img src="../images/small2.jpg" width="16"
											height="14" />
									</td>
									<td width="227" align="lef't" style="padding-left: 10px;">

										<a
											href="../blog!delete.html?id=${view.blog.id}">新闻删除</a>
									</td>
								</tr>
							</table>
							
						</c:if>
						<c:if test="${view.blog.category.id==2}">
							<table width="261" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="34" align="right">
										<img src="../images/small2.jpg" width="16"
											height="14" />
									</td>
									<td width="227" align="lef't" style="padding-left: 10px;">

										<a href="../blog/edit?id=${view.blog.id}">产品报价更新</a>
									</td>
								</tr>
							</table>
							<table width="261" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="34" align="right">
										<img src="../images/small2.jpg" width="16"
											height="14" />
									</td>
									<td width="227" align="lef't" style="padding-left: 10px;">



										<a href="/product"><a
											href="javascript:if(confirm('你确定要删除当前产品吗? ')){location.href='<c:url value='/blog!delete.html?id=${view.blog.id}'/>'}">产品报价删除
										</a>
										</a>


									</td>
								</tr>
							</table>
							<table width="261" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="34" align="right">
										<img src="../images/small2.jpg" width="16"
											height="14" />
									</td>
									<td width="227" align="lef't" style="padding-left: 10px;">

										<a href="../product.jsp">显示产品报价</a>
									</td>
								</tr>
							</table>
						</c:if>
					</c:if>
					<table width="261" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="34" align="right">
										<img src="../images/small2.jpg" width="16"
											height="14" />
									</td>
									<td width="227" align="lef't" style="padding-left: 10px;">

										<a
											href="add.jsp">继续添加</a>
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
									background="../images/titleabout.jpg"
									class="bold">
									新闻显示
								</td>
								<td width="556"
									background="../images/titlebg.jpg">
									&nbsp;
								</td>
								<td width="65" align="center"
									background="../images/titlebg.jpg">
									<a href="about.php"></a>
								</td>
							</tr>
						</table>
					</c:if>
					<c:if test="${view.blog.category.id==2}">
						<table width="719" height="31" border="0" cellpadding="0"
							cellspacing="0">
							<tr>
								<td width="98" height="31" align="center"
									background="../images/titleabout.jpg"
									class="bold">
									&nbsp;&nbsp;&nbsp;&nbsp;产品报价显示
								</td>
								<td width="556"
									background="../images/titlebg.jpg">
									&nbsp;
								</td>
								<td width="65" align="center"
									background="../images/titlebg.jpg">
								</td>
							</tr>
						</table>
					</c:if>
					<div align="center">
						<s:form action="blog!view.html" method="post"
							cssClass="creat_form clearfix">
							<input type="hidden" name="id" value="${view.blog.id}" />
							<table width="100%" height="210" border="0" cellpadding="0"
								cellspacing="0">
								
								<tr>
									<td align="left" valign="top" style="padding: 20px;">
										<table width="99%" height="42" border="0" cellpadding="0"
											cellspacing="0">
											<tr>
												<td height="35" align="center">
													<font size="2"><p>
															<span
																style="font-size: 18pt; font-family: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">
																${view.blog.title} &nbsp;&nbsp;</span>
														</p> </font>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								
									<td height="300" align="left" valign="top"
										style="padding-left: 10px">


										<p class="MsoNormal" style="margin: 0cm 0cm 0pt">
											<b style="mso- bidi-font-weight: normal">${view.blog.content}
												 
											 </b><br/><br/><br/><br/><br/><c:if test="${view.blog.category.id==2}"><font color="blue" size="2px" >详细信息欢迎来电资讯!!!<br/>
											手  &nbsp;&nbsp;&nbsp;  机：13771151511<br/>
											电  &nbsp;&nbsp;&nbsp;  话：0510-88702451 88202624 
											</font></c:if>
										</p>
										
									</td>
									
								
							</table>
						</s:form>


					</div>
					<div></div>
		</table>
    <%@ include file="../common/footer1.jsp" %>
	</body>
</html>
