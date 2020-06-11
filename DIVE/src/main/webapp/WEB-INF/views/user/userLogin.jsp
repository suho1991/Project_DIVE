<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/user/userLogin.css">
	<div class="choice-sector">
		<div class="choice-sector-content">
			<section class="choice">
				<div class="choice_btn">
					<span class="login_sector"> <a href="/"> <input
							type="button" class="login_btn" value="H O M E"></a>
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
							<input type="password" class="customer_inform_pass"
								name="password" placeholder="비밀번호를 입력하세요.">
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
				<div class="findcustomer">
					<a href="/user/findMyId">아이디찾기</a> / <a href="/mail/sendEmail">비밀번호찾기</a>
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
	
<%@ include file="../include/footer.jsp" %>