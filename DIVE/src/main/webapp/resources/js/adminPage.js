$(document).ready(function() {
	$('.move').on('click', function(e) {
		e.preventDefault();
		$('#actionForm').append(
				"<input type='hidden' name='userId' value='" + 
				$(this).attr('href') + "'/>");
		$('#actionForm').attr("action", "/user/findById");
		$('#actionForm').submit();
	});
	
	$('.requestBtn').on('click', function(e) {
		e.preventDefault();
		if($('.radio[checked="checked"]')) {
			$('#actionFrom').append(
					"<input type='hidden' name='enabled' value='" + 
					$('.radio[value]').val() + "'/>");
			$('#actionForm').append(
					"<input type='hidden' name='userId' value='" + 
					$(this).prev().val() + "'/>");
			$('#actionFrom').submit();
		} else {
			return;
		}
	})
});
