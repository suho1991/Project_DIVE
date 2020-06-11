<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/user/findMyId.css">

	<div class="choice-sector">
		<div class="choice-sector-content">
			<section class="choice">
				<h1>아이디 찾기</h1>
			</section>
			<section class="logo">
				<div class="logo_image">
					<a href="/"><i class="fas fa-universal-access"
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
<%@ include file="../include/footer.jsp" %>
<script src="/resources/js/findMyId.js"></script>