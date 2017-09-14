<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<head>
    <title>商品分类</title>
    <%@ include file="/common/style/validate.jsp" %>
</head>
<body>
<div class="home_wrapper ">
    <%@ include file="/include/providerLeft.jsp" %>
    <div class="home_content">
        <div class="home_list">
            <ul class="home_navbar clearfix ">
                <li><a href="${ctx}/">首页概况</a></li>
                <li><span>></span></li>
                <li><a href="">商品分类</a></li>
            </ul>
        </div>

        <div class="home_block clearfix">
    <form action="" method="get" class="shaix clearfix">
    <ul class="sort_left">
    <li>
    <span>名称：</span>
    <input class="input_sm" type="text" value="" name="query.title" placeholder="请输入名称" onfocus="if (placeholder =='请输入日志名称'){placeholder ='';this.style.color='#163547'}" onblur="if (placeholder ==''){placeholder='请输入日志名称';this.style.color='#77848e'}" style="color: rgb(119, 132, 142);">
    </li>
    </ul>

    <!-- 按钮 -->
    <div class="fl">
    <input class="search_btn btn btn-primary btn_xs btn_blue btn_dis btn_border" type="submit" value="查询">
    </div>
    <div class="fr">
    <a href="${ctx}/provider/categoryView" class="btn btn-success"> + 添加分类</a>
    </div>
    </form>


                <ul class="productcats clearfix">
    <li>
    <a class="name">收纳商品</a>
    <p>
    <a href=""><i class="iconfont icon-shanchu"></i></a>
    <a href=""> <i class="iconfont icon-edit1"></i></a>
    <a href=""><i class="iconfont icon-chakan"></i></a>
    </p>
    </li>
                        <li>
                            <a href="" class="name">收纳商品</a>
    <p>
    <a href=""><i class="iconfont icon-shanchu"></i></a>
    <a href=""> <i class="iconfont icon-edit1"></i></a>
    <a href=""><i class="iconfont icon-chakan"></i></a>
    </p>
                        </li>

                </ul>

            </div>

    </div>
</div>
<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
<%@ include file="/common/script/validate.jsp" %>
<script type="text/javascript">

</script>
</body>

