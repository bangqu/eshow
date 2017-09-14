<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>信息添加</title>

</head>
<body>
<div class="home_wrapper ">
    <%@ include file="/include/left.jsp" %>
    <div class="home_content">
        <div class="home_list">
            <ul class="home_navbar clearfix ">
                <li><a href="">首页概述</a></li>
                <li><span>></span></li>
                <li><a href="">信息管理</a></li>
                <li><span>></span></li>
                <li><a href="">发布信息</a></li>
            </ul>
        </div>
        <div class="home_dis">
            <s:form id="infoForm" action="info!save.action" method="post" cssClass="form-horizontal"
                    namespace="">
                <input type="hidden" name="redirect" value="/info/"/>
                <input type="hidden" name="info.website" value="${website}"/>

                <div class="home_block product_cont">
                    <%--<div class="add_info clearfix row">--%>
                        <%--<p class="add_info_txt fl"><b class="color-red">*</b><span>信息名称：</span></p>--%>
                        <%--<input class="add_info_input fl log_input" type="text" placeholder="请输入信息名称..."--%>
                               <%--name="info.title"/>--%>
                    <%--</div>--%>
                    <div class="row input_row">
                        <div class="col-xs-2 home_left">
                            <label><span>*</span>信息名称：</label>
                        </div>
                        <div  class="col-xs-10 home_right">
                            <input class="form-control" type="text" placeholder="请输入信息名称..."
                                name="info.title"/>
                        </div>
                    </div>
                    <%--<div class="add_info clearfix">--%>
                        <%--<p class="add_info_txt fl"><b class="color-red">*</b><span>信息内容：</span></p>--%>
                    <%--<textarea class="" style="height: 400px;width: 700px" placeholder="请输入信息名称..."--%>
                              <%--name="info.content" id="content"></textarea>--%>
                    <%--</div>--%>
                    <div class="row input_row">
                        <div class="col-xs-2 home_left">
                            <label><span>*</span>信息内容：</label>
                        </div>
                        <div class="col-xs-10 home_right">
                            <textarea class="form-control" style="height: 400px;width: 700px" placeholder="请输入信息名称..."
                                      name="info.content" id="content"></textarea>
                        </div>
                    </div>
                    <%--<div class="add_info clearfix">--%>
                        <%--<p class="add_info_txt fl"><b class="color-red">*</b><span>访问路径：</span></p>--%>
                    <%--<textarea class="add_info_input fl log_input" type="text" placeholder="请输入访问路径..."--%>
                              <%--name="info.website"></textarea>--%>
                    <%--</div>--%>
                    <div class="row input_row">
                        <div class="col-xs-2 home_left">
                            <label><span>*</span>备注：</label>
                        </div>
                        <div class="col-xs-10 home_right">
                            <textarea class="form-control" style="height: 100px;" placeholder="请输入备注..."
                                      name="info.remark"></textarea>
                        </div>
                    </div>

                    <div class="row input_row">
                        <div class="col-xs-offset-2 col-xs-10">
                            <input type="submit" class="btn btn-primary btn_sm btn_blue btn_dis btn_border"
                                   value="发布"/>
                            <input type="button" class="btn btn-primary btn_sm btn_blue btn_dis btn_border"
                                   value="预览"/>
                            <input type="button" class="btn btn-default btn_sm" value="取消" onclick="window.location.href='${ctx}/info/index'"/>
                        </div>
                    </div>
                    <%--<div class="add_log_btn">--%>
                        <%--<input class="release_btn" type="submit" value="添加"/>--%>
                        <%--<input type="button" class="browse_btn" value="预览"/>--%>
                        <%--<a href="${ctx}/info/index"><span>取消</span></a>--%>
                    <%--</div>--%>
                </div>
            </s:form>
        </div>
    </div>
</div>

<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
<%@ include file="/common/script/umeditor.jsp" %>

<script type="text/javascript">

    var ue = UM.getEditor('content', {
        lang: /^zh/.test(navigator.language || navigator.browserLanguage || navigator.userLanguage) ? 'zh-cn' : 'en',
        langPath: UMEDITOR_CONFIG.UMEDITOR_HOME_URL + "lang/",
        focus: true
    });

</script>
</body>

