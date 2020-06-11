<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/user/adminPage.css">
	<div class="board_list_wrap">
		<section class="top">
			<h1>관리자 페이지</h1>
			<div class="logo">
				<a href="/"><i class="fas fa-universal-access"
					style="cursor: pointer"></i></a>
			</div>
		</section>
		<table class="board_list">
			<thead>
				<tr>
					<th>No</th>
					<th>아이디</th>
					<th>이 름</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>가입일</th>
					<th colspan="2">상태</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${member}" var="member">
					<tr>
						<td><c:out value="${member.id}"></c:out></td>
						<td><c:out value="${member.userId}"></c:out></td>
						<td><c:out value="${member.name}"></c:out></td>
						<td><c:out value="${member.nickName}"></c:out></td>
						<td><c:out value="${member.email}"></c:out></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${member.regDate}"></fmt:formatDate></td>
						<td><label>활 성</label><input type="radio" name="select"
							value="true"
							<c:if test="${member.enabled eq 'true'}">checked="checked"</c:if> />
							<label>비활성</label><input type="radio" name="select" value="false"
							<c:if test="${member.enabled eq 'false'}">checked="checked"</c:if> />
						</td>
						<td><button class="modify" type="submit">등록</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
<%@ include file="../include/footer.jsp" %>
<script src="/resources/js/adminPage.js"></script>