<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>财务汇总</title>
    <%@ include file="/common/style/validate.jsp" %>
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/chosen.css">
    <link rel="stylesheet" href="${dll}/manage/styles/jquery.cxcalendar.css">
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/simditor.css">
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/style.css">
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/layer.css">
    <link rel="stylesheet" type="text/css" href="${dll}/manage/styles/select2.css">
</head>
<body>
<div class="home_wrapper ">
    <%@ include file="/include/financialleft.jsp" %>
    <div class="home_content">
        <div class="home_list" >
            <ul class="home_navbar clearfix ">
                <li><a href="">财务中心</a></li>
                <li><span>></span></li>
                <li><a href="">财务汇总</a></li>
                <li><span>></span></li>
                <li>财务汇总</li>
            </ul>
        </div>
        <div class="home_block clearfix">
            <div class="financeView">

                <div class="infos">
                    <table class="table table-bordered">

                        <tbody>
                        <tr>
                            <td colspan="2">无锡到群软件科技有限公司 汇总详情</td>
                        </tr>
                        <tr>
                            <td>起始时间：2015-08-31 00:00:00</td>
                            <td>终止时间：2015-09-01 00:00:00</td>

                        </tr>
                        <tr>

                            <td>上期余额：312323.00元</td>
                            <td>当期余额：312323.00 元</td>
                        </tr>
                        <tr>

                            <td>当期收入：＋600元，共2笔</td>
                            <td>当期支出：－300元，共3笔</td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="border">
                <table class="table table-striped ">
                    <tbody>
                    <tr>

                        <td>类型</td>
                        <td>收入笔数</td>
                        <td>收入金额(元)</td>
                        <td>支出笔数</td>
                        <td>支出金额(元)</td>
                        <td>总金额(元)</td>
                        <td>操作</td>
                    </tr>
                    <tr>
                        <td>其他</td>
                        <td>3</td>
                        <td>+2334.3</td>
                        <td>3</td>
                        <td>-233.99</td>
                        <td>221</td>
                        <td><a href="" class="btn btn-default btn-xs">查看明细</a></td>
                    </tr>
                    <tr>
                        <td>充值</td>
                        <td>3</td>
                        <td>+2334.3</td>
                        <td>3</td>
                        <td>-233.99</td>
                        <td>221</td>
                        <td><a href="" class="btn btn-default btn-xs">查看明细</a></td>
                    </tr> <tr>
                        <td>提现</td>
                        <td>3</td>
                        <td>+2334.3</td>
                        <td>3</td>
                        <td>-233.99</td>
                        <td>221</td>
                        <td><a href="" class="btn btn-default btn-xs">查看明细</a></td>
                    </tr>
                    <tr>
                        <td>提现</td>
                        <td>3</td>
                        <td>+2334.3</td>
                        <td>3</td>
                        <td>-233.99</td>
                        <td>221</td>
                        <td><a href="" class="btn btn-default btn-xs">查看明细</a></td>
                    </tr>

                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="7"></td>
                    </tr>
                    <tr>
                        <td>合计</td>
                        <td>7</td>
                        <td>+2334.3</td>
                        <td>3</td>
                        <td>-233.99</td>
                        <td>221</td>
                        <td><a href="" class="btn btn-default btn-xs">查看明细</a></td>
                    </tr>
                    </tfoot>
                </table>
                </div>
            </div>

        </div>


    </div>

</div>
<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
<%@ include file="/common/script/validate.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/select2.full.min.js"></script>
<script type="text/javascript">
//    getTxt(".promoter_select_down .down_li_active", ".classic", "categoryId");
//    getTxt(".public_select_down .down_li_active", ".input_public", "userId");
$(document).ready(function() {
//            $(".js-example-basic-single").select2();
    $("#categoryId").select2({
        ajax: {
            type:'GET',
            url: "${ctx}/category!page.action?query.website=${website}",
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    q: params.term, // search term 请求参数
                    page: params.page
                };
            },
            processResults: function (data, params) {
                params.page = params.page || 1;
                return {
                    results: data.beans,//itemList
                    pagination: {
                        more: (params.page * 30) < data.total_count
                    }
                };
            },
            cache: true
        },
        placeholder:'请选择',//默认文字提示
        language: "zh-CN",
        tags: true,//允许手动添加
        allowClear: true,//允许清空
        escapeMarkup: function (markup) { return markup; }, // 自定义格式化防止xss注入
        minimumInputLength: 1,//最少输入多少个字符后开始查询
        templateResult: formatRepo,
        formatResult: function formatRepo(repo){return repo;}, // 函数用来渲染结果
        formatSelection: function formatRepoSelection(repo){
            $("#categoryName").val(repo.text);
            return repo.text;
        } // 函数用于呈现当前的选择
    });

    $("#userId").select2({
        ajax: {
            type:'GET',
            url: "${ctx}/user!page.action?query.website=${website}",
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    q: params.term, // search term 请求参数
                    page: params.page
                };
            },
            processResults: function (data, params) {
                params.page = params.page || 1;
                return {
                    results: data.beans,//itemList
                    pagination: {
                        more: (params.page * 30) < data.total_count
                    }
                };
            },
            cache: true
        },
        placeholder:'请选择',//默认文字提示
        language: "zh-CN",
        tags: true,//允许手动添加
        allowClear: true,//允许清空
        escapeMarkup: function (markup) { return markup; }, // 自定义格式化防止xss注入
        minimumInputLength: 1,//最少输入多少个字符后开始查询
        templateResult: formatRepo,
        formatResult: function formatRepo(repo){return repo;}, // 函数用来渲染结果
        formatSelection: function formatRepoSelection(repo){
            $("#userNickname").val(repo.text);
            return repo.text;
        } // 函数用于呈现当前的选择
    });
});

/* 这里2个函数是用于查询到内容后，显示在select2的下拉框里面 */
function formatRepo (repo) {
    if (repo.loading) return repo.text;
    var markup = '<div class="clearfix">' +
            '<div class="col-sm-20">' + repo.text + '</div>' +
            '</div>';

    return markup;
}
</script>
</body>

