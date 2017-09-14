<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>订单概况</title>
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
            <div class="homeBlockTab clearfix">
                <div id="changetab" class="tab">
                    <a  href="javascript:;" class="active">日汇总</a>
                    <a href="javascript:;" >月汇总</a>
                </div>
                <div>

                    <div id="tab_ac_0">
                        <div class="prv">
                            <a href="javascript:;" onclick="chanmoth('-1')"><i class="iconfont icon-jiantou-l"></i> </a>
                            <a href="javascript:;" onclick="chanmoth('1')"><i class="iconfont icon-jiantou"></i> </a>
                        </div>
                        <div class="texs">
                            <span id="spanmoth"> </span>
                            <input type="hidden" id="thismoth" value="">
                        </div>
                        <a href="" class="btn btn-info btn-default">搜索</a>

                    </div>

                    <div id="tab_ac_1" style="display: none">
                        <div class="prv">
                            <a href="javascript:;" onclick="changyear('-1')"><i class="iconfont icon-jiantou-l"></i> </a>
                            <a href="javascript:;" onclick="changyear('1')"><i class="iconfont icon-jiantou"></i> </a>
                        </div>
                        <div class="texs">
                            <span id="spanyear"> </span>
                            <input type="hidden" id="thisyear" value="">
                        </div>
                        <a href="" class="btn btn-info btn-default">搜索</a>
                    </div>
                </div>
            </div>

            <div class="order_cond">
                 <ul class="clearfix">
                     <li>
                         <a href="" style="background:#5599FF">10</a>
                         <span>总数量</span>
                     </li>
                     <li>
                         <a href="" style="background:#9370DB">3</a>
                         <span>待接单</span>
                     </li>
                     <li>
                         <a href="" style="background:#FF6347">34</a>
                         <span>待处理</span>
                     </li>
                     <li>
                         <a href="" style="background:#337ab7">10</a>
                         <span>待发货</span>
                     </li>
                     <li>
                         <a href="" style="background:#8a6d3b">44</a>
                         <span>配送中</span>
                     </li>
                     <li>
                         <a href="" style="background:#20B2AA">10</a>
                         <span>待评价</span>
                     </li>
                     <li>
                         <a href="" style="background:#337ab7">3444</a>
                         <span>退款中</span>
                     </li>

                 </ul>
            </div>

            <div class="chart-box">
                <div class="chart-hd">订单数量趋势</div>
            </div>

            <div class="chart-box">
                <div class="chart-hd">订单金额趋势</div>
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

    //显示当天日期
    var  d = new Date();
    $("#thisyear").val(d.getFullYear()); $("#spanyear").text(d.getFullYear());
    $("#thismoth").val(d.getFullYear()+"-"+d.getMonth()); $("#spanmoth").text(d.getFullYear()+"-"+d.getMonth());


    $("#changetab a").on("click",function () {
        var _is= $(this).index();
        $(this).addClass('active').siblings().removeClass("active");
        $("#tab_ac_"+_is).show().siblings().hide();
    })


    //操作上一天、下一天
    function changyear(i) {
        var da=$("#thisyear").val();
        var strday = ESUtils.addyear(da,i);
        $("#spanyear").text(strday);
        $("#thisyear").val(strday);
    }
    //操作上一月、下一月
    function chanmoth(i) {
        var da=$("#thismoth").val();
        var strday = ESUtils.addMonth(da,i);
        $("#spanmoth").text(strday);
        $("#thismoth").val(strday);

    }





</script>
</body>

