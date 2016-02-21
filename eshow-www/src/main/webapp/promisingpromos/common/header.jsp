<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div class="header">
    <div class="top clearfix">
        <div class="logo fl">
          <a href="http://www.promisingpromos.com/"><img src="http://www.promisingpromos.com/images/logo.png"/></a>
        </div>
        <div class="info yahei fr gray">
          For more information call <span>954-394-0535</span><br>
           or email <span><a href="mailto:csr@promisingpromos.com?subject=inquiry for product &body=<p>Hi CSR,</p><p><br /></p><p>I'm looking to get a quote. </p><p><br /></p><p><strong>Contact Name:</strong></p><p><strong>Company Name:</strong></p><p>    <strong>Phone Number:</strong></p><p><strong>Fax Number:</strong></p><p><strong>Email Address:</strong></p><p><br /></p><p><strong>Product #:</strong></p><p><strong>Product Name:</strong></p><p><strong>Quantity:</strong></p><p><strong> Imprint Info:</strong></p><p><br /></p><p><strong>Desired In-Hands Date</strong>: </p><p><strong>Shipping City or Zip Code:</strong></p><p><strong>Other Details or Any Special Requirements:</strong></p>">csr@promisingpromos.com</a></span>
        </div>
    </div>
    <div class="navbox yahei"> 
      <div class="nav fl">
        <a href="${promisingpromos}/"  <c:if test="${current=='index'}">class="active"</c:if>>HOME</a>
        <a href="${promisingpromos}/product/"  <c:if test="${current=='product'}">class="active"</c:if>>PRODUCTS</a>
        <a href="${promisingpromos}/service/"  <c:if test="${current=='service'}">class="active"</c:if>>SERVICES</a>
        <a href="${promisingpromos}/support"  <c:if test="${current=='support'}">class="active"</c:if>>SUPPORT</a>
        <a href="${promisingpromos}/about"  <c:if test="${current=='about'}">class="active"</c:if>>ABOUT US</a>
        <a href="${promisingpromos}/contact"  <c:if test="${current=='contact'}">class="active"</c:if>>CONTACT US</a>
      </div>
      <div class="search fr">
 			<form id="searchForm" name="searchForm" action="http://www.promisingpromos.com/product/"
 				method="get" class="navbar-form pull-left">
 				<input type="text" class="fl s_input" hidefocus name="keyword"
 					placeholder="Product"
 					x-webkit-speech x-webkit-grammar="builtin:translate" value="${param.keyword}">
 				<button value="Search">Search</button>
 			</form>
		</div>
    </div>
 </div>
