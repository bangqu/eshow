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
		<script type="text/javascript">
 var speed=10	//图片左移的速度
 var MyMar
  function toleft(){
	  demo2.innerHTML=demo1.innerHTML
		function Marquee1(){
		if(demo2.offsetWidth-demo.scrollLeft<=0)
		demo.scrollLeft-=demo1.offsetWidth
		else{ 
		demo.scrollLeft++
		} 
		}
		MyMar=setInterval(Marquee1,speed)

  }
    function toright(){
		demo2.innerHTML=demo1.innerHTML
		  function Marquee(){
		  if(demo.scrollLeft<=0)
		  demo.scrollLeft+=demo2.offsetWidth
		  else{
		  demo.scrollLeft--
		  }
		  }
		 MyMar=setInterval(Marquee,speed)


  }
  
  	function toStop()
	{
		clearInterval(MyMar)
	}
  
  
</script>
	</head>
	<body>

		<div id="tldemo" style="display: none; position: absolute;">
			<img src=images/index/tl_demo.gif" />
		</div>
		<div class="s_top">
			<div class="s_logo">
				<a href="<c:url value='/'/>"><img
						src="indexlogo.gif" border="0" /> </a>
			</div>
			<div class="s_nav">
				<a href="<c:url value='/blog'/>" class="sub"><img
						src="images/menu_01.jpg" alt="日志" width="120"
						height="67" border="0" /> </a>
				<a href="/album" class="sub"><img
						src="images/menu_02.jpg" alt="相册" width="109"
						height="67" border="0" /> </a>
				<a href="/club" class="sub"><img
						src="images/menu_03.jpg" alt="咨询社区" width="110"
						height="67" border="0" /> </a>
				<a href="/service" class="sub"><img
						src="images/menu4_04.jpg" alt="服务项目" width="116"
						height="67" border="0" /> </a>
				<a href="/user" class="sub"><img
						src="images/menu_05.jpg" alt="员工档案" width="119"
						height="67" border="0" /> </a>
			</div>
			<div id="search2">
				<div class="login">
					<c:if test="${pageContext.request.remoteUser == null}">
						<a href="<c:url value='login.jsp'/>">[登录]</a>
						<a href="<c:url value='signup.jsp'/>">[注册]</a>
					</c:if>
					<c:if test="${pageContext.request.remoteUser != null}">
				欢迎：
         		<a
							href="/user/index/${pageContext.request.remoteUser}"><authz:authentication
								operation="username" /> </a>
						<a href="logout">退出</a>
					</c:if>
				</div>
				<input name="text" type="text" class="searchinput" value="" />
				<input name="button" type="button" class="searchbtn" />
				<div class="clear"></div>
			</div>
		</div>
		<div class="heng">
			<ul class="submenu">
				<li>
					<a href="showcase6.html" class="sub">价目表</a>
				</li>
				<li>
					<a href="#" class="sub">友情提示</a>
				</li>
			</ul>
		</div>
		<div class="s_main">
			<div class="s_left3">
				<div class="ShowPicKK">
					<table cellpadding="0" cellspacing="0" border="0"
						style="margin-left: 15px;">
						<tr>
							<td>
								<img
									src="http://www.jianqiao.org/demo/images/images/final_03.jpg"
									hspace="8" vspace="14" align="absmiddle" onmouseover="toleft()"
									onmouseout="toStop()" />
							</td>
							<td>
								<div id="demo"
									style="overflow: hidden; width: 520px; color: #ffffff;">
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td id="demo1" valign="top" align="center">
												<table cellpadding="0" cellspacing="15" border="0">
													<tr align="center">
														<td>
															<a href="showcase5.html"><img
																	src="http://www.jianqiao.org/demo/images/images/showd_03.jpg"
																	width="154" height="220" border="0" /> </a>
														</td>
														<td>
															<a href="showcase5.html"><img
																	src="http://www.jianqiao.org/demo/images/images/showd_03.jpg"
																	width="154" height="220" border="0" /> </a>
														</td>
														<td>
															<a href="showcase5.html"><img
																	src="http://www.jianqiao.org/demo/images/images/showd_03.jpg"
																	width="154" height="220" border="0" /> </a>
														</td>
														<td>
															<a href="showcase5.html"><img
																	src="http://www.jianqiao.org/demo/images/images/showd_03.jpg"
																	width="154" height="220" border="0" /> </a>
														</td>
														<td>
															<a href="showcase5.html"><img
																	src="http://www.jianqiao.org/demo/images/images/showd_03.jpg"
																	width="154" height="220" border="0" /> </a>
														</td>
														<td>
															<a href="showcase5.html"><img
																	src="http://www.jianqiao.org/demo/images/images/showd_03.jpg"
																	width="154" height="220" border="0" /> </a>
														</td>
													</tr>
												</table>
											</td>
											<td id="demo2" valign="top"></td>
										</tr>
									</table>
								</div>
							</td>
							<td>
								<img src="images/images/final_05.jpg" width="18" height="26"
									hspace="8" vspace="14" onmouseover="toright()"
									onmouseout="toStop()" />
							</td>
						</tr>
					</table>
				</div>
				<div class="ShowZIzz">
					<P>
						充分了解头发的发质、发量是发型设计的前提，发质、发量要从细处着手，如某一区域的发量分配和发质变化。由于现代人的发质都有不同程度的受损，很有可能头部各个区域的发质是不一样的，而每个部位发量的分配也是不一样的，充分了解发质、发量的情况，在发型设计时便可以有效控制头发的长度和状态。
					</P>

					<p>
						脸形是发型设计的最基础条件，除了要了解脸形的几种形以外，更重要的是要了解顾客面部的特征，如大小、线条、立体感、层次感等，不管哪一种脸形都离不开这些因素，使以上因素与发型相协调才是发型设计师直正应该做的。大小的配合，线条的柔和与生硬、立体感的强弱，能够使发型与脸形互补，从而达到和谐的目的。

					</P>
				</div>
			</div>
			<div class="s_right77">
				<div class="newsRightCol">
					<h2>
						价目表
					</h2>
					<ul>
						<li>
							剪发含洗吹 &nbsp;&nbsp;&nbsp;400RMB
						</li>
						<li>
							化妆 &nbsp;&nbsp;&nbsp;500RMB～
						</li>
						<li>
							洗吹 &nbsp;&nbsp;&nbsp; 150RMB
						</li>
						<li>
							盘发 &nbsp;&nbsp;&nbsp;300RMB～
						</li>
					</ul>
					<div class="jiantou">
						<img src="images/brand/brand_17.gif" />
					</div>
				</div>
				<div class="newsRightCol">
					<h2>
						友情提示
					</h2>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本店预约优先，晚于预定时间到店，会优先下面有预定的顾客。
					来店后请先填写顾客信息表。然后与发型师沟通造型后进行洗头，剪发，吹风。离店时交您会员卡。第三次来店时赠送优惠券，以供下次使用。
					我们免费提供咖啡，红茶，绿茶，软饮料。
					<div class="jiantou">
						<img src="images/brand/brand_17.gif" />
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
