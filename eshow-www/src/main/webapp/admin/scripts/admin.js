
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

function moveTable(table, id){

}
function keyup(len) {
	var length = $("inputBox").get("text").length;
	if (length > len) {
		alert(len);
		$("inputBox").set("text", $("inputBox").get("text").substring(0, len));
	}
}

