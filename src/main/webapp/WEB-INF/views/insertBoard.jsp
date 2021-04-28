<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/js/board/insert.js" type="text/javascript"></script>
<title>게시글 작성</title>
</head>
<body>
	<input type="hidden" id="userId" value="${account.userId}"/>
	<div class="container">
		<button onclick="location.href=document.referrer" class="btn pull-right">뒤로가기</button>
		<button onclick="location.href='/'" style="margin-right: 10px" class="btn pull-right" id="btnBack">HOME</button>
		<h1>글쓰기 페이지</h1>
		
		<hr>
		
			<!-- 
			<div class="form-group">
				<label for="writer">작성자</label>
				<input type="text" id="writer" value="${islogin }" readonly="readonly" class="form-control">
			</div>
			-->
			
		<div class="form-group"> <!-- form-group 폼모양 이쁘게 -->
			<label for="title">제목:</label><input class="form-control" type="text" id="title" name="title"/><br>
			<label for="content">내용:</label><textarea class="form-control" id="contents" name="contents" rows="10" style="width:100%;"></textarea><br>
			<div class="text-center">
				<button class="btn btn-primary" id="btnWrite">작성하기</button>
				<input type="reset" id="cancel" name="cancel" class="btn btn-danger" value="초기화">	
			</div>
		</div>
	</div>
</body>
</html>