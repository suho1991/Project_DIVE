const start = document.querySelector('.start');
            
        start.addEventListener('click', ()=> {
            // 1 ~ 45 까지 공 생성
            const candidate = Array(45).fill().map((v, i) => { return i + 1});  
            // 생성된 공이 랜덤하게 뽑혀 들어갈 자리
            const shuffle = []; 

            // 생성된 공을 랜덤하게 뽑는 중
            while(candidate.length > 8) { 
                const random = Math.floor(Math.random( ) * candidate.length);
                const spliceArray = candidate.splice(random, 1);
                const value = spliceArray[0];
                shuffle.push(value);
            }
            console.log(shuffle);
            const winBalls = shuffle.slice(0, 6).sort((p, c) => { return  p - c}); // 뽑힌 공들 중에 6개를 뽑아 오름차순으로 정열
            const bonus = shuffle[6]; // 보너스 공도 뽑아냄
            console.log(winBalls);
            console.log(bonus);

            // 랜덤하게 뽑힌 공들의 색을 입힘
            function colorize(number, tag) {  
                if(number <= 10) {
                    tag.style.backgroundColor = 'red';
                    tag.style.color = 'white';
                } else if(number <= 20) {
                    tag.style.backgroundColor = 'orange';
                } else if(number <= 30) {
                    tag.style.backgroundColor = 'yellow';
                } else if(number <= 40) {
                    tag.style.backgroundColor = 'blue';
                    tag.style.color = 'white';
                } else {
                    tag.style.backgroundColor = 'green';
                    tag.style.color = 'white';
                }
            }

            // 랜덤하게 뽑힌 공들을 result tag 에 넣어줌
            const resultTag = document.querySelector('#result');
            for(let i =0; i < 6; i++) {
                setTimeout(() => {
                    const ball = document.createElement('div');
                    colorize(winBalls[i], ball);
                    ball.className = 'ball';
                    ball.textContent = winBalls[i];
                    resultTag.appendChild(ball);
                }, 1000 * (i + 1));
            }

            // 뽑힌 보너스 공을 bonus tag 에 넣어줌
            const bonusTag = document.querySelector('#bonus');
            setTimeout(() => {
                const bonusBall = document.createElement('div');
                colorize(bonus, bonusBall);
                bonusBall.className = 'ball';
                bonusBall.textContent = bonus;
                bonusTag.appendChild(bonusBall);
            }, 7000);
        });
