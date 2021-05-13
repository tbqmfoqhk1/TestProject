// DOM이 준비되면 실행될 콜백 함수
$(document).ready(function() {
    $('.navbar-nav [data-toggle="tooltip"]').tooltip();
    $('.navbar-twitch-toggle').on('click', function(event) {
        event.preventDefault();
        $('.navbar-twitch').toggleClass('open');
    });
    
    $('.nav-style-toggle').on('click', function(event) {
        event.preventDefault();
        var $current = $('.nav-style-toggle.disabled');
        $(this).addClass('disabled');
        $current.removeClass('disabled');
        $('.navbar-twitch').removeClass('navbar-'+$current.data('type'));
        $('.navbar-twitch').addClass('navbar-'+$(this).data('type'));
    });

	$("#nav_weather").on('click', function() {
		var APIKey="53daaee22b6c134ca78d1ed703d4b2fa";
		var apiURI = "http://api.openweathermap.org/data/2.5/forecast?q=Seoul&appid="+APIKey;
	    $.ajax({			
    			url: apiURI,
                dataType: "json",
                type: "GET",
                async: "false",
                success: function(resp) {
					var min_array = [];
	         		var weather = [];
	         		var chart_date = [];
	         		for(i=0; i<resp.list.length;  i++){
	         			var timetxt = String(resp.list[i].dt_txt);
						var clocktxt = timetxt.substr(11,2);
	         			if(clocktxt==0 || clocktxt==6 || clocktxt==12 || clocktxt==18){
	         				var tmp_weather = resp.list[i].weather[0].main;
	         				var min_temp = resp.list[i].main.temp- 273.15;
	         				min_array.push(min_temp.toFixed(1));
		             		weather.push(tmp_weather);
							if(chart_date.length<=0){
								tradeDate = Date.parse(resp.list[i].dt_txt) +32400000;
		             			chart_date.push(tradeDate);
							}
	         			}
	         		}
					
             		$("#array_weather").val(weather);
					$("#array_minTemp").val(min_array);
					$("#array_date").val(chart_date);
					$("#nav_weatherForm").attr("action", "weatherPage.mvc");
					$("#nav_weatherForm").attr("method", "post");
					$("#nav_weatherForm").submit();
               }
		});
	});

});
