<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="../common/path.jsp"%>
<s:action name="info!browse" id="view" executeResult="false" namespace="">
	<s:param name="query.url">service</s:param>
	<s:param name="query.website">promisingpromos</s:param>
</s:action>
<head>
<title>Promisingpromos_Service</title>
<meta name="keywords" content="service" />
<meta name="description" content="service" />
    <link href="${promisingpromos}/styles/style.css" rel="stylesheet" />
</head>
<body>
	<section>
        <c:set var="current">about</c:set>
        <%@ include file="../common/header.jsp"%>
        <div class="w1000 pt10 clearfix">
            <%@ include file="../include/left.jsp"%>
            <div class="main fr">
                <div class="crumbnav yahei">
                    <a href="http://www.promisingpromos.com/">Home</a> > <a href="http://www.promisingpromos.com/service">Service</a>
                </div>
                                <s:action name="info!search" id="infos" executeResult="false" namespace="">
                                <s:param name="query.url">service</s:param>
                                <s:param name="query.website">promisingpromos</s:param>

                                </s:action>
                                <ul class="text clearfix yahei">
                                    <s:iterator value="%{#infos.infos}" status="rowStatus" var="product">
                                        <li>
                                            <h1>${title}</h1>
                                             ${content}
                                        </li>
                                    </s:iterator>
                                </ul>
					</div>
				</div>
			</div>
		</div>
        <%@ include file="../common/footer.jsp"%>
	</section>
</body>