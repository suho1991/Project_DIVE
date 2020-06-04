<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.move').on('click', function(e) {
			e.preventDefault();
			$('#actionForm').append(
					"<input type='hidden' name='userId' value='" + 
					$(this).attr('href') + "'/>");
			$('#actionForm').attr("action", "/user/findById");
			$('#actionForm').submit();
		});
	});
</script>
</head>
<body>
	<h1>MEMBER</h1>
	<p>
		안녕하세요
		<sec:authentication property="principal.user.userId" />
		고객님!
	</p>
	<sec:authorize access="isAnonymous()">
		<a href="/user/userLogin">Login</a>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<a href="/user/userLogout">Logout</a>
		<!-- 스프링 시큐리티 principal 가져오는 라이브러리 선언
		security > domain > CustomUser.java에 선언된 field를 불러온다.		
	 -->
		<sec:authentication property="principal" var="principal" />
		<form id="actionForm" method="get">
			<!-- EL표현식으로 사용가능 -->
			<a class='move' href='${principal.username}'> My Page </a>
		</form>
	</sec:authorize>
</body>
</html>