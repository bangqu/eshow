<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
<title>添加信息</title>
<%@ include file="/common/validate.jsp"%>
<%@ include file="/common/ueditor.jsp"%>
</head>
<body>
    <div class="am-cf admin-main">
    <s:include value="../left.jsp"></s:include>
    <div class="admin-content">
        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">信息</strong> /
                <small><a href="${ctx}/admin/info/">信息管理</a></small>
                /
                <small>添加信息</small>
            </div>
        </div>
        <div class="am-tabs am-margin" data-am-tabs="">
            <ul class="am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active"><a href="#tab2">添加信息</a></li>
            </ul>
            <div class="am-tabs-bd">
                <div class="am-tab-panel am-fade am-active am-in">
                    <s:form cssClass="am-form" id="infoForm" action="info!save.action" method="post" namespace=""
                            enctype="multipart/form-data">
                        <input type="hidden" name="redirect" value="/admin/info/index.jsp">
                        <input type="hidden" name="info.website" value="eshow">
                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-2 am-text-right">
                                信息URL
                            </div>
                            <div class="am-u-sm-4">
                                <input type="text" id="url" name="info.url">
                            </div>
                            <div class="am-u-sm-6">*必填，不可重复</div>
                        </div>
                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-2 am-text-right">
                                信息标题
                            </div>
                            <div class="am-u-sm-4 am-u-end">
                                <input type="text" class="input-xlarge" id="title" name="info.title" value="">
                            </div>
                        </div>
                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-2 am-text-right">
                                信息内容
                            </div>
                            <div class="am-u-sm-4 am-u-end">
                                <textarea  class="am-input-sm" id="content" name="info.content" value=""></textarea>
                            </div>
                        </div>
                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-2 am-text-right">
                                备注
                            </div>
                            <div class="am-u-sm-4 am-u-end">
                                <input type="text" class="am-input-sm" id="remark" name="info.remark" value=""  >
                            </div>
                        </div>
                        <div class="am-g am-margin-top-sm">
                            <div class="am-u-sm-2 am-text-right"></div>
                            <div class="am-u-sm-10">
                                <button type="submit" class="am-btn am-btn-primary am-btn-xs">提交保存</button>
                                <button type="submit" class="am-btn am-btn-primary am-btn-xs">放弃保存</button>
                            </div>
                        </div>
                    </s:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
