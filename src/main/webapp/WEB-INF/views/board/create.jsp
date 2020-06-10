
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

h1 {
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

.btn_registration, .btn_list {
	padding: 5px;
}
</style>
<div class="board_list_wrap">
	<div class="board_list_wraping">
		<div class="top">
			<h1>글 쓰기</h1>
			<div class="logo">
				<a href="/"><i class="fas fa-universal-access"
					style="cursor: pointer"></i></a>
			</div>
		</div>
		<form role="form" action="/board/create" method="post">
			<div class="board">
				<div class="board_title">
					<h3>제목</h3>
					<input type="text" name="title" class="board_title_write">
				</div>
				<div class="board_writer">
					<h3>글쓴이</h3>
					<input type="text" name="writer" class="board_title_write"
						value="<sec:authentication property='principal.user.name'/>"
						readonly="readonly">
				</div>
				<div class="board_content">
					<h3>내용</h3>
					<textarea name="content" class="board_content_write"></textarea>
				</div>

			</div>
			<input type='hidden' name="userNum" value="<sec:authentication property="principal.user.id"/>" />
			<input type='hidden' name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="board_btn">
				<button type="submit" class="btn_registration">등록</button>
				<a href="/board/list"><button class="btn_list">목록</button></a>
			</div>
		</form>
	</div>
</div>

</body>

</html>
<script>
$(document).ready(function(){
	$(".btn_list").on("click", function(e){
		e.preventDefault();
		location.href="/board/list";
	})
})
</script>
