
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board/list.css">
<div class="board_list_wrap">
	<table class="board_list">
		<section class="top">
			<h1>게시판 목록</h1>
		</section>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>작성일</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach items="${listPost}" var="post">
				<tr>
					<th><c:out value="${post.id}"></c:out></th>
					<th><a class='detailPost' href="<c:out value='${post.id}'/>"> <c:out
								value="${post.title}"></c:out>
					</a></th>
					<th><c:out value="${post.writer}"></c:out></th>
					<th><fmt:formatDate pattern="yyyy-MM-dd"
							value="${post.updateDate}"></fmt:formatDate></th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<sec:authorize access="isAuthenticated()">
	<div class="writing">
		<a href="/board/create"><button class="writing_btn">글쓰기</button></a>
	</div>
	</sec:authorize>
	
	
	<!-- 검색  -->
	<form id="searchForm" action="/board/list" method="get" >
							<select name='type'>
								<option value="" 
									<c:out value="${pageMaker.cri.type == null ? 'selected':''}"/>>────────────</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T' ? 'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C' ? 'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W' ? 'selected':''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':''}"/>>제목 or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW' ? 'selected':''}"/>>제목 or 작성자</option>
								<option value="CW"
									<c:out value="${pageMaker.cri.type eq 'CW' ? 'selected':''}"/>>내용 or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected':''}"/>>전체</option>
							</select>
							<input type="text" name='keyword'>
							<input type="hidden" name='pageNum' value='${pageMaker.cri.pageNum}'>
                            <input type="hidden" name='amount' value='${pageMaker.cri.amount}' >
                            <button id='searchBtn'>검색</button>
						</form>
	
	<div class="paging">
		<c:if test="${pageMaker.prev}">
			<a href="${pageMaker.startPage - 1}" class="btn pagingBtn"> <</a>
		</c:if>
		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			<a href="${num}" class="pagingBtn num ${pageMaker.cri.pageNum == num ? 'on':'' }">${num} </a> 
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<a href="${pageMaker.endPage + 1}" class="btn pagingBtn">></a>
		</c:if>
		
	</div>
	<form id='actionForm' action='/board/list' method='get'>
      	<input type="hidden" name='pageNum' value='${pageMaker.cri.pageNum}' >
      	<input type="hidden" name='amount' value='${pageMaker.cri.amount}' >
      	<input type="hidden" name='type' value='${pageMaker.cri.type}'>
      	<input type="hidden" name='keyword' value='${pageMaker.cri.keyword}'>
     </form>
</div>


<%@ include file="../include/footer.jsp"%>
<script>
$(document).ready(function(){
	var result = "${result}";
	
	checkAlert(result);
	
	function checkAlert(result) {
		if(parseInt(result) > 0) {
			alert(result + "번 글이 등록 되었습니다.")
		}
	}
	//페이징 이벤트 처리
	var actionForm = $('#actionForm');
    $('.pagingBtn').on('click', function(e) {
		e.preventDefault();
		
		var choosedPage = $(this).attr('href');
		actionForm.find("input[name='pageNum']").val(choosedPage);
		
		actionForm.submit();
	});
    
    $('.detailPost').on('click', function(e) {
    	e.preventDefault();
    	actionForm.append("<input type='hidden' name='id' value='"+$(this).attr('href')+"'/>");
    	actionForm.attr("action","/board/detailPost");
    	actionForm.submit();
	});
    
    var searchForm = $('#searchForm');
    $('#searchBtn').on('click', function(e) {
		if(!searchForm.find("option:selected").val()){
			alert("검색종류를 선택하세요.");
			return false;
		}
		
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요.");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		searchForm.submit();
	});
});
</script>