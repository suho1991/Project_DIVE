<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/user/signUp.css">
	<div class="choice-sector">
        <div class="choice-sector-content">
            
            <section class="customer">
                <div class="customer_inform">


                    <form action="/user/signUp" method="post" onsubmit="return checkAll()">
                        <fieldset>
                            <h1 class="top">아이디/비밀번호 입력</h1><br />
                            <div class="fieldlabel">
                                <div class="test"><label for="userId">아이디</label></div>
                                <input class="border" type="text" id="userId" name="userId" maxlength="20" value="">
                            </div>
                            <div class="fieldlabel">
                                <div><label for="userPw">비밀번호</label></div>
                                <input class="border" type="password" id="userPw" name="password" maxlength="20"
                                    autocomplete="off">
                            </div>
                            <div class="fieldlabel">
                                <div><label for="userPwCheck">비밀번호 확인</label></div>
                                <input class="border" type="password" id="userPwCheck" maxlength="20"
                                    autocomplete="off">
                            </div>
                            <br />
                            <h1>회원정보 입력</h1><br />
                            <div class="fieldlabel">
                                <div><label for="userName">이름</label></div>
                                <input class="border" type="text" id="userName" name="name" maxlength="20" value="">
                            </div>
                            <div class="fieldlabel">
                                <div><label for="userName">닉네임</label></div>
                                <input class="border" type="text" id="userName" name="nickName" maxlength="20" value="">
                            </div>
                            <div class="fieldlabel">
                                <div><label for="birthday">생년월일</label></div>
                                <input class="border" type="text" name="birthday" maxlength="8"
                                    placeholder="ex)19900314" size="15">
                            </div>
                            <div class="fieldlabel"><label>성별</label>
                                <input type="radio" name="sex" value="M" alt="남자" checked>남자
                                <input type="radio" name="sex" value="F" alt="여자">여자
                            </div>
                            <div class="fieldlabel">
                                <div><label for="address">주소</label></div>
                                <input class="border" type="text" size="30" name="address" />
                            </div>
                            <div class="fieldlabel">
                                <div><label for="mPhone1">연락처</label></div>
                                <input class="border" id="mPhone2" name="phone" type="text" value="" size="20"
                                    maxlength="11" autocomplete="off" placeholder="'-'없이 번호만 입력해주세요">
                            </div>
                            <div class="fieldlabel">
                                <div><label for="email01">이메일</label></div>
                                <input class="border" type="text" id="email01" name="email" size="20" maxlength="20"
                                    value="" autocomplete="off" placeholder="example@co.kr">
                            </div>
                            <div class="btnfield">
                                <input type="submit" class="connect_btn" value="Sign Up">
                            </div>
                        </fieldset>
                        <input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
                    </form>
                </div>
            </section>
        </div>
    </div>

<%@ include file="../include/footer.jsp" %>
<script src="/resources/js/signUp.js"></script>
