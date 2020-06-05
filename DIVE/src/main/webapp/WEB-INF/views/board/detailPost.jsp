
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../include/header.jsp"%>
<style>
.top {
	text-align: center;
}

.top h1 {
	font-size: 1.5em;
}

.logo i {
	font-size: 50px;
	margin: 30px;
}

a {
	text-decoration: none;
}

.logo a:link, .logo a:visited {
	color: black;
}

.board_list_wrap {
	width: 900px;
	height: 100%;
	margin: 150px auto;
	background-color: white;
	border-radius: 10px;
	padding-top: 20px;
	padding: 50px;
	padding-bottom: 100px;
}

.board_list_wraping {
	width: 500px;
	margin: 0 auto;
}

.board {
	width: 500px;
	margin: 0 auto;
}

.board_title_write {
	width: 500px;
}

.board_content_write {
	width: 500px;
	height: 200px;
}

.board_btn {
	width: 500;
	text-align: right;
}

.btn_modification, .btn_delete, .btn_list, .board_comment_registration {
	padding: 5px;
}

.comment_contenter {
	list-style: none;
}

.comment_date {
	font-size: 13px;
	color: darkgray;
}
</style>

<div class="board_list_wrap">
	<div class="board_list_wraping">
		<div class="top">
			<h1>게시판 상세보기</h1>
			<div class="logo">
				<a href="/"><i class="fas fa-universal-access"
					style="cursor: pointer"></i></a>
			</div>
		</div>
		<div class="board">
			<div class="board_title">
				<h3>제목</h3>
				<input type="text" class="board_title_write"
					value="<c:out value="${post.title}" />" readonly="readonly">
			</div>
			<div class="board_writer">
				<h3>글쓴이</h3>
				<input type="text" class="board_title_write"
					value="<c:out value="${post.writer}" />" readonly="readonly">
			</div>
			<div class="board_content">
				<h3>내용</h3>
				<textarea name="" class="board_content_write" readonly="readonly"><c:out
						value="${post.content}" /></textarea>
			</div>
		</div>
		<div class="board_btn">
		<sec:authentication property="principal" var='userInfo'/>
			<sec:authorize access="isAuthenticated()">
				<c:if test="${userInfo.user.id eq post.userNum}">
					<button class="btn_modification">수정</button>
					<button class="btn_delete">삭제</button>
				</c:if>
			</sec:authorize>

			<a href="/board/list"><button class="btn_list">목록</button></a>
		</div>

		<div class="comment_writing">
			<h1>댓글 쓰기</h1>
			<input type="text" class="board_comment">
			<button class="board_comment_registration">등록</button>
		</div>

		<ul>
			<li class="comment"><span class="comment_writer"> 작성자 </span> <span
				class="comment_date"> 06/03 </span></li>
			<li class="comment_contenter"><span class="comment_content">
					댓글내용 </span> <span class="comment_control">
					<button>수정</button>
					<button>삭제</button>
			</span></li>
		</ul>
	</div>
</div>


</body>

</html>
