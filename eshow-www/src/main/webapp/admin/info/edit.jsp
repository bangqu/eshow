<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<s:action name="info!view" id="view" executeResult="false"/>
<head>
    <title>修改信息${view.info.title}</title>
    <%@ include file="/common/validate.jsp" %>
    <%@ include file="/common/ueditor.jsp" %>
</head>
<body>
<div class="am-cf admin-main">
    <s:include value="../left.jsp"></s:include>
    <div class="admin-content">
        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg"><a
                    href="${ctx}/admin/index">首页</a></strong> /
                <small><a href="${ctx}/admin/info/">信息中心</a></small>/
                <small>编辑</small>
            </div>
        </div>
        <div class="am-tabs am-margin" data-am-tabs="">
            <ul class="am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active"><a href="#tab2">修改信息</a></li>
            </ul>
            <div class="am-tabs-bd">
                <div class="am-tab-panel am-fade am-active am-in">
                    <s:form cssClass="am-form" action="info!update" id="infoForm" method="post"
                            namespace=""
                            enctype="multipart/form-data">
                        <input type="hidden" name="redirect" value="/admin/info/index.jsp">
                        <input type="hidden" name="id" value="${view.info.id}">
                        <fieldset>
                            <div class="am-g am-margin-top-sm">
                                <div class="am-u-sm-2 am-text-right"> 信息URL</div>
                                <div class="am-u-sm-4 ">
                                    <input type="text" class="input-xlarge" id="url" name="info.url"
                                           value="${view.info.url}">
                                </div>
                                <div class="am-u-sm-6">*必填，不可重复</div>
                            </div>

                            <div class="am-g am-margin-top-sm">
                                <div class="am-u-sm-2 am-text-right">信息标题</div>

                                <div class="am-u-sm-4 am-u-sm-4 am-u-end">
                                    <input type="text" class="am-input-sm" id="title" name="info.title"
                                           value="${view.info.title}">
                                </div>
                            </div>
                            <div class="am-g am-margin-top-sm">
                                <div class="am-u-sm-2 am-text-right">信息内容</div>

                                <div class="am-u-sm-4 am-u-sm-4 am-u-end">
                                    <textarea  class="am-input-sm" id="content" name="info.content"
                                           value="${view.info.content}"></textarea>
                                </div>
                            </div>
                            <div class="am-g am-margin-top-sm">
                                <div class="am-u-sm-2 am-text-right">备注</div>

                                <div class="am-u-sm-4 am-u-sm-4 am-u-end">
                                    <input type="text" class="input-xlarge" id="remark" name="info.remark"
                                           value="${view.info.remark}">
                                </div>
                            </div>
                            <div class="am-g am-margin-top-sm">
                                <div class="am-u-sm-2 am-text-right">&nbsp;</div>

                                <div class="am-u-sm-4 am-u-sm-4 am-u-end">
                                    <button type="submit" class="am-btn am-btn-primary am-btn-xs">修改</button>
                                <button class="am-btn  am-btn-xs">取消</button>
                                </div>
                            </div>
                         
                        </fieldset>
                    </s:form>
                </div>
            </div>
        </div>
    </div>
<%@ include file="/admin/common/footer.jsp" %>
</body>

