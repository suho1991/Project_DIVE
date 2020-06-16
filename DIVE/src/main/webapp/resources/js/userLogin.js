$(document).ready(function() {
	$('#loginBtn').on('click', function(e) {
		e.preventDefault();
		if ($(".customer_inform_id").val() === "") {
			swal("DIVE", "아이디를 입력해주세요.", "info");
			$(".customer_inform_id").focus();
		} else if ($(".customer_inform_pass").val() === "") {
			swal("DIVE", "패스워드를 입력해주세요", "info");
			$(".customer_inform_pass").focus();
		} else {
			$("#loginForm").submit();
		}
	});
});
