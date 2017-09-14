<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>订单中心</title>
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
    <%@ include file="/include/shopleft.jsp" %>
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

            <form action="/eshow-manage/user/" method="get" class="shaix">
                <ul class="sort_left">

                    <li>
                        <select id="select" class="input_sm">
                            <option value="3">自定义时间</option>
                            <option value="0">今天</option>
                            <option value="1">最近一周</option>
                            <option value="2">最近一个月</option>

                        </select>
                    </li>
                    <li>
                        <span class="mr4">日期:</span>
                        <input id="date_before" type="text" class="input_sm calendar_bd" name="startAddTime" value="">
                        <span>-</span>
                        <input id="date_after" type="text" class="input_sm calendar_bd"  name="endAddTime" value="">
                    </li>
                    <li>
                        <span class="mr4">订单状态:</span>
                        <select id="select" class="input_sm">
                            <option value="0">全部</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                        </select>
                    </li>
                    <li>
                        <span class="mr4">付款方式:</span>
                        <select id="select" class="input_sm">
                            <option value="0">全部</option>
                            <option value="1">已付款</option>
                            <option value="2">未付款</option>
                        </select>
                    </li>
                    <li>
                        <span class="mr4">订单号:</span>
                        <input class="input_sm" type="text" placeholder="..." name="query.nickname" value="" onfocus="if (placeholder =='请输入用户昵称...'){placeholder ='';this.style.color='#163547'}" onblur="if (placeholder ==''){placeholder='请输入用户昵称...';this.style.color='#77848e'}">
                    </li>
                </ul>

                <!-- 按钮 -->
                <div class="fl">
                    <input class="search_btn btn btn-primary btn_xs btn_blue btn_dis btn_border" type="submit" value="查询">
                </div>
            </form>

            <table class="table untreatedtable ">
                <thead>
                <tr>
                    <th style="width:500px">订单商品</th>
                    <th>订单状态</th>
                    <th style="width:140px">总金额</th>
                    <th style="width:100px">操作</th>
                </tr>
                </thead>
                <tbody id="shopOrderList">
                <tr class="active">
                    <td colspan="4">
                        <input type="checkbox" name="shopOrderIds" value="17179">
                        隐秀苑-小刘炒饭馆-2015/04/01&nbsp;&nbsp;&nbsp;<span class="badge" style="background-color: #ff0000;">1</span>号订单
                        &nbsp;&nbsp;订单号:20150401134621146</td>
                </tr>
                <tr>
                    <td style="width:570px">
                        <div class="order_goods">
                            <p>
                                <a target="_blank" href="http://www.yinwan.com/product/view/642" title="盒饭">
                                    <img src="http://img.yinwan.bangqu.com/2014-07-03-19-07-47!icon.jpg">
                                </a>
                                <a target="_blank" href="http://www.yinwan.com/product/view/642" title="盒饭">
                                    <img src="http://img.yinwan.bangqu.com/2014-07-03-19-07-47!icon.jpg">
                                </a>
                                <a target="_blank" href="http://www.yinwan.com/product/view/642" title="盒饭">
                                    <img src="http://img.yinwan.bangqu.com/2014-07-03-19-07-47!icon.jpg">
                                </a>
                            </p>
                        </div>
                        <i title="盒饭"> <span class="badge">2份</span>盒饭</i>
                    </td>
                    <td>
                        <div class="rel">
                            <div class="uinfo rel">
                                <div class="size">
                                        <span class="red">
                                               </span>
                                    关闭的订单<br>

                                    <p>收货人:张霞</p>

                                    <p>收货地址:66栋402室</p>

                                    <p>手机:15261665571</p>

                                    <p class="gray">
                                        备注:
                                        <a href="javascript:void(0);">

                                            暂无备注
                                        </a>
                                    </p>
                                </div>
                                <div class="imore">
                                    <dl>
                                        <dt>
                                            <span><strong>处理时间</strong></span>
                                            <span><strong>处理信息</strong></span>
                                        </dt>
                                        <dd class="gray">
                                            <span>2015-04-01 15:56:13</span>
                                            <span> 暂无理由</span>
                                            <br>
                                            <span>2015-04-01 13:46:22</span>
                                            <span> 待配送</span>
                                            <br>
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <p>数量:x2</p>

                        <p>合计:30.0元</p>

                        <p>
                            现金支付</p>
                        <p>配送时间:尽快</p>
                    </td>
                    <td>
                        <p><a href="/shopOrder/view?shopOrderId=17179&amp;current=untreated" class="btn btn-xs btn-default">订单详情</a></p>
                    </td>
                </tr>


                <tr class="active">
                    <td colspan="4">
                        <input type="checkbox" name="shopOrderIds" value="17179">
                        隐秀苑-小刘炒饭馆-2015/04/01&nbsp;&nbsp;&nbsp;<span class="badge" style="background-color: #ff0000;">1</span>号订单
                        &nbsp;&nbsp;订单号:20150401134621146</td>
                </tr>
                <tr>
                    <td style="width:570px">
                        <div class="order_goods">
                            <p>
                                <a target="_blank" href="http://www.yinwan.com/product/view/642" title="盒饭">
                                    <img src="http://img.yinwan.bangqu.com/2014-07-03-19-07-47!icon.jpg">
                                </a>
                                <a target="_blank" href="http://www.yinwan.com/product/view/642" title="盒饭">
                                    <img src="http://img.yinwan.bangqu.com/2014-07-03-19-07-47!icon.jpg">
                                </a>
                                <a target="_blank" href="http://www.yinwan.com/product/view/642" title="盒饭">
                                    <img src="http://img.yinwan.bangqu.com/2014-07-03-19-07-47!icon.jpg">
                                </a>
                            </p>
                        </div>
                        <i title="盒饭"> <span class="badge">2份</span>盒饭</i>
                    </td>
                    <td>
                        <div class="rel">
                            <div class="uinfo rel">
                                <div class="size">
                                        <span class="red">
                                               </span>
                                    关闭的订单<br>

                                    <p>收货人:张霞</p>

                                    <p>收货地址:66栋402室</p>

                                    <p>手机:15261665571</p>

                                    <p class="gray">
                                        备注:
                                        <a href="javascript:void(0);">

                                            暂无备注
                                        </a>
                                    </p>
                                </div>
                                <div class="imore">
                                    <dl>
                                        <dt>
                                            <span><strong>处理时间</strong></span>
                                            <span><strong>处理信息</strong></span>
                                        </dt>
                                        <dd class="gray">
                                            <span>2015-04-01 15:56:13</span>
                                            <span> 暂无理由</span>
                                            <br>
                                            <span>2015-04-01 13:46:22</span>
                                            <span> 待配送</span>
                                            <br>
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <p>数量:x2</p>

                        <p>合计:30.0元</p>

                        <p>
                            现金支付</p>
                        <p>配送时间:尽快</p>
                    </td>
                    <td>
                        <p><a href="/shopOrder/view?shopOrderId=17179&amp;current=untreated" class="btn btn-xs btn-default">订单详情</a></p>
                    </td>
                </tr>


                </tbody>
            </table>
            <!-- 页码 -->

            <nav>
                <div class="page_txt fl">
                    <span>显示 1 到 20 项，共 59 项</span>
                </div>
                <ul class="pagination fr">
                    <li>

                        <a href="javascript:;">上一页</a>

                    </li>

                    <li class="active"><a href="#">1</a></li>

                    <li><a href="?query.begin=2">2</a></li>

                    <li><a href="?query.begin=3">3</a></li>

                    <li>

                        <a href="?query.begin=3">下一页</a>

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



    $('#date_before,#date_after').cxCalendar();

    var nowdate = new Date();
    var y = nowdate.getFullYear();
    var m = nowdate.getMonth()+1;
    var d = nowdate.getDate();
    var formatnowdate = y+'-'+m+'-'+d;

    //获取系统前一周的时间
    var oneweekdate = new Date(nowdate-7*24*3600*1000);
    var y = oneweekdate.getFullYear();
    var m = oneweekdate.getMonth()+1;
    var d = oneweekdate.getDate();
    var formatwdate = y+'-'+m+'-'+d;

    //获取系统前一个月的时间
    nowdate.setMonth(nowdate.getMonth()-1);
    var y = nowdate.getFullYear();
    var m = nowdate.getMonth()+1;
    var d = nowdate.getDate();
    var formatwdate = y+'-'+m+'-'+d;


    $("#select").on("change",function () {
        var k=$(this).val();
        if(k==0){
            $('#date_before,#date_after').val(formatnowdate);
        }else if(k==1){
            $('#date_after').val(formatnowdate);
            $('#date_before').val(formatwdate);
        }
        else if(k==2){
            $('#date_after').val(formatnowdate);
            $('#date_before').val(formatwdate);
        } else{
            $('#date_before,#date_after').val('');
        }
    })


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

