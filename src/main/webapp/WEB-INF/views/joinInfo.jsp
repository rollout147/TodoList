<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript">
	// 아이디 중복확인
	function confirmId() {
		if (!validateId()) return;
	
		$.ajax({
			url: '/confirmId',
			type: 'GET',
			dataType: 'json',
			data: { 'user_id': $("#user_id").val() },
			success: function (data) {
				var idCheckMessage = $("#idCheckMessage");
				if (data === 1) {
					// 유효하지 않은 경우
					idCheckMessage.text("중복된 아이디 입니다").css("color", "red");
					isIdConfirmed = false;
				} else {
					idCheckMessage.text("사용 가능한 아이디입니다.").css("color", "green");
					isIdConfirmed = true;
				}
			}
		});
	}

	// 이메일 주소 가져오기

    $(function() {
        $('#selectEmail').change(function() {
            if ($('#selectEmail').val() == 'directly') {
                $('#textEmail').attr("disabled", false);
                $('#textEmail').val("");
                $('#textEmail').focus();
            } else {
                $('#textEmail').val($('#selectEmail').val());
            }
        })
    });

	
</script>	
<body>
<h1>회원가입</h1>
	
	<div class="container">
		<form method="post" action="/join">
			
			<div class="id">
				<label for="user_id">아이디</label>
				<input type="text" id="user_id" name="user_id">
				<button type="button" id="id_check" onclick="confirmId()">중복확인</button>
				<p class="check_font" id="idCheckMessage">
			</div>
		
			<div class="pw">
				<label for="user_pw">비밀번호</label>
				<input type="password" id="user_pw" name="user_pw">
				<p class="check_font" id="pwCheckMessage">
			</div>
		
			<div class="name">
				<label for="user_name">이름</label>
				<input type="text" id="user_name" name="user_name">
				
			</div>
			
			<div class="email">
				<label for="user_email">이메일</label>
				<input type="text" id="user_email" name="user_email" placeholder="이메일 아이디">
				
				&nbsp;@&nbsp;
				
				<input type="text" id="textEmail" name="email_address" placeholder="이메일을 선택하세요"/>
				<select class="emailAddress" id="selectEmail">
					<option value="">이메일 선택</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="directly" id="textEmail">직접입력</option>
				</select>
				
				<input type="hidden" id="totalEmail" name="totalEmail" value="">
			</div>
			
			<div class="submitBut">
				<a href="/joinInfo">
					<button type="submit" id="submitBut">가입하기</button>
				</a>
			</div>
		</form>
		
	</div>
</body>

</html>