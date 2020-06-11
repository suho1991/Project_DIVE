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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dive</title>
<!-- <link rel="stylesheet" href="pretty.css"> -->
<link rel="stylesheet" href="/resources/css/slide.css">
<link rel="stylesheet" href="/resources/css/index.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- defer : 모든 파일을 받을때까지 브라우저에서 표시안되는걸 방지 -->
<!-- <script src="https://kit.fontawesome.com/a4b9f55ded.js" crossorigin="anonymous"></script> -->
</head>
<body>
	<header>
		<nav class="top">
			<!-- 익명의 사용자의 경우 표시함(로그인 되어 있지 않는 user) -->
			<sec:authorize access="isAnonymous()">
				<ul class="clear">
					<li><a class="moveStyle" href="/user/signUp">SignUp</a></li>
					<li><a class="moveStyle" href="/user/userLogin">LogIn</a></li>
				</ul>
			</sec:authorize>

			<!-- 회원 권한으로 로그인 되어  있는 경우 표시함 -->
			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<ul class="navbar_icons">
					<sec:authentication property="principal" var="principal" />
					<li>
						<form action="/user/userLogout" method="POST">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<button class="btnStyle">Logout</button>
						</form>
					</li>
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
				</ul>
			</sec:authorize>

			<!-- 관리자 권한으로 로그인 되어  있는 경우 표시함 -->
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<ul class="navbar_icons">
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
							<button>Logout</button>
						</form>
					</li>
				</ul>
			</sec:authorize>

		</nav>
		<div class="searchBar">
			<div class="logo">
				<a href="/">DIVE</a>
			</div>
			<p class="slogan">나만의 특별한 보물을 찾아보세요!</p>
			
			<form id="searchForm" action="/product/list" method="get" >
				<input type="text" name='keyword' size="40" placeholder="검색어를 입력하세요">
				<input type="hidden" name='type' value='T'>
				<button class="btnStyle">검색</button>
			</form>
		</div>
		<div class="container">
			<ul class="slider-container simple-list" id="slider">
				<li class="slide"><img src="/resources/images/1.jpg"
					alt="이미지파일"></li>
				<li class="slide"><img src="/resources/images/2.jpg"
					alt="이미지파일"></li>
				<li class="slide"><img src="/resources/images/3.jpg"
					alt="이미지파일"></li>
				<li class="slide"><img src="/resources/images/4.jpg"
					alt="이미지파일"></li>
				<li class="slide"><img src="/resources/images/5.jpg"
					alt="이미지파일"></li>
			</ul>

			<p class="pager">
				<span>1</span> <span>2</span> <span>3</span> <span>4</span> <span>5</span>
			</p>

			<a href="#" id="prev"></a> <a href="#" id="next"></a>
		</div>
	</header>

	<nav class="content_menu">
		<ul class="menu_list">
			<li><a href="/product/list"><img src="/resources/images/pro_list.png"
					alt="" width="60px" height="60px">
				<p>상품 목록</p></a></li>
			<li><a href="/board/list"><img src="/resources/images/board.png"
					alt="" width="60px" height="60px">
				<p>자유게시판</p></a></li>
			<li><a href="/game/miniGame"><img
					src="/resources/images/game.png" alt="" width="60px" height="60px">
				<p>미니 게임</p></a></li>
<<<<<<< HEAD
			<li><a href="/game/lotto"><img
=======
			<li><a href="../user/lotto.jsp"><img
>>>>>>> 00e99ec5162d43f84fc7e3c329ea0edeadc0f854
					src="/resources/images/lotto.png" alt="" width="60px" height="60px">
				<p>로또</p></a></li>
		</ul>
	</nav>

	<div class="content">
		<table class="board_list">
			<tbody>
				<p class="board_tit">Best product</p>
				<tr>
					<td class="tit"><a href="./boarditem.html"><img
							src="/resources/images/1.png" width="150" height="150">
							<p>판매자: ID</p>
							<p>판매가격: 10,000원</p>
							<p>등록일자: 2020-05-25</p> </a></td>

					<td class="tit"><a href="./boarditem.html"><img
							src="/resources/images/1.png" width="150" height="150">
							<p>판매자: ID</p>
							<p>판매가격: 10,000원</p>
							<p>등록일자: 2020-05-25</p> </a></td>

					<td class="tit"><a href="./boarditem.html"><img
							src="/resources/images/1.png" width="150" height="150">
							<p>판매자: ID</p>
							<p>판매가격: 10,000원</p>
							<p>등록일자: 2020-05-25</p> </a></td>

					<td class="tit"><a href="./boarditem.html"><img
							src="/resources/images/1.png" width="150" height="150">
							<p>판매자: ID</p>
							<p>판매가격: 10,000원</p>
							<p>등록일자: 2020-05-25</p> </a></td>

					<td class="tit"><a href="./boarditem.html"><img
							src="/resources/images/1.png" width="150" height="150">
							<p>판매자: ID</p>
							<p>판매가격: 10,000원</p>
							<p>등록일자: 2020-05-25</p> </a></td>
				</tr>
			</tbody>
		</table>
	</div>


	<footer class="footer">
		<p>
			TEAM PROJECT<br /> Lorem ipsum dolor sit amet consectetur
			adipisicing elit.<br /> Accusamus excepturi voluptatem a aliquam
			quod,<br /> inventore magni minus ad dicta tempore consequuntur
			delectus ab mollitia illo eius obcaecati rem magnam nam!
		</p>
	</footer>
	<script src="/resources/js/slide.js"></script>
	<script src="/resources/js/index.js"></script>

</body>
</html>
