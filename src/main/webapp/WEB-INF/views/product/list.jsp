<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="../resources/css/board.css">

<div class="board_list_wrap">
        <table class="board_list">
            <section class="top">
                <h1>상품 목록</h1>
                <div class="logo">
                    <a href="/"><i class="fas fa-universal-access" style="cursor:pointer"></i></a>
                </div>
            </section>

            <tbody>
            <c:set var="i" value="0" />
            <c:set var="j" value="4" />
	        <c:forEach items="${listProduct}" var="product">
	        <c:if test="${i%j == 0}">
				<tr>
			</c:if>
					<td class="tit">
					<a class="move" href="${product.id}">
					<span class="product_img${product.id}"></span>
                        <p>${product.writer}</p>
                        <p>${product.price}원</p>
                        <p><fmt:formatDate pattern="yyyy-MM-dd"
							value="${product.updateDate}"></fmt:formatDate></p>
                    </a>
                    </td>
                    <script>
				$(document).ready(function(){
					  (function(){
							var productId = ${product.id};
							$.getJSON("/product/getAttachList", {id : productId}, function(listAttach){
								console.log(listAttach);
								var outStr = "";
								
								$(listAttach).each(function(i, attachVO){
									if(i===0){
									var fileCallPath = encodeURIComponent(attachVO.uploadPath + "/"
													 + attachVO.thumbnailHeader + attachVO.uuid
													 + attachVO.fileNameSeparatorUuid + attachVO.fileName);
										outStr += "<img class='productImg' src='/displayImage?absoluteFileName=" + fileCallPath + "' >";
									}
									
								});	
								
								$(".product_img" + productId).append(outStr);
							});
							
						})();
				})
				</script>
                <c:if test="${i%j == j-1}">
				</tr>
				</c:if>
				<c:set var="i" value="${i+1}"></c:set>
				
				
			</c:forEach>
            </tbody>
        </table>
        	<sec:authorize access="isAuthenticated()">
        <div class="writing">
            <a href="/product/register"><button class="writing_btn">상품 등록</button></a>
        </div>
		</sec:authorize>
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
    </div>
    <form id='actionForm' action='/product/list' method='get'>
     	<input type="hidden" name='pageNum' value='${pageMaker.cri.pageNum}' >
     	<input type="hidden" name='amount' value='${pageMaker.cri.amount}' >
     	<input type="hidden" name='type' value='${pageMaker.cri.type}'>
     	<input type="hidden" name='keyword' value='${pageMaker.cri.keyword}'>
    </form>
    <script src="../resources/js/board.js"></script>
</body>
</html>

<script>
$(document).ready(function(){
    var actionForm = $('#actionForm');

	  $('.move').on('click', function(e) {
      	e.preventDefault();
      	actionForm.append("<input type='hidden' name='id' value='"+$(this).attr('href')+"'/>");
      	actionForm.attr("action","/product/detailProduct");
      	actionForm.submit();
		});
	  
	  $("button[data-oper='delete']").on("click", function(e) {
		    operForm.attr("action", "/product/deletePost").attr("method", "post").submit();
		});
	  
	  var actionForm = $('#actionForm');
	    $('.pagingBtn').on('click', function(e) {
			e.preventDefault();
			
			var choosedPage = $(this).attr('href');
			actionForm.find("input[name='pageNum']").val(choosedPage);
			
			actionForm.submit();
		});
})
</script>