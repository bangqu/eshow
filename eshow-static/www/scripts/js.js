$(function(){

   // 页码
$(".forum_pages ul li a").click(function() {
	$(this).css({'backgroundColor':'#c8282e','color':'#fff','border':'1px solid #c8282e'});	
});
if($($(".forum_pages ul li")[1]).children().css("backgroundColor")!="transparent"){
	$(".forum_pages ul .previous a").css("color","#77848e");
	$(".forum_pages ul .previous a").unbind();
}else if($($(".forum_pages ul li")[5]).children().css("backgroundColor")!="transparent"){
	$(".forum_pages ul .next a").css("color","#77848e");
	$(".forum_pages ul .next a").unbind();
}
//社区推荐数量
for (var i =0; i<$(".forum_recommed .dell").length; i++) {
	if($($(".forum_recommed .dell")[i]).text()!=0){
	$($(".forum_recommed")[i]).css("backgroundColor","#c9282e");
	$($(".forum_recommed")[i]).children().css("color","#fff");
	}	
}
//登录后的效果
var n=0;
n=document.title;
if(n=="EShow-讨论区（登录后）"){
	$(".forum_hd_right").show();
}else{
	$(".forum_hd_right").hide();
}
  
})

//社区
$(".doc_des_talk").hover(function(){
	$(this).children().children().eq(1).show();
	},function(){
	$(this).children().children().eq(1).hide();
    })
	
// $(".tip").click(function(){
// 	$(this).parent().parent().siblings().eq(1).show();
// 	})


function  closedmessage() {

	$("#successMessages").remove();
	$("#errorMessages").remove();
}


$(".hide_hd img").click(function(){
	$(this).parent().parent().hide();

    })

$(".tip").click(function(){
	$(".doc_hide_tip").show();
	var n=0;
	var m=0;
	n=$(this).offset().left - 354;
	m=$(this).offset().top - 32;
	$(".doc_hide_tip").css({'top':m,'left':n});
    })

$(".reply").click(function(){
	$(".answer").show();
	var n=0;
	var m=0;
	n=$(this).offset().left - 840;
	m=$(this).offset().top + 80;
	$(".answer").css({'top':m,'left':n});
    })
$(".reply1").click(function(){
	$(".forum_answer").show();
	var n=0;
	var m=0;
	n=$(this).offset().left - 620;
	m=$(this).offset().top + 84;
	$(".forum_answer").css({'top':m,'left':n});
    })


// 返回顶部
 	$(".zfs_toTop").click(function(){
		$('body,html').animate({"scrollTop": 0},600);
	});

	$(window).scroll(function(){
		if($(window).scrollTop()>2400){
			$(".zfs_toTop").fadeIn(200);
			}
		else
			{$(".zfs_toTop").fadeOut(200);}
		
		});
		
		$(".return_top").click(function(){
		$('body,html').animate({scrollTop:0},500);
	});


		$(".issue_up img").click(function() {
			$(".issue_down").show();
			var n=0;
			var m=0;
			n=$(this).offset().left - 148;
			m=$(this).offset().top + 30;	
			$(".issue_down").css({'top':m,'left':n})
		});

		$(".issue_down").hover(function(){
			$(".issue_down").show();
		},function(){
			$(".issue_down").hide();
		}
		)



	$(".issue_down li").click(function(){
		var n=0;
		n=$(this).text();
		$(".issue_caption").text(n);
	})













