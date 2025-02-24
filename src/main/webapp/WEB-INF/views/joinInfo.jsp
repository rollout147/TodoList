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
	$("#user_email").blur(function() {
		email();
	});
	
	$("#email_address").change(function(){
		email();
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
				<input type="text" id="user_email" name="user_email">
				&nbsp;@&nbsp;
				<input type="text" id="email_address" name="email_address" list="email_address"/>
					<datalist id="user_email2">
						<option value="naver.com">naver.com</option>
						<option value="naver.com">daum.net</option>
						<option value="naver.com">gmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
					</datalist>
					<input type="hidden" id="tatalEmail" name="tatalEmail" value="">
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