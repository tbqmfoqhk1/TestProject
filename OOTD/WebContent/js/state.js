// DOM(Document Object Model)이 준비 되었다면
$(document).ready(function() {
	
	
	$("#bookmark").click(function() {	
		if($("#detailLoginchk").val()){
		var class1 = $(this).attr('class');
		if(class1=='far fa-bookmark'){
			$.ajax({			
				url: "state.ajax",
				
				// type을 지정하지 않으면 get 방식 요청이다.
				type: "post",
				
				// 파라미터로 보낼 데이터를 객체 리터럴로 지정하고 있다.
				data: { "state": "state", no : $("#no").val() },
				
					
				dataType: "json",
				success: function(data, status, xhr) {
					
					alert("북마크에 등록 되었습니다.");
					$("#bookmark > .state").text(" (" + data.state + ")");		
					$("#bookmark").attr('class', 'bi bi-bookmark-fill');		
				},			
				error: function(xhr, status, error) {
					alert(xhr.statusText + ", " + status + ", " + error);
				}
			});
			
		} else {
			$.ajax({			
				url: "state_minus.ajax",
				
				// type을 지정하지 않으면 get 방식 요청이다.
				type: "post",
				
				// 파라미터로 보낼 데이터를 객체 리터럴로 지정하고 있다.
				data: { "state": "state", no : $("#no").val() },
				
					
				dataType: "json",
				success: function(data, status, xhr) {
					
					alert("북마크가 해제되었습니다.");
					$("#bookmark > .state").text(" (" + data.state + ")");		
					$("#bookmark").attr('class', 'far fa-bookmark');		
				},			
				error: function(xhr, status, error) {
					alert(xhr.statusText + ", " + status + ", " + error);
				}
			});
		}
	} else{
			alert("좋아요는 로그인해야지만 가능합니다.\n 로그인해주세요");
			return false;
			
		}
	}).hover(function() {
		$(this).css({cursor: "pointer"});
	});
	


/* 아래는 신고하기 버튼을 임시로 연결한 함수 */
function reportReply(elemId) {
	var result = confirm("이 댓글을 신고하시겠습니까?");
	if(result == true) {
		alert("report - " + result);
	}	
};
});