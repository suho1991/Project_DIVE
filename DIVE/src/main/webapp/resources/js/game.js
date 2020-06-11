const computerTag = document.querySelector('#computer');
        computerTag.style.background = 'url("rsp.jpeg") 0 0';
        
        let computerChoice = 'rock';

        // 바위, 가위, 보 변수의 그룹화
        const rspCoord = {
            rock: '0',  // 바위
            scissor: '-248px',  // 가위
            paper: '-520px',  // 보
        }
        
        const intervalMaker = () => {
            return setInterval(() => {
                if(computerChoice === 'rock') {
                    computerChoice = 'scissor';
                } else if(computerChoice === 'scissor') {
                    computerChoice = 'paper';
                } else if(computerChoice === 'paper') {
                    computerChoice = 'rock';
                }
                computerTag.style.background = `url("rsp.jpeg") ${rspCoord[computerChoice]} 0`;
            }, 100);
        }; 
        let intervalID = intervalMaker();

        const rockTag = document.querySelector('#rock'),
              scissorTag = document.querySelector('#scissor'),
              paperTag = document.querySelector('#paper');


        // 중복을 제거할수 있는 규칙을 만든다  
        // 가위: 1, 바위: 0, 보:-1
        // 나/컴퓨터  가위  바위  보
        //      가위   0    1    2
        //      바위  -1    0    1
        //      보    -2   -1    0

        const score = {
            rock: 0,
            scissor: 1,
            paper: -1,
        }

        // 고차함수 (함수가 다른 함수를 리턴한다)
        const clickButton = (myChoice) => {
            return () => {
                clearInterval(intervalID);
                const myScore = score[myChoice];
                const computerScore = score[computerChoice];
                const diff = myScore - computerScore;
                const scoreTag = document.querySelector('#score');
                let accScore = Number(scoreTag.textContent);

                if(diff === 2 || diff === -1) {
                    accScore += 1;
                } else if(diff === -2 || diff === 1) {
                    accScore -= 1;
                }
                scoreTag.textContent = accScore;

                setTimeout(() => {
                    intervalID = intervalMaker();
                }, 1000);
            };
        };

        rockTag.addEventListener('click', clickButton('rock'));
        scissorTag.addEventListener('click', clickButton('scissor'));
        paperTag.addEventListener('click', clickButton('paper'));
        