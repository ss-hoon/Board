/**
 * 
 */

$(document).ready(function(){
	$("#btnWrite").click(function(){
		if($("#title").val() == '' || $("#contents").val() == ''){
			alert("제목 또는 내용을 1자 이상 입력해주세요.");
			return;
		}
		
		var param = {
			"title" : $("#title").val(),
			"contents" : $("#contents").val(),
			"userId" : $("#userId").val()
		}
		
		$.ajax({
			url : "/board/insertProc",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify(param),
			dataType : "json",
			success : function(data){
				if(data != 0){
					alert("작성 성공");
					location.href="/";
				}
			},
			error : function(){
				alert("통신 오류");
			}
		});
	});
});