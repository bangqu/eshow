<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="../common/path.jsp"%>
<head>
<%@ include file="../common/yunshipei.jsp"%>
<title>芯依福案例_到群软件</title>
<meta name="keywords" content="芯依福案例，到群软件" />
<meta name="description" content="芯依福案例，到群软件" />
<link rel="stylesheet" href="${daoqun}/styles/xinyifu.css" />
    <link rel="stylesheet" href="${daoqun}/styles/style.css"/>
</head>
<body>
	<c:set var="current">demo</c:set>
	<%@ include file="../common/header.jsp"%>
	<div class="wapper clearfix phone">
        <div class="wapper bor-bt">
            <div class="gallery-top">
                <p>
                    <img src="${daoqun}/images/xinyifu/d1.jpg">
                </p>
                <p>
                    <img src="${daoqun}/images/xinyifu/d2.jpg">
                </p>
                <p class="tex fontok yahei">《中国心血管病报告》指出，全国现有2.3亿心血管病患者，为了更好提供专业的医生团队服务与个人健康信息查询
                    。我们从功能架构和视觉表现入手，为芯依福重新设计Web与Pad客户端，为用户带来全新的使用体验。</p>
            </div>
        </div>
        <div class="wapper bor-bt yahei " id="ov1">
            <div class="grid2col clearfix">
                <div class="first-tex">
                    <h3 class="h3title">芯依福 for Web</h3>
                    <p class="fontok">
                        我们为国际领先的远程监测技术营运商，整体解决方案及终端产品的提供商，提供了具有前瞻性，简单易用，生动的Web界面设计。全新的设计不仅将其与竞争对手在界面操作层面拉开差距，同时帮助芯依福树立了独有的品牌个性。</p>
                </div>
                <div class="clast">
                    <figure>
                        <img id="fwb" src="${daoqun}/images/xinyifu/d3.png">
                    </figure>
                </div>
            </div>
        </div>
        <div class="wapper yahei" id="ha">
            <div class="gridone clearfix">
                <div class="first-tex">
                    <h3 class="h3title">芯依福 for Pad</h3>
                    <p class="fontok">
                        通过长期的用户调研，为了更好满足用户在移动端上使用需求，我们从交互与视觉入手，专业打造适合医生与病人的操作界面，我们发现“复杂抽象的统计数据给浏览带来不便。通过数据图形化的方式，令信息呈现既直观有效，更好地给用户带来便捷性，率先进入移动互联时代。</p>
                </div>
                <img id="xz" src="${daoqun}/images/xinyifu/d4.png">
            </div>
        </div>
	</div>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="${daoqun}/scripts/waypoints.min.js"></script>
    <script type="text/javascript">
        var Animate = {
            anm:function(over,heig,dm,dongzuo,time){
                $(over).waypoint( function(){
                    $(dm).addClass(dongzuo);
                    setTimeout("$('"+ dm +"').removeClass('"+ dongzuo +"');",time);
                },{offset: function() {
                    return +heig;
                }
                })
            }
        }
        Animate.anm("#ha","300","#xz","dhh","1000");
        Animate.anm("#ov1","200","#fwb","fadeInDown","6000");
    </script>
    <%@ include file="../common/footer.jsp"%>
</body>
