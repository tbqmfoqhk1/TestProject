// DOM이 준비되면 실행될 콜백 함수
$(function() {
		
	/* 새 창으로 띄운 아이디 중복확인 창에서 "아이디 사용 버튼"이 클릭되면 
	 * 새 창을 닫고 입력된 아이디를 부모창의 회원가입 폼에 입력해 주는 함수
	 **/
	$("#btnIdCheckClose").on("click", function() {
		var id = $(this).attr("data-id-value");
		opener.document.joinForm.id.value = id;
		opener.document.joinForm.isIdCheck.value = true;
		window.close();
	});
	
		});
