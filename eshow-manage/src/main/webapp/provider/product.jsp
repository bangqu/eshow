<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<head>
    <title>商品列表</title>
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
                <li><a href="">供应商管理</a></li>
            </ul>
        </div>

        <div class="home_block clearfix">
            <div class="sort_cond">

                <form action="" method="get" class="shaix">
                    <ul class="sort_left">
                        <li>
                        <span>名称：</span>
                        <input class="input_sm" type="text" value="" name="query.title" placeholder="请输入名称" onfocus="if (placeholder =='请输入日志名称'){placeholder ='';this.style.color='#163547'}" onblur="if (placeholder ==''){placeholder='请输入日志名称';this.style.color='#77848e'}" style="color: rgb(119, 132, 142);">
                        </li>
                        <li>
                        <span>供应商：</span>
                        <input class="input_sm" type="text" value="" name="query.title" placeholder="请输入名称" onfocus="if (placeholder =='请输入日志名称'){placeholder ='';this.style.color='#163547'}" onblur="if (placeholder ==''){placeholder='请输入日志名称';this.style.color='#77848e'}" style="color: rgb(119, 132, 142);">
                        </li>
                        <li>
                        <span>状态：</span>
                            <select class="input_sm">
                            <option value="">全部</option>
                            </select>
                        </li>
                    </ul>

                    <!-- 按钮 -->
                    <div class="fl">
                        <input class="search_btn btn btn-primary btn_xs btn_blue btn_dis btn_border" type="submit" value="查询">
                    </div>
                    <div class="fr">
                        <a href="${ctx}/provider/add" class="btn btn-success">+ 添加商品</a>
                    </div>
                </form>

                <table class="table_dis table table-striped table-hover data-table table-bordered">
                    <thead>
                    <tr>
                        <th><span>商品</span></th>
                        <th><span>商品分类</span></th>
                        <th><span>库存</span></th>
                        <th><span>单价</span></th>
                        <th><span>单位</span></th>
                        <th><span>供应商</span></th>
                        <th><span>状态</span></th>
                        <th><span>操作</span></th>
                    </tr>
                    </thead>
                    <tbody>


                    <tr>
                        <td>小苹果一只</td>
                        <td>水果</td>
                        <td>122</td>
                        <td>￥318</td>
                        <td>只</td>
                        <td>到群软件</td>
                        <td>上架</td>
                        <td>
                            <a href="" class="btn btn-xs btn-default">详情</a>
                            <a href="" class="btn btn-xs btn-primary">下架</a>
                            <a href="" class="btn btn-xs btn-info">编辑</a>
                            <a href="" class="btn btn-xs btn-danger">删除</a>
                        </td>
                    </tr>
    <tr>
    <td>小苹果一只</td>
    <td>水果</td>
    <td>122</td>
    <td>￥318</td>
    <td>只</td>
    <td>到群软件</td>
    <td>上架</td>
    <td>
    <a href="" class="btn btn-xs btn-default">详情</a>
    <a href="" class="btn btn-xs btn-primary">下架</a>
    <a href="" class="btn btn-xs btn-info">编辑</a>
    <a href="" class="btn btn-xs btn-danger">删除</a>
    </td>
    </tr>

    <tr>
    <td>小苹果一只</td>
    <td>水果</td>
    <td>122</td>
    <td>￥318</td>
    <td>只</td>
    <td>到群软件</td>
    <td>上架</td>
    <td>
    <a href="" class="btn btn-xs btn-default">详情</a>
    <a href="" class="btn btn-xs btn-primary">下架</a>
    <a href="" class="btn btn-xs btn-info">编辑</a>
    <a href="" class="btn btn-xs btn-danger">删除</a>
    </td>
    </tr>




    </tbody>
                </table>
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
<script type="text/javascript">

</script>
</body>

