// Pseudo code for demonstrating interactions
$(function() { 
	///////////////////
	//     slide     //
	///////////////////
	//"slide": next buttom click
	$(".slide-next").click(function(){
		var target = $(".slide-content");
		var now = target.children().filter(".visible");
		var next = now.next();
		if (next.length === 0) {
			next = now.siblings().first();
		}
		next.addClass("visible");
		now.removeClass("visible");
		
		var pTarget = $(".slide-pager ul");
		var pNow = pTarget.children().filter(".current");
		var pNext = pNow.next();
		if (pNext.length === 0) {
			pNext = pNow.siblings().first();
		}
		pNext.addClass("current");
		pNow.removeClass("current");
	});

	//"slide": prev buttom click
	$(".slide-prev").click(function(){
		var target = $(".slide-content");
		var now = target.children().filter(".visible");
		var prev = now.prev();
		if (prev.length === 0) {
			prev = now.siblings().last();
		}
		prev.addClass("visible");
		now.removeClass("visible");

		var pTarget = $(".slide-pager ul");
		var pNow = pTarget.children().filter(".current");
		var pPrev = pNow.prev();
		if (pPrev.length === 0) {
			pPrev = pNow.siblings().last();
		}
		pPrev.addClass("current");
		pNow.removeClass("current");
	});

	//"slide": slide pager click (the little white dots)
	$(".slide-pager li").click(function(){
		var order = $(".slide-pager li").index(this);
		$(".slide-pager li").removeClass("current");
		$(this).addClass("current");
		$(".slide-item").removeClass("visible");
		$(".slide-item").eq(order).addClass("visible");
	});
});

//"slide": auto-switch
$(document).ready(function () {

 $(".lang-p").hover(function(){
	$(this).find(".lang-i").show();
 },function(){
 $(this).find(".lang-i").hide();})
 
 
	$(".slide-content").each(function(){
		var len = $(this).attr("timer");
		var target = $(this);
		var pTarget = $(".slide-pager ul");

		setInterval(function(){
			var now = target.children().filter(".visible");
			var next = now.next();
			if (next.length === 0) {
				next = now.siblings().first();
			}
			next.addClass("visible");
			now.removeClass("visible");

			var pNow = pTarget.children().filter(".current");
			var pNext = pNow.next();
			if (pNext.length === 0) {
				pNext = pNow.siblings().first();
			}
			pNext.addClass("current");
			pNow.removeClass("current");
		}, len);
	});
});
 