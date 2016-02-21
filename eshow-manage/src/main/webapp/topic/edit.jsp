<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="topic!view" id="view" executeResult="false"></s:action>
<head>
	<title>修改话题</title>
	<link rel="stylesheet" href="<c:url value='/styles/topic.css'/>"
		type="text/css" />
	<link media="screen" type="text/css"
		href="<c:url value='/scripts/validate/theme/grey/formcheck.css'/>"
		rel="stylesheet" />
	<script type="text/javascript"
		src="<c:url value='/scripts/validate/lang/zh-CN.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/scripts/validate/formcheck.js'/>"></script>
	<script type="text/javascript">
	 	window.addEvent('domready', function() {
			new FormCheck('topicForm');
		});
    </script>
	<script type="text/javascript" charset="utf-8"
		src="<c:url value="/components/kindeditor/kindeditor.js"/>"></script>
</head>
<body>
	<div id="page-wrapper">
		<img src="<c:url value='/images/top-hr.png'/>"
			style="height: 12px; margin-top: 10px; width: 980px;" />
		<table cellspacing="0" cellpadding="0"
			style="background: url(<c:url value='/images/bg-body.png'/>) repeat-y top; width: 980px;">
			<tr>
				<td width="2"></td>
				<td valign="top"
					style="background: url(<c:url value='/images/bg-sec-12.png'/>) repeat-x top; padding: 40px 40px; align: center;">
					<div>
						<div class="fullWidth">
							<div class="pagehead clearit">
								<h1 class="noImage">
									网站技术支持
								</h1>
							</div>
							<div class="skyWrap">
								<div class="forumview">
									<div id="forumsearch">
										<s:form id="topicForm" action="topic!update.html" method="post"
											cssClass="creat_form clearfix">
											<input type="hidden" name="id" value="${view.topic.id}" />
											<table>
												<tr>
													<td>
														标题：
													</td>
													<td>
														<input name="topic.title" class="inputtext text-input validate['required']" onblur="this.className='inputtext'"
															style="width: 300px;" maxlength="50" type="text" value="${view.topic.title}" />
													</td>
												</tr>
												<tr>
													<td colspan="2">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td>
														分类：
													</td>
													<td>
														<s:action name="board!list" id="boardList"
															executeResult="false">
														</s:action>
														<select id="strClassId" name="boardId">
															<s:iterator value="%{#boardList.boards}"
																status="rowStatus">
																<option value="${id}"
																	<c:if test="${view.topic.board.id==id}">selected="selected"</c:if>>
																	${name}
																</option>
															</s:iterator>
														</select>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td>
														内容：
													</td>
													<td>
														<script type="text/javascript">
														    KE.show({
														        id : 'ke-text'
														    });
														</script>
														<textarea id="ke-text" name="topic.content"
															style="width: 600px; height: 300px;">${view.topic.content}</textarea>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														&nbsp;
													</td>
												</tr>
												<tr>
													<td colspan="2" align="center">
														<input type="submit" class="botton" value="修改"
															onmouseout="this.className='botton';"
															onmouseover="this.className='botton2';" />
														<input type="button" class="botton_close1" value="取消"
															onmouseout="this.className='botton_close1';"
															onmouseover="this.className='botton_close2';"
															onclick="javascript:history.back();" />
													</td>
												</tr>
											</table>
										</s:form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</td>
				<td width="3"></td>
			</tr>
		</table>
		<table cellspacing="0" cellpadding="0"
			style="background: url(<c:url value='/images/bg-btm-hr.png'/>) repeat-y top; width: 980px; height: 9px;">
			<tr>
				<td></td>
			</tr>
		</table>
	</div>
</body>
