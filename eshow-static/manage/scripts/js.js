

// 内容部分，高度问题
     function autoHeight(contH,leftH) {
        var windowHeight=0;
        var contentHeight=0;
        windowHeight = $(window).innerHeight();
        contentHeight = $(contH).height() - 60;
        if (windowHeight > contentHeight) {
            $(leftH).css('height',windowHeight);
        } else {
            $(leftH).css('height',contentHeight);
        }
    };
    autoHeight(".main",".home_sider");
    //个人头像
    $(".home_avatar").click(function(e){
        $(".home_avatar_down").toggle();
        $(document).click(function () {
                $(".home_avatar_down").hide();
        });
         e.stopPropagation();
    });
    // 左侧菜单
    $(".hover_li").click(function () {
        $(this).siblings().toggle();
        var narrow=$(this).children('li:last').find('.ar_start');
        if(narrow.hasClass('on')){
           narrow.removeClass('on');
           narrow.siblings().addClass('on');
        }else{
            narrow.addClass('on');
            narrow.siblings().removeClass('on');
        }
    });
    
     $(".hide_delete i").click(function(event) {
        $(this).parent().parent().hide();

 });
     $(".filter").click(function(){
        var select_span=$(this).children(".narrow:first");
        if(select_span.hasClass('on')){
           select_span.removeClass('on');
           select_span.siblings().addClass('on');
        }else{
            select_span.addClass('on');
            select_span.siblings().removeClass('on');
        }
     });






    






























