<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<s:action name="category!view" id="view" executeResult="false" />
<head>
<title>${view.category.name}</title>
<meta name="keywords" content="${view.category.name}" />
<meta name="description" content="${view.category.name}" /> 
</head>
<body>

	<header id="header">
		<div class="hero-unit showcase">
			<div class="container">
				<h1 class="yahei">EShow平台友好开发计划</h1>
			</div>
		</div>
	</header>

	
	<div class="container">
		<div class="row">  
			<div class="span8">  
					<s:action name="blog!search" id="blogList" executeResult="false">
						<s:param name="queryBean.categoryId">${param.id}</s:param>
						<s:param name="queryBean.order">addTime</s:param>
						<s:param name="queryBean.desc">true</s:param>
						<s:param name="pagesize">5</s:param>
					</s:action>
					<s:iterator value="%{#blogList.blogs}" status="rowStatus">
					 
								<div class="post">
							<h3 class="yahei">
								<a href="<c:url value='/blog/view/${id}'/>">${title}</a>
							</h3>
							<ul class="post-meta clearfix">
								<li><i class="icon-calendar"></i> <a href=""><s:date
											name='%{addTime}' format='yyyy-MM-dd' />
								</a></li>
								<li><i class="icon-user"></i> <a href="">${user.username}</a>
								</li>
								<li><i class="icon-folder-close"></i> <a href="">${category.name}</a>
								</li>
							</ul>
							<div class="text">
								${util:preview(content,300)}&nbsp;&nbsp;&nbsp;&nbsp; <small
									style="color: #ffe69f"> <font color="#23a726"> <a
										href="<c:url value='/blog/view/${id}'/>" class="lnk1">阅读更多</a>
								</font> </small> <br />
							</div>
						</div>
					</s:iterator>
					<div style="text-align: center;">
						<%@ include file="/common/page.jsp"%>
					</div> 
			</div>
			<div class="span4" >
			<div class="sdbox">
				<h3 class="yahei">全部日志</h3>
				<ul class="cate">
					<s:action name="category!list" id="categoryList"
						executeResult="false">
					</s:action>
                    <s:iterator value="%{#categoryList.categories}" status="rowStatus">
                        <c:if test="${id == param.id}">
                            <li class="page_item page-item-654 active " >
                                <a href="<c:url value='/blog/category/${id}'/>" class="lnk1 page_item page-item-654  ">${name} </a>
                            </li>
                        </c:if>
                        <c:if test="${id != param.id}">
                            <li class="page_item page-item-654 ">
                                <a href="<c:url value='/blog/category/${id}'/>" class="lnk1 ">${name}</a>
                            </li>
                        </c:if>
                    </s:iterator>
				</ul>
				</div>
			</div>
 
		</div>
	</div>

 
</body>