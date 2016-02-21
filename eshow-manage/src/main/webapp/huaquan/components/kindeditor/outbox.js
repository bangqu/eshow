var msgIds = "";
var count = 0;
var allSelected = false;

//复选按钮，批量选择要删除的消息
function checkClicked(id)
{
   var checkBox = window.document.getElementById(id);
   if(checkBox.checked == true)
   {
    msgIds = msgIds + " " + id ;
    count++;
   }
   else
   {
    msgIds = msgIds.replace(' '+id,'');
    count--;
   }
}

//显示消息完整内容
function showMsgInfo(index)
{
    $("#showLink"+index).hide();
    $("#hideLink"+index).show();
    $("#partMsg"+index).hide();
    $("#fullMsg"+index).show("normal");   
    //scroller(document.getElementById("fullMsg"+index),100,0.5);
}
//隐藏完整内容
function hideMsgInfo(index)
{
    $("#hideLink"+index).hide();
    $("#showLink"+index).show();
    $("#fullMsg"+index).hide("normal",function(){$("#partMsg"+index).show();});   
    //scroller(document.getElementById("partMsg"+index),100,0.5);
}
function DeleteSelectedMsgs()
{
    if(msgIds.length > 0 && count > 0)
    {
       var page = $("#currentPage").val();
       OpenDialogBoxByText("你确定要删除选中的" + count + "条消息么？", "删除消息", 350, 
          function() {
            $("#idBoxConfirm").bind("click", function() {
            $.post("/Message/DeleteOutboxMsg",{msgIdList:msgIds.slice(1)},
               function(data) {
                  location="/Message/Outbox?pageIndex="+page;
               });
           });
       });       
     }
}
function DeleteMsg(msgId)
{
    var page = $("#currentPage").val();
    OpenDialogBoxByText("你确定要删除该消息么？", "删除消息", 350, 
       function() {
         $("#idBoxConfirm").bind("click", function() {
            $.post("/Message/DeleteOutboxMsg",{msgIdList:msgId},
            function(data) {
               location="/Message/Outbox?pageIndex="+page;
            });
        });
    });   
}
//清空收件箱，弹出提示框
function cleanUp()
{
    OpenDialogBoxByText("发件箱里的所有信息都将被删除，你确定么？","清空发件箱",400,
         function() {
        $("#idBoxConfirm").bind("click", cleanUpConfirm);
      });
}
function cleanUpConfirm()
{
    window.location="/Message/ClearupOutbox";
}
function ViewMessage(msgId, reply)
{
    var url = "/Message/ViewMessage?MsgId=" + msgId;
    if (reply) url += "&action=reply";
    window.location = url;
}
function SelectAll()
{
    var chkarry = $('input[type="checkbox"]');
    msgIds = "";
    count = 0;
    chkarry.each(function() {
        if (allSelected == false)
        {
            $(this).attr("checked", "true");
            checkClicked($(this).attr("id"));
        }
        else
        {
             $(this).removeAttr("checked");
        }
    });
    allSelected = !allSelected;
}