<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="../resources/css/productwrite.css">

<div class="board_list_wrap">
        <div class="board_list_wraping">
            <div class="top">
                <h1>상품 등록 페이지</h1>
                <div class="logo">
                    <a href="./index.html"><i class="fas fa-universal-access" style="cursor:pointer"></i></a>
                </div>
            </div>
            <div class="board">
                <from action="/" method="post">
                    <div class="board_title">
                        <h3>제목</h3>
                        <input type="text" name="" class="board_title_write">
                    </div>
                    <div class="box">
                        <div class="board_region">
                            <h4>판매자 지역</h4><input type="text" class="board_size" list="depList" placeholder="ex) 서울">
                        </div>
                        <div class="board_price">
                            <h4>희망 가격</h4><input type="text" class="board_size">
                        </div>
                    </div>
                    <div class="board_content">
                        <h3>내용</h3>
                        <textarea name="" class="board_content_write"></textarea>
                    </div>
                    <div class="dragndrap">
                        <h3>파일 첨부</h3>
                        <input type="file">
                    </div>
                </from>
            </div>
            <div class="board_btn">
                <button type="submit" class="btn_registration">등록</button>
                <a href="./board.html"><button class="btn_list">목록</button></a>

            </div>
        </div>
    </div>
<script src="../resources/js/productwrite.js"></script>
</body>

</html>