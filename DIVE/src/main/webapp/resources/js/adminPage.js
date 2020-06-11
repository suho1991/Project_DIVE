$(document).ready(
			function() {
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
			});