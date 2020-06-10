document.addEventListener('DOMContentLoaded', function(){ 
    
    // 변수 지정
    let slideWrap = document.querySelector('.container'),
        slideContainer = document.querySelector('.slider-container'),
        slide = document.querySelectorAll('.slide'),
        navPrev = document.getElementById('prev'),
        slideHeight = 0,
        slideCount = slide.length,
        currentIndex = 0,
        pager = document.querySelector('.pager'),
        pagerBtn = document.querySelectorAll('.pager span'),
        navNext = document.getElementById('next');
        timer = undefined; 
                   
        //슬라이드의 높이 확인하여 부모의 높이로 지정하기 - 대상.offsetHeight
        for(let i = 0; i < slideCount ; i++){
           if(slideHeight < slide[i].offsetHeight){
                slideHeight = slide[i].offsetHeight;
           }
        }
        console.log(slideHeight);

        slideWrap.style.height = slideHeight +'px';
        slideContainer.style.height = slideHeight +'px';

        // 슬라이드가 있으면 가로로 배열하기
        for(let a = 0; a < slideCount; a++){
            slide[a].style.left = a * 100 + '%'; 
        }

       

        // 슬라이드 이동 함수 
        function goToSlide(idx){
            slideContainer.classList.add('animated');
            slideContainer.style.left = -100 * idx + '%';
            currentIndex = idx;         
        }//goToSlide

        goToSlide(0);

        // 버튼을 클릭하면 슬라이드 이동시키기
        navPrev.addEventListener('click',function(){            
            //goToSlide($currentIndex - 1);

            if(currentIndex == 0){
                //$navPrev.classList.add('disabled');
                goToSlide(slideCount - 1);
            }else{
                //$navPrev.classList.remove('disabled');
                goToSlide(currentIndex - 1);
            } 
        });

        navNext.addEventListener('click',function(){
            //goToSlide($currentIndex + 1);

           if(currentIndex == slideCount - 1){
               // $navNext.classList.add('disabled');
               goToSlide(0);
           }else{
               // $navNext.classList.remove('disabled');
               goToSlide(currentIndex + 1);
           }
        });

    //자동 슬라이드
    function startAutoSlide() {
        timer = setInterval(function() {
            let nextSlide = (currentIndex + 1) % slideCount;
            goToSlide(nextSlide);
        }, 4000);
    }

    startAutoSlide();

    function stopAutoSlide() {
        clearInterval(timer);
    }

    slideWrap.addEventListener('mouseenter', function() {
        stopAutoSlide();
    });
    slideWrap.addEventListener('mouseleave', function() {
        startAutoSlide();
    });


    for(let x=0; x < pagerBtn.length; x++) {
        pagerBtn[x].addEventListener('click', function() {
        //    let pagerNum = event.target.getAttribute(data-idx);
           let pagerNum = event.target.innerText -1;
            goToSlide(pagerNum);
        });
    }
    
   

});//DOMcontentloaded

