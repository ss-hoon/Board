/**
 * 
 */

$(document).ready(function(){
	
	$("#btnLogin").click(function(){
		if($("#userId").val() == ''){
			alert("아이디를 입력하세요");
			return;
		} else if($("#userPw").val() == ''){
			alert("비밀번호를 입력하세요");
			return;
		}
		
		var param = {
			"userId" : $("#userId").val(),
			"userPw" : $("#userPw").val()
		}
		
		$.ajax({
			url : "/member/loginProc",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify(param),
			dataType : "json",
			success : function(data){
				console.log(data);
				if(data == 1){
					alert("로그인되었습니다.");
					location.href = "/";
				} else {
					alert("아이디 또는 비밀번호가 다릅니다");
				}
			},
			error : function(){
				alert("통신 오류");
			}
		});
	});
});