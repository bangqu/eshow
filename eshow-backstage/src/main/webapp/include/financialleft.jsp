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
                    <span href="javascript:;">财务概况</span>
                </li>
            </ul>
            <ul class="tab_down tab_down_show">
                <a href="${ctx}/financial/index">
                    <li class="active">
                        <span>财务概况</span>
                    </li>
                </a>
            </ul>
        </li>

        <li class="tab_up clearfix">
            <ul class="hover_li">
                <li class="fl">
                    <i class="iconfont icon-log"></i>
                    <span>财务汇总</span>
                </li>
                <li class="fr">
                    <i class="iconfont icon-jiantou ar_start on"></i>
                    <i class="iconfont icon-jiantou-copy ar_end"></i>
                </li>
            </ul>
            <ul class="tab_down clear">
                <a href="${ctx}/financial/finance/">
                <li>
                    <span>财务汇总</span>
                </li>
                </a>
                <a href="${ctx}/financial/bill/index">
                <li>
                    <span>账单明细</span>
                </li>
                </a>
            </ul>
        </li>
        <li class="tab_up clearfix">
            <ul class="hover_li">
                <li class="fl">
                    <i class="iconfont icon-iconfontphoto"></i>
                    <span>店铺概览</span>
                </li>
                <li class="fr">
                    <i class="iconfont icon-jiantou ar_start on"></i>
                    <i class="iconfont icon-jiantou-copy ar_end"></i>
                </li>
            </ul>
            <ul class="tab_down">
                <a href="${ctx}/financial/shop/">
                    <li>
                        <span>店铺概览</span>
                    </li>
                </a>
                <a href="${ctx}/financial/shop/gather">
                    <li>
                        <span>店铺汇总</span>
                    </li>
                </a>
                <a href="${ctx}/financial/shop/view">
                    <li>
                        <span>汇总详情</span>
                    </li>
                </a>
                <a href="${ctx}/financial/shop/order">
                    <li>
                        <span>订单明细</span>
                    </li>
                </a>
            </ul>
        </li>
        <li class="tab_up clearfix">
            <ul class="hover_li">
                <li class="fl">
                    <i class="iconfont icon-iconfontdingdan"></i>
                    <span>提现管理</span>
                </li>
                <li class="fr">
                    <i class="iconfont icon-jiantou ar_start on"></i>
                    <i class="iconfont icon-jiantou-copy ar_end"></i>
                </li>
            </ul>
            <ul class="tab_down">

                <a href="${ctx}/financial/withdraw/">
                <li>
                    <span>提现管理</span>
                </li>
                </a>
            </ul>
        </li>
        <li class="tab_up clearfix">
            <ul class="hover_li">
                <li class="fl">
                    <i class="iconfont icon-yonghuzhanghuguanli"></i>
                    <span>费用管理</span>
                </li>
                <li class="fr">
                    <i class="iconfont icon-jiantou ar_start on"></i>
                    <i class="iconfont icon-jiantou-copy ar_end"></i>
                </li>
            </ul>
            <ul class="tab_down">
                <a href="">
                <li>
                    <span>充值管理</span>
                </li>
                </a>
                <a href="">
                    <li>
                        <span>退款管理</span>
                    </li>
                </a>
                <a href="">
                    <li>
                        <span>现金管理</span>
                    </li>
                </a>
            </ul>
        </li>

    </ul>
</div>
