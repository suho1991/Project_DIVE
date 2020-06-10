<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
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
					<span class="login_sector"> <a href="/"> <input
							type="button" class="login_btn" value="H O M E">
					</a>
					</span> <span class="signup_sector"> <input type="button"
						class="signup_btn" value="S I G N U P">
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


					<form name="form" action="/user/signUp" method="post">
						<!-- onsubmit="return checkAll()" -->

						<h1>아이디/비밀번호 입력</h1>
						<br />
						<div class="fieldlabel">
							<div class="test">
								<label for="userId">아이디</label>
							</div>
							<input class="border" type="text" id="userId" name="userId"
								maxlength="20" value="">
						</div>
						<div class="fieldlabel">
							<div>
								<label for="userPw">비밀번호</label>
							</div>
							<input class="border" type="password" id="userPw" name="password"
								maxlength="20" autocomplete="off">
						</div>
						<div class="fieldlabel">
							<div>
								<label for="userPwCheck">비밀번호 확인</label>
							</div>
							<input class="border" type="password" id="userPwCheck"
								name="userPwCheck" maxlength="20" autocomplete="off">
						</div>
						<br />
						<h1>회원정보 입력</h1>
						<br />
						<div class="fieldlabel">
							<div>
								<label for="userName">이름</label>
							</div>
							<input class="border" type="text" id="userName" name="name"
								maxlength="20" value="">
						</div>
						<div class="fieldlabel">
							<div>
								<label for="userName">닉네임</label>
							</div>
							<input class="border" type="text" id="userName" name="nickName"
								maxlength="20" value="">
						</div>
						<div class="fieldlabel">
							<div>
								<label for="birthday">생년월일</label>
							</div>
							<input class="border" type="text" " name="birthday" maxlength="8"
								placeholder="ex)19900314" size="15">
						</div>
						<div class="fieldlabel">
							<label>성별</label> <input type="radio" name="sex" value='M'
								alt="남자" checked>남자 <input type="radio" name="sex"
								value='F' alt="여자">여자
						</div>
						<div class="fieldlabel">
							<div>
								<label for="address">주소</label>
							</div>
							<input class="border" type="text" size="30" name="address" />
						</div>
						<div class="fieldlabel">
							<div>
								<label for="mPhone1">연락처</label>
							</div>
							<input class="border" id="mPhone2" name="phone" type="text"
								value="" size="20" maxlength="11" autocomplete="off"
								placeholder="'-'없이 번호만 입력해주세요">
						</div>
						<div class="fieldlabel">
							<div>
								<label for="email01">이메일</label>
							</div>
							<input class="border" type="text" id="email01" name="email"
								size="20" maxlength="20" value="" autocomplete="off"
								placeholder="example@co.kr">
						</div>
						<div class="btnfield">
							<button type="submit" class="connect_btn">SignUp</button>
						</div>

						<!-- 스프링 시큐리티 사용 시 POST 방식의 전송은 반드시 CSRF 토큰을 사용하도록 추가해야 함 -->
						<input type='hidden' name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
					<div>
						<a href="/"><button class="connect_btn">Main</button></a>
					</div>
				</div>
			</section>
		</div>
	</div>


	<script language="javascript">
		function checkAll() {
			if (!checkUserId(form.userId.value)) {
				form.userId.focus();
				return false;
			}
			if (!checkPassword(form.userId.value, form.password.value,
					form.userPwCheck.value)) {
				return false;
			}
			if (!checkName(form.name.value)) {
				return false;
			}
			if (!checkBirthday(form.birthday.value)) {
				return false;
			}
			if (!checkAddress(form.address.value)) {
				return false;
			}
			if (!checkmPhone2(form.mPhone2.value)) {
				return false;
			}
			if (!checkMail(form.email.value)) {
				return false;
			}
			alert("회원가입 성공");
			return true;
		}

		// 공백확인 함수
		function checkExistData(value, dataName) {
			if (value == "") {
				alert(dataName + " 입력해주세요!");
				return false;
			}
			return true;
		}

		function checkUserId(userId) {
			//Id가 입력되었는지 확인하기
			if (!checkExistData(userId, "아이디를")) {
				form.userId.focus();
				return false;
			}

			var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
			if (!idRegExp.test(userId)) {
				alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
				form.userId.value = "";
				form.password.focus();
				return false;
			}
			return true; //확인이 완료되었을 때
		}

		function checkPassword(id, password, userPwCheck) {
			//비밀번호가 입력되었는지 확인하기
			if (!checkExistData(password, "비밀번호를")) {
				form.password.focus();
				return false;
			}
			//비밀번호 확인이 입력되었는지 확인하기
			if (!checkExistData(userPwCheck, "비밀번호 확인을")) {
				form.userPwCheck.focus();
				return false;
			}
			var passwordRegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
			if (!passwordRegExp.test(password)) {
				alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
				form.password.value = "";
				form.userPwCheck.value = "";
				form.password.focus();
				return false;
			}
			//비밀번호와 비밀번호 확인이 맞지 않다면..
			if (password != userPwCheck) {
				alert("두 비밀번호가 맞지 않습니다.");
				form.password.value = "";
				form.userPwCheck.value = "";
				form.userPwCheck.focus();
				return false;
			}
			//아이디와 비밀번호가 같을 때..
			if (id == password) {
				alert("아이디와 비밀번호는 같을 수 없습니다!");
				form.password.value = "";
				form.userPwCheck.value = "";
				form.password.focus();
				return false;
			}
			return true; //확인이 완료되었을 때
		}

		function checkName(name) {
			if (!checkExistData(name, "이름을")) {
				form.name.focus();
				return false;
			}
			var nameRegExp = /^[가-힣]{2,5}$/;
			if (!nameRegExp.test(name)) {
				alert("이름이 올바르지 않습니다.");
				form.name.value = "";
				form.name.focus();
				return false;
			}
			return true; //확인이 완료되었을 때
		}

		function checkBirthday(birthday) {
			if (!checkExistData(birthday, "생년월일을")) {
				form.birthday.focus();
				return false;
			}
			var birthdayRegExp = /^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$/;
			if (!birthdayRegExp.test(birthday)) {
				alert("생년월일 형식이 올바르지 않습니다.");
				form.birthday.value = "";
				form.birthday.focus();
				return false;
			}
			return true; //확인이 완료되었을 때
		}

		function checkAddress(address) {
			if (!checkExistData(address, "주소를")) {
				form.address.focus();
				return false;
			}

			var addressRegExp = /^[가-힣]{10,20}$/;
			if (!addressRegExp.test(address)) {
				alert("주소가 올바르지 않습니다.");
				form.address.value = "";
				form.address.focus();
				return false;
			}

			return true; //확인이 완료되었을 때
		}

		function checkmPhone2(mPhone2) {
			if (!checkExistData(mPhone2, "번호를")) {
				form.mPhone2.focus();
				return false;
			}
			var mPhone2RegExp = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;

			if (!mPhone2RegExp.test(mPhone2)) {
				alert("번호가 올바르지 않습니다.");
				form.mPhone2.value = "";
				form.mPhone2.focus();
				return false;
			}
			return true; //확인이 완료되었을 때
		}

		function checkMail(email) {
			//mail이 입력되었는지 확인하기
			if (!checkExistData(email, "이메일을")) {
				form.email.focus();
				return false;
			}
			var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
			if (!emailRegExp.test(email)) {
				alert("이메일 형식이 올바르지 않습니다!");
				form.email.value = "";
				form.email.focus();
				return false;
			}
			return true; //확인이 완료되었을 때
		}
	</script>
</body>
</html>