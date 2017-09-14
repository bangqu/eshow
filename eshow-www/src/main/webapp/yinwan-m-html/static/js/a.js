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
    if(_h.length<10){
        alert("内容完善中!");
    }else{
        window.location.href=_h;
    }

})

$(".sidebar .hd img").on("click",function () {
    window.location.href="index.jsp";
})