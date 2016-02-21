<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<%-- Put constants into request scope --%>
<appfuse:constants scope="request"/>

<table width="980" height="48" border="0" align="center"
       cellpadding="0" cellspacing="0">
    <tr>
        <td width="240">
            <img src="images/logo.jpg" width="400" />
        </td>
        <td width="740" align="right" valign="bottom"
            background="images/logobg.jpg">
            <table width="60%" height="79" border="0" cellpadding="0"
                   cellspacing="0">
                <tr>
                    <td height="35" colspan="7" align="right" valign="top"
                        style="padding-top: 10px">
                        <table width="280" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <img src="images/tu1.jpg" width="18"
                                         height="18" />
                                </td>
                                <td align="left">
                                    <a
                                            onClick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.wxdayou.com/');"
                                            href="#">设为首页</a>
                                </td>
                                <td>
                                    <img src="images/tu2.jpg" width="18"
                                         height="18" />
                                </td>
                                <td align="left">
                                    <a href="javascript:void(0);"
                                       onClick="window.external.AddFavorite(document.location.href,document.title)">加入收藏</a>
                                </td>
                                <td>
                                    <img src="images/tu3.jpg" width="18"
                                         height="18" />
                                </td>
                                <td align="left">
                                    <a href="cantact.jsp">联系我们</a>
                                </td>
                                <td width="20">
                                    ﻿
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td width="16%" height="33" valign="middle">
                        <a href="index.jsp"><img
                                src="images/d1.jpg" name="Image18"
                                width="93" height="31" border="0" id="Image18" /> </a>
                    </td>
                    <td width="16%" valign="middle">
                        <a href="aboutus.jsp"><img
                                src="images/d2.jpg" name="Image17"
                                width="93" height="31" border="0" id="Image17" /> </a>
                    </td>
                    <td width="16%" valign="middle">
                        <a href="blog.jsp"><img
                                src="images/news.jpg" name="Image16"
                                width="93" height="31" border="0" id="Image16" /> </a>
                    <td width="16%" valign="middle">
                        <a href="product.jsp"><img
                                src="images/money1.jpg" name="Image16"
                                width="93" height="31" border="0" id="Image16" /> </a>
                    </td>
                    <td width="16%" valign="middle">
                        <a href="business.jsp"><img
                                src="images/pro.jpg" name="Image15"
                                width="93" height="31" border="0" id="Image15" /> </a><a
                            href="el.php.html"></a>

                    </td>
                    <td width="20%" valign="middle">
                        <a href="cantact.jsp"><img
                                src="images/d6.jpg" name="Image13"
                                width="93" height="31" border="0" id="Image13" /> </a><a
                            href="about.phpid=2.html"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<table width="980" height="93" border="0" align="center"
       cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <div id="content">
                <script src="scripts/swfobject_source.js"   type=text/javascript></script>
                <div id=dplayer2 style="WIDTH: 980px; HEIGHT: 313px"></div>
                <script language=javascript type=text/javascript>
                    var titles = '专业服务 诚信经营|尊贵品质 唯有大铕|合作伙伴|专业服务 值得依赖';
                    <%--var imgs='${pageContext.request.contextPath}/eshow/wxdayou/images/1.jpg|${pageContext.request.contextPath}/wxdayou/images/2.jpg|${pageContext.request.contextPath}/wxdayou/images/3.jpg|${pageContext.request.contextPath}/wxdayou/images/4.jpg';--%>
                    var imgs='images/1.jpg|images/2.jpg|images/3.jpg|images/4.jpg';
                    var urls='#|#|#|#';
                    var pw = 980;
                    var ph = 313;
                    var sizes = 14;
                    var Times = 3000;
                    var umcolor = 0xFFFFFF;
                    var btnbg =0xFF7E00;
                    var txtcolor =0xFFFFFF;
                    var txtoutcolor = 0x000000;

                    var flash = new SWFObject('images/focus1.swf', 'mymovie', pw, ph, '7', '');
                    <%--var flash = new SWFObject('${pageContext.request.contextPath}/wxdayou/images/focus1.swf', 'mymovie', pw, ph, '7', '');--%>
                    flash.addParam('allowFullScreen', 'true');
                    flash.addParam('allowScriptAccess', 'always');
                    flash.addParam('quality', 'high');
                    flash.addParam('wmode', 'Transparent');
                    flash.addVariable('pw', pw);
                    flash.addVariable('ph', ph);
                    flash.addVariable('sizes', sizes);
                    flash.addVariable('umcolor', umcolor);
                    flash.addVariable('btnbg', btnbg);
                    flash.addVariable('txtcolor', txtcolor);
                    flash.addVariable('txtoutcolor', txtoutcolor);
                    flash.addVariable('urls', urls);
                    flash.addVariable('Times', Times);
                    flash.addVariable('titles', titles);
                    flash.addVariable('imgs', imgs);
                    flash.write('dplayer2');
                </script>
                <div id="sites">

                </div>
            </div>
        </td>
    </tr>
</table>
<table width="980" height="10" border="0" align="center"
       cellpadding="0" cellspacing="0">
    <tr>
        <td valign="top">
            <img src="images/bnft.jpg" width="980"
                 height="10" />
        </td>
    </tr>
</table>