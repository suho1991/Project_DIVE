const togglebtn = document.querySelector('.navbar_toggle_btn');
        const menu = document.querySelector('.navbar_menu');
        const icon = document.querySelector('.navbar_icons');
 
        togglebtn.addEventListener('click', () => {
            menu.classList.toggle('active');
            icon.classList.toggle('active');
        });