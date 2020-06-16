
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board/create.css">
<div class="board_list_wrap">
	<div class="board_list_wraping">
		<div class="top">
			<h1>글 쓰기</h1>
		</div>
		<form role="form" action="/board/create" method="post">
			<div class="board">
				<div class="board_title">
					<h3>제목</h3>
					<input type="text" name="title" class="board_title_write">
				</div>
				<br />
				<div class="board_writer">
					<h3>글쓴이</h3>
					<input type="text" name="writer" class="board_title_write"
						value="<sec:authentication property='principal.user.name'/>"
						readonly="readonly">
				</div>
				<br />
				<div class="board_content">
					<h3>내용</h3>
					<textarea name="content" class="board_content_write" style="resize: none;"></textarea>
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


<%@ include file="../include/footer.jsp"%>
<script>
$(document).ready(function(){

	$(".btn_list").on("click", function(e){
		e.preventDefault();
		location.href="/board/list";
	})
})
</script>
