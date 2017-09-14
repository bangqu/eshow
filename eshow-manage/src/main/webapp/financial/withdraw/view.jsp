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

            <div class="financeView">
                <div class="thisType">
                    <span>订单状态</span><span class="label-warning label">提现审核中</span>
                </div>

                <table class="table table-striped">
                    <tbody>
                    <tr>
                        <td>交易时间</td>
                        <td>类型</td>
                        <td>流水号</td>
                        <td>订单号</td>
                        <td>实付金额</td>
                        <td>优惠</td>
                        <td>服务费</td>
                        <td>总金额</td>
                    </tr>
                    <tr>
                        <td>2017-03-21<br>18:12:33</td>
                        <td>购物</td>
                        <td>123334</td>
                        <td>99877623663</td>
                        <td>4.12</td>
                        <td>+1.3</td>
                        <td>+2.1</td>
                        <td>212.5</td>
                    </tr>

                    <tr>
                        <td>转出账户</td>
                        <td >交易账户</td>
                        <td colspan="3" style="text-align: center" ><i class="icon-jiantou iconfont"></i> </td>
                        <td>提现账户</td>
                        <td >交易账户</td>
                        <td >交易账号</td>
                    </tr>
                    <tr>
                        <td>18737237333</td>
                        <td>银行卡</td>
                        <td colspan="3" style="text-align: center" ><i class="icon-jiantou iconfont"></i> </td>
                        <td>张三</td>
                        <td>银行卡</td>
                        <td>18737237333</td>
                    </tr>

                    <tr>
                        <td>创建时间</td>
                        <td>付款时间</td>
                        <td colspan="6">完成时间</td>
                    </tr>
                    <tr>
                        <td>2017-03-21<br>18:12:33</td>
                        <td>2017-03-21<br>18:12:33</td>
                        <td colspan="6">2017-03-21<br>18:12:33</td>
                    </tr>



                    <tr>
                        <td colspan="10">备注</td>
                    </tr>
                    <tr>

                        <td colspan="10">无</td>
                    </tr>
                    </tbody>
                </table>
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

