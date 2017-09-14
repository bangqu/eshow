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
				<div class="form-comm">

					<form class="form-horizontal">
						<div class="formtitle">基本信息</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label"><Span class="color-danger">*</Span> 供应商名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">联系人</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">联系电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">联系地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">邮编</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">网址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">营业执照</label>
							<div class="col-sm-10">
								<img width="200" src="https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=785224167,4087641141&fm=117&gp=0.jpg">
								<p class="margin-sm-top"><a href="" class="btn btn-primary">上传图片</a></p>
							</div>
						</div>

						<div class="formtitle">开票信息</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">开票名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">开户行</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">开户行账号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="">
							</div>
						</div>




						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-primary">提交</button>
							</div>
						</div>
					</form>
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

