function collection(type, groupId, id) {
	new Ajax("userGroup!save.html?groupId=" + groupId + "&type=" + escape(escape(type))+ "&userGroup.isCollection=true", {method:"post", update:$(id), onComplete:function () {
		if (this.response.text.length > 20) {
			//$("infoCollection").innerHTML = type + "\u5931\u8d25";
			$(id).innerHTML = type + "失败";
		} else {
			$(id).innerHTML = type + "\u6210\u529f";
		}
         //Nifty("div#"+'req_count'+c.id);
	}}).request();
}

function info(type, groupId, id) {
	new Ajax("info!save.html?groupId=" + groupId + "&info.type=" + escape(escape(type)), {method:"post", update:$(id), onComplete:function () {
		if (this.response.text.length > 20) {
			//$("infoCollection").innerHTML = type + "";
			$(id).innerHTML = type + "失败";
		} else {
			$(id).innerHTML = type + "成功";
		}
         //Nifty("div#"+'req_count'+c.id);
	}}).request();
}

function infoMiniGroup(type, groupId, id) {
	new Ajax("info!save.html?groupId=" + groupId + "&info.type=" + escape(escape(type)), {method:"post", update:$(id), onComplete:function () {
		if (this.response.text.length > 20) {
			//$("infoCollection").innerHTML = type + "";
			$(id).innerHTML = type + "失败";
		} else {
			$(id).innerHTML = type + "成功";
		}
         //Nifty("div#"+'req_count'+c.id);
	}}).request();
}