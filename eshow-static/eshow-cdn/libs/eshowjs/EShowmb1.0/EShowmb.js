var EShowmb = EShowmb || {};
EShowmb = {
  shar:function () {
    layer.open({
          type: 1
          ,content: '<div style="padding:20px;"><img onclick="layer.closeAll()" style="width:100%" src="./EShowmb/need/images/shartip.png"></div>'
          ,style: 'position:fixed; top:0; left:0; width: 100%; height: 200px;background:none; padding:10px 0; border:none;'
      });
  },

  //消息提示
    msg:function(msg){
      layer.open({
          content: msg
          ,skin: 'msg'
          ,time: 2 //2秒后自动关闭
        });
    },
    smsbtn:function (time,btn) {
        var handle;//事件柄
        $("#"+btn).attr("disabled", true);
        handle = setInterval(function() {
            if (time > 0) {
                time = time - 1;
                $("#"+btn).html(time+"秒");
            } else {
                $("#"+btn).html("获取");
                $("#"+btn).attr("disabled", false);
                clearInterval(handle);
            }
        }, 1000);
    }


}

$('body').on("click",'[data-href]',function(){
    var _url=$(this).attr("data-href");
    window.location.href=_url;
})
