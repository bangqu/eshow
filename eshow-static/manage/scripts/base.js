$.ajaxSetup({
	global : true,
	cache : false
});// 不要cache

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

function state(msg,table,id,state) {
    if (window.confirm(msg)) {
        var url = eshow.ctx + "/" + table + "!state.action?id=" + id+"&"+table+".state="+state;
        $.get(url, function(data) {
            $('#' + table + id).slideUp("slow");
        });
        return true;
    }
    return false;
}


//用户的启用禁用
function userEnabled(msg, table, id) {
    if (window.confirm(msg)) {
        var url = eshow.ctx + "/" + table + "!userEnabled.action?id=" + id;
        $.get(url, function(data) {
            $('#' + table + id).slideUp("slow");
        });
        return true;
    }
    return false;
}


jQuery.eshow = {
    sidenav:function(param) {
       // $("#"+param).find()
    }
};