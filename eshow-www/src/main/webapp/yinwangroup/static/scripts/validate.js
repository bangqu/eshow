
/**
	I-media validate frame need DWR
	
	1.JHshLTrim(sString)  Judge left spaces
	2.JHshRTrim(sString)  Judge right spaces
	3.JHshTrim(sString)   Judge left and right spaces
	4.compareDate(date1, date2)  Judge date1 > date2
	5.compareDateEq(date1, date2) Judge date1 >= date2
	6.nonNull(field,msg)  Judge field is null
	7.IsInt(field, msg)
	8.IsSignedInt(field, msg)
	9.IsFloat(field, msg)
	10.IsSignedFloat(field, msg)
	11.IsChinese(field, msg)
	12.IsChar(field, msg)
	13.IsNumberChar(field, msg)
	14.IsEmail(field, msg)
*/
function JHshLTrim(sString) {
	var sStr, i, iStart, sResult = "";
	sStr = sString.split("");
	iStart = -1;
	for (i = 0; i < sStr.length; i++) {
		if (sStr[i] != " ") {
			iStart = i;
			break;
		}
	}
	if (iStart == -1) {
		return "";
	} else {
		return sString.substring(iStart);
	}
}

//
function JHshRTrim(sString) {
	var sStr, i, sResult = "", sTemp = "";
	if (sString.length == 0) {
		return "";
	}
	sStr = sString.split("");
	for (i = sStr.length - 1; i >= 0; i--) {
		sResult = sResult + sStr[i];
	}
	sTemp = JHshLTrim(sResult);
	if (sTemp == "") {
		return "";
	}
	sStr = sTemp.split("");
	sResult = "";
	for (i = sStr.length - 1; i >= 0; i--) {
		sResult = sResult + sStr[i];
	}
	return sResult;
} 

//
function JHshTrim(sString) {
	var strTmp;
	strTmp = JHshRTrim(JHshLTrim(sString));
	return strTmp;
}
function compareDate(date1, date2) {
	if (Date.parse(date1) > Date.parse(date2)) {
		return true;
	} else {
		return false;
	}
}
/**
* 2007/08/01 format
*/
function compareDateEq(date1, date2) {
	if (Date.parse(date1) >= Date.parse(date2)) {
		return true;
	} else {
		return false;
	}
}
function nonNull(field, msg) {
	if ($(field).value == "") {
		if (msg != "") {
			alert(msg);
		}
		$(field).focus();
		return false;
	}
	return true;
}
function IsInt(field, msg) {
	var re = /^\d+$/;
	var fieldvalue = $(field).value;
	if (!re.test(fieldvalue)) {
		alert(msg);
		$(field).focus();
		return false;
	}
	return true;
}
function IsSignedInt(field, msg) {
	var re = /^(\+|-)?\d+$/;
	var fieldvalue = $(field).value;
	if (!re.test(fieldvalue)) {
		alert(msg);
		$(field).focus();
		return false;
	}
	return true;
}

function IsFloat(field, msg) {
	var re = /^\d+(\.\d+)?$/;
	var fieldvalue = $(field).value;
	if (!re.test(fieldvalue)) {
		alert(msg);
		$(field).focus();
		return false;
	}
	return true;
}

function IsSignedFloat(field, msg) {
	var re = /^(\+|-)?\d+(\.\d+)?$/;
	var fieldvalue = $(field).value;
	if (!re.test(fieldvalue)) {
		alert(msg);
		$(field).focus();
		return false;
	}
	return true;
}

function IsChinese(field, msg) {
	var re = /[\u4E00-\u9FA5]|[\uFE30-\uFFA0]/gi;
	var fieldvalue = $(field).value;
	if (!re.test(fieldvalue)) {
		alert(msg);
		$(field).focus();
		return false;
	}
	return true;
}
function IsChar(field, msg) {
	var re = /^[a-zA-Z]+$/;
	var fieldvalue = $(field).value;
	if (!re.test(fieldvalue)) {
		alert(msg);
		$(field).focus();
		return false;
	}
	return true;
}
function IsNumberChar(field, msg) {
	var re = /^[a-zA-Z0-9]+$/;
	var fieldvalue = $(field).value;
	if (!re.test(fieldvalue)) {
		alert(msg);
		$(field).focus();
		return false;
	}
	return true;
}
function IsEmail(field, msg) {
	var re = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	var fieldvalue = $(field).value;
	if (!re.test(fieldvalue)) {
		alert(msg);
		$(field).focus();
		return false;
	}
	return true;
}

