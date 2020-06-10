<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<!-- CSS 또는 JS의 경우 절대경로를 사용하도록 한다 servlet-context.xml에 명시되어 있는 resources mapping 확인 -->
<link rel="stylesheet" href="pretty.css">
<!-- defer : 모든 파일을 받을때까지 브라우저에서 표시안되는걸 방지 -->
<link rel="stylesheet" href="/resources/css/main_style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/js/main_js.js"></script>
<script src="https://kit.fontawesome.com/a4b9f55ded.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<nav class="navbar">
		<div class="navbar_logo">
			<i class="fas fa-universal-access"></i>
			<h1>DIVE</h1>
		</div>
		<ul class="navbar_menu">
			<li><a href="/">HOME</a></li>
			<li><a href="/product/list">PRODUCTS</a></li>
			<li><a href="/chat/intro">CHAT</a></li>
			<li><a href="/board/list">BOARD</a></li>
		</ul>

		<!-- 익명의 사용자의 경우 표시함(로그인 되어 있지 않는 user) -->
		<sec:authorize access="isAnonymous()">
			<ul class="navbar_icons">
				<li><a href="/user/userLogin">Login</a></li>
				<li><a href="/user/signUp">Sign Up</a></li>
			</ul>
		</sec:authorize>

		<!-- 회원 권한으로 로그인 되어  있는 경우 표시함 -->
		<sec:authorize access="hasRole('ROLE_MEMBER')">
			<ul class="navbar_icons">
				<sec:authentication property="principal" var="principal" />
				<li><a href="/user/userLogout">Logout</a></li>
				<!-- 스프링 시큐리티 principal 가져오는 라이브러리 선언
		security > domain > CustomUser.java에 선언된 field를 불러온다. -->
				<sec:authentication property="principal" var="principal" />
				<li>
					<form id="actionForm" method="get">
						<!-- EL표현식으로 사용가능 -->
						<a class='move' href='${principal.username}'> 
							<sec:authentication property="principal.user.userId" />
						</a>
					</form>
				</li>
			</ul>
		</sec:authorize>

		<!-- 관리자 권한으로 로그인 되어  있는 경우 표시함 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<ul class="navbar_icons">
				<sec:authentication property="principal" var="principal" />
				<li><a href="/chat/intro">채팅</a></li>
				<!-- 스프링 시큐리티 principal 가져오는 라이브러리 선언
		security > domain > CustomUser.java에 선언된 field를 불러온다. -->
				<sec:authentication property="principal" var="principal" />
				<li>
					<form id="actionForm" method="get">
						<!-- EL표현식으로 사용가능 -->
						<a class='move' href='${principal.username}'>
							<sec:authentication property="principal.user.userId" />
						</a>
					</form>
				</li>
				<li><a href="/user/adminPage">Admin Page</a></li>
				<li><a href="/user/userLogout">Logout</a></li>
			</ul>
		</sec:authorize>


		<a href="#" class="navbar_toggle_btn"> <i class="fas fa-bars"></i>
		</a>
	</nav>

	<article>
		<div class="main">

			<div class="mainbox">
				<div class="mainsearch">
					<h1>당신의 보물을 찾아보세요!</h1>
					<div class="search_bar">
						<input type="text" class="search_bar_text">
						<button type="button" onclick="alert('Hello Dive!')"
							class="search_btn" style="cursor: pointer">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</article>

	<div class="maincontent_bottom">
		<h1>THIS WEEK ISSUE ITEM'S</h1>
		<div class="maincontent_bottom_line1">
			<div class="maincontent_bottom_line1_item1 item_common">
				<a href="#"><img src="../../resources/images/1.png" alt="1"></a>
				<h2>title</h2>
				<h3>content</h3>
			</div>
			<div class="maincontent_bottom_line1_item2 item_common">
				<a href="#"><img src="../../resources/images/2.png" alt="2"></a>
				<h2>title</h2>
				<h3>content</h3>
			</div>
			<div class="maincontent_bottom_line1_item3 item_common">
				<a href="#"><img src="../../resources/images/3.png" alt="3"></a>
				<h2>title</h2>
				<h3>content</h3>
			</div>
		</div>

		<div class="maincontent_bottom_line2">
			<div class="maincontent_bottom_line2_item4 item_common">
				<a href="#"><img src="../../resources/images/4.png" alt="4"></a>
				<h2>title</h2>
				<h3>content</h3>
			</div>
			<div class="maincontent_bottom_line2_item5 item_common">
				<a href="#"><img src="../../resources/images/5.png" alt="5"></a>
				<h2>title</h2>
				<h3>content</h3>

			</div>
			<div class="maincontent_bottom_line2_item6 item_common">
				<a href="#"><img src="../../resources/images/6.png" alt="6"></a>
				<h2>title</h2>
				<h3>content</h3>
				</a>
			</div>
		</div>
	</div>


	<div class="board_list_wrap">
		<table class="board_list">
			<caption>게시판 목록</caption>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td class="tit"><a href="#">크롬 개발자도구 활용하는 방법</a></td>
					<td>관리자</td>
					<td>2020-05-25</td>
					<td>555</td>
				</tr>
				<tr>
					<td>2</td>
					<td class="tit"><a href="#">크롬 개발자도구 활용하는 방법</a></td>
					<td>관리자</td>
					<td>2020-05-25</td>
					<td>555</td>
				</tr>
				<tr>
					<td>4</td>
					<td class="tit"><a href="#">크롬 개발자도구 활용하는 방법</a></td>
					<td>관리자</td>
					<td>2020-05-25</td>
					<td>555</td>
				</tr>
				<tr>
					<td>5</td>
					<td class="tit"><a href="#">크롬 개발자도구 활용하는 방법</a></td>
					<td>관리자</td>
					<td>2020-05-25</td>
					<td>555</td>
				</tr>
				<tr>
					<td>1</td>
					<td class="tit"><a href="#">크롬 개발자도구 활용하는 방법</a></td>
					<td>관리자</td>
					<td>2020-05-25</td>
					<td>555</td>
				</tr>
			</tbody>
		</table>
		<div class="paging">
			<a href="#" class="btn"><<</a> <a href="#" class="btn"><</a> <a
				href="#" class="num on">1</a> <a href="#" class="num">2</a> <a
				href="#" class="num">3</a> <a href="#" class="btn">></a> <a href="#"
				class="btn">>></a>
		</div>
	</div>

	<footer class="footer">
		TEAM PROJECT<br /> Lorem ipsum dolor sit amet consectetur adipisicing
		elit.<br /> Accusamus excepturi voluptatem a aliquam quod,<br />
		inventore magni minus ad dicta tempore consequuntur delectus ab
		mollitia illo eius obcaecati rem magnam nam!
	</footer>
	<h1>Main</h1>

</body>
</html>
