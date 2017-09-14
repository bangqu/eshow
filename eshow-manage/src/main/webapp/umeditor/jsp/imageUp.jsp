<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="cn.org.eshow.component.qiniu.QiniuConfig" %>
<%@ page import="cn.org.eshow.component.umeditor.Uploader" %>

<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    Uploader up = new Uploader(request);
    up.setSavePath("");
    String[] fileType = {".gif", ".png", ".jpg", ".jpeg", ".bmp"};
    up.setAllowFiles(fileType);
    up.setMaxSize(10000); //单位KB
    up.upload(QiniuConfig.BUCKET);
    up.setUrl(QiniuConfig.URL + "/" + up.getUrl() + "!middle.jpg");
    up.setTitle(up.getTitle().replace("&", "&amp;").replace("'", "&qpos;").replace("\"", "&quot;").replace("<", "&lt;").replace(">", "&gt;"));

    String callback = request.getParameter("callback");

    String result = "{\"name\":\"" + up.getFileName() + "\", \"originalName\": \"" + up.getOriginalName() + "\", \"size\": " + up.getSize() + ", \"state\": \"" + up.getState() + "\", \"type\": \"" + up.getType() + "\", \"url\": \"" + up.getUrl() + "\"}";

    result = result.replaceAll("\\\\", "\\\\");

    String type = request.getParameter("type");
    String editorId = request.getParameter("editorid");

    if (callback == null) {
        response.getWriter().print(result);
    } else {
        response.getWriter().print("<script>parent.UM.getEditor('" + editorId + "').getWidgetCallback('image')('" + up.getUrl().replace("!icon.jpg", "") + "','" + up.getState() + "')</script>");
    }
%>
