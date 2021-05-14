<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
	
<article class="article">    
    <div id="Detail" class="Detail">
    	<div id="folium-map" class="folium-map"></div>
    		<div id = "check" class = "check">
	    		<a href="projectMap?keyword=${ keyword }&rate=NaN">모든등급</a>
	        	<a href="projectMap?keyword=${ keyword }&rate=1등급">1등급</a>
				<a href="projectMap?keyword=${ keyword }&rate=2등급"> 2등급</a>
				<a href="projectMap?keyword=${ keyword }&rate=3등급">3등급</a>
				<a href="projectMap?keyword=${ keyword }&rate=4등급">4등급</a>
				<a href="projectMap?keyword=${ keyword }&rate=등급제외">등급제외</a><br/> 
            </div>
        	<div id="scroll" class="scroll"> 
            	<c:if test="${ not empty pList }">
					<c:forEach var="p" items="${ pList }" varStatus="status">	
					<div id="list" class="list" style="pointer-events: visiblepainted;">
				    	<div id ="hospital_list" class="hospital_list" style="top: -806px;">
				    		<div class="result" align="center">
					    		<div class="a_hospital" data-hid="">
					    			<div class="search_hospital" >
					    				<div class="info">
					    					<div class="title">
					    						<div class="name">${ p.name }</div>
						    					<div class="num">${ p.disease }</div>
						    				</div>
						    				<div class="location">
						    					<div class="address">${ p.grade } &nbsp; | &nbsp; ${ p.area }</div>
						    				</div>
						    			</div>
						   				<div class="pic">
						   					<img src="resources/images/hospital/${ p.img }"/>
						   				</div>
						   			</div>
					    			<div class="hospital_mini"><br/></div>	
				    			</div>
				    		</div>
				    	</div>
			    	</div>
	    </c:forEach>
		</c:if>
		<div class="pageNum">
			<c:if test="${ startPage > pageGroup }">
				<a href="projectMap?pageNum=${ startPage - pageGroup }
				&keyword=${ keyword }&rate=${ rate }">←</a>
			</c:if>
			<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
				<c:if test="${ i == currentPage }">
					${ i }
				</c:if>
				<c:if test="${ i != currentPage }">
					<a href="projectMap?pageNum=${ i }
					&keyword=${ keyword }&rate=${ rate }">${ i }</a>
				</c:if>
			</c:forEach>

			<c:if test="${ endPage < pageCount }">
				<a href="projectMap?pageNum=${ startPage + pageGroup }
				&keyword=${ keyword }&rate=${ rate }">→</a>
			</c:if>
		</div>
		
	<c:if test="${ empty pList }">
		<div class="none">
            해당 등급의 병원은 없습니다.
        </div> 
 
	</c:if>
	</div> 
	</div>
</article>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb7aaac94442a9e4a0443c14ac6faabf"></script>
<script>
var marker = [];

var mapContainer = document.getElementById('folium-map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.308103598482965, 126.94722480416557), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
<c:if test="${ not empty pList }">
<c:forEach var="p" items="${ pList }" varStatus="status"> 

var positions = [
    {
        content: '<div>${ p.name }</div>', 
        latlng: new kakao.maps.LatLng(${ p.lat }, ${ p.log })
    }
];

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}
</c:forEach>
</c:if>

/* 현재 위치 표시하는 메서드 */
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="text-align: center;padding-left: 37px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}  
function displayPlaces(places) {
	
	var listEl = document.getElementById('scroll'),
	fragement = document.createDocumentFragment(),
	listStr = '';

	for ( var i=0; i<places.length; i++ ) {
		var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
			marker = addMarker(placePosition, i),
			itemEl = getListItem(i, places[i]);
		
		(function(marker, title) {
			kakao.maps.event.addListener(marker, 'mouseover', function() {
				displayInfowindow(marker, title);
			});
			
			kakao.maps.event.addListener(marker, 'mouseout', function() {
				infowindow.close();
			});
			
			itemEl.onmouseover = function () {
				displayInfowindow(marker, title);
			};
			
			itemEl.onmouseout = function () {
				infowindow.close();
			};
		})(marker, places[i].place_name);
		
		fragement.appendChile(itemEl);
	}
	
	listEl.appendChild(fragment);
    menuEl.scrollTop = 0;
}
</script>