/**
 * 
 */

$(document).ready(function(){
	
	$("#write").click(function(){
		var param = {
			"postNum" : $("#postNum").val(),
			"userId" : $("#userId").val(),
			"title" : $("#title").val(),
			"contents" : $("#contents").val(),
		}
		
		$.ajax({
			url : "/board/updateProc",
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
				alert("통신오류");
			}
		});
	});
});