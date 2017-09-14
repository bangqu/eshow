	$('#star_calendar').cxCalendar();
            $('#end_calendar').cxCalendar();
			function click_down(upName,downName){
			  $(upName).click(function(e) {
			    $(downName).show();
			    $(downName).siblings().hide();
			    var t=0;
			    var l=0;
			    t=$(this).offset().top +36;
			    l=$(this).offset().left;
			    $(downName).css({'top':t,'left':l});
			    $(document).click(function(){
			        $(downName).hide();
			        });
			        e.stopPropagation();
			  });
			};
			function getTxt(bTxt,aTxt,documentId){
			  $(bTxt).click(function(e){
			      var txt="";
			      var n=0;
			      txt=$(this).text();
			      $(this).parent().hide();
			      // n=$(this).attr("pr");
			      // $("#"+documentId).val(n);
			      // $(aTxt).val(txt);
			      $(aTxt).text(txt);
			      e.stopPropagation();
			  });
			};
			click_down(".audite_up",".audite_down");
			getTxt(".down_li_active",".audite_up","");