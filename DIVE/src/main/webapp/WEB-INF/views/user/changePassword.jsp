<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/user/changePassword.css">
<div class="choice-sector">
	<div class="choice-sector-content">
		<section class="choice">
			<h1>인증하기</h1>
		</section>
		<section class="logo">
			<div class="logo_image">
				<a href="/"><i class="fas fa-universal-access"
					style="cursor: pointer"></i></a>
			</div>
		</section>
		<form action="/user/changePassword" method="post">
			ID: <input type="text" name="userId" value="${userId}"> 신규
			비밀번호: <input type="password" name="password"
				placeholder=" 패스워드를 입력하세요. ">
			<button type="submit" name="submit">변경</button>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>
