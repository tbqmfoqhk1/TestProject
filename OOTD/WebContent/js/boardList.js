/*// DOM이 준비되면 실행될 콜백 함수*/
$(document).ready(function() {
	$('.search_img').click(function(){
		$('.searchMain').fadeIn(300);
		$('.searchSection').fadeIn(200);
	});
	$('.Delete').click(function(){
		$('.searchSection').fadeOut(200);
		$('.searchMain').fadeOut(300);
	});
	
	/* 검색버튼 눌렀을시*/
	$("#glass").on("click", function() {
		var keyword = $("#keyword").val();
		if(keyword.length <= 0) {
			alert("검색어가 입력되지 않았습니다.\n검색어를 입력해주세요");
			return false;
		}
			
		$("#searchV2").attr("action", window.location.href="boardList.mvc?keyword=" + keyword);
		$("#searchV2").attr("method", "post");
		$("#searchV2").submit();
	});	
	
	$(".styleLink input[id^=btn_hash_]").on("click", function(){
		var hashTag = $(this).val();
		
		$("#searchV2").attr("action", window.location.href="boardList.mvc?keyword="+hashTag);
		$("#searchV2").attr("method", "post");
		$("#searchV2").submit();
		
	});
	$(".styleLink input[id^=btn_hash_]").on("click", function(){
		var hashTag = $(this).val();
		
		$("#searchV2").attr("action", window.location.href="boardList.mvc?keyword="+hashTag);
		$("#searchV2").attr("method", "post");
		$("#searchV2").submit();
		
	});
	
	$("#form1").show(function(e) {

            var choice = $("input[type=checkbox]:checked").val();

            /* 폼 양식에 입력된 데이터를 다음과 같은 파라미터 문자열(쿼리스트링)로 읽어온다.
             * "searchOption=1&id=midas
             **/
            var param = $(this).serialize();
            var result;

            // $.ajax() 메소드를 이용해 POST 방식으로 요청하고 JSON 데이터 받기
            $.ajax({
                url: "ajax/ajaxObjectGson.jsp",
                type: "POST",
                data: param,
                dataType: "json",
                success: function(data) {

                    $("#result").empty();

                    $("<table id='memberTable'></table>").appendTo("#result");

                    console.log("datalength: " + $(data).length);
                    for(var i = 0; i < $(data).length; i++) {

                        $("<tr><td><span class='keywords'>" + $(data).get(i).word + "</span></td></tr>")
                        .appendTo("#memberTable");
                    }
                },
                error: function(xhr, statusText, error) {
                    alert("error : " + statusText + ", " + xhr.status);
                }
            });

            // 기본 이벤트 제거
            return false;
        });

        $(document).on("click", ".keywords", function() {
            var keyword = $(this).text();
            console.log(keyword);
            $("#keyword").val(keyword);
            $("#searchForm").submit();

        });

});
	
	



