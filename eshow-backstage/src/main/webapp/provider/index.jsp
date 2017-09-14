<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<head>
    <title>供应商列表</title>
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
                            <input class="input_sm" type="text" placeholder="..." name="query.nickname" value="" onfocus="if (placeholder =='请输入用户昵称...'){placeholder ='';this.style.color='#163547'}" onblur="if (placeholder ==''){placeholder='请输入用户昵称...';this.style.color='#77848e'}">
                        </li>

                    </ul>

                    <!-- 按钮 -->
                    <div class="fl">
                        <input class="search_btn btn btn-primary btn_xs btn_blue btn_dis btn_border" type="submit" value="查询">
                    </div>
                    <div class="fr">
                        <a href="${ctx}/provider/add" class="btn btn-success">+ 添加供应商</a>
                    </div>
                </form>

                <table class="table_dis table table-striped table-hover data-table table-bordered">
                    <thead>
                    <tr>
                        <th><span>供应商名称</span></th>
                        <th><span>联系地址</span></th>
                        <th><span>联系人</span></th>
                        <th><span>联系电话</span></th>
                        <th><span>所属行业</span></th>
                        <th><span>操作</span></th>
                    </tr>
                    </thead>
                    <tbody>


                    <tr>
                        <td>无锡到群软件科技有限公司</td>
                        <td>江苏省无锡市滨湖区鸿桥路801号</td>
                        <td>张三</td>
                        <td>1377625266</td>
                        <td>食品</td>
                        <td>
                            <a href="" class="btn btn-xs btn-default">详情</a>
                            <a href="" class="btn btn-xs btn-default">查看商品</a>
                            <a href="" class="btn btn-xs btn-default">编辑</a>
                            <a href="" class="btn btn-xs btn-default">删除</a>
                        </td>
                    </tr>
                    <tr>
                        <td>无锡到群软件科技有限公司</td>
                        <td>江苏省无锡市滨湖区鸿桥路801号</td>
                        <td>张三</td>
                        <td>1377625266</td>
                        <td>食品</td>
                        <td>
                            <a href="" class="btn btn-xs btn-default">详情</a>
                            <a href="" class="btn btn-xs btn-default">查看商品</a>
                            <a href="" class="btn btn-xs btn-default">编辑</a>
                            <a href="" class="btn btn-xs btn-default">删除</a>
                        </td>
                    </tr>

                    <tr>
                        <td>无锡到群软件科技有限公司</td>
                        <td>江苏省无锡市滨湖区鸿桥路801号</td>
                        <td>张三</td>
                        <td>1377625266</td>
                        <td>食品</td>
                        <td>
                            <a href="" class="btn btn-xs btn-default">详情</a>
                            <a href="" class="btn btn-xs btn-default">查看商品</a>
                            <a href="" class="btn btn-xs btn-default">编辑</a>
                            <a href="" class="btn btn-xs btn-default">删除</a>
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
    getTxt(".promoter_select_down .down_li_active", ".classic", "categoryId");
    getTxt(".public_select_down .down_li_active", ".input_public", "userId");
</script>
</body>

