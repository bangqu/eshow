<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<s:action name="info!view" var="view" executeResult="false"/>
<head>
    <title>信息页修改</title>
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/simditor.css">
</head>
<body>

<div class="home_wrapper ">
    <%@ include file="/include/left.jsp" %>
    <div class="home_content">
        <div class="home_list mt80">
            <ul class="home_navbar clearfix ">
                <li><a href="${ctx}/">首页概述</a></li>
                <li><span>></span></li>
                <li><a href="${ctx}/info">信息页管理</a></li>
                <li><span>></span></li>
                <li>修改信息页</li>
            </ul>
        </div>
        <div class="home_dis">
            <s:form id="infoForm" action="info!update.action" method="post" cssClass="form-horizontal"
                    namespace="">
                <input type="hidden" name="redirect" value="/info/"/>
                <input type="hidden" name="id" value="${view.info.id}"/>
                <input type="hidden" name="info.website" value="${website}"/>

                <div class="home_block product_cont">
                    <div class="row input_row">
                        <div class="col-xs-2 home_left">
                            <label><span>*</span>信息名称：</label>
                        </div>
                        <div  class="col-xs-10 home_right">
                            <input class="input_md" type="text" placeholder="请输入信息名称..."
                                   name="info.title" value="${view.info.title}"/>
                        </div>
                    </div>
                    <div class="row input_row">
                        <div class="col-xs-2 home_left">
                            <label><span>*</span>信息内容：</label>
                        </div>
                        <div class="col-xs-10 home_right">
                            <textarea class="form-control" style="height: 400px;width: 700px" placeholder="请输入信息名称..."
                                      name="info.content" id="content">${view.info.content}</textarea>
                        </div>
                    </div>
                    <div class="row input_row">
                        <div class="col-xs-2 home_left">
                            <label><span>*</span>备注：</label>
                        </div>
                        <div class="col-xs-10 home_right">
                            <textarea class="form-control" style="height: 100px;" placeholder="请输入备注..."
                                      name="info.remark">${view.info.remark}</textarea>
                        </div>
                    </div>

                    <div class="row input_row">
                        <div class="col-xs-offset-2 col-xs-10">
                            <input type="submit" class="btn btn-primary btn_sm btn_blue btn_dis btn_border"
                                   value="发布"/>
                            <input type="button" class="btn btn-primary btn_sm btn_blue btn_dis btn_border"
                                   value="预览"/>
                            <input type="button" class="btn btn-default btn_sm" value="取消" onclick="javascript:history.back();"/>
                        </div>
                    </div>
                </div>
            </s:form>
        </div>
    </div>
</div>
<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>

<script src="${dll}/manage/scripts/module.min.js"></script>
<script src="${dll}/manage/scripts/hotkeys.min.js"></script>
<script src="${dll}/manage/scripts/uploader.min.js"></script>
<script src="${dll}/manage/scripts/simditor.min.js"></script>

<script type="text/javascript">

    $(function(){
        var editor = new Simditor({
            textarea: $('#content')
        });
        editor;

    });

</script>
</body>

