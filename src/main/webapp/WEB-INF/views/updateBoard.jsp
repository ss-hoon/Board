<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/header.jsp" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/js/board/update.js" type="text/javascript"></script>
<title>Insert title here</title>
<style>
	input, textarea{
		width:100%;
		height:100%;
		border:none;
		border-right:0px;
		border-top:0px;
		boder-left:0px;
		boder-bottom:0px;
		outline: none;
	}
</style>
</head>
<body>
<div class="container">

	<h1 class="pull-left">게시글 수정</h1>
	<button onclick="location.href=document.referrer" class="btn pull-right" id="btnback">뒤로가기</button>
	<button onclick="location.href='/'" style="margin-right: 10px" class="btn pull-right" id="btnBack">HOME</button>
	<div class="clearfix"></div>
	<hr>

	<input type="hidden" id="postNum" name="postNum" value="${detailList.postNum}"/>
	<input type="hidden" id="userId" name="userId" value="${detailList.userId}"/>
	<table class="table table-bordered">
		<tr>
			<td class="info">글번호</td>
			<td colspan="3">${detailList.postNum}</td>
		</tr>

		<tr>
			<td class="info">아이디</td>
			<td colspan="3">${detailList.userId}</td>
		</tr>

		<tr>
			<td class="info">조회수</td>
			<td>${detailList.hitCnt}</td>
			<td class="info">작성일</td>
			<td>${detailList.createdDate}</td>
		</tr>

		<tr>
			<td class="info">제목</td>
			<td colspan="3"><input type="text" id="title" name="title" value="${detailList.title}"/></td>
		</tr>

		<tr>
			<td class="info" colspan="4">본문</td>
		</tr>

		<tr>
			<td colspan="4"><textarea rows="10" cols="150" id = contents name = "contents">${detailList.contents}</textarea>
		</tr>

	</table>
	
	<div class="text-center">
		<button class="btn btn-primary" id="write">수정하기</button>
	</div>
</div>
</body>
</html>