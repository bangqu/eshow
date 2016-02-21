function $(id) { return document.getElementById(id); }
function moveElement(elementID,final_x,final_y,interval) {
  if (!document.getElementById) return false;
  if (!document.getElementById(elementID)) return false;
  var elem = document.getElementById(elementID);
  if (elem.movement) {
    clearTimeout(elem.movement);
  }
  if (!elem.style.left) {
    elem.style.left = "0px";
  }
  if (!elem.style.top) {
    elem.style.top = "0px";
  }
  var xpos = parseInt(elem.style.left);
  var ypos = parseInt(elem.style.top);
  if (xpos == final_x && ypos == final_y) {
		return true;
  }
  if (xpos < final_x) {
    var dist = Math.ceil((final_x - xpos)/10);
    xpos = xpos + dist;
  }
  if (xpos > final_x) {
    var dist = Math.ceil((xpos - final_x)/10);
    xpos = xpos - dist;
  }
  if (ypos < final_y) {
    var dist = Math.ceil((final_y - ypos)/10);
    ypos = ypos + dist;
  }
  if (ypos > final_y) {
    var dist = Math.ceil((ypos - final_y)/10);
    ypos = ypos - dist;
  }
  elem.style.left = xpos + "px";
  elem.style.top = ypos + "px";
  var repeat = "moveElement('"+elementID+"',"+final_x+","+final_y+","+interval+")";
  elem.movement = setTimeout(repeat,interval);
}
function classNormal(){
	var focusBtnList = $('focus_change_btn').getElementsByTagName('li');
	for(var i=0; i<focusBtnList.length; i++) {
		focusBtnList[i].className='';
	}
}
function focusChange() {
	var focusBtnList = $('focus_change_btn').getElementsByTagName('li');
		focusBtnList[0].onmouseover = function() {
			moveElement('focus_change_list',0,0,5);
			classNormal()
			focusBtnList[0].className='current'
		}
		focusBtnList[1].onmouseover = function() {
			moveElement('focus_change_list',-960,0,5);
			classNormal()
			focusBtnList[1].className='current'
		}
		focusBtnList[2].onmouseover = function() {
			moveElement('focus_change_list',-1920,0,5);
			classNormal()
			focusBtnList[2].className='current'
		}
		focusBtnList[3].onmouseover = function() {
			moveElement('focus_change_list',-2880,0,5);
			classNormal()
			focusBtnList[3].className='current'
		}
        focusBtnList[4].onmouseover = function() {
			moveElement('focus_change_list',-3840,0,5);
			classNormal()
			focusBtnList[4].className='current'
		}
}
setInterval('autoFocusChange()', 5000);
function autoFocusChange() {
	var focusBtnList = $('focus_change_btn').getElementsByTagName('li');
	for(var i=0; i<focusBtnList.length; i++) {
		if (focusBtnList[i].className == 'current') {
			var currentNum = i;
		}
	}
	if (currentNum==0 ){
		moveElement('focus_change_list',-960,0,5);
		classNormal()
		focusBtnList[1].className='current'
	}
	if (currentNum==1 ){
		moveElement('focus_change_list',-1920,0,5);
		classNormal()
		focusBtnList[2].className='current'
	}
	if (currentNum==2 ){
		moveElement('focus_change_list',-2880,0,5);
		classNormal()
		focusBtnList[3].className='current'
	}
    if (currentNum==3 ){
		moveElement('focus_change_list',-3840,0,5);
		classNormal()
		focusBtnList[4].className='current'
	}
	if (currentNum==4 ){
		moveElement('focus_change_list',0,0,5);
		classNormal()
		focusBtnList[0].className='current'
	}
}