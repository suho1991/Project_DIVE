$(document).ready(
		function() {
			$('.modify').on(
					'click',
					function(e) {
						e.preventDefault();
						$('#actionForm').append(
								"<input type='hidden' name='userId' value='"
										+ $(this).attr('href') + "'/>");
						$('#actionForm').attr("action", "/user/updateUser");
						$('#actionForm').submit();
					});
		});