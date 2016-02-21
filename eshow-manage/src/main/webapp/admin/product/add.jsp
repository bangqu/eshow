<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="../common/website.jsp" %>
<head>
    <title>添加产品</title>
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
                <small>添加产品</small>
            </div>
        </div>

        <div class="am-tabs am-margin" data-am-tabs="">
            <ul class="am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active"><a href="#tab2">添加产品</a></li>
            </ul>
            <div class="am-tabs-bd">
                <div class="am-tab-panel am-fade am-active am-in">
                    <s:form cssClass="am-form" id="productForm" action="product!save.action" method="post" namespace=""
                            enctype="multipart/form-data">
                        <input type="hidden" name="redirect" value="/admin/product/index.jsp">
                        <input type="hidden" name="product.website" value="eshow">
                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-2 am-text-right">
                                产品名称
                            </div>
                            <div class="am-u-sm-4">
                                <input type="text" id="name" name="product.name">
                            </div>
                            <div class="am-u-sm-6">*必填，不可重复</div>
                        </div>

                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-2 am-text-right">
                                产品分类
                            </div>
                            <div class="am-u-sm-4 am-u-end">
                                <s:action name="product-category!list" id="productCategoryList" executeResult="false">
                                    <s:param name="query.enabled">true</s:param>
                                </s:action>
                                <select id="productCategoryId" name="productCategoryId">
                                    <s:iterator value="%{#productCategoryList.productCategories}" status="rowStatus">
                                        <option value="${id}">${name}</option>
                                    </s:iterator>
                                </select>
                            </div>
                        </div>

                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-2 am-text-right">
                                产品型号
                            </div>
                            <div class="am-u-sm-4 am-u-end">
                                <input type="text" class="input-xlarge" id="code" name="product.code" value="">

                            </div>
                        </div>

                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-2 am-text-right">
                                信息来源
                            </div>
                            <div class="am-u-sm-4">
                                <input type="text" class="am-input-sm">
                            </div>
                            <div class="am-u-sm-6">选填</div>
                        </div>

                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-2 am-text-right">
                                内容摘要
                            </div>
                            <div class="am-u-sm-4">
                                <input type="text" class="am-input-sm">
                            </div>
                            <div class="am-u-sm-6">不填写则自动截取内容前255字符</div>
                        </div>

                        <div class="am-g am-margin-top-sm">
                            <div class="am-u-sm-2 am-text-right">
                                内容描述
                            </div>
                            <div class="am-u-sm-10">
                                <textarea id="content" name="product.content" class="content">
                                    <ul class=" list-paddingleft-2">
                                        <li>
                                            <p>
                                                <span class="tit">Minimum Order Quantity :</span> &nbsp;<span
                                                    class="cc">xxx(pcs)</span>
                                            </p>
                                        </li>
                                        <li>
                                            <p>
                                                <span class="tit">am-uors :</span> &nbsp;<span class="cc">Red, Blue, Green</span>
                                            </p>
                                        </li>
                                        <li>
                                            <p>
                                                <span class="tit">Material :</span> &nbsp;<span
                                                    class="cc">ABS and PS</span>
                                            </p>
                                        </li>
                                        <li>
                                            <p>
                                                <span class="tit">Size :</span> &nbsp;<span
                                                    class="cc">2.72x0.16cm</span>
                                            </p>
                                        </li>
                                        <li>
                                            <p>
                                                <span class="tit">Imprint Method : </span> &nbsp;<span class="cc">Silkscreen</span>
                                            </p>
                                        </li>
                                        <li>
                                            <p>
                                                <span class="tit">Description :</span> &nbsp;<span class="cc">Identification card slip located in the translucence material. Buckle strap attaches easily for hassle-free travel. </span>
                                            </p>
                                        </li>
                                    </ul>
                                    <p>
                                        <br/>
                                    </p>
                                    <table width="100%">
                                        <tbody>
                                        <tr>
                                            <td valign="top" style="border-am-uor:#92cddc;" width="20%">
                                                <br/>
                                            </td>
                                            <td valign="top" style="border-am-uor:#92cddc;" width="20%">
                                                <br/>
                                            </td>
                                            <td valign="top" style="border-am-uor:#92cddc;" width="20%">
                                                <br/>
                                            </td>
                                            <td valign="top" style="border-am-uor:#92cddc;" width="20%">
                                                <br/>
                                            </td>
                                            <td valign="top" style="border-am-uor:#92cddc;" width="20%">
                                                <br/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="border-am-uor:#92cddc;" width="20%">
                                                <br/>
                                            </td>
                                            <td valign="top" style="border-am-uor:#92cddc;" width="20%">
                                                <br/>
                                            </td>
                                            <td valign="top" style="border-am-uor:#92cddc;" width="20%">
                                                <br/>
                                            </td>
                                            <td valign="top" style="border-am-uor:#92cddc;" width="20%">
                                                <br/>
                                            </td>
                                            <td valign="top" style="border-am-uor:#92cddc;" width="20%">
                                                <br/>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <p>
                                        <br/>
                                    </p>
                                </textarea>
                            </div>
                        </div>

                        <div class="am-g am-margin-top-sm">
                            <div class="am-u-sm-2 am-text-right">&nbsp;</div>
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
        minFrameWidth : 141,
        maxInputCount : 20
        };
        var _editor = new baidu.editor.ui.Editor(
        editorOption);
        _editor.render('content');


</script>
</body>

