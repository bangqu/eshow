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
								310s
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
										src="<c:url value='images/others.jpg'/>" width="250" border="0"
										name="p2_r6_c4" />
								</td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;
									我公司经销太钢,大庚,宝钢，张浦，宝新，酒钢进口不锈钢板, 在华东地区有很广的客户销售网络！！。<br/>

									保质保量!!还可根据用户的要求将卷板纵剪分条剪切成不同规格的钢带、钢板、钢管、型材等；可订特殊材质、特殊规格

									的各类优钢！一手资源保障服务和价格的竞争力。以宽广的进货渠道和优质的服务赢得市场认同。现货资源价格优惠，期

									货资源合作多样。因市场波动较大，请以当日业务员报价为准！不锈钢板及耐蚀耐高温合金钢规格齐全,品种繁多,欢迎广大用户光临惠顾!!
									<br />
									
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
