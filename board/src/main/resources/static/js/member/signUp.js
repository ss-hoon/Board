/**
 * 
 */
var flagIdCheck = false; // 아이디 중복 체크 
$(document).ready(function(){
	/* 검증 */
	$("#btnIdCheck").click(function(){
		if($("#userId").val() == ''){
			alert("아이디를 입력하세요");
			return;
		}
		
		$.ajax({
			url : "/member/idCheck",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify({"userId" : $("#userId").val()}),
			dataType : "json",
			success : function(data){
				if(data == 0){
					alert("사용가능한 아이디입니다");
					flagIdCheck = true;
					$("#userId").attr("disabled", true);
				} else {
					alert("중복된 아이디입니다.");
				}
			},
			error : function(){
				alert("통신 오류");
			}
		});
	});
	
	/* 검증 완료 후 통신 */
	
	$("#btnRegister").click(function(){
		if(!flagIdCheck){
			alert("아이디 중복체크를 해주세요");
			return;
		} else if($("#userPw").val() == ''){
			alert("비밀번호를 입력하세요");
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
			"userPw" : $("#userPw").val(),
			"name" : $("#name").val(),
			"email" : $("#email").val()
		};
		
		$.ajax({
			url : "/member/signUpProc",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify(param),
			dataType : "json",
			success : function(data){
				if(data == 1){
					alert("가입 성공");
					location.href = "/member/login";
				} else {
					alert("가입 실패");
				}
			},
			error : function(){
				alert("통신 오류");
			}
		});
	});
});