<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="../common/path.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<head>
<title>Promisingpromos_Products</title>
<meta name="keywords" content="Products" />
<meta name="description" content="Products" />
    <link href="${promisingpromos}/styles/style.css" rel="stylesheet" />
</head>
<body>
	<section>
		<c:set var="current">product</c:set>
		<%@ include file="../common/header.jsp"%>
		<div class="w1000 pt10 clearfix">
			<%@ include file="../include/left.jsp"%>
			<div class="main fr">
				<div class="crumbnav yahei">
					<a href="http://www.promisingpromos.com/">Home</a> > <a href="http://www.promisingpromos.com/product/">Products</a>
				</div>
				<s:action name="product!search" id="products" executeResult="false" namespace="">
					<c:if test="${param.keyword != null}"><s:param name="query.name">${param.keyword}</s:param></c:if>
					<s:param name="query.website">promisingpromos</s:param>
					<s:param name="query.enabled">true</s:param>
					<s:param name="query.pagesize">20</s:param>
					<s:param name="query.order">addTime</s:param>
					<s:param name="query.desc">true</s:param>
				</s:action>
				<ul class="product clearfix yahei">
					<s:iterator value="%{#products.products}" status="rowStatus" var="product">
						<li>
							<a href="http://www.promisingpromos.com/product/view/${id}"> <img src="${product.img}!small.jpg" title="${name}"/>
								<p>
									<span class="name str">${util:preview(name,15)}</span><br> Item# ${code}<br>
									As low as <span class="price str">$${price}</span>
								</p>
							</a>
						</li>
					</s:iterator>
				</ul>
				<%@ include file="/common/page.jsp"%>
			</div>
		</div>
        <%@ include file="../common/footer.jsp"%>
	</section>

</body>