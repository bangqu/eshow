if (getCookie("username") != null) {
    $("j_username").value = getCookie("username");
    $("j_password").focus();
} else {
    $("j_username").focus();
}

var expires = new Date();
    expires.setTime(expires.getTime() + 24 * 30 * 60 * 60 * 1000); // sets it for approx 30 days.
    setCookie("u",document.referrer,"<c:url value="/"/>");

function saveUsername(theForm) {
    var expires = new Date();
    expires.setTime(expires.getTime() + 24 * 30 * 60 * 60 * 1000); // sets it for approx 30 days.
    setCookie("username",theForm.j_username.value,expires,"<c:url value="/"/>");
}

function validateForm(form) {                                                               
    return validateRequired(form); 
} 

function passwordHint() {
    if ($("j_username").value.length == 0) {
        alert("用户名不能为空");
        $("j_username").focus();
    } else {
        location.href="passwordHint.html?username=" + $("j_username").value;     
    }
}

function required () { 
    this.aa = new Array("j_username", "用户名不能为空", new Function ("varName", " return this[varName];"));
    this.ab = new Array("j_password", "密码不能为空", new Function ("varName", " return this[varName];"));
}