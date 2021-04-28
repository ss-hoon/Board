<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="/WEB-INF/views/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN</title>
<script src="/js/board/boardList.js" type="text/javascript"></script>
<style>
	#searchKeyword {
		width: auto;
		display: inline;
	}
</style>
</head>
<body>
	<h1 class="pull-left">게시판 목록</h1>	
	<div class="clearfix"></div>
	<div>
		<c:if test="${account != null}">
			<span class="pull-right" style="margin-right: 10px; font-size: 18px;">반갑습니다 <strong>${account.name}</strong> 님</span>
		</c:if>
	</div>
	<hr>
	<div>
		<c:if test="${account == null}">
			<button onclick="location.href='/member/signUp'" class="btn btn-default pull-right">Sign-up</button>	
			<button onclick="location.href='/member/login'" style="margin-right: 10px;" class="btn btn-default pull-right">Sign-in</button>
		</c:if>
		<c:if test="${account != null}">
			<button onclick="location.href='/board/insert'" class="btn btn-default pull-left" id="btnWrite">글쓰기</button>
			<button onclick="location.href='/member/logout'" style="margin-right: 10px;" class="btn btn-default pull-right">로그아웃</button>
		</c:if>
	</div>
	<div class="clearfix"></div>
	<br>
	
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th style="width: 10%">글 번호</th>
				<th style="width: 45%">제목</th>
				<th style="width: 20%">작성자</th>
				<th style="width: 15%">작성일</th>
				<th style="width: 10%">조회수</th>
			</tr>	
		</thead>
		<tbody>
			<c:forEach var="board" items="${list}">
				<tr onclick="location.href='/board/detail?postNum=${board.postNum}'">
					<td>${board.rowNum}</td>
					<td>${board.title}</td>
					<td>${board.userId}</td>
					<td>${board.createdDate}</td>
					<td>${board.hitCnt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<jsp:include page="/WEB-INF/views/paging/paging.jsp"/>
	
	<div style="text-align: center">
		<select class="btn btn-default dropdown-toggle" name="searchType" id="searchType">
			<option value="writer">작성자</option>
			<option value="title">제목</option>
			<option value="contents">내용</option>
		</select>
		<input type="text" class="form-control" name="searchKeyword" id="searchKeyword"> 
		<input type="submit" class="btn btn-default" name="btnSearch" id="btnSearch" value="검색">
		<button onclick="location.href='/'" class="btn btn-default">검색 초기화</button>
	</div>
	
	
</body>
</html>

