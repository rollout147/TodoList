<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
	<div class="container">
		<div class="form">
			<form action="/login" method="post">
				<c:if test="${not empty loginFailed}">
					<p class="errMessage">${loginFailed}</p>				
				</c:if>
				
				<input type="text"		placeholder="아이디" 	id="user_id" name="user_id" value="${user_id}" required="required">
				<input type="password"	placeholder="비밀번호"	name="user_pw" required="required">
				<input type="submit"	value="로그인">
			</form>
			
			<button class="but_join">
				<a href="/join">회원가입</a>
			</button>
			
			<button class="but_findId">
				<a href="/findId">아이디 찾기</a>
			</button>
			
			<button class="but_findPw">
				<a href="/findPw">비밀번호 찾기</a>
			</button>
						
		</div>
	</div>
</body>
</html>