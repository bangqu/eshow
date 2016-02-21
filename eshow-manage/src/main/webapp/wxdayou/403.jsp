<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
 contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<page:applyDecorator name="default">

 <head>
  <title><fmt:message key="403.title" /></title>
  <meta name="heading" content="<fmt:message key='403.title'/>" />
 </head>
 <body id="404" >

    </body>
  <div id="middle">
   <div id="main">
    <div id="layoutmid">

     <p>
      <fmt:message key="403.message">
       <fmt:param>
        <c:url value="/" />
       </fmt:param>
      </fmt:message>
     </p>
     <p style="text-align: center; margin-top: 20px">
      <a href="search!search.html?q=美女" title="搜索美女"> <img
        src="images/403.jpg" alt="更多美女赶快搜索美女群组哈" /> </a>
     </p>
    </div>
   </div>
  </div>
</page:applyDecorator>