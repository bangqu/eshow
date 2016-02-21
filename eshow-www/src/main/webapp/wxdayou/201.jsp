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
								201
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
										src="<c:url value='images/201.jpg'/>" width="250" border="0"
										name="p2_r6_c4" />
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp; 国内市场“201”名义销售的产品，基本上都是J4。
									最近，在市场上采购了国内最大的五个生产“200”系列不锈钢企业生产的以“201”名义销售板材的样品，送到钢铁研究总院进行化学成分检验和点蚀性能检验，并与宝钢、太钢生产的409L、Cr13、439L、304进行了对比。结果显示，在国内市场上销售的所有这些对外声称为“201”的产品，他们的成分都不符合国家或国际201的标准，Cr含量国家和国际标准是16%～18%，这些企业产品含量都不到15%；镍含量国家和国际标准是3.5%～5.5%，这些企业产品只有一家达到1.01%，其他含量都不到1%。他们的成分与印度金达来的J4成分基本相同。通过在中性氯化物(3.5%NaCl溶液)中的耐点蚀性能检验，这五个企业产品的耐点蚀性能远远低于304和439L,也全部低于Cr13,仅仅与409
									L基本相当（详细资料见下表）。 根据以上资料，我们可以得出以下结论：<br />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1、目前市场上以“201”名义销售的产品，不是符合国家和国际标准的201，其实是J4。<br />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、他们的耐点蚀性能仅仅相当于409L。<br />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、前一阶段市场上以“201”名义销售的产品价格为每吨16500元（2B2mm），而409L为12200元。购买性能基本相当的409L，用户每吨可节省4300元。<br />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4、与409L相比，这些产品多用了宝贵的镍、铬、铜和锰等合金材料，扣除比409L少用的铌、钛等，每吨多用合金材料价值为4511元（以9月25日合金市场价计算）。<br />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5、根据国际不锈钢论坛提供的资料，409、410是用来代替碳钢的材料（见下图），也就是说，它的耐蚀性能仅比碳钢高。换言之，目前市场上以“201”名义销售的产品耐蚀性仅仅比碳钢高一些。<br />
									表：各厂带钢的化学成分和在中性氯化物(3.5%NaCl溶液)中的耐点蚀性.

									<br />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									3.0*1500*6000/C 4.0*1500*6000/C 5.0*1500*6000/C 6.0*1500*6000/C
									<br />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									5.0*1500*6000/C 6.0*1500*6000/C 8.0*1500*6000/C 10*1500*6000/C
									<br />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

									12*1500*6000/C 14*1500*6000/C 4.0*1800*6000/C 5.0*1800*6000/C
									<br />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									6.0*1800*6000/C 8.0*1800*6000/C 10*1800*6000/C 12*1800*6000/C
									<br />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									14*1800*6000/C 5.0*2000*6000/C 6.0*2000*6000/C 8.0*2000*6000/C
									<br />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
