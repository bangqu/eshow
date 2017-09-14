<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>日志列表</title>
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
                <li><a href="">日志管理</a></li>
                <li><span>></span></li>
                <li><a href="">日志列表</a></li>
            </ul>
        </div>
        <div class="financialInfo clearfix">
            <dl>
                <dt>总营业额<span>(截止今日0点)</span></dt>
                <dd>
                    <span class="price"><em>￥122.93</em> 元</span>
                    <a href="">收支明细</a>
                </dd>
            </dl>
            <dl>
                <dt>总返点支出<span>(截止今日0点)</span></dt>
                <dd>
                    <span class="price"><em>￥122.93</em> 元</span>
                    <a href="" class="btn btn-xs btn-info">收支明细</a>
                </dd>
            </dl>
            <dl>
                <dt>总营业额</dt>
                <dd>
                    <span class="price"><em>￥122.93</em> 元</span>
                    <a href="" class="btn btn-xs btn-info">余额提现</a>
                </dd>
            </dl>
        </div>

        <div class="financialIbox">
            <div class="box">
                <div class="hd"><span>店铺订单</span><a href="" class="btn btn-xs btn-info">查看明细</a></div>
                <ul>
                    <li>
                        <span>总计</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                    <li>
                        <span>今日</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                    <li>
                        <span>昨日</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                    <li>
                        <span>前日</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                </ul>
            </div>
            <div class="box">
                <div class="hd"><span>充值订单</span><a href="" class="btn btn-xs btn-info">查看明细</a></div>
                <ul>
                    <li>
                        <span>总计</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                    <li>
                        <span>今日</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                    <li>
                        <span>昨日</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                    <li>
                        <span>前日</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                </ul>
            </div>
            <div class="box">
                <div class="hd"><span>其他订单</span><a href="" class="btn btn-xs btn-info">查看明细</a></div>
                <ul>
                    <li>
                        <span>总计</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                    <li>
                        <span>今日</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                    <li>
                        <span>昨日</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                    <li>
                        <span>前日</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                </ul>
            </div>
            <div class="box">
                <div class="hd"><span>退款</span><a href="" class="btn btn-xs btn-info">查看明细</a></div>
                <ul>
                    <li>
                        <span>总计</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                    <li>
                        <span>今日</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                    <li>
                        <span>昨日</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                    <li>
                        <span>前日</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                </ul>
            </div>
            <div class="box">
                <div class="hd"><span>充值</span><a href="" class="btn btn-xs btn-info">查看明细</a></div>
                <ul>
                    <li>
                        <span>总计</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                    <li>
                        <span>今日</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                    <li>
                        <span>昨日</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                    <li>
                        <span>前日</span>
                        <span><em>2000.2</em>元</span>
                        <span>192笔</span>
                    </li>
                </ul>
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

