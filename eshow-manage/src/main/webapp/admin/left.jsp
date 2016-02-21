<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!-- sidebar start -->
<div class="admin-sidebar">
    <ul class="am-list admin-sidebar-list" id="mmm">
        <li><a href="${ctx}/admin/index.jsp"><span class="am-icon-home"></span> 首页</a></li>
        <li class="admin-parent am-panel">
            <a class="am-cf" data-am-collapse="{parent: '#mmm', target: '#s1'}"><span class="am-icon-file"></span> 内容管理
                <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
            <ul id="s1" class="am-list am-collapse admin-sidebar-sub am-in">
                <li><a href="${ctx}/admin/product/" class="am-cf"><span class="am-icon-check"></span> 产品
                    <c:if test="${current=='product'}"><span
                            class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></c:if>
                    </span></a></li>
                <li><a href="${ctx}/admin/info/"><span class="am-icon-th"></span> 信息页
                    <c:if test="${current=='info'}"><span
                            class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></c:if>
                    </span>
                </a></li>
            </ul>
        </li>
        <li class="admin-parent am-panel">
            <a class="am-cf" data-am-collapse="{parent: '#mmm', target: '#s2'}"><span class="am-icon-file"></span> 话题管理
                <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
            <ul id="s2" class="am-list am-collapse admin-sidebar-sub ">
                <li><a href="${ctx}/admin/topic/" class="am-cf"><span class="am-icon-check"></span> 话题列表
                    <c:if test="${current=='topic'}"><span
                            class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></c:if>
                    </span></a></li>
                <li><a href="${ctx}/admin/board/"><span class="am-icon-th"></span> 板块管理
                    <c:if test="${current=='board'}"><span
                            class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></c:if>
                    </span></a></li>
            </ul>
        </li>
        <li class="admin-parent am-panel">
            <a class="am-cf" data-am-collapse="{parent: '#mmm', target: '#s3'}"><span class="am-icon-file"></span> 相册管理
                <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
            <ul id="s3" class="am-list am-collapse admin-sidebar-sub">
                <li><a href="${ctx}/admin/photo/" class="am-cf"><span class="am-icon-check"></span> 图片列表
                    <c:if test="${current=='photo'}"><span
                            class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></c:if>
                    </span></a></li>
                <li><a href="${ctx}/admin/album/"><span class="am-icon-th"></span> 相册列表
                    <c:if test="${current=='album'}"><span
                            class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></c:if>
                    </span></a></li>
            </ul>
        </li>
        <li><a href="#"><span class="am-icon-sign-out"></span> 注销</a></li>
    </ul>
</div>
<!-- sidebar end -->
