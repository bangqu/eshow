    <%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@ page import="com.logo.eshow.components.ueditor.Uploader" %>
    <%@ page import="com.logo.eshow.components.upyun.UpYunConfig" %>

    <%
    request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
    Uploader up = new Uploader(request);
    String[] fileType = {".gif" , ".png" , ".jpg" , ".jpeg" , ".bmp"};
    up.setAllowFiles(fileType);
    up.setMaxSize(10000); //单位KB
    up.upload(UpYunConfig.BUCKET);
    up.setUrl(UpYunConfig.IMG + up.getUrl() + "!middle.jpg");
    up.setTitle(up.getTitle().replace("&", "&amp;").replace("'", "&qpos;").replace("\"", "&quot;").replace("<", "&lt;").replace(">", "&gt;"));
    response.getWriter().print("{'original':'"+up.getOriginalName()+"','url':'"+up.getUrl()+"','title':'"+up.getTitle()+"','state':'"+up.getState()+"'}");
    %>
