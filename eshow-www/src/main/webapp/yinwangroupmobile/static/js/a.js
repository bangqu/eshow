/**
 * Created by lavsql on 2017/2/6.
 */
function showside() {
    $(".sidebar").show().animate({right:'0px'});
    $("body").attr("style","position:fixed;width:100%");
    $("body").animate({right:'280px'});
    $("body").append("<div class='bgl' onclick='closeside();' style='position:fixed;top:0;right:0;bottom: 0;left:0;z-index:40;background: #000;opacity:.6;'></div>");
}


function  closeside() {
    $(".sidebar").show().animate({right:'-280px'});
    $("body").animate({right:'0'}).css("position","");
    $(".bgl").remove();
}



$("[data-href]").on("click",function () {
     var _h=$(this).attr("data-href");
    if(_h.length<2){
        alert("内容完善中!");
    }else{
        window.location.href=_h;
    }

})

$(".sidebar .hd img").on("click",function () {
    window.location.href="index.jsp";
})



//手机版
function browserRedirect() {//判断设备
    var sUserAgent = navigator.userAgent.toLowerCase();
    var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
    var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
    var bIsMidp = sUserAgent.match(/midp/i) == "midp";
    var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
    var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
    var bIsAndroid = sUserAgent.match(/android/i) == "android";
    var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
    var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
    if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
        return "h5";
    }else {
        return "pc";
    }
}

if(!$.cookie('access_target')){
    if(browserRedirect()=="pc"){//pc访问，无cookie记录跳转到pc
        $.cookie('access_target', 'pc', { expires: 365, path: '/',domain:'.yinwangroup.com'});
        location.reload();
    }
}

if($.cookie('access_target')=='pc'){//跳转到cookie指定
    window.location.href="http://www.yinwangroup.com/";
}
