<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/user/myPage.css">
<div class="choice-sector">
	<div class="choice-sector-content">
		<section class="customer">
			<h1 class="customer_title">My Page</h1><br />
			<div class="customer_inform">
				<sec:authentication property="principal" var="principal" />
				<sec:authorize access="isAuthenticated()">
					<div class="form-group">
						<p class="infoTit">기본 정보</p>
						<label for="userId">아이디</label> <input class="form-control"
							type="text" readonly='readonly' value='${user.userId}'
							name="userId">
					</div>
					<br />
					<div class="form-group">
						<label for="userName">이름</label> <input class="form-control"
							type="text" readonly='readonly' value='${user.name}' name="name">
					</div>
					<br />
					<div class="form-group">
						<label for="userName">닉네임</label> <input class="form-control"
							type="text" readonly='readonly' value='${user.nickName}'
							name="nickName">
					</div>
					<br />
					<div class="form-group">
						<label for="birthday">생년월일</label> <input class="form-control"
							type="text" readonly='readonly' value='${user.birthday}'
							name="birthday">
					</div>
					<br />
					<div class="form-group">
						<label>성별</label> <input class="form-control" type="text"
							readonly='readonly' value='${user.sex}' name="sex">
					</div>
					<br />
					<p class="infoTit">기타 정보</p>
					<div class="form-group">
						<label for="address">주소</label> <input class="form-control"
							type="text" readonly='readonly' value='${user.address}'
							name="address">
					</div>
					<br />
					<div class="form-group">
						<label for="mPhone1">연락처</label> <input class="form-control"
							type="text" readonly='readonly' value='${user.phone}'
							name="phone">
					</div>
					<br />
					<div class="form-group">
						<label for="email01">이메일</label> <input class="form-control"
							type="text" readonly='readonly' value='${user.email}'
							name="email">
					</div>

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

					<form id="actionForm" class="formStyle">
						<a class="modify" href="${principal.username}"><button>정보
								수정</button></a>
					</form>
				</sec:authorize>
			</div>

		</section>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>
<script src="/resources/js/myPage.js"></script>
