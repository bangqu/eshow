<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
<title>日志分类</title>

	<link rel="stylesheet" href="${dll}/manage/styles/simditor-html.css" media="screen" charset="utf-8" />
</head>

<body>
<div class="main">
	<div class="home_header">
		<div class="home_logo fl">
			<a href="">
				<img src="http://127.0.0.1:8080/eshow-static/manage/images/stage_log.png">
			</a>
		</div>

		<div class="home_nav fl">
			<a href="${ctx}/" class="active">首页</a>
		</div>

		<div class="fr home_avatar">
			<div class="home_avatar_up">
				<img src="http://127.0.0.1:8080/eshow-static/manage/images/header.png">
				<span>admin</span>
				<img src="http://127.0.0.1:8080/eshow-static/manage/images/avatar_narrow.png">
			</div>
		</div>
	</div>
	<div class="home_wrapper">
		<div class="home_sider fl">
			<%@ include file="/include/boardLeft.jsp" %>
		</div>
		<div class="home_content">
			<div class="home_list">
				<ul class="home_navbar clearfix ">
					<li><a>信息页</a></li>
					<li><span>></span></li>
					<li><a>话题管理</a></li>
					<li><span>></span></li>
					<li><a>话题列表</a></li>
					<li><span>></span></li>
					<li><a>板块管理</a></li>
					<li><span>></span></li>
					<li><a>相册管理</a></li>
					<li><span>></span></li>
					<li><a>图片管理</a></li>
					<li><span>></span></li>
					<li><a>注销</a></li>
					<li><span>></span></li>
				</ul>
			</div>

			<div class="home_block">


					<form>
						<s:hidden name="id" value="%{#view.board.id}"></s:hidden>
						<fieldset>
							<div class="row input_row">
								<div class="col-xs-2 home_left">
									<label><span>*</span>分类名称：</label>
								</div>
								<div class="col-xs-10 home_right">
									<input class="input_md" type="text" placeholder=""请输入分类名称相关信息.."".
										   name="info.title" value="${view.board.name}" />
									<span class="input_tip">必填！</span>
								</div>
							</div>

							<div class="row input_row">
								<div class="col-xs-2 home_left">
									<label><span>*</span>备注：</label>
								</div>
								<div class="col-xs-10 home_right">
									<textarea class="form-control" id="editor"  placeholder=""请输入相关备注信息...">${view.board.description}</textarea>
									<span class="input_tip">必填！</span>
								</div>
							</div>
							<div class="row input_row">
								<div class="col-xs-offset-2 col-xs-10">
									<input type="submit" class="btn btn-primary btn_sm btn_blue btn_dis btn_border"
										   value="修改"/>
									<input type="button" class="btn btn-default btn_sm" value="取消" onclick="javascript:history.back();"/>
								</div>
							</div>
						</fieldset>
					</form>

			</div>
		</div>
	</div>
</div>

<%@ include file="/common/scripts.jsp" %>
<%--<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>--%>
<script type="text/javascript" src="${dll}/manage/scripts/chosen.jquery.js"></script>
<!-- <script type="text/javascript" src="scripts/bootstrap.min.js"></script> -->
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>

<script type="text/javascript">
	$(function(){


	});
</script>
</body>
