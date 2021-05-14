// DOM이 준비되면 실행될 콜백 함수
// 체크 함수
function getCheckboxValue()  {
  // 선택된 목록 가져오기
  const query = 'input[name="disease"]:checked';
  const selectedEls = 
      document.querySelectorAll(query);

  // 선택된 목록에서 value 찾기
  let result = '';
  selectedEls.forEach((el) => {
	if(result==''){
		result += el.value;	
	} else {
		result += ', ' + el.value;
	}
    
  });

  // 출력
  document.getElementById('result1').innerText
    = result;
}

$(function() {
	// python 머신러닝 ajax 연동
	$("#testStart").click(function(){
		$("#result").empty();
		let count = $("input:checked[type='checkbox']").length;
		if(count <= 1){
			$(this).prop("checked", false);
				alert("2개 이상 선택하셔야 합니다.");
			return false;
		}
		data = document.getElementById("result1").innerText;		
		console.log(data);
		console.log("testStart Clicked...");
		$.ajax({
			url:"http://localhost:9000/selfTest",
			type: "post", data:{"symptom" : data},
			success: function(res) {
				// div:result에 결과 출력
				var resultDisease = 
					"선택한 증상으로 예측한 병은 "
					+"<span style='color : red;'>"
					+ res
					+"</span>"
					+ "입니다.";
				$("#result").append(resultDisease);
				//
			},
			error: function(xhr, statusText, err) {
				console.log(statusText + " == " + err);
			}
		});
	});
})
