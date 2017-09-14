<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>账单明细</title>
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
                <li>提现管理</li>
            </ul>
        </div>
        <div class="home_block clearfix">
            <div class="clearfix">
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
                        <select id="select" class="input_sm">
                            <option value="0">全部账务类型</option>
                            <option value="1">收入</option>
                            <option value="2">支出</option>
                        </select>
                    </li>
                    <li>
                        <span class="mr4">用户名:</span>
                        <input class="input_sm" type="text" placeholder="..." name="query.nickname" value="" onfocus="if (placeholder =='请输入用户昵称...'){placeholder ='';this.style.color='#163547'}" onblur="if (placeholder ==''){placeholder='请输入用户昵称...';this.style.color='#77848e'}">
                    </li>
                </ul>

                <!-- 按钮 -->
                <div class="fl">
                    <input class="search_btn btn btn-primary btn_xs btn_blue btn_dis btn_border" type="submit" value="查询">
                </div>
            </form>
            </div>
            <div class="financeView">
                <div class="border">
                <table class="table table-striped">
                    <tbody>
                    <tr>
                        <td>发生时间</td>
                        <td>用户名称</td>
                        <td>交易号</td>
                        <td>账号类型</td>
                        <td>提现账号</td>
                        <td>提现金额(元)</td>
                        <td>状态</td>
                        <td>操作</td>
                    </tr>
                    <tr>
                        <td>2017-03-21<br>18:12:33</td>
                        <td>张小泉</td>
                        <td>212999928</td>
                        <td>支付宝</td>
                        <td>13655556553</td>
                        <td>1000.00</td>
                        <td>
                            <span class="colorWrong">提现中</span>
                        </td>
                        <td>
                            <a href="" class="btn btn-xs btn-success">提现成功</a>
                            <a href="" class="btn btn-xs btn-danger">提现失败</a>
                            <a href="" class="btn btn-xs btn-default">详情</a>
                        </td>
                    </tr>
                    <tr>
                        <td>2017-03-21<br>18:12:33</td>
                        <td>张小泉</td>
                        <td>212999928</td>
                        <td>支付宝</td>
                        <td>13655556553</td>
                        <td>1000.00</td>
                        <td>
                            <span class="colorDanger">提现失败</span>
                        </td>
                        <td>
                            <a href="" class="btn btn-xs btn-success">提现成功</a>
                            <a href="" class="btn btn-xs btn-danger">提现失败</a>
                            <a href="" class="btn btn-xs btn-default">详情</a>
                        </td>
                    </tr>
                    <tr>
                        <td>2017-03-21<br>18:12:33</td>
                        <td>张小泉</td>
                        <td>212999928</td>
                        <td>支付宝</td>
                        <td>13655556553</td>
                        <td>1000.00</td>
                        <td>
                            <span class="colorGreen">提现成功</span>
                        </td>
                        <td>
                            <a href="" class="btn btn-xs btn-success">提现成功</a>
                            <a href="" class="btn btn-xs btn-danger">提现失败</a>
                            <a href="" class="btn btn-xs btn-default">详情</a>
                        </td>
                    </tr>

                    </tbody>
                </table>
                </div>

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

</div>
<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
<%@ include file="/common/script/validate.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/select2.full.min.js"></script>
<script type="text/javascript">
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



</script>
</body>

