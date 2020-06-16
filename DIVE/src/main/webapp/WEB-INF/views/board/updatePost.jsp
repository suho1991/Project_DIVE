
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board/updatePost.css">
<div class="board_list_wrap">
	<div class="board_list_wraping">
		<div class="top">
			<h1>게시글 수정하기</h1>
		</div>
		<form role="form" action="/board/updatePost" method="post">
			<div class="board">
				<div class="board_title">
					<h3>제목</h3>
					<input type="text" name="title" class="board_title_write" value="${post.title}">
				</div>
				<div class="board_writer">
					<h3>글쓴이</h3>
					<input type="text" name="writer" class="board_title_write"
						value="${post.writer}"
						readonly="readonly">
				</div>
				<div class="board_content">
					<h3>내용</h3>
					<textarea name="content" class="board_content_write" style="resize: none;">${post.content}</textarea>
				</div>

			</div>
			<input type="hidden" id="pageNum" name="pageNum" value="${criteria.pageNum}" />
			<input type="hidden" id="amount" name="amount" value="${criteria.amount}" />
			<input type="hidden" name="type" value="${criteria.type}" />
			<input type="hidden" name="keyword" value="${criteria.keyword}" />
			<input type="hidden" name="userNum" value="${post.userNum}"/>
			<input type="hidden" name="id" value="${post.id}"/>
			<input type='hidden' name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="board_btn">
				<button type="submit" class="btn_update">수정 완료</button>
				<a href="/board/list"><button class="btn_list">목록</button></a>
			</div>
		</form>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>

<script>
$(document).ready(function(){
	var formObj = $("form");
})
</script>

