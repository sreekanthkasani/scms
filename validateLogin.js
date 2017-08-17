var inputEmailFlag = false;
var inputPwdFlag = false;

function validateLoginForm() {
	var valueEmail = $("#username").val(),
			valuePwd = $("#password").val(),
			atPos = valueEmail.indexOf("@"),
			dotPos = valueEmail.lastIndexOf(".");

	if (valueEmail === "") {
		$("#let1").html("Oops, you didn't enter your email");
		$("input[name=username]").css("border-bottom","2px solid #f44336");
		inputEmailFlag = true;
		return false;
	} else if ((atPos < 1) || (dotPos < (atPos + 2)) || ((dotPos + 2) >= valueEmail.length)) {
		$("#let1").html("Something looks funny with that email");
		$("input[name=username]").css("border-bottom","2px solid #f44336");
		inputEmailFlag = true;
		return false;
	} else if (valuePwd === "") {
		$("#let2").html("You didn't enter your password");
		$("input[name=password]").css("border-bottom","2px solid #f44336");
		inputPwdFlag = true;
		return false;
	} else {
		$("#loginMessage").html("Your login validates!<br>This is for demonstration purposes only.<br>Form doesn't actually submit.");
		return false;
	}
}

$("input[name=username]").focus(function() {
	$("input[name=username]").css("border-bottom","2px solid #757575");
	$("input[name=password]").css("border-bottom","2px solid #757575");
	$("#let1").html(" ");
	$("#let2").html(" ");
  if ((inputEmailFlag === true) || (inputPwdFlag === true)) {
		inputEmailFlag = false;
		inputPwdFlag = false;
	}
});

$("input[name=password]").focus(function() {
	$("input[name=username]").css("border-bottom","2px solid #757575");
	$("input[name=password]").css("border-bottom","2px solid #757575");
	$("#let1").html(" ");
	$("#let2").html(" ");
  if ((inputEmailFlag === true) || (inputPwdFlag === true)) {
		inputEmailFlag = false;
		inputPwdFlag = false;
	}
});