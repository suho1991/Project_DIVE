$(document).ready(function() {
	function checkAll() {
		if (!idCheck(form.customer_inform_id.value)) {
			form.customer_inform_id.focus();
			return false;
		}
		if (!passwordCheck(form.customer_inform_pass.value)) {
			return false;
		}
		
		return true;
	}

	

	function checkExistData(value, dataName) {
		if (value == "") {
			alert(dataName + " 입력해주세요!");
			return false;
		}
		return true;
	}

	function idCheck(customer_inform_id) {

		if (!checkExistData(customer_inform_id, "아이디를")) {
			form.customer_inform_id.focus();
			return false;
		}

		return true; // 확인이 완료되었을 때
	}

	function passwordCheck(customer_inform_pass) {

		if (!checkExistData(customer_inform_pass, "비밀번호를")) {
			form.customer_inform_pass.focus();
			return false;
		}

		return true; // 확인이 완료되었을 때
	}
});