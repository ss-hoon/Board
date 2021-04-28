<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/js/reply/reply.js" type="text/javascript"></script>
<title>게시글 상세목록</title>
<style>
	#reply, th {
		text-align: center;
	}
	
	.replyContents {
		text-align: left;
	}
</style>
</head>

<div class="container">
	<input type="hidden" id="postNum" name="postNum" value='${detailList.postNum}'/>
	<input type="hidden" id="account" name="account" value='${account}'/>
	<input type="hidden" id="userId" name="userId" value='${account.userId}'/>
	<h1 class="pull-left">게시글 상세목록</h1>
	<button onclick="location.href=document.referrer" class="btn btn-default pull-right" id="btnBack">뒤로가기</button>
	<button onclick="location.href='/'" style="margin-right: 10px" class="btn btn-default pull-right" id="btnBack">HOME</button>
	
	<div class="clearfix"></div>
	<hr>

	<table class="table table-bordered">
		<tr>
			<td class="info">글번호</td>
			<td colspan="3">${detailList.postNum}</td>
		</tr>

		<tr>
			<td class="info">조회수</td>
			<td>${detailList.hitCnt}</td>
			<td class="info">작성일</td>
			<td>${detailList.createdDate}</td>
		</tr>

		<tr>
			<td class="info">제목</td>
			<td colspan="3">${detailList.title}</td>
		</tr>

		<tr>
			<td class="info" colspan="4">본문</td>
		</tr>

		<tr>
			<td colspan="4">${detailList.contents}</td>
		</tr>

	</table>
	<br>
	<c:if test="${account.userId eq detailList.userId}">
	<div class="text-center">
		<a href="/board/update?postNum=${detailList.postNum}"><button class="btn btn-primary">수정</button></a>
		<a href="/board/delete?postNum=${detailList.postNum}"><button id="delete" class="btn btn-primary btn-danger">삭제</button></a>
	</div>
	</c:if>
	
	<div style="margin-top: 20px;">
		<strong>Comment</strong>
		<div class="row-fluid">
			<div class="col">
			    <div class="input-group">
			    <input type="text" class="form-control" id="contents" name="contents" placeholder="댓글을 입력하세요"/>
			    <span class="input-group-btn">
					<button class="btn btn-default" id="btnWrite">작성</button>
			    </span>
			    </div>
			</div>
		</div>
		
		<div style="margin-top: 20px;">
			<table id="reply" class="table table-striped table-hover">
				<thead>
					<tr>
						<th style="width: 50%">내용</th>
						<th style="width: 16%">글쓴이</th>
						<th style="width: 14%">작성일</th>
						<th style="width: 10%">수정</th>
						<th style="width: 10%">삭제</th>
					</tr>
				</thead>
				<tbody id="replyList">
				<c:forEach var="replyList" items="${replyList}">
					<input type="hidden" id="replyObject${replyList.idx}" value="${replyList}"/>
					<input type="hidden" id="replyContentsParam${replyList.idx}" name="replyContentsParam${replyList.idx}"/>
					<tr style="border: 1px solid black" id="linkReReply${replyList.idx}" data-value="${replyList.userId}">
						<td class="replyContents" id="replyContents${replyList.idx}">${replyList.contents}</td>
						<td id="replyListUserId${replyList.idx}" data-value="${replyList.userId}">${replyList.userId}</td>
						<td>${replyList.createdDate}</td>
						<td><button class="btn btn-primary modify" id="btnReplyUpdate${replyList.idx}" name="btnReplyUpdate${replyList.idx}" value="${replyList.idx}">수정</button></td>
						<td><button class="btn btn-danger" id="btnReplyDelete${replyList.idx}" onclick="location.href='/reply/delete?postNum=${replyList.postNum}&idx=${replyList.idx}'">삭제</button></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
		
</div>