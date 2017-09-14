<script>
  //非空校验  返回true：空
  function _isEmpty(str){
    return str.replace(/(^s*)|(s*$)/g, "").length==0 ;
  }
  //删除左右两端的空格??
  function trim(str){
    return str.replace(/(^s*)|(s*$)/g, "");
  }
  //随机颜色
  function getRandomColor(obj) {
    var str_start = "list_icon list_icon_";
    var a = ["red", "blue", "orange", "green", "lightgreen", "lightblue"];
    obj.each(function (key) {
      $(this).attr("class", str_start + a[(key + 1) % 6]);
    })
  }
  /*获得焦点、失去焦点时placeholder的显示、隐藏*/
  function focusFunc(obj,ph_temp){
    if(obj.value==""){
      ph_temp[0] = obj.placeholder;
      obj.placeholder="";
      obj.style.color='#163547';
    }
  }
  function blurFunc(obj,ph_temp){
    if(obj.value==""){
      obj.placeholder=ph_temp[0];
      obj.style.color='#77848e';
    }
  }


</script>
