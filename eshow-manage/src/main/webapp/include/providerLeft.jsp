<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/website.jsp" %>


<div class="home_sider fl">

    <ul class="tab_menus" id="sidenav">
        <li class="tab_up clearfix">
            <ul class="hover_li">
                <li class="fl">
                    <i class="iconfont icon-log"></i>
                    <span>供应商管理</span>
                </li>
                <li class="fr">
                    <i class="iconfont icon-jiantou ar_start on"></i>
                    <i class="iconfont icon-jiantou-copy ar_end"></i>
                </li>
            </ul>
            <ul class="tab_down clear">
                <a href="${ctx}/provider/index">
                <li>
                    <span>供应商列表</span>
                </li>
                </a>
                <a href="${ctx}/provider/view">
                    <li>
                        <span>供应商详情</span>
                    </li>
                </a>
                <a href="${ctx}/provider/add">
                <li>
                    <span>添加供应商</span>
                </li>
                </a>
            </ul>
        </li>


        <li class="tab_up clearfix">
            <ul class="hover_li">
                <li class="fl">
                    <i class="iconfont icon-log"></i>
                    <span>商品管理</span>
                </li>
                <li class="fr">
                    <i class="iconfont icon-jiantou ar_start on"></i>
                    <i class="iconfont icon-jiantou-copy ar_end"></i>
                </li>
            </ul>
            <ul class="tab_down clear">
                <a href="${ctx}/provider/product">
                    <li>
                        <span>商品列表</span>
                    </li>
                </a>
                <a href="${ctx}/provider/productView">
                    <li>
                        <span>商品详情</span>
                    </li>
                </a>
                <a href="${ctx}/provider/productAdd">
                    <li>
                        <span>添加或编辑商品</span>
                    </li>
                </a>
                <a href="${ctx}/provider/category">
                    <li>
                        <span>商品分类</span>
                    </li>
                </a>

            </ul>
        </li>

    </ul>
</div>
