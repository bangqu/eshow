$(document).ready(function(){ 
	 	$(".nav li").hover(function () { 
		    $(this).parent(".nav").find(".active").removeClass("active").addClass("oo");
		}, function () { 
		    $(this).parent(".nav").find(".oo").addClass("active");
		}) 

		//tab切换
		$("div [id^='tabcc_']").each(
 		 	function(i,ob){
			  $(ob).find('a').bind
			  ('mouseover',function(){
			   $(ob).find('a').removeClass('active');
			   $(this).addClass('active');
			   var cid=$(this).attr('cid'); 
			   $(ob).parent().siblings('div').hide();
			   $(ob).parent().siblings("div [id='courseList_"+cid+"']").show();
			  });
			});

});




//电脑版
function browserRedirect() {
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
    if(browserRedirect()=="h5"){
        $.cookie('access_target', 'h5', { expires: 365, path: '/',domain:'.yinwangroup.com'});
        location.reload();
    }
}

if($.cookie('access_target')=='h5'){
    window.location.href="http://m.yinwangroup.com/";
}

