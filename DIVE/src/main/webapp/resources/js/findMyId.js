$(document).ready(function() {
	$('#findMyIdBtn').on('click', function(e) {
		e.preventDefault();
		if ($(".customer_inform_name").val() === "") {
			swal("DIVE", "아이디를 입력해주세요.", "info");
			$(".customer_inform_name").focus();
		} else if ($(".customer_inform_email").val() === "") {
			swal("DIVE", "패스워드를 입력해주세요", "info");
			$(".customer_inform_email").focus();
		} else {
			$("#findMyIdForm").submit();
		}
	});
});
