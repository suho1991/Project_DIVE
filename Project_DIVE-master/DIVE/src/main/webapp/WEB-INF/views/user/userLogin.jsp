<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/user/userLogin.css">
	<div class="choice-sector">
        <div class="choice-sector-content">
            <section class="choice">
                <div class="choice_top">
                    <h1>로그인</h1>
                </div>
            </section>
            
            <section class="customer">
                <div class="customer_inform">
                	<form action="/login" method="post">
	                    <div class="customer_inform_id_sector">
	                        <input type="text" class="customer_inform_id" name="username" placeholder="아이디를 입력하세요.">
	                    </div>
	                    <div class="customer_inform_pass_sector">
	                        <input type="password" class="customer_inform_pass" name="password" placeholder="비밀번호를 입력하세요.">
	                    </div>
	                </div>
	            </section>
	            <section class="remember">
	                <div class="remeber_id">
	                    <input type="checkbox" name="remember-me"> 아이디 저장하기
	                </div>
	            </section>
	            <section class="connect_sector">
	                
	                <div>
	                    <input type="submit" class="connect_btn" value="Login">
	                </div>
	                <input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

	            </form>
	            
		        <div>
		            <a href="/user/signUp"><input type="submit" class="connect_btn" value="SignUp"></a>
		        </div>
	        
	            
                <div class="findcustomer">
                    <a href="/user/findMyId">아이디찾기</a> /
                    <a href="/mail/sendEmail">비밀번호찾기</a>
                </div>
            </section>
        </div>
    </div>
    
<%@ include file="../include/footer.jsp" %>