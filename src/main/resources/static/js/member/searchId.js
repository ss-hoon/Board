/**
 * 
 */

$(document).ready(function(){
	
	$("#btnSearch").click(function(){
		if($("#name").val() == ''){
			alert("이름을 입력하세요");
			return;
		} else if($("#email").val() == ''){
			alert("이메일을 입력하세요");
			return;
		}
		
		var param = {
			"name" : $("#name").val(),
			"email" : $("#email").val()
		}
		
		$.ajax({
			url : "/member/searchIdProc",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify(param),
			dataType : "json",
			success : function(data){
				console.log(data);
				if(data.userId != null){
					alert("등록된 아이디가 있습니다\n=>" + data.userId);
					location.href = "/member/login";
				} else {
					alert("등록된 아이디가 없습니다");
				}
			},
			error : function(){
				alert("통신 오류");
			}
		});
	});
});