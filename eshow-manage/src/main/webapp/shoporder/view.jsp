<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<head>
    <title>订单详情</title>
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
        <div class="home_list">
            <ul class="home_navbar clearfix ">
                <li><a href="">财务中心</a></li>
                <li><span>></span></li>
                <li><a href="">财务汇总</a></li>
                <li><span>></span></li>
                <li>财务汇总</li>
            </ul>
        </div>
        <div class="home_block clearfix orderMain">

            <div class="order-hd">
                <span>订单状态: <em class="label label-success">已完成</em> </span>
            </div>
            <div class="order-hd">
                <p>
                <a href="" class="btn btn-info">确认订单</a>
                <a href="" class="btn btn-danger">取消订单</a>
                </p>
            </div>


            <div  class="order-process ">

                <div class="node ready"><i class="node-icon icon-start"></i>
                    <ul>
                        <li class="txt1">&nbsp;</li>
                        <li class="txt2">提交订单</li>
                        <li id="track_time_0" class="txt3">2017-04-06 <br> 21:43:05</li>
                    </ul>
                </div>
                <div class="proce done">
                    <ul>
                        <li class="txt1"></li>
                    </ul>
                </div>
                <div class="node ready"><i class="node-icon icon-pay"></i>
                    <ul>
                        <li class="txt1">&nbsp;</li>
                        <li class="txt2">付款成功</li>
                        <li id="track_time_4" class="txt3"></li>
                    </ul>
                </div>
                <div class="proce done">
                    <ul>
                        <li class="txt1">&nbsp;</li>
                    </ul>
                </div>
                <div class="node ready"><i class="node-icon icon-store"></i>
                    <ul>
                        <li class="txt1">&nbsp;</li>
                        <li class="txt2">商品出库</li>
                        <li id="track_time_1" class="txt3">2017-04-06 <br> 22:19:06</li>
                    </ul>
                </div>
                <div class="proce done">
                    <ul>
                        <li class="txt1">&nbsp;</li>
                    </ul>
                </div>
                <div class="node ready"><i class="node-icon icon-express"></i>
                    <ul>
                        <li class="txt1">&nbsp;</li>
                        <li class="txt2">等待收货</li>
                        <li id="track_time_5" class="txt3">2017-04-07 <br> 03:17:11</li>
                    </ul>
                </div>
                <div class="proce done">
                    <ul>
                        <li class="txt1">&nbsp;</li>
                    </ul>
                </div>
                <div class="node ready"><i class="node-icon icon-finish"></i>
                    <ul>
                        <li class="txt1">&nbsp;</li>
                        <li class="txt2">完成</li>
                        <li id="track_time_6" class="txt3">2017-04-07 <br> 15:31:55</li>
                    </ul>
                </div>
            </div>

            <div class="order-info-mod clearfix">

                <dl class="order-info  ">
                    <dt><span>买家信息</span></dt>
                    <dd>
                        <p><label>联系人</label> <span>张小泉</span></p>
                        <p><label>手机号</label> <span>137788837662</span></p>
                        <p><label>收货地址</label> <span>无锡市滨湖区鸿桥路801号无锡国际工业设计大厦1407</span></p>
                    </dd>
                </dl>

                <dl class="order-info  ">
                    <dt><span>卖家信息</span></dt>
                    <dd>
                        <p><label>联系人</label> <span>张小泉</span></p>
                        <p><label>手机号</label> <span>137788837662</span></p>
                        <p><label>所在地</label> <span>无锡市滨湖区鸿桥路801号无锡国际工业设计大厦1407</span></p>
                    </dd>
                </dl>

                <dl class="order-info">
                    <dt><span>配送信息</span></dt>
                    <dd>
                        <p><label>送货方式</label> <span>普通快递</span></p>
                        <p><label>运费</label> <span>0</span></p>
                        <p><label>发货日期</label> <span>12-12-12 12:12</span></p>
                        <p><label>签收日期</label> <span>12-12-12 12:12</span></p>

                    </dd>
                </dl>

                <dl class="order-info">
                    <dt><span>付款信息</span></dt>
                    <dd>
                        <p><label>付款方式</label> <span>在线支付</span></p>
                        <p><label>付款时间</label> <span>12-12-12 12:12</span></p>
                        <p><label>订单金额</label> <span>0</span></p>
                        <p><label>运费金额</label> <span>￥12.9</span></p>

                    </dd>
                </dl>

            </div>

            <div class="order-info-table ">
                <div class="order-hd">
                    <span>订单信息 </span>
                </div>
                <div class="store">
                    订单编号: <span>3796776916256246</span>   供应商：<span>无锡到群</span>
                </div>

                <table class="table table-hover border">
                    <thead>
                    <tr>
                        <th>商品</th>
                        <th>单价</th>
                        <th>数量</th>
                        <th>服务费</th>
                        <th>快递费</th>
                        <th>优惠</th>
                        <th>商品合计</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="prd"><img width="50" height="50" src="https://img12.360buyimg.com/n2/jfs/t3322/329/105241637/241614/d5640be1/57ff50f0N1f6cd383.jpg">
                            <p>五羊（FIVERAMS）婴儿紫草护理膏宝宝护肤蚊叮虫咬护理霜10</p>
                        </td>
                        <td>11.2</td>
                        <td>x2</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>22.0</td>
                    </tr>
                    <tr>
                        <td class="prd"><img width="50" height="50" src="https://img12.360buyimg.com/n2/jfs/t3322/329/105241637/241614/d5640be1/57ff50f0N1f6cd383.jpg">
                            <p>五羊（FIVERAMS）婴儿紫草护理膏宝宝护肤蚊叮虫咬护理霜10</p>
                        </td>
                        <td>11.2</td>
                        <td>x2</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>22.0</td>
                    </tr>
                    <tr>
                        <td class="prd"><img width="50" height="50" src="https://img12.360buyimg.com/n2/jfs/t3322/329/105241637/241614/d5640be1/57ff50f0N1f6cd383.jpg">
                            <p>五羊（FIVERAMS）婴儿紫草护理膏宝宝护肤蚊叮虫咬护理霜10</p>
                        </td>
                        <td>11.2</td>
                        <td>x2</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>22.0</td>
                    </tr>
                    <tr>
                        <td colspan="7">备注：#333发顺丰</td>
                    </tr>
                    <tr class="heji">
                        <td colspan="7" style="text-align: right">合计价格：<span>122.09</span></td>
                    </tr>
                    </tbody>
                </table>
            </div>


            <div class="order-info-comment">
                <div class="order-hd">
                    评价详情
                </div>

                <div class="textbox">
                    <div class="des">
                        商品描述 <span>
                        <i class="iconfont icon-xing"></i>
                        <i class="iconfont icon-xing"></i>
                        <i class="iconfont icon-xing"></i>
                        <i class="iconfont icon-xing"></i>
                        <i class="iconfont icon-xing"></i>
                    </span>
                    </div>
                    <div class="tex">
                            <p>一直都在这里买的纸尿裤，觉得挺好用的，这次又回家补货，感觉用得很快！每个月都在买。
                            </p>
                    </div>
                    <div class="imgs">
                        <a href=""><img src="https://img12.360buyimg.com/n4/s130x130_jfs/t4366/224/7327358/349285/3494137f/58ad5357N53aec608.jpg"></a>
                        <a href=""><img src="https://img12.360buyimg.com/n4/s130x130_jfs/t4366/224/7327358/349285/3494137f/58ad5357N53aec608.jpg"></a>
                        <a href=""><img src="https://img12.360buyimg.com/n4/s130x130_jfs/t4366/224/7327358/349285/3494137f/58ad5357N53aec608.jpg"></a>
                        <a href=""><img src="https://img12.360buyimg.com/n4/s130x130_jfs/t4366/224/7327358/349285/3494137f/58ad5357N53aec608.jpg"></a>
                    </div>
                </div>

                <form class="reps">
                    <div class="form-group">
                        <label for="">回复评论</label>
                        <textarea class="form-control" rows="3"></textarea>
                    </div>

                    <button type="submit" class="btn btn-info">回复</button>
                </form>
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
    $(document).ready(function () {


        $('#date_before,#date_after').cxCalendar();

        var nowdate = new Date();
        var y = nowdate.getFullYear();
        var m = nowdate.getMonth() + 1;
        var d = nowdate.getDate();
        var formatnowdate = y + '-' + m + '-' + d;

        //获取系统前一周的时间
        var oneweekdate = new Date(nowdate - 7 * 24 * 3600 * 1000);
        var y = oneweekdate.getFullYear();
        var m = oneweekdate.getMonth() + 1;
        var d = oneweekdate.getDate();
        var formatwdate = y + '-' + m + '-' + d;

        //获取系统前一个月的时间
        nowdate.setMonth(nowdate.getMonth() - 1);
        var y = nowdate.getFullYear();
        var m = nowdate.getMonth() + 1;
        var d = nowdate.getDate();
        var formatwdate = y + '-' + m + '-' + d;


        $("#select").on("change", function () {
            var k = $(this).val();
            if (k == 0) {
                $('#date_before,#date_after').val(formatnowdate);
            } else if (k == 1) {
                $('#date_after').val(formatnowdate);
                $('#date_before').val(formatwdate);
            }
            else if (k == 2) {
                $('#date_after').val(formatnowdate);
                $('#date_before').val(formatwdate);
            } else {
                $('#date_before,#date_after').val('');
            }
        })


        $("#categoryId").select2({
            ajax: {
                type: 'GET',
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
            placeholder: '请选择',//默认文字提示
            language: "zh-CN",
            tags: true,//允许手动添加
            allowClear: true,//允许清空
            escapeMarkup: function (markup) {
                return markup;
            }, // 自定义格式化防止xss注入
            minimumInputLength: 1,//最少输入多少个字符后开始查询
            templateResult: formatRepo,
            formatResult: function formatRepo(repo) {
                return repo;
            }, // 函数用来渲染结果
            formatSelection: function formatRepoSelection(repo) {
                $("#categoryName").val(repo.text);
                return repo.text;
            } // 函数用于呈现当前的选择
        });

        $("#userId").select2({
            ajax: {
                type: 'GET',
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
            placeholder: '请选择',//默认文字提示
            language: "zh-CN",
            tags: true,//允许手动添加
            allowClear: true,//允许清空
            escapeMarkup: function (markup) {
                return markup;
            }, // 自定义格式化防止xss注入
            minimumInputLength: 1,//最少输入多少个字符后开始查询
            templateResult: formatRepo,
            formatResult: function formatRepo(repo) {
                return repo;
            }, // 函数用来渲染结果
            formatSelection: function formatRepoSelection(repo) {
                $("#userNickname").val(repo.text);
                return repo.text;
            } // 函数用于呈现当前的选择
        });
    });

    /* 这里2个函数是用于查询到内容后，显示在select2的下拉框里面 */
    function formatRepo(repo) {
        if (repo.loading) return repo.text;
        var markup = '<div class="clearfix">' +
            '<div class="col-sm-20">' + repo.text + '</div>' +
            '</div>';

        return markup;
    }
</script>
</body>

