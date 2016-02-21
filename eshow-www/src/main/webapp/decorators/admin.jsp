<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="" />
<link rel="stylesheet" href="http://cdn.amazeui.org/amazeui/2.1.0/css/amazeui.min.css"/>
<link rel="stylesheet" href="${ctx}/admin/styles/admin.css">
    <title><decorator:title />_eshow后台管理系统</title>
<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>

<script src="${ctx}/admin/scripts/amazeui.min.js"></script> 
<decorator:head />
</head>
<body
	<decorator:getProperty property="body.id" writeEntireProperty="true"/>
	<decorator:getProperty property="body.class" writeEntireProperty="true"/>>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand">
    <strong>ESHOW</strong> <small><a href="${ctx}/admin/index">网站管理平台</a></small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li><a href="javascript:;"><span class="am-icon-envelope-o"></span> 收件箱 <span class="am-badge am-badge-warning">5</span></a></li>
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span> <security:authentication
							property="principal.nickname" /> <span class="am-icon-caret-down"></span>
        </a>
        <ul class="am-dropdown-content">
          <li><a href="#"><span class="am-icon-user"></span> 资料</a></li>
          <li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
          <li><a href="${ctx}/user/logout"><span class="am-icon-power-off"></span> 退出</a></li>
        </ul>
      </li>
    
    </ul>
  </div>
</header>
	<decorator:body />
</body>
</html>
