
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../include/header.jsp"%>
<style>
table {
	border-collapse: collapse;
}

.top {
	text-align: center;
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

.tit a {
	color: black;
}

.board_list_wrap {
	padding: 50px;
}

.board_list {
	width: 100%;
	border-top: 2px solid navy;
}

.board_list tr {
	border-bottom: 1px solid #ccc;
}

.board_list th, .board_list td {
	padding: 10px;
	font-size: 14px;
}

.board_list td {
	text-align: center;
}

.board_list .tit {
	text-align: left;
}

.board_list .tit:hover {
	text-decoration: underline;
}

.board_list_wrap {
	width: 900px;
	height: 100%;
	margin: 150px auto;
	background-color: white;
	border-radius: 10px;
	padding-bottom: 100px;
}

.board_list_wrap .paging {
	font-size: 0;
	/* list 사이 여백 공간 초기화 */
	margin-top: 20px;
	text-align: center;
}

.board_list_wrap .paging a {
	display: inline-block;
	margin-left: 10px;
	padding: 5px 10px;
	border-radius: 100px;
	font-size: 12px;
	/* .board_list_wrap .paging 에서 여백 초기화한 값을 토대로 다시 사이즈 재지정 */
	color: black;
}

.board_list_wrap .paging a:first-child {
	margin-left: 0;
}

.board_list_wrap .paging a.btn {
	border: 1px solid #eee;
	/* 옆의 border가 들어간 item들과 크기를 맞추기위하여 */
	text-decoration: none;
	background: white;
}

.board_list_wrap .paging a.num {
	border: 1px solid blue;
	font-weight: 600;
	color: blue;
}

.board_list_wrap .paging a.num.on {
	background: blue;
	color: #fff;
}

.writing {
	text-align: right;
}

.writing_btn {
	margin: 5px;
	padding: 5px;
}
</style>
<div class="board_list_wrap">
	<table class="board_list">
		<section class="top">
			<h1>게시판 목록</h1>
			<div class="logo">
				<a href="/"><i class="fas fa-universal-access"
					style="cursor: pointer"></i></a>
			</div>
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
					<th><a class='move' href="<c:out value='${post.id}'/>"> <c:out
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
	<form id="searchForm" class="form-inline" action="/board/list" method="get" >
							<select class="form-control" name='type'>
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
							<input class="form-control" type="text" name='keyword' value='${pageMaker.cri.keyword}'>
							<input type="hidden" name='pageNum' value='${pageMaker.cri.pageNum}'>
                            <input type="hidden" name='amount' value='${pageMaker.cri.amount}' >
                            <button id='searchBtn' class='btn btn-primary'>검색</button>
						</form>
	
	<div class="paging">
		<a href="#" class="btn"> <<</a> 
		<c:if test="${pageMaker.prev}">
			<a href="${pageMaker.startPage - 1}" class="btn pagingBtn"> <</a>
		</c:if>
		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			<a href="${num}" class="pagingBtn num ${pageMaker.cri.pageNum == num ? 'on':'' }">${num} </a> 
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<a href="${pageMaker.endPage + 1}" class="btn pagingBtn">></a>
		</c:if>
		  <a href="#" class="btn">>></a>
	</div>
	<form id='actionForm' action='/board/list' method='get'>
      	<input type="hidden" name='pageNum' value='${pageMaker.cri.pageNum}' >
      	<input type="hidden" name='amount' value='${pageMaker.cri.amount}' >
      	<input type="hidden" name='type' value='${pageMaker.cri.type}'>
      	<input type="hidden" name='keyword' value='${pageMaker.cri.keyword}'>
     </form>
</div>


</body>
</html>
<script>
$(document).ready(function(){
	
	//페이징 이벤트 처리
	var actionForm = $('#actionForm');
    $('.pagingBtn').on('click', function(e) {
		e.preventDefault();
		
		var choosedPage = $(this).attr('href');
		actionForm.find("input[name='pageNum']").val(choosedPage);
		
		actionForm.submit();
	});
    
    $('.move').on('click', function(e) {
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