/**
 * 
 */

$(document).ready(function(){
	$("#btnSearch").click(function(){
		if($("#searchKeyword").val() == ''){
			alert("검색 조건을 입력하세요.");
			location.reload();
		} else {
			var url = location.pathname;
			url = url + "?searchType=" + $("#searchType").val();
			url = url + "&searchKeyword=" + encodeURI($("#searchKeyword").val());
			location.href = url;
		}
	});
});