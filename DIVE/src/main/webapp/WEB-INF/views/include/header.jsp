<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In</title>
<script src="https://kit.fontawesome.com/a4b9f55ded.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/header.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<nav class="navbar">
	<a href="/">
        <div class="navbar_logo">
            <i class="fas fa-universal-access"></i>
            <h1>DIVE</h1>
        </div>
	</a>
        <ul class="navbar_search">
            <div class="navbar_search_box">
	            <form id="searchForm" action="/product/list" method="get" >
					<input type="text" class="navbar_search_bar" name='keyword' size="40" placeholder="검색어를 입력하세요">
					<input type="hidden" name='type' value='T'>
					<button class="navbar_search_btn"></button>
	                <img src="/resources/images/search.png" alt="btn">
	            </form>
            </div>
        </ul>
        <ul class="navbar_menu">
            <li><a href="/product/list">중고 상품</a></li>
            <li><a href="/board/list">자유게시판</a></li>
            
            
            <sec:authorize access="isAnonymous()">
					<li><a href="/user/userLogin">LogIn</a></li>
					<li><a href="/user/signUp">SignUp</a></li>
			</sec:authorize>

			<!-- 회원 권한으로 로그인 되어  있는 경우 표시함 -->
			<sec:authorize access="hasRole('ROLE_MEMBER')">
					<sec:authentication property="principal" var="principal" />
					
					<!-- 스프링 시큐리티 principal 가져오는 라이브러리 선언
	    security > domain > CustomUser.java에 선언된 field를 불러온다. -->
					<sec:authentication property="principal" var="principal" />
					<li>
						<form id="actionForm" method="get">
							<!-- EL표현식으로 사용가능 -->
							<a class='move moveStyle' href='${principal.username}'> <sec:authentication
									property="principal.user.userId" />
							</a>
						</form>
					</li>
					<li>
						<form action="/user/userLogout" method="POST">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<button class="btnStyle">Logout</button>
						</form>
					</li>
			</sec:authorize>

			<!-- 관리자 권한으로 로그인 되어  있는 경우 표시함 -->
			<sec:authorize access="hasRole('ROLE_ADMIN')">
					<sec:authentication property="principal" var="principal" />
					<!-- 스프링 시큐리티 principal 가져오는 라이브러리 선언
	    security > domain > CustomUser.java에 선언된 field를 불러온다. -->
					<sec:authentication property="principal" var="principal" />
					<li>
						<form id="actionForm" method="get">
							<!-- EL표현식으로 사용가능 -->
							<a class='move moveStyle' href='${principal.username}'> <sec:authentication
									property="principal.user.userId" />
							</a>
						</form>
					</li>
					<li><a href="/user/adminPage">Admin Page</a></li>
					<li>
						<form action="/user/userLogout" method="POST">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<button class="btnStyle">Logout</button>
						</form>
					</li>
			</sec:authorize>
        </ul>
        
        <a href="#" class="navbar_toggle_btn">
            <i class="fas fa-bars"></i>
        </a>
    </nav>
    
    <script src="/resources/js/header.js"></script>
