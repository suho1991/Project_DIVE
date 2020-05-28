document.addEventListener("DOMContentLoaded", function () { // jQuery
															// $(document).ready(function()
															// {}) 과 동일한 역할
    const togglebtn = document.querySelector('.navbar_toggle_btn');
    const menu = document.querySelector('.navbar_menu');
    const icon = document.querySelector('.navbar_icons');

    togglebtn.addEventListener('click', () => {
        menu.classList.toggle('active');
        icon.classList.toggle('active');
    });
    
		$('.move').on('click', function(e) {
			e.preventDefault();
			$('#actionForm').append(
					"<input type='hidden' name='id' value='" + 
					$(this).attr('href') + "'/>");
			$('#actionForm').attr("action", "/user/findById");
			$('#actionForm').submit();
		});
});
