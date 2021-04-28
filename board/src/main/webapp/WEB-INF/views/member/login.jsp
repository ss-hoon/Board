<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/js/member/login.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/css/member.css">
<title>Login</title>
<style>
	#backBtn {
		background: #f5f6f7;
		color: #8C8C8C;
	}
	
	#headBtn {
		margin-bottom: 50px;
	}
</style>
</head>
<body>
	<div class="container">
		<div id="headBtn">
			<button class="btn pull-right" id="backBtn" onclick="location.href='/'">HOME</button>
		</div>
		<h1>LOGIN</h1>
		<br>
		<form>
			<div class="form-group">
			  <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디">
			</div>
			<div class="form-group">
			  <input type="password" class="form-control" id="userPw" name="userPw" placeholder="비밀번호">
			</div>
			
			<div id = "btnGroup">
				<button class="btn btn-block btn-success" type="button" id="btnLogin">로그인</button>
			</div>
		</form>
		<hr>
		<div class="btn-group btn-group-justified">
		    <a class="btn btn-primary" onclick="location.href='/member/searchId'">아이디 찾기</a>
		    <a class="btn btn-primary" onclick="location.href='/member/searchPw'">비밀번호 찾기</a>
		    <a class="btn btn-primary" onclick="location.href='/member/signUp'">회원가입</a>
	  	</div>
  	</div>
</body>
</html>