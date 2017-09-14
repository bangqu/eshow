<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/website.jsp" %>


<div id="wrapper">
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="active">
                    <a href="index.html">
                        <i class="fa fa-th-large"></i>
                        <span class="nav-label">基础风格</span>
                        <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li class="active"><a href="${ctx}/blog/index">列表</a></li>
                        <li><a href="${ctx}/blog/add">表单</a></li>
                        <li><a href="dashboard_3.html">详情</a></li>
                    </ul>
                </li>
                <li>
                    <a href="layouts.html"><i class="fa fa-diamond"></i> <span class="nav-label">图标库</span></a>
                </li>

            </ul>

        </div>
    </nav>