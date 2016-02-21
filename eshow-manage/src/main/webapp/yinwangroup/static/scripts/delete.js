
function deleteData(table, id) {
	if (window.confirm("\u771f\u7684\u9700\u8981\u5220\u9664\u5417?")) {
		var myMorph = new Fx.Morph(table + id, {"duration":1500});
		myMorph.start({"opacity":0, "background-color":"#90ee90"});
		var myVerticalSlide = new Fx.Slide(table + id);
		myVerticalSlide.slideOut();
		var url = table + "!delete.html?id=" + id;
		var req = new Request.HTML({url:url, onSuccess:function (html) {
			//show_ajax_message("success");
		}, onFailure:function () {
			//show_ajax_message("failure");
		}});
		req.send();
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

