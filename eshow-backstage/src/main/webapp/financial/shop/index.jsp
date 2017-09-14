<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>店铺概览</title>
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
                <li><a href="">店铺概览</a></li>
            </ul>
        </div>
        <div class="home_block clearfix">
            <div class="sort_cond">

                <form action="" method="get" class="shaix">
                    <ul class="sort_left">
                        <li>
                            <select class="input_sm">
                                <option value="zhe">省</option>
                                <option value="zhe">f</option>
                                <option value="zhe">f</option>
                            </select>
                            <select class="input_sm">
                                <option value="zhe">市</option>
                                <option value="zhe">f</option>
                                <option value="zhe">f</option>
                            </select>
                            <select class="input_sm">
                                <option value="zhe">区</option>
                                <option value="zhe">f</option>
                                <option value="zhe">f</option>
                            </select>
                        </li>
                        <li>
                            <input class="input_sm" type="text" placeholder="..." name="query.nickname" value="" onfocus="if (placeholder =='请输入用户昵称...'){placeholder ='';this.style.color='#163547'}" onblur="if (placeholder ==''){placeholder='请输入用户昵称...';this.style.color='#77848e'}">
                        </li>

                    </ul>

                    <!-- 按钮 -->
                    <div class="fl">
                        <input class="search_btn btn btn-primary btn_xs btn_blue btn_dis btn_border" type="submit" value="查询">
                    </div>
                </form>

                <table class="table_dis table table-striped table-hover data-table table-bordered">
                    <thead>
                    <tr>
                        <th ><span>店铺名称</span></th>
                        <th><span>地区</span></th>
                        <th ><span>累计收入(元)</span></th>
                        <th ><span>累计支出(元)</span></th>
                        <th ><span>账户余额</span></th>
                        <th ><span>操作</span></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>华帝厨具上海分店</td>
                        <td>上海-浦东新区</td>
                        <td>299128.99</td>
                        <td>299128.99</td>
                        <td>299128.99</td>
                        <td>
                            <a href="" class="btn btn-xs btn-default">详情</a>
                        </td>
                    </tr>
                    <tr>
                        <td>华帝厨具上海分店</td>
                        <td>上海-浦东新区</td>
                        <td>299128.99</td>
                        <td>299128.99</td>
                        <td>299128.99</td>
                        <td>
                            <a href="" class="btn btn-xs btn-default">详情</a>
                        </td>
                    </tr>
                    <tr>
                        <td>华帝厨具上海分店</td>
                        <td>上海-浦东新区</td>
                        <td>299128.99</td>
                        <td>299128.99</td>
                        <td>299128.99</td>
                        <td>
                            <a href="" class="btn btn-xs btn-default">详情</a>
                        </td>
                    </tr>
                    <tr>
                        <td>华帝厨具上海分店</td>
                        <td>上海-浦东新区</td>
                        <td>299128.99</td>
                        <td>299128.99</td>
                        <td>299128.99</td>
                        <td>
                            <a href="" class="btn btn-xs btn-default">详情</a>
                        </td>
                    </tr>



                    </tbody>
                </table>
            </div>
            <!-- 页码 -->

            <nav>
                <div class="page_txt fl">
                    <span>显示 1 到 10 项，共 37 项</span>
                </div>
                <ul class="pagination fr">
                    <li>

                        <a href="javascript:;">上一页</a>

                    </li>

                    <li class="active"><a href="#">1</a></li>

                    <li><a href="?query.begin=2">2</a></li>

                    <li><a href="?query.begin=3">3</a></li>

                    <li><a href="?query.begin=4">4</a></li>

                    <li>

                        <a href="?query.begin=4">下一页</a>

                    </li>
                </ul>
            </nav>




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

