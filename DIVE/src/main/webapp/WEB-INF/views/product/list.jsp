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
                    <a href="./index.html"><i class="fas fa-universal-access" style="cursor:pointer"></i></a>
                </div>
            </section>

            <tbody>
            <c:set var="i" value="0" />
            <c:set var="j" value="4" />
	        <c:forEach items="${listProduct}" var="product">
				<tr>
					<td class="tit">
					<a href="#">
					<img src="#" width="150" height="150">
                        <p>${product.writer}</p>
                        <p>${product.price}</p>
                        <p><fmt:formatDate pattern="yyyy-MM-dd"
							value="${product.updateDate}"></fmt:formatDate></p>
                    </a>
                    </td>
				</tr>
			</c:forEach>
            </tbody>
        </table>
        	<sec:authorize access="isAuthenticated()">
        <div class="writing">
            <a href="/product/register"><button class="writing_btn">상품 등록</button></a>
        </div>
		</sec:authorize>
        <div class="paging">
            <a href="#" class="btn">
                <<</a> <a href="#" class="btn">
                    <</a> <a href="#" class="num on">1
            </a>
            <a href="#" class="num">2</a>
            <a href="#" class="num">3</a>
            <a href="#" class="btn">></a>
            <a href="#" class="btn">>></a>
        </div>
    </div>
    
    <script src="../resources/js/board.js"></script>
</body>
</html>