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