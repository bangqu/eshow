<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<s:action name="product-category!search" var="productCategoryList" executeResult="false">
    <s:param name="query.enabled">true</s:param>
    <%--<s:param name="query.order">sequence</s:param>--%>
    <s:param name="query.desc">false</s:param>
    <s:param name="query.pagesize">20</s:param>
</s:action>
<head>
    <title>产品添加</title>
</head>
<body>
<div class="home_wrapper ">
    <%@ include file="/include/left.jsp" %>
    <div class="home_content" >
        <div class="home_list" style="margin-top:80px;">
            <ul class="home_navbar clearfix ">
                <li><a href="">首页概述</a></li>
                <li><span>></span></li>
                <li><a href="">产品管理</a></li>
                <li><span>></span></li>
                <li><a href="">发布产品</a></li>
            </ul>
        </div>
        <div class="home_dis">
            <s:form id="productForm" action="product!save.action" method="post" cssClass="form-horizontal"
                    namespace="">
                <input type="hidden" name="redirect" value="/product/"/>
                <input type="hidden" name="product.website" value="${website}"/>

                <div class="home_block product_cont">

                    <%--<div class="add_info clearfix col-md-7">--%>
                        <%--<p class="add_info_txt fl"><b class="color-red">*</b><span>产品名称：</span></p>--%>
                        <%--<input class="add_info_input fl log_input" type="text" placeholder="请输入产品名称..."--%>
                               <%--name="product.name"/>--%>
                    <%--</div>--%>
                    <div class="row input_row" >
                        <div class="col-xs-2 home_left">
                            <label><span>*</span>产品名称：</label>
                        </div>
                        <div  class="col-sm-10">
                            <input  type="text" class="form-control" placeholder="请输入产品名称..."
                                   name="product.name"
                                    onFocus="if (placeholder =='请输入产品名称...'){placeholder ='';this.style.color='#163547'}"
                                    onBlur="if (placeholder ==''){placeholder='请输入产品名称...';this.style.color='#77848e'}"/>
                        </div>
                    </div>

                    <%--<div class="add_info clearfix">--%>
                        <%--<p class="add_info_txt fl"><b class="color-red">*</b><span>产品分类：</span></p>--%>

                        <%--<input type="hidden" name="productCategoryId" id="productCategoryId">--%>

                        <%--<div class="add_info_input fl input_name_down input_name_down_b classic"><span>Eshow办公室</span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <div class="row input_row">
                        <div class="col-xs-2 home_left">
                            <label><span>*</span>产品分类：</label>
                        </div>

                        <%--<input type="hidden" name="productCategoryId" id="productCategoryId">--%>

                        <%--<div class="col-xs-2 home_left">--%>
                            <%--<label>Eshow办公室</label>--%>
                        <%--</div>--%>
                        <div class="col-sm-10">
                            <select name="productCategoryId" id="productCategoryId" class="form-control">
                                    <%--<option>请选择</option>--%>
                                <s:iterator value="%{#productCategoryList.productCategories}"  var="cat">
                                    <option  value="${id}">${name}</option>
                                </s:iterator>
                            </select>
                        </div>
                    </div>

                    <%--<div class="add_info clearfix">--%>
                        <%--<p class="add_info_txt fl"><b class="color-red">*</b><span>产品内容：</span></p>--%>
                    <%--<textarea class="" style="height: 400px;width: 700px" placeholder="请输入产品名称..."--%>
                              <%--name="product.content" id="content"></textarea>--%>
                    <%--</div>--%>
                    <div class="row input_row" >
                        <div class="col-xs-2 home_left">
                            <label><span>*</span>产品内容：</label>
                        </div>
                        <div class="col-xs-10 home_right" >
                        <textarea class="form-control" style="height: 400px;width: 700px "  placeholder="请输入产品内容..."
                                  name="product.content" id="content"
                                  onFocus="if (placeholder =='请输入产品内容...'){placeholder ='';this.style.color='#163547'}"
                                  onBlur="if (placeholder ==''){placeholder='请输入产品内容...';this.style.color='#77848e'}"></textarea>
                        </div>
                    </div>

                    <div class="row input_row">
                        <div class="col-xs-offset-2 col-xs-10">
                            <input type="submit" class="btn btn-primary btn_sm btn_blue btn_dis btn_border"
                                   value="发布"/>
                            <input type="button" class="btn btn-primary btn_sm btn_blue btn_dis btn_border"
                                   value="预览"/>
                            <input type="button" class="btn btn-default btn_sm" value="取消" onclick="javascript:history.back()"/>
                        </div>
                    </div>
                    <%--<div class="add_log_btn">--%>
                        <%--<input class="release_btn" type="submit" value="发布"/>--%>
                        <%--<input type="button" class="browse_btn" value="预览"/>--%>
                        <%--<a href="javascript:history.go(-1);"><span>取消</span></a>--%>
                    <%--</div>--%>
                </div>
            </s:form>
        </div>
    </div>
</div>
<div class="downmenu_hides">
    <ul class="promoter_select_down">
        <li class="promoter_down_li">
            <input type="text" placeholder="输入您要搜索的分类"
                   onFocus="if (placeholder =='输入您要搜索的分类'){placeholder ='';this.style.color='#000'}"
                   onBlur="if (placeholder ==''){placeholder='输入您要搜索的分类';this.style.color='#c1c8ce'}"/>
        </li>
        <%--<s:action name="product-category!search" var="productCategoryList" executeResult="false">--%>
            <%--<s:param name="query.enabled">true</s:param>--%>
            <%--<s:param name="query.order">sequence</s:param>--%>
            <%--<s:param name="query.website">${website}</s:param>--%>
            <%--<s:param name="query.desc">false</s:param>--%>
            <%--<s:param name="query.pagesize">20</s:param>--%>
        <%--</s:action>--%>
        <s:iterator value="%{#productCategoryList.productCategories}" status="rowStatus" var="cat">
            <li class="down_li_active" pr="${id}">${name}</li>
        </s:iterator>

    </ul>
</div>
<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
<%@ include file="/common/script/umeditor.jsp" %>

<script>
    getTxt(".promoter_select_down .down_li_active", ".classic", "productCategoryId");

    $("input[type='submit']").click(function () {
        layer.open({
            type: 0,
            title: ['发布话题', 'fontSize:16px;color:#163547;'],
            content: '您确认发布该话题吗？',
            btn: ['取消', '确认']
        })
    });
    var ue = UM.getEditor('content', {
        lang: /^zh/.test(navigator.language || navigator.browserLanguage || navigator.userLanguage) ? 'zh-cn' : 'en',
        langPath: UMEDITOR_CONFIG.UMEDITOR_HOME_URL + "lang/",
        focus: true
    });
</script>
</body>

