// DOM이 준비되면 실행될 콜백 함수
$(function () {
	
	// 좌측의 로그인 버튼이 클릭되었을 때 이벤트 처리 - 유효성 검사 
	$("#formLogin").submit(function() {
		var id = $("#m_id").val();
		var pass = $("#m_pass").val();
		if(id.length <= 0) {
			alert("아이디가 입력되지 않았습니다.\n아이디를 입력해주세요");
			$("#m_id").focus();
			return false;
		}
		if(pass.length <= 0) {
			alert("비밀번호가 입력되지 않았습니다.\n비밀번호를 입력해주세요");
			$("#m_pass").focus();
			return false;
		}
	});
	
	
	// 좌측의 로그아웃 버튼이 클릭되었을 때 이벤트 처리
	$("#formLogout").on("click", function() {
		var input = confirm("로그아웃 하시겠습니까?");
		if(! input) {
			return false;
		}
			return true;
	});
	
	
		
	
	$("#userId").on("keyup", function() {		
		//영문 대소문자, 숫자만 입력되었는지 체크
		var regExp = /[^A-Za-z0-9]/gi;	
		if(regExp.test($(this).val())) {
			alert("영문 대소문자, 숫자만 입력할 수 있습니다.");
			$(this).val($(this).val().replace(regExp, ""));
		}
	});
	
	$("#pass1").on("keyup", inputCharReplace);	
	$("#pass2").on("keyup", inputCharReplace);	
	
	
	/* 회원 가입 폼에서 아이디 중복확인 버튼이 클릭되면
	 * 아이디 중복을 확인할 수 있는 새 창을 띄워주는 함수
	 **/ 
	$("#btnOverlapId").on("click", function() {
		var id = $("#m_id").val();
		url="overlapIdCheck.mvc?id=" + id;
		
		if(id.length == 0) {
			alert("아이디를 입력해주세요");
			return false;
		}
		
		if(id.length < 5) {
			alert("아이디는 5자 이상 입력해주세요.");
			return false;
		}
		
		window.open(url, "idCheck", "toolbar=no, location=no, " 
				+  "status=no, memubar=no, width=400, height=200");
	});

	
	/* 새 창으로 띄운 아이디 찾기 폼에서
	 * 아이디 중복확인 버튼이 클릭되면 유효성 검사를 하는 함수	 
	 **/
	$("#idCheckForm").on("submit", function() {
		var id = $("#checkId").val();	
		
		if(id.length == 0)  {
			alert("아이디를 입력해주세요");
			return false;
		}
		
		if(id.length < 5) {
			alert("아이디는 5자 이상 입력해주세요.");
			return false;
		}
	});
	
	
	
	
	
	// 회원 가입 폼이 서브밋 될 때 이벤트 처리 - 폼 유효성 검사
	$("#joinForm").on("submit", function() {
	
		return joinFormCheck();
	});
	
	// 회원 정보 수정 폼이 서브밋 될 때 이벤트 처리 - 폼 유효성 검사
	$("#btn_registerUpdate_submit").on("click", function() {
		return updateFormCheck();
	});
	

	/* 회원정보 수정 폼에서 "비밀번호 확인" 버튼이 클릭될 때 이벤트 처리
	 * 회원정보 수정 폼에서 기존 비밀번호가 맞는지를 Ajax 통신을 통해 확인한다.
	 **/
	$("#btnPassCheck").click(function() {
		var oldId = $("#userId").val();
		var oldPass = $("#oldPass").val();
		
		if($.trim(oldPass).length == 0) {
			alert("기존 비밀번호가 입력되지 않았습니다.\n기존 비밀번호를 입력해주세요");
			return false;
		}
		var data = "id=" + oldId + "&pass="+oldPass;
		console.log("data : " + data);
		
		$.post("passCheck.ajax", data, function(resultData, status, xhr) {		
			if(status == "success") {				
				var obj =resultData;
				console.log("resultData : " + resultData);
				
				if(obj.result == -1) {
					alert("존재하지 않는 아이디입니다.");
					
				} else if(obj.result == 0) {
					alert("비밀번호가 다릅니다.\n비밀번호를 다시 입력하고 비밀번호를 확인해주세요");
					$("#oldPass").val("").focus();
					
				} else if(obj.result == 1) {
					alert("비밀번호가 확인되었습니다.\n비밀번호를 수정해주세요");
					$("#btnPassCheck").prop("disabled", true);
					$("#pass1").focus();
				}
			}
		});
	});	
	
	
	/* 회원정보 수정 폼에서 비밀번호 확인 후에 기존 비밀번호가 다시 수정되면 
	 * 비밀번호 확인 버튼을 다시 활성화 시켜서 submit 될때 비밀번호 확인을
	 * 다시 하도록 한다.
	 **/
	$("#oldPass").change(function() {
		$("#btnPassCheck").prop("disabled", false);
	});
		
	
	// 회원정보 수정 폼에서 수정하기 버튼이 클릭되면 유효성 검사를 하는 함수
	$("#memberUpdateForm").on("submit", function() {
		
		/* 회원정보 수정 폼에서 "비밀번호 확인" 버튼이 disabled 상태가 아니면
		 * 기존 비밀번호를 확인하지 않았기 때문에 확인하라는 메시지를 띄운다.
		 **/
		if(! $("#btnPassCheck").prop("disabled")) {
			alert("기존 비밀번호를 확인해야 비밀번호를 수정할 수 있습니다.\n"
				+ "기존 비밀번호를 입력하고 비밀번호 확인 버튼을 클릭해 주세요");
			return false;
		}
		
		/* joinFormChcek() 함수에서 폼 유효성 검사를 통과하지 못하면
		 * false가 반환되기 때문에 그대로 반환하면 폼이 서브밋 되지 않는다.
		 **/ 
		return joinFormCheck();
	});
	
    $('.button-checkbox').each(function () {

        // Settings
        var $widget = $(this),
            $button = $widget.find('button'),
            $checkbox = $widget.find('input:checkbox'),
            color = $button.data('color'),
            settings = {
                on: {
                    icon: 'glyphicon glyphicon-check'
                },
                off: {
                    icon: 'glyphicon glyphicon-unchecked'
                }
            };

        // Event Handlers
        $button.on('click', function () {
            $checkbox.prop('checked', !$checkbox.is(':checked'));
            $checkbox.triggerHandler('change');
            updateDisplay();
        });
        $checkbox.on('change', function () {
            updateDisplay();
        });

        // Actions
        function updateDisplay() {
            var isChecked = $checkbox.is(':checked');

            // Set the button's state
            $button.data('state', (isChecked) ? "on" : "off");

            // Set the button's icon
            $button.find('.state-icon')
                .removeClass()
                .addClass('state-icon ' + settings[$button.data('state')].icon);

            // Update the button's color
            if (isChecked) {
                $button
                    .removeClass('btn-default')
                    .addClass('btn-' + color + ' active');
            }
            else {
                $button
                    .removeClass('btn-' + color + ' active')
                    .addClass('btn-default');
            }
        }

        // Initialization
        function init() {

            updateDisplay();

            // Inject the icon if applicable
            if ($button.find('.state-icon').length == 0) {
                $button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i>');
            }
        }
        init();
    });
    
    // 비밀번호 찾기에서 취소를 눌렀을때 창 닫기와 세션 초기화
	$("#passSearchUpdateForm").on("submit", function() {
		var pass1 = $("#passUpdate_pass1").val();
		var pass2 = $("#passUpdate_pass2").val();
		if(pass1.length <= 0) {
			alert("비밀번호가 입력되지 않았습니다.\n비밀번호를 입력해주세요");
			$("#passUpdate_pass1").focus();
			return false;
		}
		if(pass2.length <= 0) {
			alert("비밀번호가 입력되지 않았습니다.\n비밀번호를 입력해주세요");
			$("#passUpdate_pass2").focus();
			return false;
		}
		if(pass1 != pass2) {
			alert("비밀번호가 동일하지 않습니다.\n비밀번호를 확인해주세요");
			$("#passUpdate_pass1").focus();
			return false;
		}
	});
	
	
		/* 회원정보 수정 폼에서 "비밀번호 확인" 버튼이 클릭될 때 이벤트 처리
	 * 회원정보 수정 폼에서 기존 비밀번호가 맞는지를 Ajax 통신을 통해 확인한다.
	 **/
	$("#btnPassCheck").click(function() {
		var oldId = $("#userId").val();
		var oldPass = $("#oldPass").val();
		
		if($.trim(oldPass).length == 0) {
			alert("기존 비밀번호가 입력되지 않았습니다.\n기존 비밀번호를 입력해주세요");
			return false;
		}
		var data = "id=" + oldId + "&pass="+oldPass;
		console.log("data : " + data);
		
		$.post("passCheck.ajax", data, function(resultData, status, xhr) {		
			if(status == "success") {				
				var obj =resultData;
				console.log("resultData : " + resultData);
				
				if(obj.result == -1) {
					alert("존재하지 않는 아이디입니다.");
					
				} else if(obj.result == 0) {
					alert("비밀번호가 다릅니다.\n비밀번호를 다시 입력하고 비밀번호를 확인해주세요");
					$("#oldPass").val("").focus();
					
				} else if(obj.result == 1) {
					alert("비밀번호가 확인되었습니다.\n비밀번호를 수정해주세요");
					$("#btnPassCheck").prop("disabled", true);
					$("#pass1").focus();
				}
			}
		});
	});
	
	// 회원탈퇴 버튼이 클릭되었을 때 이벤트 처리 - 유효성 검사 
	$("#formDelete").submit(function() {
		var input = confirm("회원탈퇴 하시겠습니까?");
		if(! input) {
			return false;
		}
			return true;
	});
    
});

/////////////////////////////////////부트스트랩//////////////////////////

/* 회원 아이디, 비밀번호, 비밀번화 확인, 이메일 아이디 폼 컨트롤에
 * 사용자가 입력한 값이 영문 대소문자, 숫자 만 입력되도록 수정하는 함수
 **/
function inputCharReplace() {
	// 아래와 같이 정규표현식을 이용해 영문 대소문자, 숫자만 입력되었는지 체크할 수 있다. 
	var regExp = /[^A-Za-z0-9]/gi;	
	if(regExp.test($(this).val())) {
		alert("영문 대소문자, 숫자만 입력할 수 있습니다.");
		$(this).val($(this).val().replace(regExp, ""));
	}
}


/* 회원 가입 폼의 유효성 검사를 하는 함수
  **/
function joinFormCheck() {
	var name = $("#name").val();
	var id = $("#m_id").val();
	var pass1 = $("#pass1").val();
	var pass2 = $("#pass2").val();
	var phone = $("#phone").val();
	var age = $("#age").val();
	var gender = $("#gender").val();
	var isIdCheck = $("#isIdCheck").val();
	
	if(name.length == 0) {		
		alert("이름이 입력되지 않았습니다.\n이름을 입력해주세요");
		$("#name").focus(); 
		return false;
	}	
	if(id.length == 0) {		
		alert("아이디가 입력되지 않았습니다.\n아이디를 입력해주세요");
		$("#m_id").focus(); 
		return false;
	}		
	if(isIdCheck == 'false') {		
		alert("아이디 중복 체크를 하지 않았습니다.\n아이디 중복 체크를 해주세요");
		return false;
	}	
	if(pass1.length == 0) {		
		alert("비밀번호가 입력되지 않았습니다.\n비밀번호를 입력해주세요");
		$("#pass1").focus(); 
		return false;
	}
	
	if(pass2.length == 0) {		
		alert("비밀번호 확인이 입력되지 않았습니다.\n비밀번호 확인을 입력해주세요");
		$("#pass2").focus(); 
		return false;
	}
	if(pass1 != pass2) {
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		return false;
	}
	if(pass1.length < 4) {		
		alert("비밀번호가 너무 짧습니다.\n비밀번호를 4자이상 입력해주세요");
		$("#pass1").focus(); 
		return false;
	}
	if(phone.length == 0 ) {		
		alert("휴대폰 번호가 입력되지 않았습니다.\n휴대폰 번호를 입력해주세요");
		$("#phone").focus(); 
		return false;
	}
	if(phone.length != 11 ) {		
		alert("정확한 휴대폰 번호가 아닙니다.\n휴대폰 번호를 제대로 입력해주세요");
		$("#phone").focus(); 
		return false;
	}
	if(age.length == 0) {		
		alert("나이가 입력되지 않았습니다.\n나이를 입력해주세요");
		$("#age").focus(); 
		return false;
	}
	if(age.length == 0) {		
		alert("나이가 입력되지 않았습니다.\n나이를 입력해주세요");
		$("#age").focus(); 
		return false;
	}
	if($("#gender").val() == "Gender") {
         alert("성별이 선택되지 않았습니다.\n성별을 선택해주세요");      
         return false;
     }
		alert("당신의 회원가입을 축하드립니다");
	
}


/* 회원정보 수정 폼의 유효성 검사를 하는 함수
 **/
function updateFormCheck() {
	var upname = $("#updateMembername").val();		
		var uppass = $("#updateMemberPass").val();
		var uppass2 = $("#updateMemberPass2").val();
		var upphone = $("#updateMemberPhone").val();
		var upage = $("#updateMemberAge").val();
		var upgender = $("#updateMemberGender").val();
		if(upname.length <= 0) {		
			alert("이름이 입력되지 않았습니다.\n이름을 입력해주세요");
			$("#updateMembername").focus(); 
			return false;
		}
		if(uppass.length <= 0) {		
			alert("비밀번호가 입력되지 않았습니다.\n비밀번호를 입력해주세요");
			$("#updateMemberPass").focus(); 
			return false;
		}
		if(uppass2.length <= 0) {		
			alert("비밀번호 확인이 입력되지 않았습니다.\n비밀번호 확인을 입력해주세요");
			$("#updateMemberPass2").focus(); 
			return false;
		}
		if(uppass != uppass2) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			return false;
		}
		if(uppass.length < 4) {		
			alert("비밀번호가 너무 짧습니다.\n비밀번호를 4자이상 입력해주세요");
			$("#updateMemberPass").focus(); 
			return false;
		}
		if(upphone.length == 0 ) {		
			alert("휴대폰 번호가 입력되지 않았습니다.\n휴대폰 번호를 입력해주세요");
			$("#updateMemberPhone").focus(); 
			return false;
		}
		if(!updateMemberPhone.length == 11 ) {		
			alert("정확한 휴대폰 번호가 아닙니다.\n휴대폰 번호를 제대로 입력해주세요");
			$("#updateMemberPhone").focus(); 
			return false;
		}
		if(upage.length == 0) {		
			alert("나이가 입력되지 않았습니다.\n나이를 입력해주세요");
			$("#updateMemberAge").focus(); 
			return false;
		}
	
		if( upgender== "Gender") {
	         alert("성별이 선택되지 않았습니다.\n성별을 선택해주세요");      
	         return false;
	     }
		alert("수정이 완료되었습니다");
}




