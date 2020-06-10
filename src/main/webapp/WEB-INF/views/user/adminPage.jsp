<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/adminPage.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('.move').on(
						'click',
						function(e) {
							e.preventDefault();
							$('#actionForm').append(
									"<input type='hidden' name='userId' value='"
											+ $(this).attr('href') + "'/>");
							$('#actionForm').attr("action", "/user/findById");
							$('#actionForm').submit();
						});
			});
</script>
</head>
<body>
	<nav class="navbar">
		<div class="navbar_logo">
			<i class="fas fa-universal-access"></i>
			<h1>DIVE</h1>
		</div>
		<ul class="navbar_menu">
			<li><a href="/product/list">PRODUCT</a></li>
			<li><a href="/board/list">BOARD</a></li>
			<li><a href="/chat/intro">CHAT</a></li>
			<li><a href="#">CORPORATION</a></li>
		</ul>
		<ul class="navbar_icons">
			<sec:authorize access="isAnonymous()">
				<li><a href="/user/userLogin">Login</a></li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li><a href="/user/userLogout">Logout</a></li>
				<!-- 스프링 시큐리티 principal 가져오는 라이브러리 선언
		security > domain > CustomUser.java에 선언된 field를 불러온다.		
	 -->
				<sec:authentication property="principal" var="principal" />
				<li>
					<form id="actionForm" method="get">
						<!-- EL표현식으로 사용가능 -->
						<a class='move' href='${principal.username}'> 
							<sec:authentication property="principal.user.userId" />
						</a>
					</form>
				</li>
			</sec:authorize>
		</ul>
		<a href="#" class="navbar_toggle_btn"> <i class="fas fa-bars"></i>
		</a>
	</nav>


	<div class="board_list_wrap">
		<section class="top">
			<h1>관리자 페이지</h1>
			<div class="logo">
				<a href="/"><i class="fas fa-universal-access"
					style="cursor: pointer"></i></a>
			</div>
		</section>
		<table class="board_list">
			<thead>
				<tr>
					<th>No</th>
					<th>아이디</th>
					<th>이 름</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>가입일</th>
					<th colspan="2">상태</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${member}" var="member">
					<tr>
						<td><c:out value="${member.id}"></c:out></td>
						<td><c:out value="${member.userId}"></c:out></td>
						<td><c:out value="${member.name}"></c:out></td>
						<td><c:out value="${member.nickName}"></c:out></td>
						<td><c:out value="${member.email}"></c:out></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${member.regDate}"></fmt:formatDate></td>
						<td><label>활 성</label><input type="radio" name="select"
							value="true"
							<c:if test="${member.enabled eq 'true'}">checked="checked"</c:if> />
							<label>비활성</label><input type="radio" name="select" value="false"
							<c:if test="${member.enabled eq 'false'}">checked="checked"</c:if> />
						</td>
						<td><button class="modify" type="submit">등록</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>