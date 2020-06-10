<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In</title>
<script src="https://kit.fontawesome.com/a4b9f55ded.js"
	crossorigin="anonymous"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background-image: url(../../resources/images/dive.png);
	background-size: cover;
	background-repeat: no-repeat;
}

a:link {
	text-decoration: none;
}

input {
	outline: none;
}

.choice-sector {
	width: 350px;
	height: 100%;
	margin: 150px auto;
	background-color: white;
	border-radius: 10px;
	padding-bottom: 100px;
}

.choice-sector-content {
	text-align: center;
}

.login_btn, .signup_btn {
	width: 100px;
	height: 40px;
	margin-top: 80px;
	border-radius: 50px;
	background-color: white;
}

i {
	font-size: 50px;
	margin: 30px;
}

.customer_inform_id_sector, .customer_inform_pass_sector {
	padding: 10px;
}

.customer_inform_id, .customer_inform_pass {
	border: 0;
	border-bottom: 1px solid black;
	padding-bottom: 5px;
}

.connect_sector {
	margin-top: 50px;
}

.connect_btn {
	width: 200px;
	height: 50px;
	border-radius: 50px;
	background-color: white;
}
</style>
</head>
<body>
	<div class="choice-sector">
		<div class="choice-sector-content">
			<section class="choice">
				<div class="choice_btn">
					<span class="login_sector"> <a href="/"> <input type="button"
						class="login_btn" value="H O M E"></a>
					</span> <span class="signup_sector"> <a href="/user/signUp"> <input
							type="button" class="signup_btn" value="S I G N U P">
					</a>
					</span>
				</div>
			</section>
			<section class="logo">
				<div class="logo_image">
					<i class="fas fa-universal-access"></i>
				</div>
			</section>
			<section class="customer">
				<div class="customer_inform">
					<form action="/login" method="POST">
						<div class="customer_inform_id_sector">
							<input type="text" class="customer_inform_id" name="username"
								placeholder="아이디를 입력하세요.">
						</div>
						<div class="customer_inform_pass_sector">
							<input type="password" class="customer_inform_pass" name="password"
								placeholder="비밀번호를 입력하세요.">
						</div>
						<div>
							<input type="checkbox" name="remember-me" />Remember Me
						</div>
						<div>
							<input type="submit" class="connect_btn" value="Login">
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
				</div>
			</section>
			<h3>
				<c:out value="${error}"></c:out>
			</h3>
			<h3>
				<c:out value="${logout}"></c:out>
			</h3>
		</div>
	</div>
</body>
</html>