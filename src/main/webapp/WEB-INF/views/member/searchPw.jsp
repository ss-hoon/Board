<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/js/member/searchPw.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/css/member.css">
<title>비밀번호 찾기</title>
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
			<button class="btn pull-right" id="backBtn" onclick="location.href='/member/login'">로그인 화면</button>
		</div>
		<h1>비밀번호 찾기</h1>
		<br>
		<form>
			<div class="form-group">
			  <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디">
			</div>
			<div class="form-group">
			  <input type="text" class="form-control" id="name" name="userId" placeholder="이름">
			</div>
			<div class="form-group">
			  <input type="email" class="form-control" id="email" name="userId" placeholder="이메일">
			</div>
			
			<div id = "btnGroup">
				<button class="btn btn-block btn-success" id="btnSearch">검색</button>
			</div>
		</form>
  	</div>
</body>
</html>