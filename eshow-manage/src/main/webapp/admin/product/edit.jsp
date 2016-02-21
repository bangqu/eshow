<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="../common/website.jsp" %>
<s:action name="product!view" id="view" executeResult="false" namespace="">
    <s:param name="id">${param.id}</s:param>
</s:action>
<head>
    <title>修改产品</title>
    <%@ include file="/common/ueditor.jsp" %>
</head>
<body>
<div class="am-cf admin-main">
    <s:include value="../left.jsp"></s:include>
    <div class="admin-content">
        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">产品</strong> /
                <small><a href="${ctx}/admin/product/">产品管理</a></small>
                /
                <small>修改产品</small>
            </div>
        </div>

        <div class="am-tabs am-margin" >
            <ul class="am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active"><a href="#tab2">修改产品</a></li>
            </ul>
            <div class="am-tabs-bd">
                <div class="am-tab-panel am-active am-in">
                    <s:form cssClass="am-form" action="product!update" id="productForm" method="post"
                            namespace=""
                            enctype="multipart/form-data">
                        <input type="hidden" name="redirect" value="/admin/product/index.jsp">
                        <input type="hidden" name="id" value="${view.product.id}">
                        <fieldset>
                            <div class="am-g am-margin-top">
                                <div class="am-u-sm-2 am-text-right"> 产品名称</div>
                                <div class="am-u-sm-4 ">
                                    <input type="text" class="input-xlarge" id="name" name="product.name"
                                           value="${view.product.name}">
                                </div>
                                <div class="am-u-sm-6">*必填，不可重复</div>
                            </div>

                            <div class="am-g am-margin-top">
                                <div class="am-u-sm-2 am-text-right">产品分类</div>

                                <div class="am-u-sm-4 am-u-end">
                                    <s:action name="product-category!list" id="productCategoryList"
                                              executeResult="false">
                                        <s:param name="query.enabled">true</s:param>
                                        <%--<s:param name="query.website">eshow</s:param>--%>
                                    </s:action>
                                    <select id="productCategoryId" name="productCategoryId">
                                        <option id="">无</option>
                                        <s:iterator value="%{#productCategoryList.productCategories}"
                                                    status="rowStatus">
                                            <option value="${id}"
                                                    <c:if test="${view.product.productCategory.id==id}">selected="selected"</c:if>>
                                                    ${name}
                                            </option>
                                        </s:iterator>
                                    </select>
                                </div>
                            </div>


                            <div class="am-g am-margin-top">
                                <div class="am-u-sm-2 am-text-right">产品型号</div>

                                <div class="am-u-sm-4 am-u-end">
                                    <input type="text" class="input-xlarge" id="code" name="product.code"
                                           value="${view.product.code}">
                                </div>
                            </div>
                            <div class="am-g am-margin-top">
                                <div class="am-u-sm-2 am-text-right">产品价格</div>

                                <div class="am-u-sm-4 am-u-end">
                                    <input type="text" class="input-xlarge" id="price" name="product.price"
                                           value="${view.product.price}"> 数字
                                </div>
                            </div>
                            <div class="am-g am-margin-top">
                                <div class="am-u-sm-2 am-text-right">计量单位</div>

                                <div class="am-u-sm-4 am-u-end">
                                    <input type="text" class="input-xlarge" id="unit" name="product.unit"
                                           value="${view.product.unit}">
                                </div>
                            </div>
                            <div class="am-g am-margin-top">
                                <div class="am-u-sm-2 am-text-right">选择图片</div>

                                <div class="am-u-sm-4 am-u-end">
                                    <input type="file" class="input-xlarge" name="file" id="file">

                                    <p>
                                        <c:if test="${view.product.img != null}">
                                            <img class="img-rounded" src="${view.product.img}!small.jpg"/>
                                        </c:if>
                                    </p>
                                    <p style="margin-top: 10px; am-uor: #999;">图片大小不能超过2M，支持
                                        .jpeg .jpg .gif .bmp .png 格式</p>
                                </div>
                            </div>
                            <div class="am-g am-margin-top">
                                <div class="am-u-sm-2 am-text-right">产品描述</div>

                                <div class="am-u-sm-4 am-u-end">
                                    <textarea id="content" name="product.content"
                                              class="content">${view.product.content}</textarea>
                                    <script type="text/javascript">
										var editorOption = {
											toolbars : [ [ 'Bold', 'underline',
													'foream-uor', 'Undo',
													'Redo', 'insertimage',
													'link', 'unlink',
													'justifyleft',
													'justifycenter',
													'justifyright',
													'insertunorderedlist',
													'insertorderedlist', '|',
													'AutoTypeSet',
													'FormatMatch',
													'RemoveFormat', '|',
													'highlightcode', 'Source',
													'FullScreen' ] ],
											wordCount : false,
											initialContent : '',
											elementPathEnabled : false,
											minFrameHeight : 341,
											maxInputCount : 20
										};
										var _editor = new baidu.editor.ui.Editor(
												editorOption);
										_editor.render('content');


                                    </script>
                                </div>
                            </div>
                           <div class="am-g am-margin-top-sm">
                            <div class="am-u-sm-2 am-text-right">&nbsp;</div>
                            <div class="am-u-sm-10">
                                <button type="submit" class="am-btn am-btn-primary am-btn-xs">提交保存</button>
                                <button type="submit" class="am-btn am-btn-primary am-btn-xs">放弃保存</button>
                            </div>
                        </div>
                        </fieldset>
                    </s:form>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>

