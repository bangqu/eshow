$.ajaxSetup({
	global : true,
	cache : false
});// 不要cache

function keywordDelete(msg, table, id) {
    if (window.confirm(msg)) {
        var url = eshow.ctx + "/" + table + "!delete.action?id=" + id;
        $.get(url, function(data) {
            location.reload();
        });
        return true;
    }
    return false;
}

function deleteData(msg, table, id) {
    if (window.confirm(msg)) {
        var url = eshow.ctx + "/" + table + "!delete.action?id=" + id;
        $.get(url, function(data) {
            $('#' + table + id).slideUp("slow");
        });
        return true;
    }
    return false;
}

function audit(msg, table, id) {
    if (window.confirm(msg)) {
        var url = eshow.ctx + "/" + table + "!audit.action?id=" + id;
        $.get(url, function(data) {
            $('#' + table + id).slideUp("slow");
        });
        return true;
    }
    return false;
}

function state(msg, table, id,state,content) {
    if (window.confirm(msg)) {
        var url = eshow.ctx + "/" + table + "!state.action?id=" + id+"&"+table+".state="+state+"&content="+content;
        $.get(url, function(data) {
            $('#' + table + id).slideUp("slow");
        });
        return true;
    }
    return false;
}

function successed(msg, table, id) {
    if (window.confirm(msg)) {
        var url = eshow.ctx + "/" + table + "!successed.action?id=" + id;
        $.get(url, function(data) {
            location.reload();
        });
        return true;
    }
    return false;
}

function failed(msg, table, id) {
    if (window.confirm(msg)) {
        var url = eshow.ctx + "/" + table + "!failed.action?id=" + id;
        $.get(url, function(data) {
            location.reload();
        });
        return true;
    }
    return false;
}

$(document).ready(function() {

	 $('a[data-toggle]').tooltip();
	 $('span[data-toggle]').tooltip(); 


	// 放弃
	$("#giveup").on('click', function() {
		if (window.confirm("确定放弃吗？")) {
			window.history.back();
		}
	});

	$("#add-service").on('click', function() {
		var s_bll = parseInt($(".s-bll").text());
		var okpay = parseInt($(".okpay").text());
		var ems = s_bll * 0.06 + s_bll + 6;
		if ($(this).attr("checked")) {
			$(".bill-box").show();
			$(".okpay").html(ems);
		} else {
			$(".bill-box").hide();
			$(".okpay").html(s_bll);
		}
	});

	/* service */
	$(".adid").change(function() {
		var total = 0;
		var arr = null;
		arr = $("table input[type=checkbox]:checked").map(function() {
			var _parent = $(this).parents("tr");
			var id = parseInt(_parent.find("#ids").val());
			var price = parseInt(_parent.find("#price").val());
			var month = parseInt(_parent.find("#month").val());
			var an = parseInt(_parent.find("#an").val());
			var all = price * month * an; 
			return [ all ];
		}).get();
		$.each(arr, function(key, val) {
			total += val;
		});
		$(".s-bll").text(total);
		var newmoney=total * 0.06 + total + 6; 
		if($("#addbill").attr("checked")){
				$(".okpay").text(newmoney);
			}else{
				$(".okpay").text(total);
			}
		$("#total").val(total);
		if(total>0){$("#paybt").removeAttr("disabled");}else{
			$("#paybt").attr("disabled", "disabled");
			$("#addbill").attr("checked",false);
			$(".bill-box").hide();
			$(".okpay").html("0");
		}
	});

	$("#addbill").on('click', function() { 
		var s_bll = parseInt($(".s-bll").text());
		var okpay = parseInt($(".okpay").text());
		var ems = s_bll * 0.06 + s_bll + 6; 
		var tabcheck=$("table input[type=checkbox]:checked");
		if(tabcheck.attr("checked")){
				if ($(this).attr("checked")) {
				$(".bill-box").show();
				$(".okpay").html(ems);
				$("#total").val(ems); 
			} else {
				$(".bill-box").hide();
				$(".okpay").html(s_bll);
				$("#total").val(s_bll); 
			}
		}else{ 
			alert("您还未添加任何增值服务！");
		   $(this).attr("checked",false)}
		
	});

	$("#del").on('click', function() {
		$(this).parents(".fileimg").html("");
	}); 


});
function upp(){ 
		$(".bt-lod").on('click', function() {
				$(this).addClass("disabled");
				$(this).html("正在提交...");
			})
		}
function normal(id, times) {
	var obj = $("#" + id);
	obj.css("background-color", "#FFF");
	if (times < 0) {
		return;
	}
	times = times - 1;
	setTimeout("error('" + id + "'," + times + ")", 100);
}

function error(id, times) {
	var obj = $("#" + id);
	obj.css("background-color", "#F6CECE");
	times = times - 1;
	setTimeout("normal('" + id + "'," + times + ")", 100);
	obj[0].focus();
}

function upgradeData(msg, table, id) {
    if (window.confirm(msg)) {
        var url = yinwan_company.ctx + "/" + table + "!upgrade.action?id=" + id;
        $.get(url, function(data) {
            $('#' + table + id).slideUp("slow");
        });
        return true;
    }
    return false;
}

function stateData(msg, table, id) {
    if (window.confirm(msg)) {
        var url = yinwan_company.ctx + "/" + table + "!state.action?id=" + id;
        $.get(url, function(data) {
            $('#' + table + id).slideUp("slow");
        });
        return true;
    }
    return false;
}

function changeType(msg, table, id) {
	if (window.confirm(msg)) {
		var url = yinwan_company.ctx + "/" + table + "!delete.action?id=" + id;
		$.get(url, function(data) {
			window.location.reload();
		});
		return true;
	}
	return false;
}

function changeEnabled(msg, table, id,flag) {
	if (window.confirm(msg)) {
		enabled(table,id,flag);
	}
}

function call_back(table,ids){
	var hide = function(table,_id){
		$('#' + table + _id).slideUp("slow");
	};
	if(ids.indexOf(",")!= -1){
		var arr = ids.split(",");
		for(var i=0;i<arr.length;i++){
			var _id = arr[i];
			if(_id != ''){
				hide(table,_id);
			}		
		}
	}else{
		hide(table,id);
	}
}

function changeState(msg,table,ids,state){
	if (window.confirm(msg)) {
		var url = eshow.ctx+"/"+table+"!change.action?ids=" + ids+"&state="+state;
		 $.ajax({
   			 type:'POST',
   			 url:url,
   			 cache:false,
   			 dataType:'json',
   			 success:function(result){
   				call_back(table,ids);
   		  	 }
		});
	}
}

function enabled(table,ids,flag){
	var url = eshow.ctx + "/" + table + "!enabled.action?ids=" + ids+"&flag="+flag;
	$.get(url, function(data) {
		call_back(table,id);
	});
}

function close(id) {
	$("#" + id).hide();
}

function jobadd() {
	$("#tip01").show("slow");
	$("#tip01").delay(3000).fadeOut("slow");
}


function checkAll(obj){
	var select= function(flag){
    	$('input[name=checkbox]').each(function(){
    		$(this).attr("checked",flag);
    	});
    };	    
    var flag = $(obj).attr("checked") == 'checked'?true:false;
    select(flag);
}

function getChecked(){
	var ids = "";
	$("input[name=checkbox]:checked").each(function(){
        var sid = $(this).val();
        ids = ids + sid+ ",";
    });
	return ids;
}

function enabledAll(msg,table,flag){
	var ids = getChecked();
	if(ids != ""){
		changeEnabled(msg,table, ids,flag);
	}
}

function stateAll(msg,table,flag){
	var ids = getChecked();
	if(ids != ""){
		changeState(msg,table, ids,flag);
	}
}



