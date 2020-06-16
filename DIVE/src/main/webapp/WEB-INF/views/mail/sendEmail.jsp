<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/mail/sendEmail.css">
<div class="choice-sector">
		<div class="choice-sector-content">
			<section class="choice">
					<h1>비밀번호 찾기</h1>
			</section>
				
			<form action="/mail/sendEmail" method="post">
		        <div class="customer_inform"></div>
		            <div class="customer_inform_id_sector">
		                <input type="text" name="userId" class="customer_inform_id" placeholder="  ID를 입력하세요. ">
		            </div>
		            <div class="customer_inform_email_sector">
		                <input type="email" name="email" class="customer_inform_email" placeholder="  이메일주소를 입력하세요. ">
		            </div>
		        </div> 
		        <div class="btnSend">  
		            <button type="submit" name="submit" class="sendEmail">인증 메일받기 (이메일 보내기)</button>
		            <input type="hidden" name="${_csrf.parameterName}"
		                value="${_csrf.token}" />
		        </div> 
		    </form>
		</div>
	</div>

<%@ include file="../include/footer.jsp"%>
