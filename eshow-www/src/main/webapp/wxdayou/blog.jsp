<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
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
		<title>新闻中心</title>
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
								<img src="images/1-news.jpg" width="218"
									height="74" />
							</td>
						</tr>
					</table>

					<table width="261" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<img src="images/leftline.jpg" width="261" height="7" />
							</td>
						</tr>
					</table>
							
					<c:if test="${pageContext.request.remoteUser != null}">
						<div>
							<table width="261" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="34" align="right">
										<img src="images/small2.jpg" width="16"
											height="14" />
									</td>
									<td width="227" align="lef't" style="padding-left: 10px;">
										<a href="/blog/add.jsp">新闻添加</a>
									</td>
								</tr>
							</table>
							<br />
							
						</div>
					</c:if>
				</td>

				<td width="719" align="left" valign="top">
					<table width="719" height="31" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="98" height="31" align="center"
								background="images/titleabout.jpg" class="bold">
								新闻中心
							</td>
							<td width="556" background="images/titlebg.jpg">
								&nbsp;
							</td>
							<td width="65" align="center" background="images/titlebg.jpg">
								<a href="about.php"></a>
							</td>
						</tr>
					</table>


				 	<table width="95%" border="0" align="center" cellpadding="5"
						cellspacing="0" style="margin: 20px 0;">
                        <s:action name="blog!search" id="blogList" executeResult="false">
                            <s:param name="query.website">wxdayou</s:param>
                            <s:param name="query.order">addTime</s:param>
                            <s:param name="query.keyword">${param.keyword}</s:param>
                            <s:param name="query.desc">true</s:param>
                        </s:action>
                        <tr>
                            <td align="left" width="300px" white-space:nowrap>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新闻标题
                            </td>
                            <td align="left" valign="left" width="200px">
                                新闻内容
                            </td>
                            <td align="left" valign="middle" width="150px">
                                <c:if test="${pageContext.request.remoteUser != null}">
                                    操&nbsp;&nbsp;作
                                </c:if>
                            </td>
                            <td align="left" valign="middle" width="250px">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新闻发布时间
                            </td>
                        </tr>

						<s:iterator value="%{#blogList.blogs}" status="rowStatus">
							<tr>

                                <td align="left" valign="middle" width="400px"
                                    white-space:nowrap>
                                    <img src="images/small.jpg" border="0" />
                                    <a href="blog/view/${id}"> ${title}</a>
                                    <br />
                                </td>

                                <td align="left" valign="middle" width="120px">
                                    <font color="red"> <a href="blog/view/${id}"><span style="color:red;">点击进入查看</span></a></font>

                                    <br />
                                </td>

								<td align="left" valign="middle" width="120px">
									<c:if test="${pageContext.request.remoteUser != null}">
									
										<div>
											<a href="blog/view/${id}">详细</a>&nbsp;&nbsp;
											<a
												href="javascript:if(confirm('确定要删除吗？')){location.href='<c:url value='/blog!delete.html?id=${id}'/>'};">删除

											</a>
										</div>
									</c:if>
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
