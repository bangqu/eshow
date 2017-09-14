<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
		 contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<head>
	<title>供应商</title>
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
				<li><span>></span></li>
				<li><a href="">详情</a></li>
			</ul>
		</div>

		<div class="home_block clearfix">
			 <div class="panel-view">
				 <div class="panel-hd"><span>基本信息</span></div>
				 <div class="panel-bd">
				 <div class="item">
					 <span class="labs">供应商名称：</span>
					 <p>无锡到群软件科技有限公司</p>
				 </div>
				 <div class="item">
					 <span class="labs">联系人：</span>
					 <p>张三</p>
				 </div>
				 <div class="item">
					 <span class="labs">联系电话：</span>
					 <p>12766366666</p>
				 </div>
				 <div class="item">
					 <span class="labs">联系地址：</span>
					 <p>江苏省无锡市滨湖区鸿桥路801号</p>
				 </div>
				 <div class="item">
					 <span class="labs">邮箱：</span>
					 <p>710504142@qq.com</p>
				 </div>
				 <div class="item">
					 <span class="labs">网址：</span>
					 <p>baidu.com</p>
				 </div>
				 <div class="item">
					 <span class="labs">营业执照：</span>
					 <p> <img width="200" src="https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=785224167,4087641141&fm=117&gp=0.jpg">
					 </p>
				 </div>
			 </div>
			 </div>
			<div class="panel-view">
				<div class="panel-hd"><span>开票信息</span></div>
				<div class="panel-bd">
				<div class="item">
					<span class="labs">开票名称：</span>
					<p>无锡到群软件科技有限公司</p>
				</div>
				<div class="item">
					<span class="labs">开户行：</span>
					<p>农业银行丽湖支行</p>
				</div>

				<div class="item">
					<span class="labs">开户行账号：</span>
					<p>2088882771277</p>
				</div>

				</div>
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

