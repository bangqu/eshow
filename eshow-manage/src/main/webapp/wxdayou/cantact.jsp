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
		<meta name="description" content="日志" />
		<meta name="keywords" content="日志" />
		<title>联系我们</title>
	</head>
	<body>
    <%@ include file="common/header.jsp"%>
		<table width="980" height="417" border="0" align="center"
			cellpadding="0" cellspacing="0">
			<tr>
				<td width="261" height="208" align="left" valign="top"
					background="images/leftzbg.jpg">
					<table width="261" height="49" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td algin="left" style="padding: 15px;">
								<img src="images/1-cantact.jpg" width="218" height="74" />
							</td>
						</tr>
					</table>
					
				</td>
				<td width="719" align="left" valign="top">
					<table width="719" height="31" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="98" height="31" align="center"
								background="images/titleabout.jpg" class="bold">
								联系我们
							</td>
							<td width="556" background="images/titlebg.jpg">
								&nbsp;
							</td>
							<td width="65" align="center" background="images/titlebg.jpg">
								<a href="about.php"></a>
							</td>
						</tr>
					</table>
					<table width="100%" height="168" border="0" cellpadding="0"
						cellspacing="0" >
						<tr>
							<td align="left" valign="top" style="padding: 10px 5px;">

									<span class="STYLE3">地&nbsp;&nbsp;&nbsp;&nbsp;址：无锡市锡山区北环路118号东方钢材城二期三幢A121<br />
										联系人：李&nbsp;&nbsp;健  <br /> 手&nbsp;&nbsp;&nbsp;&nbsp;机：13771151511<br />
										电&nbsp;&nbsp;&nbsp;&nbsp;话：0510-88702451&nbsp;&nbsp;&nbsp;88202624&nbsp;&nbsp;&nbsp;82129191&nbsp;&nbsp;&nbsp;82136262&nbsp;&nbsp;&nbsp;82127518&nbsp;&nbsp;&nbsp;82127528 <br /> 
										传&nbsp;&nbsp;&nbsp;&nbsp;真：0510-88202614  88202624 <br />
										E-Mail：<email>wxdy.lj@163.com</email><br /> 网&nbsp;&nbsp;&nbsp;&nbsp;址：http://www.wxdayou.com</span>
								
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

        <%@ include file="common/footer.jsp"%>
	</body>
</html>
