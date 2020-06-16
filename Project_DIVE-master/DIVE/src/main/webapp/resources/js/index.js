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
});

