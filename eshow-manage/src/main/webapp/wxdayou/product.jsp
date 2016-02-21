<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<s:action name="category!search" id="categoryList" executeResult="false" />
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-

transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Language" content="zh-CN" />
		<meta name="description" content="无锡大铕不锈钢有限公司" />
		<meta name="keywords" content="无锡大铕不锈钢有限公司" />
		<title>报价中心</title>
	</head>
	<body>
    <%@ include file="common/header.jsp"%>
		<table width="980" height="472" border="0" align="center"
			cellpadding="0" cellspacing="0">
			<tr>
				<td width="261" height="208" align="left" valign="top"
					background="images/leftzbg.jpg">
					<table width="261" height="49" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td algin="left" style="padding: 15px;">
								<img src="<c:url value='images/money2.jpg'/>" width="218"
									height="74" />
							</td>
						</tr>
					</table>
					<c:if test="${pageContext.request.remoteUser != null}">
						
							<table width="261" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="34" align="right">
										<img src="<c:url value='images/small2.jpg'/>" width="16"
											height="14" />
									</td>
									<td width="227" align="left" style="padding-left: 10px;">
										<a href="blog/productAdd">报价信息添加</a>
									</td>
								</tr>
							</table>
					</c:if>
				</td>

				<td width="719" align="left" valign="top">
					<table width="719" height="31" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="98" height="31" align="center"
								background="images/titleabout.jpg"
								class="bold">
								报价中心
							</td>
							<td width="556" background="images/titlebg.jpg">
								&nbsp;
							</td>
							<td width="65" align="center"
								background="images/titlebg.jpg">
							</td>
						</tr>
					</table>
					<table width="95%" border="0" align="center" cellpadding="5"
						cellspacing="0" style="margin: 20px 0;">
						<s:action name="product!search" id="productList"
							executeResult="false">
                            <s:param name="query.website">wuxidayou</s:param>
							<s:param name="query.order">addTime</s:param>
							<s:param name="query.desc">true</s:param>
						</s:action>
						<tr>

							<td align="left" width="300px" white-space:nowrap>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;报价信息
							</td>

							<td align="left" valign="left" width="200px">
								产品价格
							</td>
							<td align="left" valign="middle" width="150px">
								<c:if test="${pageContext.request.remoteUser != null}">
								操&nbsp;&nbsp;作
								</c:if>
							</td>
							<td align="left" valign="middle" width="250px">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信息发布时间
							</td>
						</tr>
						<s:iterator value="%{#productList.products}" status="rowStatus">
							<tr>

								<td align="left" valign="middle" width="400px"
									white-space:nowrap>
									<img src="images/small.jpg" border="0" />
									<a href="product/view/${id}"> ${name}</a>
									<br />
								</td>

								<td align="left" valign="middle" width="120px">
									<font color="red"> <a href="product/view/${id}"> ${price}</a></font>

									<br />
								</td>
								<td align="left" valign="middle" width="120px">
									<c:if test="${pageContext.request.remoteUser != null}">
										<a
											href="javascript:if(confirm('确定要删除吗？')){location.href='<c:url value='/product!delete.html?id=${id}'/>'};">删除

										</a>
									</c:if>
									<br />
								</td>
								<td align="left" valign="middle" width="150px">
									<span><s:date name='addTime' format="yyyy-MM-dd HH:mm" />
								</td>
							</tr>
						</s:iterator>
					</table>
					<%--<div id="articeBottom">--%>
						<%--<%@ include file="/common/page.jsp"%>--%>
					<%--</div>--%>
		</table>
        <%@ include file="common/footer.jsp"%>
	</body>
</html>
