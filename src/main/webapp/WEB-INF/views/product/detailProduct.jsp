<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/productitem.css">
 <div class="product_list_wrap">
        <div class="product_list_wraping">
            <div class="product_img">
				
    
            </div>
            <div class="product_item">
                <div class="product_user">
                    <h3 class="product_writer">${product.writer}</h3>
                    <div class="product_region">
                            ${product.region}
                    </div>
                </div>
                    <!-- 신뢰도 bar-->
                <div class="reliability">
                    <div class="meter">
                        <span style="width:30%;">
                            <span class="progress"></span>
                        </span>
                    </div>
                    <h5>매너온도</h5>
                </div>
            </div>
            <div class="product_content">
                <div class="product_content_top">
                    <div class="product_describe">
                        <h3 class="product_title">${product.title}</h3>
                            <p class="product_date">
						<fmt:formatDate pattern="yyyy-MM-dd"
							value="${product.updateDate}"></fmt:formatDate></p>
                        <h3>${product.price}원</h3>
                    </div>
                    
                    <div class="chat_btn_area">
                        <a onclick="window.open ( '../Project/chat/html.html', 'name', 'width = 400, height = 569, scrollbars=no, resizable=no, toolbars=no, menubar=no')"><button class="chat_btn">채팅하기</button></a>
                    </div>

                </div>

                <p class="product_content_main">
                    
                 ${product.description}

                </p>

			<div class="product_content_bottom">
                <div class="product_interest">
                    채팅 1 ∙ 관심 ${product.likeCount} ∙ 조회 ${product.hitsCount}
                </div>
                <div class="product_content_control">
		<sec:authentication property="principal" var='principal'/>
			<sec:authorize access="isAuthenticated()">
				<c:if test="${principal.user.id eq product.userNum}">
                <button data-oper="update">수정</button>
                <button data-oper="delete">삭제</button>
            </c:if>
			</sec:authorize>
                <a href="/product/list"><button>목록</button></a>
                </div>
			</div>

                
                
            </div>


        </div>
    </div>

    <form id="operForm" action="/product/updateProduct" method="get">
        <input type="hidden" id="id" name="id" value="${product.id}">
        <input type="hidden" name="userNum" value="${product.userNum}">
        <input type="hidden" id="pageNum" name="pageNum" value="${criteria.pageNum}">
        <input type="hidden" id="amount" name="amount" value="${criteria.amount}">
        <input type="hidden" name="type" value="${criteria.type}">
        <input type="hidden" name="keyword" value="${criteria.keyword}">
        <input type='hidden' name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
</body>

</html>
<script>
$(document).ready(function() {
	(function(){
		var productId = "${product.id}"; 
		$.getJSON("/product/getAttachList", {id : productId}, function(listAttach){
			var outStr = '<ul class="slider-container simple-list" id="slider">';
			
			$(listAttach).each(function(i, attachVO){
				var fileCallPath = encodeURIComponent(attachVO.uploadPath + "/"
								 + attachVO.thumbnailHeader + attachVO.uuid
								 + attachVO.fileNameSeparatorUuid + attachVO.fileName);
				if(attachVO.fileType) {
					outStr += "<li class='slide'>"
							+ "<img class='productImg' src='/displayImage?absoluteFileName=" + fileCallPath + "' >"
							+ "</li>";
				}
			});
			outStr += "</ul>"
			
			$(".product_img").html(outStr);
		});
		
	})();
	
	var operForm = $("#operForm");
	$("button[data-oper='update']").on("click", function(e) {
	    operForm.submit();
	});
	
	$("button[data-oper='delete']").on("click", function(e) {
	    operForm.attr("action", "/product/deleteProduct").attr("method", "post").submit();
	});

	
});
</script>