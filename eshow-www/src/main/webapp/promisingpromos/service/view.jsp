<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<s:action name="info!browse" id="info" executeResult="false" namespace="">
	<s:param name="query.url">service-index</s:param>
	<s:param name="query.website">promisingpromos</s:param>
</s:action>
<head>
<title>${info.info.title }</title>
<meta name="keywords" content="${info.info.title}" />
<meta name="description" content="${info.info.title}" />
<link href="http://www.promisingpromos.com/styles/style.css" rel="stylesheet" />

</head>
<body>
	<c:set var="current">service</c:set>
	<section>
		<%@ include file="../common/header.jsp"%>
		<div class="w1000 pt10 clearfix">
			<%@ include file="../include/left.jsp"%>
			<div class="main fr">
				<div class="crumbnav yahei">
					<a href="http://www.promisingpromos.com/">Home</a> > <a
						href="http://www.promisingpromos.com/service/">${serviceview.info.title}</a>
				</div>
				<s:action name="service!view" id="view" executeResult="false" namespace=""/>
				<div class="text clearfix yahei">
					<div class="text-c">
						<p>
							${view.service.id}.&nbsp; <a
								href="http://www.promisingpromos.com/service/view/${view.service.id}">${view.service.title}</a>
						</p>
						${view.service.content}
					</div>
				</div>
			</div>
		</div>
        <%@ include file="../common/footer.jsp"%>
	</section>
</body>