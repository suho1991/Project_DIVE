<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="/resources/css/findMyId.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/js/findMyId.js"></script>
</head>
<body>
	<nav class="navbar">
		<div class="navbar_logo">
			<i class="fas fa-universal-access"></i>
			<h1>DIVE</h1>
		</div>
		<ul class="navbar_menu">
			<li><a href="#">PRODUCT</a></li>
			<li><a href="./board.html">Q&A</a></li>
			<li><a
				onclick="window.open ( '../Project/chat/html.html', 'name', 'width = 400, height = 569, scrollbars=no, resizable=no, toolbars=no, menubar=no')">CHAT</a>
			</li>
			<li><a href="#">CORPORATION</a></li>
		</ul>
		<ul class="navbar_icons">
			<a href="./login.html">
				<li>Log in</li>
			</a>
			<a href="./signup.html">
				<li>Sign up</li>
			</a>
		</ul>
		<a href="#" class="navbar_toggle_btn"> <i class="fas fa-bars"></i>
		</a>
	</nav>


	<div class="choice-sector">
		<div class="choice-sector-content">
			<section class="choice">
				<h1>아이디 찾기</h1>
			</section>
			<section class="logo">
				<div class="logo_image">
					<a href="./index.html"><i class="fas fa-universal-access"
						style="cursor: pointer"></i></a>
				</div>
			</section>
			<form action="/user/findMyId" method="post" onsubmit="return checkAll()">
				<section class="customer">
					<div class="customer_inform">
						<div class="customer_inform_id_sector">
							<input type="text" class="customer_inform_id" name="name"
								placeholder="이름을 입력하세요.">
						</div>
						<div class="customer_inform_pass_sector">
							<input type="text" class="customer_inform_pass" name="email"
								placeholder="이메일 주소를 입력하세요.">
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div>
						<c:out value="고객님의 아이디는 ${user.userId} 입니다."></c:out>
					</div>
				</section>
				<section class="connect_sector">
					<div>
						<button type="submit" class="connect_btn">아이디 찾기</button>
					</div>
				</section>
			</form>
		</div>
	</div>
</body>
</html>