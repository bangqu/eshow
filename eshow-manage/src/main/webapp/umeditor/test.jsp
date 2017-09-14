<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>上传图片测试</title>
</head>
<body>

<div>
    <input type="text" id="editor" name="content" placeholder="">
</div>

<%@ include file="/common/scripts.jsp" %>
<%@ include file="/common/script/umeditor.jsp" %>

<script type="text/javascript">
    getUMEditor("editor");
</script>

</body>

