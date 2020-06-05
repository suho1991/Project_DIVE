<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<script src="https://kit.fontawesome.com/a4b9f55ded.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('.move')
						.on(
								'click',
								function(e) {
									e.preventDefault();
									$('#actionForm').append(
											"<input type='hidden' name='userId' value='"
													+ $(this).attr('href')
													+ "'/>");
									$('#actionForm').attr("action",
											"/user/deleteUser");
									$('#actionForm').submit();
								});
			});
</script>
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

.fieldlabel {
	padding: 0 0px 10px 80px;
	text-align: left;
}

.border {
	border: 0;
	border-bottom: 1px solid black;
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

.btnfield {
	padding-top: 50px;
}
</style>

</head>
<body>
	<div class="choice-sector">
		<div class="choice-sector-content">
			<section class="choice">
				<div class="choice_btn">
					<span class="login_sector"> <a href="/user/myPage"> <input
							type="button" class="login_btn" value="M Y P A G E">
					</a>
					</span> <span class="signup_sector"> <a href="/user/userLogout">
							<input type="button" class="login_btn" value="L O G O U T">
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
					<form action="/user/updateUser" method="post">
						<div class="form-group">
							<label for="userId">아이디</label> <input class="form-control"
								type="text" readonly='readonly' value='${user.userId}' name="userId">
						</div>
						<br />
						<div class="form-group">
							<label for="userName">이름</label> <input class="form-control"
								type="text" readonly='readonly' value='${user.name}' name="name">
						</div>
						<br />
						<div class="form-group">
							<label for="userName">닉네임</label> <input class="form-control"
								type="text" readonly='readonly' value='${user.nickName}' name="nickName">
						</div>
						<br />
						<div class="form-group">
							<label for="birthday">생년월일</label> <input class="form-control"
								type="text" readonly='readonly' value='${user.birthday}' name="birthday">
						</div>
						<br />
						<div class="form-group">
							<label>성별</label> <input class="form-control" type="text"
								readonly='readonly' value='${user.sex}' name="sex">
						</div>
						<br />
						<div class="form-group">
							<label for="address">주소</label> <input class="form-control"
								type="text" value='${user.address}' name="address">
						</div>
						<br />
						<div class="form-group">
							<label for="mPhone1">연락처</label> <input class="form-control"
								type="text" value='${user.phone}' name="phone">
						</div>
						<br />
						<div class="form-group">
							<label for="email01">이메일</label> <input class="form-control"
								type="text" value='${user.email}' name="email">
						</div>

						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

						<button type="submit" data-oper='modify'>정보 수정</button>
					</form>
				</div>
				<a href="/"><button class="cancle">HOME</button></a> <br />
			</section>
		</div>
	</div>
</body>
</html>