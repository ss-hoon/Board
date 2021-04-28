/**
 * 
 */

$(document).ready(function(){
	var flagBtnModify = false;
	var flagProceedModify = 0;
	
	function changeInput(idx){
		var tag = "<div class='row-fluid'>";
		tag += "<div class='col'>";
		tag += "<div class='input-group'>";
		tag += "<input type='text' class='form-control newReplyContents' id='newReplyContents" + idx + "'";
		tag += " placeholder='댓글을 수정하세요'/>";
		tag += "<span class='input-group-btn'>";
		tag += "<button class='btn btn-default btnReplyUpdateWrite'>작성</button>";
		tag += "</span></div></div></div>";
		
		return tag;
	}
	
	$("#btnWrite").click(function(){
		console.log($("#userId").val());
		if($("#userId").val() == ''){
			alert("로그인이 필요합니다");
			location.href="/member/login";
			return;
		}
		
		if($("#contents").val() == ''){
			alert("댓글을 1자 이상 입력해주세요.");
		} else{
			console.log($("#userId").val());
			var param = {
				"postNum" : $("#postNum").val(),
				"contents" : $("#contents").val(),
				"userId" : $("#userId").val()
			};
			
			$.ajax({
				url : "/reply/insert",
				type : "POST",
				contentType : "application/json; charset=UTF-8",
				data : JSON.stringify(param),
				dataType : "json",
				success : function(data){
					if(data != 0){
						alert("작성 성공");
						location.href="/board/detail?postNum=" + $("#postNum").val();
					}
				},
				error : function(){
					alert("통신 오류");
				}
			});	
		}
	});
	
	/* 로그인 아이디에 따라 댓글 수정 삭제버튼 disabled */
	$("#replyList tr .modify").each(function(index, item){
		var idx = item.value;
		
		if($("#userId").val() != $("#replyListUserId" + idx).data('value')){
			$("#btnReplyUpdate" + idx).attr("disabled", true);
			$("#btnReplyDelete" + idx).attr("disabled", true);
		}
	});
	
	/* 수정 버튼을 누르면 input이 나옴 */
	/* 다시 누르면 원래대로 */
	$(".modify").click(function(){
		var idx = $(this).attr("value");
		var originContents = $("#replyContentsParam" + idx).val();
		var tag = "";
		
		if(flagProceedModify != idx && flagProceedModify != 0){
			alert("한번에 하나의 댓글만 수정할 수 있습니다");
			return;
		}
		
		if(!flagBtnModify){
			tag = changeInput(idx);
			flagBtnModify = true;
			flagProceedModify = idx;
		} else {
			tag = originContents;
			flagBtnModify = false;
			flagProceedModify = 0;
		}
		
		$("#replyContents" + idx).html(tag);
		
		$(".btnReplyUpdateWrite").click(function(){
			var contents = $(".newReplyContents").val();
				
			var param = {
				"idx" : idx,
				"contents" : contents
			};
			
			console.log(param);
			
			$.ajax({
				url : "/reply/update",
				type : "POST",
				contentType : "application/json; charset=UTF-8",
				data : JSON.stringify(param),
				dataType : "json",
				success : function(data){
					if(data != 0){
						alert("수정 성공");
						location.href="/board/detail?postNum=" + $("#postNum").val();
					}
				},
				error : function(){
					alert("통신 오류");
				}
			});
		});
	});
});