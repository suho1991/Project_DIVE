<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/mail/certifyEmail.css">
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
		<form action="/mail/certifyEmail" method="post">
		ID: <input type="text" name="userId" value="${userId}"> 인증번호
		입력 : <input type="number" name="certifyDice"
			placeholder="  인증번호를 입력하세요. "> <input type="hidden"
			name="dice" value="${dice}">
		<button type="submit" name="submit">인증번호 전송</button>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>

