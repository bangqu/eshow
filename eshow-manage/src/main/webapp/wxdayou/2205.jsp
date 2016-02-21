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
		<title>品牌代理</title>
	</head>
	<body>
    <%@ include file="common/header.jsp" %>
		<table width="980" height="417" border="0" align="center"
			cellpadding="0" cellspacing="0">
			<tr>
				<td width="261" height="208" align="left" valign="top"
					background="images/leftzbg.jpg">
					<table width="261" height="49" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td algin="left" style="padding: 15px;">
								<img src="images/four.jpg" width="218" height="74" />
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
								2205
							</td>
							<td width="556" background="images/titlebg.jpg">
								&nbsp;
							</td>
							<td width="65" align="center" background="images/titlebg.jpg">
								<a href="about.php"></a>
							</td>
						</tr>
					</table>
					<br />

					<table cellspacing="0" cellpadding="0" width="90%" align="center"
						border="0">
						<tbody>
							<tr>


								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

									
									<img id="p2_r6_c4" height="230" alt=""
										src="<c:url value='images/2205.jpg'/>" width="250" border="0"
										name="p2_r6_c4" />
								</td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;
									我公司经销太钢,大庚,宝钢，张浦，宝新，酒钢进口不锈钢板, 在华东地区有很广的客户销售网络！！<br/>
									2205型  比304型和316型优越，因为他对氯化物应力腐蚀裂纹具有高的抵抗力，并具有大约两倍的强度。(自：我要不锈

钢网)
									<br />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									3.0*1500*6000/C 4.0*1500*6000/C 5.0*1500*6000/C 6.0*1500*6000/C
									<br />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									5.0*1500*6000/C 6.0*1500*6000/C 8.0*1500*6000/C 10*1500*6000/C
									<br />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									12*1500*6000/C 14*1500*6000/C 4.0*1800*6000/C 5.0*1800*6000/C
									<br />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									6.0*1800*6000/C 8.0*1800*6000/C 10*1800*6000/C 12*1800*6000/C
									<br />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									14*1800*6000/C 5.0*2000*6000/C 6.0*2000*6000/C 8.0*2000*6000/C
									<br />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									10*2000*6000/C 12*2000*6000/C 14*2000*6000/C

								</td>
							</tr>
						</tbody>
					</table>

				</td>
			</tr>
		</table>
    <%@ include file="common/footer.jsp" %>
	</body>
</html>
