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
								品牌代理
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
								<td colspan="3">
									<font color="red">产品介绍:</font>
								</td>
							</tr>
							<tr>
								<td>
									<a href="201.jsp"><img id="p2_r6_c4" height="131" alt=""
											src="<c:url value='images/201.jpg'/>" width="140" border="0"
											name="p2_r6_c4" /> </a>
								</td>
								<td>
									<a href="202.jsp"><img id="p2_r6_c8" height="131" alt=""
											src="images/202.jpg" width="140" border="0" name="p2_r6_c8" />
									</a>
								</td>
								<td>
									<a href="304.jsp"><img id="p2_r6_c12" height="131" alt=""
											src="images/304.gif" width="140" border="0" name="p2_r6_c12" />
									</a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="201.jsp">201</a>
								</td>
								<td>
									<a href="202s.jsp">202</a>
								</td>
								<td>
									<a href="304.jsp">304</a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="316l.jsp"><img id="p2_r6_c4" height="131" alt=""
											src="<c:url value='images/316l.jpg'/>" width="140" border="0"
											name="p2_r6_c4" /> </a>
								</td>
								<td>
									<a href="321.jsp"><img id="p2_r6_c8" height="131" alt=""
											src="images/321.gif" width="140" border="0" name="p2_r6_c8" />
									</a>
								</td>
								<td>
									<a href="309s.jsp"><img id="p2_r6_c12" height="131" alt=""
											src="images/309s.jpg" width="140" border="0" name="p2_r6_c12" />
									</a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="316l.jsp">316l</a>
								</td>
								<td>
									<a href="312.jsp">321</a>
								</td>
								<td>
									<a href="309s.jsp">309s</a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="310s.jsp"> <img id="p2_r6_c4" height="131" alt=""
											src="<c:url value='images/310S.gif'/>" width="140" border="0"
											name="p2_r6_c4" /> </a>
								</td>
								<td>
									<a href="430.jsp"><img id="p2_r6_c8" height="131" alt=""
											src="images/430.jpg" width="140" border="0" name="p2_r6_c8" />
									</a>
								</td>
								<td>
									<a href="2205.jsp"><img id="p2_r6_c12" height="131" alt=""
											src="images/2205.jpg" width="140" border="0" name="p2_r6_c12" />
									</a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="310s.jsp">310s</a>
								</td>
								<td>
									<a href="430.jsp">430</a>
								</td>
								<td>
									<a href="2205.jsp">2205</a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="904l.jsp"><img id="p2_r6_c4" height="131" alt=""
											src="<c:url value='images/904l.jpg'/>" width="140" border="0"
											name="p2_r6_c4" /> </a>
								</td>
								<td>
									<a href="others.jsp"><img id="p2_r6_c8" height="131" alt=""
											src="images/others.jpg" width="140" border="0"
											name="p2_r6_c8" /> </a>
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td>
									<a href="904l.jsp">904L</a>
								</td>
								<td>
									<a href="others.jsp">特殊钢</a>
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
						</tbody>
					</table>
					<br />
					<br />
					<br />
					<table cellspacing="0" cellpadding="0" width="90%" align="center"
						border="0">
						<tbody>
							<tr>
								<td colspan="3">
									<font color="red">合作伙伴:</font>
								</td>
							</tr>
							<tr>
								<td>
									<img id="p2_r6_c4" height="44" alt="" src="images/1-1.jpg"
										width="204" border="0" name="p2_r6_c4" />
								</td>
								<td>
									<a href="http://www.baosteel.com/group/index.asp"><img
											id="p2_r6_c8" height="44" alt="" src="images/1-2.jpg"
											width="204" border="0" name="p2_r6_c8" /> </a>
								</td>
								<td>
									<img id="p2_r6_c12" height="44" alt="" src="images/1-3.jpg"
										width="204" border="0" name="p2_r6_c12" />
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td>
									<a href="http://www.zpss.com/"><img id="p2_r8_c4"
											height="44" alt="" src="images/1-4.jpg" width="204"
											border="0" name="p2_r8_c4" /> </a>
								</td>
								<td>
									<a href="http://ksdgbxg.cn.china.cn/"> <img id="p2_r8_c8"
											height="44" alt="" src="images/1-5.jpg" width="204"
											border="0" name="p2_r8_c8" /> </a>
								</td>
								<td>
									<a
										href="http://www.jiaoyitong.com/sales/20081009/1223565797_921328675.htm"><img
											id="p2_r8_c12" height="44" alt="" src="images/1-6.jpg"
											width="204" border="0" name="p2_r8_c12" /> </a>
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td>
									<img id="p2_r10_c4" height="44" alt="" src="images/1-7.jpg"
										width="204" border="0" name="p2_r10_c4" />
								</td>
								<td>
									<img id="p2_r10_c8" height="44" alt="" src="images/1-8.jpg"
										width="204" border="0" name="p2_r10_c8" />
								</td>
								<td>
									<img id="p2_r10_c12" height="44" alt="" src="images/1-9.jpg"
										width="204" border="0" name="p2_r10_c12" />
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td>
									<img id="p2_r12_c4" height="44" alt="" src="images/1-10.jpg"
										width="204" border="0" name="p2_r12_c4" />
								</td>
								<td>
									<a href="http://www.gze.cn/hmpg_JMMPRPGRNPKON8.html"><img
											id="p2_r12_c4" height="44" alt="" src="images/pr1.jpg"
											width="204" border="0" name="p2_r12_c4" /> </a>
								</td>
								<td>
									<a href="http://www.gze.cn/hmpg_JMMPRPGRNPKON8.html"><img
											id="p2_r12_c4" height="44" alt="" src="images/pr5.jpg"
											width="204" border="0" name="p2_r12_c4" />
									</a>
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td>
									<a href="http://www.skschina.com/"><img id="p2_r12_c4"
											height="44" alt="" src="images/pr2.jpg" width="204"
											border="0" name="p2_r12_c4" /> </a>
								</td>
								<td>
									<a href="http://www.baoxins.com/baoxins/index.jsp"><img
											id="p2_r12_c4" height="44" alt="" src="images/pr3.jpg"
											width="204" border="0" name="p2_r12_c4" /> </a>
								</td>
								<td>
									<a href="http://www.baosteel.com/group/index.asp"><img
											id="p2_r12_c4" height="44" alt="" src="images/pr4.jpg"
											width="204" border="0" name="p2_r12_c4" /> </a>
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
							</tr>

						</tbody>
					</table>
				</td>
			</tr>
		</table>
        <%@ include file="common/footer.jsp"%>
	</body>
</html>
