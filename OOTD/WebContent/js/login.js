// DOM이 준비되면 실행될 콜백 함수
$(function(){
    
	
	$("#passchk").on("click", function() {
		
		url="passCheck.mvc";
		
		
		window.open(url, "passCheck", "toolbar=no, location=no, " 
				+  "status=no, memubar=no, width=600, height=400");
				
	});
});
