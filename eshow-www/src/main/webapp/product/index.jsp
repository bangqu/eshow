<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<s:action name="product!view" id="productList" executeResult="false" />
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<head>
	<title>商品</title>
	<meta name="keywords" content="商品" />
	<meta name="description" content="商品" />
</head>
<body>

	<header id="header">
		<div class="hero-unit showcase">
			<div class="container">
				<h1 class="yahei">商品</h1>
			</div>
		</div>
	</header>

<div class="container">


		<ul class="thumbnails ">
            <s:action name="product!search" id="productList" executeResult="false" namespace="">
                <s:param name="query.order">addTime</s:param>
                <s:param name="query.desc">true</s:param>
                <s:param name="query.website">eshow</s:param>
            </s:action>
            <s:iterator value="%{#productList.products}" status="rowStatus">
                <li class="span3">
                    <div class="thumbnail">
                        <a href=""><img src="${img}"  width="250" height="200"></a>
                        <div class="caption">
                            <h3><a href="<c:url value='/product/view?id=${id}'/>">${name}</a></h3>
                            <p>${code}-${price}</p>
                        </div>
                    </div>
                </li>
            </s:iterator>
              	</ul>

             <div class="pagination pagination-centered clearfix">
              <ul>
                <li class="disabled"><a href="#">«</a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">»</a></li>
             </ul>
            </div>
</div>
</body>