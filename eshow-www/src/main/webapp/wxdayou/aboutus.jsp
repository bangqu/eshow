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
		<meta name="description" content="关于我们" />
		<meta name="keywords" content="关于我们" />
		<title>关于我们</title>
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
								<img src="images/leftab.jpg" width="218" height="74" />
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
								关于我们
							</td>
							<td width="556" background="images/titlebg.jpg">
								&nbsp;
							</td>
							<td width="65" align="center" background="images/titlebg.jpg">
								<a href="about.php"></a>
							</td>
						</tr>
					</table>
					<table width="100%" height="210" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td align="left" valign="top" style="padding: 20px;">
								<p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;无锡大铕不锈钢有限公司座落在被誉为华东最大的不锈钢集散地——无锡，座落于交通方便、风景秀丽的太湖之滨， 南方不锈钢市场地处无锡市312国道旁最大的广南立交桥旁，南靠无锡市高新技术开发区，西邻无锡市区，北至太湖大道，东接锡山开发区、沪宁高速公路，是无锡物流市场和不锈钢市场的中心区域，被业内人士称为“不锈钢价格的晴雨表” 。公司专业经营及加工各种不锈钢产品，是太钢不锈、宝钢不锈、张家港浦项、天津太钢天管、广州联众及酒钢不锈的代理商。 <br/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 公司自创以来始终贯彻“高速高效、务实发展；以客为本、服务优先”的经营理念和服务宗旨。在各界同仁和客户的关心、支持下，不断的稳步前进和成长，改善经营策略，引进和培养人才，现已发展为一个集不锈钢加工及销售为一体的综合性企业！<br/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;谁了解市场，洞察先机，果断决策，谁就能赢得市场。大铕不锈将矢志不渝地坚持以市场为导向，厚积薄发，精益求精。 <br/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 企业因客户而存在。只有实现了客户的利益，企业才能求得自身的发展。大铕不锈始终将客户利益摆在第一位，努力打造高品质产品，真诚对待客户，让客户百分百满意。卓越的品质与优质的服务是大铕人永远的承诺。
&nbsp;&nbsp;&nbsp;&nbsp;
									
								</p>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
    <%@ include file="common/footer.jsp"%>
	</body>
</html>
