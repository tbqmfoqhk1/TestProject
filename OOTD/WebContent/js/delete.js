$(function() {
	$("#detailDelete").on("click", function() {
	
		
		var input = confirm('삭제하시겠습니까?');
		
		if(input) {
		
		$("#checkForm").attr("action", "deleteProcess.mvc");
		$("#checkForm").attr("method", "post");
		$("#checkForm").submit();
		
		} else{
				return false; 
			}

		
		
	});
});