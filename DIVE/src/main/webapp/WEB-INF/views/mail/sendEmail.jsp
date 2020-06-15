<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/mail/sendEmail.css">
<div class="choice-sector">
	<div class="choice-sector-content">
		<section class="choice">
				<h1>이메일 보내기</h1>
			</section>
			<section class="logo">
				<div class="logo_image">
					<a href="/"><i class="fas fa-universal-access"
						style="cursor: pointer"></i></a>
				</div>
			</section>
		<form action="/mail/sendEmail" method="post">
			아이디: <input type="text" name="userId" placeholder="  ID를 입력하세요. ">
			이메일 : <input type="email" name="email" placeholder="  이메일주소를 입력하세요. ">
			<button type="submit" name="submit">이메일 인증받기 (이메일 보내기)</button>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>
