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

                <div class="homeCompany">
                    <div class="hd"><span class="">无锡到群软件科技有限公司 汇总账单</span> </div>
                    <ul class="clearfix">
                        <li>
                            累计收入：<span>9999.99</span>元
                        </li>
                        <li>
                            累计支出：<span>9999.99</span>元
                        </li>
                        <li>
                            账户余额：<span>9999.99</span>元
                        </li>
                    </ul>
                </div>
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
                <table class="table_dis table table-striped table-hover data-table table-bordered" id="blog">
                    <thead>
                    <tr>
                        <th><span>日期</span></th>
                        <th><span>收入(元)</span></th>
                        <th><span>支出(元)</span></th>
                        <th><span>余额(元)</span></th>
                        <th><span>操作</span></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><a href="">21日</a></td>
                        <td><span class="colorGreen">+1000</span><br><span>2笔</span></td>
                        <td><span class="colorDanger">-1000</span><br><span>21笔</span></td>
                        <td><span class="colorGray">期初</span> 120.00<br><span class="colorGray">期末 </span>1.00</td>
                        <td>
                            <a href="${ctx}/financial/shop/view" class="btn btn-xs btn-default">查看</a>
                          </td>
                    </tr>
                    <tr>
                        <td><a href="">21日</a></td>
                        <td><span class="colorGreen">+1000</span><br><span>2笔</span></td>
                        <td><span class="colorDanger">-1000</span><br><span>21笔</span></td>
                        <td><span class="colorGray">期初</span> 120.00<br><span class="colorGray">期末 </span>1.00</td>
                        <td>
                            <a href="${ctx}/financial/shop/view" class="btn btn-xs btn-default">查看</a>
                        </td>
                    </tr>
                    <tr>
                        <td><a href="">21日</a></td>
                        <td><span class="colorGreen">+1000</span><br><span>2笔</span></td>
                        <td><span class="colorDanger">-1000</span><br><span>21笔</span></td>
                        <td><span class="colorGray">期初</span> 120.00<br><span class="colorGray">期末 </span>1.00</td>
                        <td>
                            <a href="${ctx}/financial/shop/view" class="btn btn-xs btn-default">查看</a>
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
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
<%@ include file="/common/script/validate.jsp" %>

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

