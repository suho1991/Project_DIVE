document.addEventListener("DOMContentLoaded", function() { // jQuery
	// $(document).ready(function()
	// {}) 과 동일한 역할
	$('.move').on(
			'click',
			function(e) {
				e.preventDefault();
				$('#actionForm').append(
						"<input type='hidden' name='userId' value='"
								+ $(this).attr('href') + "'/>");
				$('#actionForm').attr("action", "/user/findById");
				$('#actionForm').submit();
			});
	$('#logoutBtn').on('click', function(e) {
    	e.preventDefault();
    	swal({
    		title: "DIVE",
    		text: "로그아웃 하시겠습니까?",
    		icon: "info",
    		closeOnClickOutside: false,
    		buttons: {
    			cancle: {
    				text: '로그아웃',
    				value: true,
    			},
    			confirm: {
    				text: '취소',
    				value: false,
    			}
    		}
    	}).then((result) => {
    		if(result) {
    			$('#logoutForm').submit();
    		} else {
    			history.go(0);
    		}
    	})
    });
});