$(function() {
	$("#detailUpdate").on("click", function() {
		
		$("#checkForm").attr("action", "updateForm.mvc");
		$("#checkForm").attr("method", "post");
		$("#checkForm").submit();
	});
	
	
	$("#btn_updateSubmit").on("click", function() {
		
		if($("#update_weather").val().length <= 0) {
			alert("날씨가 입력되지 않았습니다.\n날씨를 입력해주세요");
			$("#update_weather").focus();
			return false;
		}
		
		if($("#update_temp").val().length <= 0) {
			alert("기온이 입력되지 않았습니다.\n기온을 입력해주세요");
			$("#update_temp").focus();
			return false;
		}
		
		if($("#update_date").val().length <= 0 ) {
			alert("날짜가 입력되지 않았습니다.\n날짜를 입력해주세요");
			$("#update_date").focus();
			return false;
		} 
		if($("#update_date").val().length > 6) {
			alert("날짜를 YYMMDD의 형태로 입력해 주세요.")
			$("#update_date").focus();
			return false; 
		}
			
		if($("#update_content").val().length <= 0) {
			alert("착용 제품이 입력되지 않았습니다.\n착용 제품을 입력해주세요");
			$("#update_content").focus();
			return false;
		}
			
		if($("#update_img").val().length <= 0) {
			var result = confirm("사진이 등록되지 않았습니다." +
			"\n사진을 등록해주세요.");
			return false;
		}
		$("#updateForm").attr("action", "updateProcess.mvc");
		$("#updateForm").attr("method", "post");
		$("#updateForm").submit();
		
	});

});