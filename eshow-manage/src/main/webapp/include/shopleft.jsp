<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/website.jsp" %>


<div class="home_sider fl">

    <ul class="tab_menus" id="sidenav">
        <li class="tab_up clearfix">
            <ul class="hover_li ">
                <li class="fl">
                    <i class="iconfont icon-icon03"></i>
                    <span href="javascript:;">订单概况</span>
                </li>
            </ul>
            <ul class="tab_down tab_down_show">
                <a href="${ctx}/shoporder/index">
                    <li class="active">
                        <span>订单概况</span>
                    </li>
                </a>
            </ul>
        </li>

        <li class="tab_up clearfix">
            <ul class="hover_li">
                <li class="fl">
                    <i class="iconfont icon-log"></i>
                    <span>订单管理</span>
                </li>
                <li class="fr">
                    <i class="iconfont icon-jiantou ar_start on"></i>
                    <i class="iconfont icon-jiantou-copy ar_end"></i>
                </li>
            </ul>
            <ul class="tab_down clear">
                <a href="${ctx}/shoporder/view">
                <li>
                    <span>实物商品订单</span>
                </li>
                </a>
                <a href="${ctx}/shoporder/bill/index">
                <li>
                    <span>虚拟商品订单</span>
                </li>
                </a>
                <a href="${ctx}/shoporder/bill/index">
                    <li>
                        <span>服务订单</span>
                    </li>
                </a>
                <a href="${ctx}/shoporder/bill/index">
                    <li>
                        <span>线下订单</span>
                    </li>
                </a>
                <a href="${ctx}/shoporder/bill/index">
                    <li>
                        <span>采购订单</span>
                    </li>
                </a>
                <a href="${ctx}/shoporder/bill/index">
                    <li>
                        <span>充值订单</span>
                    </li>
                </a>
            </ul>
        </li>

    </ul>
</div>
