/**
 * 
 */

$(document).ready(function(){
	
	$("#btnSearch").click(function(){
		if($("#userId").val() == ''){
			alert("아이디를 입력하세요");
			return;
		} else if($("#name").val() == ''){
			alert("이름을 입력하세요");
			return;
		} else if($("#email").val() == ''){
			alert("이메일을 입력하세요");
			return;
		}
		
		var param = {
			"userId" : $("#userId").val(),
			"name" : $("#name").val(),
			"email" : $("#email").val()
		}
		
		$.ajax({
			url : "/member/searchPwProc",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify(param),
			dataType : "json",
			success : function(data){
				console.log(data);
				if(data.userPw != null){
					alert("등록된 아이디의 비밀번호가 있습니다\n=>" + data.userPw);
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