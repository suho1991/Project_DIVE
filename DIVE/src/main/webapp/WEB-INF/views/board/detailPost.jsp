
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board/detailPost.css">
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
		<sec:authentication property="principal" var='principal'/>
			<sec:authorize access="isAuthenticated()">
				<c:if test="${principal.user.id eq post.userNum}">
					<button data-oper="update" class="btn_modification">수정</button>
					<button data-oper="delete" class="btn_delete">삭제</button>
				</c:if>
			</sec:authorize>

			<a href="/board/list"><button class="btn_list">목록</button></a>
		</div>

		<form id="operForm" action="/board/updatePost" method="get">
			<input type="hidden" id="id" name="id" value="${post.id}">
			<input type="hidden" name="userNum" value="${post.userNum}">
			<input type="hidden" id="pageNum" name="pageNum" value="${criteria.pageNum}">
			<input type="hidden" id="amount" name="amount" value="${criteria.amount}">
			<input type="hidden" name="type" value="${criteria.type}">
			<input type="hidden" name="keyword" value="${criteria.keyword}">
			<input type='hidden' name="${_csrf.parameterName}" value="${_csrf.token}" />
			
		</form>




		<!-- 댓글 -->
		<div class="comment_writing">
		<sec:authorize access="isAuthenticated()">
			<h1>댓글 쓰기</h1>
			<input type="text" class="board_comment">
			<input type="hidden" name="writer" value="<sec:authentication property='principal.user.name'/>">
			<button class="board_comment_registration">등록</button>
		</sec:authorize>
		</div>

		<ul class="replyList">
		
		</ul>
	</div>
	
	<div class="paging">
	</div>
</div>


<%@ include file="../include/footer.jsp"%>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
$(document).ready(function(){
	const REPLIES_PER_PAGE = 10.0;
	const PAGING_LINK_AMOUNT = 10;
	
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	
	var operForm = $("#operForm");
	$("button[data-oper='update']").on("click", function(e) {
		operForm.submit();
	});
	
	$("button[data-oper='delete']").on("click", function(e) {
		var confirmFlag = confirm("정말로 삭제하시겠습니까?");
		if (confirmFlag) {
			operForm.attr("action", "/board/deletePost").attr("method", "post").submit();
		} else {
			
		}
	});
	
	
	var result = "${result}";
	
	checkAlert(result);
	
	function checkAlert(result) {
		if(parseInt(result) > 0) {
			alert("게시글이 수정 되었습니다.");
		}
	}
	
	// 댓글 처리
	var curPageNum = 1;
	var postId = ${post.id};
	
	var ULreplyList = $(".replyList");
	
	showList(1);
	
	<sec:authorize access="isAuthenticated()">
		var loginUserNum = <sec:authentication property='principal.user.id'/>;
	</sec:authorize>
	
	// 댓글 입력
	var inputWriter = $("input[name='writer']").val();
	
	$(".board_comment_registration").on("click", function() {
		var replyObj = {
				content : $(".board_comment").val(),
				writer : inputWriter,
				pid : postId,
				userNum : loginUserNum,
		}
		replyService.createReply(replyObj, csrfHeaderName, csrfTokenValue, function(result) {
			location.href="/board/detailPost?id=" + postId;
		})
	});
	
	// 댓글 수정
	$(document).on("click", ".updateReplyBtn", function() {
		var replyId = $(this).data("id");
		var replyContent = $(".reply" + replyId).data("content");
		$(".reply" + replyId).remove();
		$(".updateReplyBtn").remove();
		$(".deleteReplyBtn").remove();
		$(".replycontenter" + replyId).html("<input class='replyContent' value='" + replyContent +"'>"
				+ "<button class='submitBtn'>완료</button>");
		
		$(".submitBtn").on("click", function(e) {
			var updateContent = $(".replyContent").val();
			var replyObj = {
					content : updateContent,
					userNum : loginUserNum,
					id : replyId
			}
			replyService.updateReply(replyObj, csrfHeaderName, csrfTokenValue, function(result) {
				alert("수정 완료");
				location.href="/board/detailPost?id=" + postId;
			});
		});
	});
	
	//댓글 삭제
	$(document).on("click", ".deleteReplyBtn", function() {
		var confirmFlag = confirm("정말로 삭제하시겠습니까?");
		var replyId = $(this).data("id");
		if (confirmFlag) {
			replyService.deleteReply(replyId, loginUserNum, csrfHeaderName, csrfTokenValue, function(successMsg) {
				if (successMsg === 'success') {
					alert('삭제 성공');
					location.href="/board/detailPost?id=" + postId;
				}
			}, function(err) {
				alert('삭제 실패....' + err);
			});
		} else {
				
		}
	});
	
	
	function showList(pageNum) {
		replyService.getReplyList({
			pid : postId,
			page : pageNum || 1
		},
		function(replyCnt, listReply) {
			if(pageNum == -1) {
				var lastPage = Math.ceil(replyCnt / REPLIES_PER_PAGE);
				curPageNum = lastPage;
				showList(lastPage);
				return;
			}
			
			var str = "";
			for (var i = 0, len = listReply.length || 0; i < len; i++) {
				str += "<li class='comment' data-id='" + listReply[i].id + "'>"
					 + "<span class='comment_writer'>" + listReply[i].writer + "</span>" 
					 + "<span class='comment_date'>" + replyService.convertTime2Str(listReply[i].updateDate) + "</span>" 
					 + "</li>";
				str += "<li class='comment_contenter replycontenter" + listReply[i].id + "'>"
					 + "<span class='comment_content reply" + listReply[i].id + "' data-content='" + listReply[i].content + "'>" + listReply[i].content + "</span>"
					 + "<span class='comment_control'>";
				<sec:authorize access="isAuthenticated()"> 
				if(listReply[i].userNum === loginUserNum) {
				str += "<button class='updateReplyBtn' data-id='" + listReply[i].id + "'>수정</button>"
					 + "<button class='deleteReplyBtn' data-id='" + listReply[i].id + "'>삭제</button>";
				}
				</sec:authorize>
				
				str += "</span>"
					 + "</li>";
			}
			ULreplyList.html(str);
			
			showReplyPage(replyCnt);
		});
	};
	
	function showReplyPage(replyCnt) {
		var endNum = Math.ceil(curPageNum / REPLIES_PER_PAGE) * PAGING_LINK_AMOUNT;
		var startNum = endNum - (PAGING_LINK_AMOUNT - 1);
		var hasPrev = startNum != 1;
		var hasNext = false;
		
		if (endNum * REPLIES_PER_PAGE >= replyCnt) {
			endNum = Math.ceil(replyCnt / REPLIES_PER_PAGE);
		}
		
		hasNext = endNum * REPLIES_PER_PAGE < replyCnt;
		
		//UL 및 Li로 출력하기
		var paginationStr = "";
		if (hasPrev) {
			paginationStr += "<a class='btn pagingBtn' href='" + (startNum - 1) + "'> <</a>";
		}
		for (var i = startNum; i <= endNum; i++) {
			var on = curPageNum == i ? "on" : "";
			paginationStr += "<a class='pagingBtn num " + on + "' href='" + i + "'>" + i + "</a>";
		}
		if (hasNext) {
			paginationStr += "<a class='btn pagingBtn' href='" + (endNum + 1) + "'> ></a>";
		}
		
		$(".paging").html(paginationStr);
	}
	
	$(document).on("click", ".pagingBtn", function(e) {
		e.preventDefault();
		curPageNum = $(this).attr("href");
		showList(curPageNum);
	});
	
})
</script>
