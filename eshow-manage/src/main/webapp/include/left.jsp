<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/website.jsp" %>


<div class="home_sider fl">

    <ul class="tab_menus" id="sidenav">
        <li class="tab_up clearfix">
            <ul class="hover_li on">
                <li class="fl">
                    <i class="iconfont icon-icon03"></i>
                    <span href="javascript:;">话题管理</span>
                </li>
                <li class="fr">
                    <i class="iconfont icon-jiantou ar_start on"></i>
                    <i class="iconfont icon-jiantou-copy ar_end"></i>
                </li>
            </ul>
            <ul class="tab_down tab_down_show">
                <a href="${ctx}/">
                <li class="active">
                    <span>话题统计</span>
                </li>
                </a>
                <a href="${ctx}/board/">
                <li>
                    <span>话题分类</span>
                </li>
                </a>
                <a href="${ctx}/topic/">
                <li>
                    <span>话题列表</span>
                </li>
                </a>
            </ul>
        </li>

        <li class="tab_up clearfix">
            <ul class="hover_li">
                <li class="fl">
                    <i class="iconfont icon-log"></i>
                    <span>日志管理</span>
                </li>
                <li class="fr">
                    <i class="iconfont icon-jiantou ar_start on"></i>
                    <i class="iconfont icon-jiantou-copy ar_end"></i>
                </li>
            </ul>
            <ul class="tab_down">
                <a href="${ctx}/category/">
                <li>
                    <span>日志分类</span>
                </li>
                </a>
                <a href="${ctx}/blog/">
                <li>
                    <span>日志列表</span>
                </li>
                </a>
            </ul>
        </li>
        <li class="tab_up clearfix">
            <ul class="hover_li">
                <li class="fl">
                    <i class="iconfont icon-iconfontphoto"></i>
                    <span>相册管理</span>
                </li>
                <li class="fr">
                    <i class="iconfont icon-jiantou ar_start on"></i>
                    <i class="iconfont icon-jiantou-copy ar_end"></i>
                </li>
            </ul>
            <ul class="tab_down">
                <a href="${ctx}/album/">
                <li>
                    <span>相册列表</span>
                </li>
                </a>
            </ul>
        </li>
        <li class="tab_up clearfix">
            <ul class="hover_li">
                <li class="fl">
                    <i class="iconfont icon-iconfontdingdan"></i>
                    <span>订单管理</span>
                </li>
                <li class="fr">
                    <i class="iconfont icon-jiantou ar_start on"></i>
                    <i class="iconfont icon-jiantou-copy ar_end"></i>
                </li>
            </ul>
            <ul class="tab_down">
                <a href="${ctx}/order/">
                <li>
                    <span>订单列表</span>
                </li>
                </a>
            </ul>
        </li>
        <li class="tab_up clearfix">
            <ul class="hover_li">
                <li class="fl">
                    <i class="iconfont icon-yonghuzhanghuguanli"></i>
                    <span>用户管理</span>
                </li>
                <li class="fr">
                    <i class="iconfont icon-jiantou ar_start on"></i>
                    <i class="iconfont icon-jiantou-copy ar_end"></i>
                </li>
            </ul>
            <ul class="tab_down">
                <a href="${ctx}/user/">
                <li>
                    <span>用户列表</span>
                </li>
                </a>
            </ul>
        </li>
        <li class="tab_up clearfix">
            <ul class="hover_li">
                <li class="fl">
                    <i class="iconfont icon-chanpin"></i>
                    <span href="javascript:;">产品管理</span>
                </li>
                <li class="fr">
                    <i class="iconfont icon-jiantou ar_start on"></i>
                    <i class="iconfont icon-jiantou-copy ar_end"></i>
                </li>
            </ul>
            <ul class="tab_down">
                <a href="${ctx}/productCategory/">
                <li>
                    <span>产品分类</span>
                </li>
                </a>
                <a href="${ctx}/product/">
                <li>
                    <span>产品列表</span>
                </li>
                </a>

            </ul>
        </li>
        <li class="tab_up clearfix">
            <ul class="hover_li">
                <li class="fl">
                    <i class="iconfont  icon-iconsinfor"></i>
                    <span href="javascript:;">网站信息</span>
                </li>
                <li class="fr">
                    <i class="iconfont icon-jiantou ar_start on"></i>
                    <i class="iconfont icon-jiantou-copy ar_end"></i>
                </li>
            </ul>
            <ul class="tab_down">
                <a href="${ctx}/info/">
                <li>
                    <span>信息页列表</span>
                </li>
                </a>
            </ul>
        </li>
    </ul>
</div>
