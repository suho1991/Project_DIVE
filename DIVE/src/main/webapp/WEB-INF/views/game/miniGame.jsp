<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<link rel="stylesheet" href="/resources/css/game.css">
    <title>가위바위보 게임</title>
</head>
	<body>
        <div class="tit">
            <p>가위바위보 게임!</p>
        </div>
        <div id="container">
            <div id="computer"></div>
            <br>
            <div class="rsp">
                <button id="rock" class="btn">바위</button>
                <button id="scissor" class="btn">가위</button>
                <button id="paper" class="btn">보</button>
            </div><br>
            <p> 내점수: &nbsp; <span id="score">0</span>점</p>
        </div>
		<script src="/resourcse/js/game.js"></script>
	</body>
</html>