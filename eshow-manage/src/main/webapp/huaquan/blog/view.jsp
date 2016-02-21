<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<%@ include file="../common/path.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<s:action name="blog!view" id="view" executeResult="false"></s:action>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>${view.blog.title}</title>
		<meta name="keywords" content="${view.blog.title}" />
		<meta name="description" content="${view.blog.title}" />
        <link rel="stylesheet" href="../styles/style.css"
              type="text/css" />
	</head>
	<body>
    <%@ include file="../header.jsp" %>
     <div id="main">
		<div id="content">
			<div id="postpath">
				<strong>当前页面：<a href="<c:url value='${huaquan}/index.jsp'/>" title="首页">首页</a>
					&raquo; ${view.blog.title}</strong>
			</div>

			<div id="post-80" class="page">
				<div class="entry-content">
					${view.blog.content}
				</div>
			</div>
			<!-- .post -->

		</div>
		<!-- #content -->

		<div id="sidebar">

			<div class="sidebar_li">
                    <div class="sidebar_li">
                        <ul>
                            <li class="page_item">
                                <a href="${huaquan}/blog/categories/8" title="公司新闻">公司新闻</a>
                            </li>
                            <li class="page_item">
                                <a href="${huaquan}/blog/categories/9" title="行业新闻">行业新闻</a>
                            </li>
                            <li class="page_item">
                                <a href="${huaquan}/blog/categories/10" title="报价中心">报价中心</a>
                            </li>
                        </ul>
                    </div>
			</div>
		</div>
         <%@ include file="../footer.jsp" %>
      </div>

	</body>
</html>