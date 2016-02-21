<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Language" content="zh-CN" />
		<meta name="description" content="相册" />
		<meta name="keywords" content="相册" />
		<title>相册</title>
	</head>
	<body>
    <%@ include file="common/header.jsp"%>
		<div id="tldemo" style="display: none; position: absolute;">
			<img src="images/index/tl_demo.gif" />
		</div>
		<div class="s_top">
			<div class="s_logo">
				<a href=""><img
						src="images/indexlogo.gif" border="0" /> </a>
			</div>
			<div class="s_nav">
				<a href="blog.jsp" class="sub"><img
						src="images/menu_01.jpg" alt="日志" width="120"
						height="67" border="0" /> </a>
				<a href="<c:url value='/album'/>" class="sub"><img
						src="images/menu_02.jpg" alt="相册" width="109"
						height="67" border="0" /> </a>
				<a href="club.jsp" class="sub"><img
						src="images/menu_03.jpg" alt="咨询社区" width="110"
						height="67" border="0" /> </a>
				<a href="service.jsp" class="sub"><img
						src="images/menu_04.jpg" alt="服务项目" width="116"
						height="67" border="0" /> </a>
				<a href="user.jsp" class="sub"><img
						src="images/menu5_05.jpg" alt="员工档案" width="119"
						height="67" border="0" /> </a>
			</div>
			<div id="search2">
				<div class="login">
					<c:if test="${pageContext.request.remoteUser == null}">
						<a href="login.jsp">[登录]</a>
						<a href="signup.jsp">[注册]</a>
					</c:if>
					<c:if test="${pageContext.request.remoteUser != null}">
				欢迎：
         		<a
							href="user/index/${pageContext.request.remoteUser}'/>"><authz:authentication
								operation="username" /> </a>
						<a href="logout.jsp">退出</a>
					</c:if>
				</div>
				<input name="text" type="text" class="searchinput" value="" />
				<input name="button" type="button" class="searchbtn" />
				<div class="clear"></div>
			</div>
		</div>
		<div class="heng">
		</div>
		<div class="sc_mian">
			<div class="sc_left">
				<div class="ContentBai">
					<div class="BookSubMian">
						<div class="BookSub">
							<h3>
								发型师简介
							</h3>
						</div>
						<div class="bwContent">
							<div class="ContentPic0">
								<a href="people.html"><img src="images/images/peolo_01.jpg"
										width="100" height="100" hspace="25" /> </a>
							</div>
							<div class="ContenZi">
								<p>
									<a href="people_info.html" class="ab"><b>Yuzo
											Sajiki&nbsp;&nbsp; &nbsp; &nbsp; 总经理 总监</b> <br />

										在日本・英国学习造型基础，赴纽约积累经验。回国后，他在世界时装汇集的东京・青山地区担任驰名美发厅的店长一职。然后他来到世界上最热闹的国际城市“上海”，研究上海的美发业界，为创造最佳・最舒适的美发salon日日奋斗。他擅长英语和中文。
									</a>
								</p>
							</div>
						</div>
						<div class="bwContent">
							<div class="ContentPic0">
								<a href="people.html"><img src="images/images/peolo_02.jpg"
										width="100" height="100" hspace="25" /> </a>
							</div>
							<div class="ContenZi">
								<p>
									<a href="people_info.html" class="ab"><b>Eri Sato
											&nbsp;&nbsp; &nbsp; &nbsp; 总监</b> <br />

										身为本店的技术总监，还担任电视，时尚杂志等专署化妆师。他设计出的造型取得中国，日本，欧美等国内外顾客，男女顾客的广泛支持。
									</a>
								</p>
							</div>
						</div>
						<div class="bwContent">
							<div class="ContentPic0">
								<a href="people.html"><img src="images/images/peolo_05.jpg"
										width="100" height="100" hspace="25" /> </a>
							</div>
							<div class="ContenZi">
								<p>
									<a href="people_info.html" class="ab"><b>Saori Hayashi
											&nbsp;&nbsp; &nbsp; &nbsp;高级发型师</b> <br />

										在日本东京从事8年的发型设计工作，然后来到上海。她日本最有权威的AHA发型设计比赛上获奖两次，参加一次日本顶级发型秀。她擅长设计出有日本时尚杂志风格的可爱＆容易打理的发型。她对人热情，有亲和力，为您提供造型的中肯建议。

									</a>
								</p>
							</div>
						</div>
						<div class="bwContent">
							<div class="ContentPic0">
								<a href="people.html"><img src="images/images/peolo_04.jpg"
										width="100" height="100" hspace="25" /> </a>
							</div>
							<div class="ContenZi">
								<p>
									<a href="people_info.html" class="ab"><b>Jane
											&nbsp;&nbsp; &nbsp; &nbsp; 副店长 楼层经理</b> <br />

										经过酒店服务台职员，楼层经理的经验，现在从事美发salon管理。他精通日，中，英三种语言，为所有顾客提供最周到的服务。 </a>
								</p>
							</div>
						</div>
						<div class="Leftys">
							< 上一页&nbsp; 1 2 3 4 5 ... 10 11 12下一页>
						</div>
					</div>
				</div>
				<div class="mianmbot"></div>
			</div>
		</div>
    <%@ include file="common/footer.jsp" %>
	</body>
</html>
