<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<s:action name="category!search" id="categoryList" executeResult="false" />
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Language" content="zh-CN" />
		<meta name="description" content="无锡大铕不锈钢有限公司" />
		<meta name="keywords" content="无锡大铕不锈钢有限公司" />
		<title>登录</title>
	</head>
	<body>
    <%@ include file="common/header.jsp"%>
		<table width="980" height="417" border="0" align="center"
			cellpadding="0" cellspacing="0">
			<tr>
				<td width="261" height="208" align="left" valign="top"
					background="images/leftzbg.jpg">
					<table width="261" height="49" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td algin="left" style="padding: 15px;">
								<img src="images/three.jpg" width="218" height="74" />
							</td>
						</tr>
					</table>
					
					
				</td>
				<td width="719" align="left" valign="top">
					<table width="719" height="31" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="98" height="31" align="center"
								background="images/titleabout.jpg" class="bold">
								登录页面
							</td>
							<td width="556" background="images/titlebg.jpg">
								&nbsp;
							</td>
							<td width="65" align="center" background="images/titlebg.jpg">
								<a href="about.php"></a>
							</td>
						</tr>
					</table>
					<table width="100%" height="210" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td align="left" valign="top" style="padding: 20px;">
								<div>
									<form method="post" id="loginForm"
										action="j_security_check"
										onsubmit="saveUsername(this);return validateForm(this)">
										<c:if test="${param.error != null}">
											<li class="error">
												<img src="${ctx}images/iconWarning.gif"
													alt="<fmt:message key='icon.warning'/>" class="icon"
													width="264" height="17" />
												<fmt:message key="errors.password.mismatch" />
												<%--${sessionScope.ACEGI_SECURITY_LAST_EXCEPTION.message}--%>
											</li>
										</c:if>
										<br />
										<div class="sc_mian">
											<div class="sc_left">
												<div class="BigMian">
													<div class="jiaojiao"></div>
													<div class="ContentBai">
														<div class="BookSub" align="center">
															<h3>
																登&nbsp;&nbsp;陆
															</h3>
														</div>
														<div align="center">
															<label for="j_username">
																<font color="#00000">用户名:</font>
															</label>
															<input id="j_username" name="j_username"
																style="width: 10em;" type="text" />
														</div>
														<br />
														<div align="center">
															<label for="j_password">
																<font color="#00000">密&nbsp;&nbsp;&nbsp;&nbsp;码:</font>
															</label>
															<input type="password" name="j_password" id="j_password"
																style="width: 10em;" />
														</div>
														<br />
														<c:if test="${appConfig['rememberMeEnabled']}">
															<div align="center" style="margin-right: 120px;">
																<label for="rememberMe">
																	<font color="#00000">让系统记住我</font>
																</label>
																<input type="checkbox" name="rememberMe" id="rememberMe"
																	checked="checked" />
															</div>
														</c:if>
														<div style="margin-left: 120px;" align="center">
															<input type="submit" name="login"
																value="<fmt:message key='button.login'/>" />
															<p>
															</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
        <%@ include file="common/footer.jsp"%>
	</body>
</html>
