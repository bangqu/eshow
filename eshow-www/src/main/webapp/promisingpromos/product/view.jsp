<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<s:action name="product!view" id="view" executeResult="false" namespace="" />
<head>
<title>Promisingpromos_${view.product.name}</title>
<meta name="keywords" content="${view.product.name}" />
<meta name="description" content="${view.product.name}" />
    <link href="${promisingpromos}/styles/style.css" rel="stylesheet" />
<%@ include file="/common/style/fancybox.jsp"%>
<%@ include file="/common/script/fancybox.jsp"%>
<script type="text/javascript">
    $(document).ready(function() {
        $(".fancybox").fancybox({
            openEffect	: 'none',
            closeEffect	: 'none'
        });
    });
</script>
</head>
<body>
	<section>
		<c:set var="current">product</c:set>
		<%@ include file="../common/header.jsp"%>
		<div class="w1000 pt10 clearfix">
			<%@ include file="../include/left.jsp"%>
			<div class="main fr">
				<div class="crumbnav yahei">
					<a href="http://www.promisingpromos.com/">Home</a> > 
					<a href="http://www.promisingpromos.com/product/">Products</a> > 
					<a href="http://www.promisingpromos.com/product/category/${view.product.productCategory.id}">${view.product.productCategory.name}</a> > 
					<a href="http://www.promisingpromos.com/product/view/${view.product.id}">${view.product.name}</a>
				</div>
				<div class="view clearfix yahei">
					<div class="v-pic fl">
						<a class="fancybox" href="${view.product.img}!big.jpg"><img src="${view.product.img}!middle.jpg"></a>
					</div>
					<div class="v-unit fr yahei">
						<ul class="clearfix">
							<li><a href="javascript:window.print();" style="color:#fff">PRINT SPECS</a></li>
							<li><a href="mailto:csr@promisingpromos.com?subject=inquiry for ${view.product.name}&body=<p>Hi CSR,</p><p><br /></p><p>I'm looking to get a quote. </p><p><br /></p><p><strong>Contact Name:</strong></p><p><strong>Company Name:</strong></p><p>    <strong>Phone Number:</strong></p><p><strong>Fax Number:</strong></p><p><strong>Email Address:</strong></p><p><br /></p><p><strong>Product #:</strong></p><p><strong>Product Name:</strong></p><p><strong>Quantity:</strong></p><p><strong> Imprint Info:</strong></p><p><br /></p><p><strong>Desired In-Hands Date</strong>: </p><p><strong>Shipping City or Zip Code:</strong></p><p><strong>Other Details or Any Special Requirements:</strong></p>" style="color:#fff">BUY OR GET A QUOTE</a></li>
						</ul>
						<!--div class="pcs">
							<a href="javascript:;">CODE : ${view.product.code }</a> <a href="javascript:;">As low as : ${view.product.price}$</a>
						</div-->
					</div>
				</div>
				<div class="v-info yahei">
					<div class="v-info-title">${view.product.name } (${view.product.code })</div>
					<div>${view.product.content }</div>
				</dl>
                    </div>
			</div>
		</div>
             <%@ include file="../common/footer.jsp"%>
	</section>
</body>