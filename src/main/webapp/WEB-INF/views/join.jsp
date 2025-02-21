<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript">
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
				<input type="text" id="user_email" name="user_email">
				&nbsp;@&nbsp;
				<input type="text" id="user_email3" name="selboxDirect" />
					<select id="user_email2" name="email_domain">
						<option value="naver.com">naver.com</option>
						<option value="naver.com">daum.net</option>
						<option value="naver.com">gmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="direct">직접입력</option>
					</select>
			</div>
		</form>
		
	</div>
</body>

</html>