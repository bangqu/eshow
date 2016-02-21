<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<table width="980" height="93" border="0" align="center"
       cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <div id="content">
                <script src="../scripts/swfobject_source.js"
                        type=text/javascript></script>
                <div id=dplayer2 style="WIDTH: 980px; HEIGHT: 313px"></div>
                <script language=javascript type=text/javascript>
                    var titles = '专业服务 诚信经营|尊贵品质 唯有大铕|合作伙伴|专业服务 值得依赖';
                    var imgs='${pageContext.request.contextPath}/images/1.jpg|${pageContext.request.contextPath}/images/2.jpg|${pageContext.request.contextPath}/images/3.jpg|${pageContext.request.contextPath}/images/4.jpg';
                    var urls='#|#|#|#';
                    var pw = 980;
                    var ph = 313;
                    var sizes = 14;
                    var Times = 3000;
                    var umcolor = 0xFFFFFF;
                    var btnbg =0xFF7E00;
                    var txtcolor =0xFFFFFF;
                    var txtoutcolor = 0x000000;
                    var flash = new SWFObject('${pageContext.request.contextPath}/images/focus1.swf', 'mymovie', pw, ph, '7', '');
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
            <img src="../images/bnft.jpg" width="980"
                 height="10" />
        </td>
    </tr>
</table>
<decorator:body />
<table width="980" height="10" border="0" align="center"
       cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <img src="../images/space.gif" width="1" height="10" />
        </td>
    </tr>
</table>
<table width="980" height="1" border="0" align="center"
       cellpadding="0" cellspacing="0">
    <tr>
        <td bgcolor="#CCCCCC">
            <img src="../images/space.gif" width="1" height="1" />
        </td>
    </tr>
</table>
<br />
<table align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <a
                    onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.wxdayou.com/');"
                    href="#">设为首页</a> |
            <a href="javascript:void(0);"
               onclick="window.external.AddFavorite(document.location.href,document.title)">
                加入收藏</a> |

            <a href="../cantact.jsp">联系我们</a> |
            <a href="../business.jsp">合作伙伴</a> |
            <c:if test="${pageContext.request.remoteUser == null}">
                <a href="../login.jsp">[登录]</a>
            </c:if>
            <c:if test="${pageContext.request.remoteUser != null}">
                欢迎：
                <authz:authentication operation="username" />
                <a href="../user/password.jsp">修改密码</a>
                <a href="../logout.jsp">退出</a>
            </c:if>
        </td>
    </tr>
    <tr>
        <td>
            Copyright ? 2009 无锡大铕不锈钢有限公司 All rights reserved
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;技术支持:<a href="http://www.daoqun.net" target="_blank">到群软件</a>
            &nbsp;&nbsp;合作伙伴:<a href="http://bangqu.com" target="_blank">帮趣网 </a>
        </td>
    </tr>
    <tr>
        <td height="15"></td>
    </tr>
</table>