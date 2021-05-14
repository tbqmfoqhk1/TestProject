<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<article class="article">
	<div class="page-content2" style="padding-top : 50px;">
		<div class="subContHeader">
			<h3 class="subTitle" style="font-size : 26px;">
				자가 진단 테스트 
			</h3>
		</div>
	<div class="tabbed2">
		<input type="radio" id="tab1" name="css-tabs" checked>
		<input type="radio" id="tab2" name="css-tabs">
		<input type="radio" id="tab3" name="css-tabs">
		<input type="radio" id="tab4" name="css-tabs">
		<input type="radio" id="tab5" name="css-tabs">
		<input type="radio" id="tab6" name="css-tabs">
		<input type="radio" id="tab7" name="css-tabs">
		<input type="radio" id="tab8" name="css-tabs">
		
		<ul class="tabs2">
			<li class="tab2"><label for="tab1">머리</label></li>
			<li class="tab2"><label for="tab2">목</label></li>
			<li class="tab2"><label for="tab3">가슴</label></li>
			<li class="tab2"><label for="tab4">배</label></li>
			<li class="tab2"><label for="tab5">등</label></li>
			<li class="tab2"><label for="tab6">엉덩이</label></li>
			<li class="tab2"><label for="tab7">팔</label></li>
			<li class="tab2"><label for="tab8">다리</label></li>
		</ul>
		
		<div class="tab-content2">
			<ul>
				<li class="disease_li2"><input type="checkbox" name="disease" value="간성뇌증" onclick="getCheckboxValue()"><p>간성뇌증</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="강박증" onclick="getCheckboxValue()"><p>강박증</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="건망증" onclick="getCheckboxValue()"><p>건망증</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="고산병" onclick="getCheckboxValue()"><p>고산병</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="광대뼈" onclick="getCheckboxValue()"><p>광대뼈</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="위치" onclick="getCheckboxValue()"><p>위치</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="이상" onclick="getCheckboxValue()"><p>이상</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="기민상태" onclick="getCheckboxValue()"><p>기민상태</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="기억장애" onclick="getCheckboxValue()"><p>기억장애</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="깨어나면 기억하지 못함" onclick="getCheckboxValue()"><p>깨어나면 기억하지 못함</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="납작한코" onclick="getCheckboxValue()"><p>납작한 코</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="축 쳐진 귀" onclick="getCheckboxValue()"><p>축 쳐진 귀</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="낮 시간대의 졸음" onclick="getCheckboxValue()"><p>낮 시간대의 졸음</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="낮은 지능" onclick="getCheckboxValue()"><p>낮은 지능</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="낮은 학업 성취" onclick="getCheckboxValue()"><p>낮은 학업 성취</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="내분비계이상" onclick="getCheckboxValue()"><p>내분비계이상</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="놀란 표정" onclick="getCheckboxValue()"><p>놀란 표정</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="놀람반사의 약화" onclick="getCheckboxValue()"><p>놀람반사의 약화</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="뇌부종" onclick="getCheckboxValue()"><p>뇌부종</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="뇌수종" onclick="getCheckboxValue()"><p>뇌수종</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="뇌압상승증상" onclick="getCheckboxValue()"><p>뇌압상승증상</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="뇌출혈" onclick="getCheckboxValue()"><p>뇌출혈</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="달 모양의 둥근 얼굴" onclick="getCheckboxValue()"><p>달 모양의 둥근 얼굴</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="두부 외상" onclick="getCheckboxValue()"><p>두부 외상</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="두통" onclick="getCheckboxValue()"><p>두통</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="두피 건조" onclick="getCheckboxValue()"><p>두피 건조</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="두피 열상" onclick="getCheckboxValue()"><p>두피 열상</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="만성 부비동염" onclick="getCheckboxValue()"><p>만성 부비동염</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="머리모양 변형" onclick="getCheckboxValue()"><p>머리모양 변형</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="모발" onclick="getCheckboxValue()"><p>모발</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="탈색 모발이 가늘어짐" onclick="getCheckboxValue()"><p>탈색 모발이 가늘어짐</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="모발이 거침" onclick="getCheckboxValue()"><p>모발이 거침</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="무균성" onclick="getCheckboxValue()"><p>무균성</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="뇌막염" onclick="getCheckboxValue()"><p>뇌막염</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="무의식" onclick="getCheckboxValue()"><p>무의식</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="박동성 통증" onclick="getCheckboxValue()"><p>박동성 통증</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="방향감각 상실" onclick="getCheckboxValue()"><p>방향감각 상실</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="볼, 눈 주위 움푹 꺼짐" onclick="getCheckboxValue()"><p>볼, 눈 주위 움푹 꺼짐</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="볼이 처짐" onclick="getCheckboxValue()"><p>볼이 처짐</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="비웃는 듯한 표정" onclick="getCheckboxValue()"><p>비웃는 듯한 표정</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="삐뚤어진 눈, 코, 입" onclick="getCheckboxValue()"><p>삐뚤어진 눈, 코, 입</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="수막자극증상" onclick="getCheckboxValue()"><p>수막자극증상</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="실인증" onclick="getCheckboxValue()"><p>실인증</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="실행증" onclick="getCheckboxValue()"><p>실행증</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="안면 변형" onclick="getCheckboxValue()"><p>안면 변형</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="안면 마비" onclick="getCheckboxValue()"><p>안면 마비</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="안면부 출혈" onclick="getCheckboxValue()"><p>안면부 출혈</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="안면통" onclick="getCheckboxValue()"><p>안면통</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="안면 홍조" onclick="getCheckboxValue()"><p>안면 홍조</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="어지러움" onclick="getCheckboxValue()"><p>어지러움</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="언어 장애" onclick="getCheckboxValue()"><p>언어 장애</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="얼굴 중심선이 안맞음" onclick="getCheckboxValue()"><p>얼굴 중심선이 안맞음</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="얼굴 한쪽의 반점" onclick="getCheckboxValue()"><p>얼굴 한쪽의 반점</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="얼굴모양 변화" onclick="getCheckboxValue()"><p>얼굴모양 변화</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="얼굴 부종" onclick="getCheckboxValue()"><p>얼굴 부종</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="얼굴에 땀이 남" onclick="getCheckboxValue()"><p>얼굴에 땀이 남</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="얼굴에 털이 자람" onclick="getCheckboxValue()"><p>얼굴에 털이 자람</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="얼굴의 나비 모양 홍반" onclick="getCheckboxValue()"><p>얼굴의 나비 모양 홍반</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="얼굴이 밋밋함" onclick="getCheckboxValue()"><p>얼굴이 밋밋함</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="얼굴이 화끈거림" onclick="getCheckboxValue()"><p>얼굴이 화끈거림</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="얼굴형태의 이상 운동" onclick="getCheckboxValue()"><p>얼굴형태의 이상 운동</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="원형, 타원형 탈모" onclick="getCheckboxValue()"><p>원형, 타원형 탈모</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="의식 변화" onclick="getCheckboxValue()"><p>의식 변화</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="의식 저하" onclick="getCheckboxValue()"><p>의식 저하</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="이마가 넓어짐" onclick="getCheckboxValue()"><p>이마가 넓어짐</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="이마의 주름" onclick="getCheckboxValue()"><p>이마의 주름</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="이중턱 인지장애" onclick="getCheckboxValue()"><p>이중턱 인지장애</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="졸림" onclick="getCheckboxValue()"><p>졸림</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="지남력 장애" onclick="getCheckboxValue()"><p>지남력 장애</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="짓누르는 느낌" onclick="getCheckboxValue()"><p>짓누르는 느낌</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="치매" onclick="getCheckboxValue()"><p>치매</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="코 옆과 입꼬리 주름" onclick="getCheckboxValue()"><p>코 옆과 입꼬리 주름</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="콧등이 넓어짐" onclick="getCheckboxValue()"><p>콧등이 넓어짐</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="턱 끝이 커보임" onclick="getCheckboxValue()"><p>턱 끝이 커보임</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="턱의 통증" onclick="getCheckboxValue()"><p>턱의 통증</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="편두통" onclick="getCheckboxValue()"><p>편두통</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="하악전돌" onclick="getCheckboxValue()"><p>하악전돌</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="학습장애" onclick="getCheckboxValue()"><p>학습장애</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="혼돈" onclick="getCheckboxValue()"><p>혼돈</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="혼수" onclick="getCheckboxValue()"><p>혼수</p></li>
			</ul>
		</div>
		
		<div class="tab-content2">
			<ul>
				<li class="disease_li2"><input type="checkbox" name="disease" value="갑상선 비대" onclick="getCheckboxValue()"><p>갑상선 비대</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="갑상선이 단단해짐" onclick="getCheckboxValue()"><p>갑상선이 단단해짐</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="경부 강직" onclick="getCheckboxValue()"><p>경부 강직</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="경부 림프절병증" onclick="getCheckboxValue()"><p>경부 림프절병증</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="경부 운동 제한" onclick="getCheckboxValue()"><p>경부 운동 제한</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="경정맥 확장" onclick="getCheckboxValue()"><p>경정맥 확장</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="고음애서의 분열" onclick="getCheckboxValue()"><p>고음에서의 분열</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="남성스러운 목소리" onclick="getCheckboxValue()"><p>남성스러운 목소리</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="덩어리가 만져짐" onclick="getCheckboxValue()"><p>덩어리가 만져짐</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="목 뒷부분의 지방축적" onclick="getCheckboxValue()"><p>목 뒷부분의 지방축적</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="목 주변 부종" onclick="getCheckboxValue()"><p>목 주변 부종</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="목소리 변화" onclick="getCheckboxValue()"><p>목소리 변화</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="목의 이물감" onclick="getCheckboxValue()"><p>목의 이물감</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="목의 통증" onclick="getCheckboxValue()"><p>목의 통증</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="사경" onclick="getCheckboxValue()"><p>사경</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="삼키기 곤란" onclick="getCheckboxValue()"><p>삼키기 곤란</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="성대 이상" onclick="getCheckboxValue()"><p>성대 이상</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="성대마비" onclick="getCheckboxValue()"><p>성대마비</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="성대부종" onclick="getCheckboxValue()"><p>성대부종</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="음성피로" onclick="getCheckboxValue()"><p>음성피로</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="이물감" onclick="getCheckboxValue()"><p>이물감</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="이중음성" onclick="getCheckboxValue()"><p>이중음성</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="이하선비대" onclick="getCheckboxValue()"><p>이하선비대</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="인후염" onclick="getCheckboxValue()"><p>인후염</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="잦은 상기도 감영" onclick="getCheckboxValue()"><p>잦은 상기도 감영</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="지속적인 애성" onclick="getCheckboxValue()"><p>지속적인 애성</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="코가 목 뒤로 넘어감" onclick="getCheckboxValue()"><p>코가 목 뒤로 넘어감</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="편도선 비대" onclick="getCheckboxValue()"><p>편도선 비대</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="후두부종" onclick="getCheckboxValue()"><p>후두부종</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="후두신경 마비" onclick="getCheckboxValue()"><p>후두신경 마비</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="후두염" onclick="getCheckboxValue()"><p>후두염</p></li>
			</ul>
		</div>
		
		<div class="tab-content2">
			<ul>
				<li class="disease_li2"><input type="checkbox" name="disease" value="가래" onclick="getCheckboxValue()"><p>가래</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="가슴 답답" onclick="getCheckboxValue()"><p>가슴 답답</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="가슴 두근거림" onclick="getCheckboxValue()"><p>가슴 두근거림</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="가슴 통증" onclick="getCheckboxValue()"><p>가슴 통증</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="객혈" onclick="getCheckboxValue()"><p>객혈</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="거품이 섞인 가래" onclick="getCheckboxValue()"><p>거품이 섞인 가래</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="검은색 가래" onclick="getCheckboxValue()"><p>검은색 가래</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="겨드랑이 악취" onclick="getCheckboxValue()"><p>겨드랑이 악취</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="과호흡" onclick="getCheckboxValue()"><p>과호흡</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="기침" onclick="getCheckboxValue()"><p>기침</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="늑막삼출" onclick="getCheckboxValue()"><p>늑막삼출</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="락스를 마셨어요" onclick="getCheckboxValue()"><p>락스를 마셨어요</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="무호흡" onclick="getCheckboxValue()"><p>무호흡</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="반복되는 폐렴" onclick="getCheckboxValue()"><p>반복되는 폐렴</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="부정맥" onclick="getCheckboxValue()"><p>부정맥</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="불규칙호흡" onclick="getCheckboxValue()"><p>불규칙호흡</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="빈맥" onclick="getCheckboxValue()"><p>빈맥</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="빈호흡" onclick="getCheckboxValue()"><p>빈호흡</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="사래걸림" onclick="getCheckboxValue()"><p>사래걸림</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="새가슴" onclick="getCheckboxValue()"><p>새가슴</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="서맥" onclick="getCheckboxValue()"><p>서맥</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="서호흡" onclick="getCheckboxValue()"><p>서호흡</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="수면 무호흡" onclick="getCheckboxValue()"><p>수면 무호흡</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="숨막히는 느낌" onclick="getCheckboxValue()"><p>숨막히는 느낌</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="심근손상" onclick="getCheckboxValue()"><p>심근손상</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="심방 부정맥" onclick="getCheckboxValue()"><p>심방 부정맥</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="심실세동" onclick="getCheckboxValue()"><p>심실세동</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="심염" onclick="getCheckboxValue()"><p>심염</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="심음 감소" onclick="getCheckboxValue()"><p>심음 감소</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="심인성 쇼크" onclick="getCheckboxValue()"><p>심인성 쇼크 </p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="심잡음" onclick="getCheckboxValue()"><p>심잡음</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="심정지" onclick="getCheckboxValue()"><p>심정지</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="염산, 황산을 마셨어요" onclick="getCheckboxValue()"><p>염산, 황산을 마셨어요</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="운동 시 호흡곤란" onclick="getCheckboxValue()"><p>운동 시 호흡곤란</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="울혈성" onclick="getCheckboxValue()"><p>울혈성</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="심부전" onclick="getCheckboxValue()"><p>심부전</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="잦은 딸국질" onclick="getCheckboxValue()"><p>잦은 딸국질</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="저심박출량" onclick="getCheckboxValue()"><p>저심박출량</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="질식" onclick="getCheckboxValue()"><p>질식</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="천명음" onclick="getCheckboxValue()"><p>천명음</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="천식" onclick="getCheckboxValue()"><p>천식</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="청진시 휘파람 소리" onclick="getCheckboxValue()"><p>청진시 휘파람 소리</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="폐기능저하" onclick="getCheckboxValue()"><p>폐기능저하</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="폐동맥 고혈압" onclick="getCheckboxValue()"><p>폐동맥 고혈압</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="폐부종" onclick="getCheckboxValue()"><p>폐부종</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="폐색전" onclick="getCheckboxValue()"><p>폐색전</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="폐출혈" onclick="getCheckboxValue()"><p>폐출혈</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="함몰가슴" onclick="getCheckboxValue()"><p>함몰가슴</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="헛기침" onclick="getCheckboxValue()"><p>헛기침</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="호기의 증가" onclick="getCheckboxValue()"><p>호기의 증가</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="호흡곤란" onclick="getCheckboxValue()"><p>호흡곤란</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="호흡기감염" onclick="getCheckboxValue()"><p>호흡기감염</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="화농성 객담" onclick="getCheckboxValue()"><p>화농성 객담</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="흉곽 팽윤" onclick="getCheckboxValue()"><p>흉곽 팽윤</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="흉부압박감" onclick="getCheckboxValue()"><p>흉부압박감</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="흉쇄" onclick="getCheckboxValue()"><p>흉쇄</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="유돌근의 몽우리" onclick="getCheckboxValue()"><p>유돌근의 몽우리</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="흉수" onclick="getCheckboxValue()"><p>흉수</p></li>
			</ul>
		</div>
		
		<div class="tab-content2">
			<ul>
				<li class="disease_li2"><input type="checkbox" name="disease" value="가슴 쓰림" onclick="getCheckboxValue()"><p>가슴 쓰림</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="간기능 저하" onclick="getCheckboxValue()"><p>간기능 저하</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="간부전" onclick="getCheckboxValue()"><p>간부전</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="간비대" onclick="getCheckboxValue()"><p>간비대</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="공복감" onclick="getCheckboxValue()"><p>공복감</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="구토" onclick="getCheckboxValue()"><p>구토</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="급성 신부전" onclick="getCheckboxValue()"><p>급성 신부전</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="농신증" onclick="getCheckboxValue()"><p>농신증</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="담도감염" onclick="getCheckboxValue()"><p>담도감염</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="담석 덩어리가 만져짐" onclick="getCheckboxValue()"><p>담석 덩어리가 만져짐</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="만성 신부전" onclick="getCheckboxValue()"><p>만성 신부전</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="명치 부위 통증" onclick="getCheckboxValue()"><p>명치 부위 통증</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="무통증" onclick="getCheckboxValue()"><p>무통증</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="문맥성고혈압" onclick="getCheckboxValue()"><p>문맥성고혈압</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="배꼽의 고름 및 피" onclick="getCheckboxValue()"><p>배꼽의 고름 및 피</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="배꼽이 솟음" onclick="getCheckboxValue()"><p>배꼽이 솟음</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="복벽이 움푹 들어감" onclick="getCheckboxValue()"><p>복벽이 움푹 들어감</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="복부 불편감" onclick="getCheckboxValue()"><p>복부 불편감</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="복부 압박 증상" onclick="getCheckboxValue()"><p>복부 압박 증상</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="복부 통증" onclick="getCheckboxValue()"><p>복부 통증</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="복부경련" onclick="getCheckboxValue()"><p>복부경련</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="복부비만" onclick="getCheckboxValue()"><p>복부비만</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="복보의 박동감" onclick="getCheckboxValue()"><p>복보의 박동감</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="복부팽만감" onclick="getCheckboxValue()"><p>복부팽만감</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="복수 분출성" onclick="getCheckboxValue()"><p>복수 분출성</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="구토 비장비대" onclick="getCheckboxValue()"><p>구토 비장비대</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="산통 소화불량" onclick="getCheckboxValue()"><p>산통 소화불량</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="손가락으로 밀면 들어감" onclick="getCheckboxValue()"><p>손가락으로 밀면 들어감</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="식후 불쾌감" onclick="getCheckboxValue()"><p>식후 불쾌감</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="십이지장 궤양" onclick="getCheckboxValue()"><p>십이지장 궤양</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="아랫배가 뭉침" onclick="getCheckboxValue()"><p>아랫배가 뭉침</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="악취 안정 시 탈장 사라짐" onclick="getCheckboxValue()"><p>악취 안정 시 탈장 사라짐</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="압통" onclick="getCheckboxValue()"><p>압통</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="야뇨증" onclick="getCheckboxValue()"><p>야뇨증</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="양수의 감소" onclick="getCheckboxValue()"><p>양수의 감소</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="옆구리 통증" onclick="getCheckboxValue()"><p>옆구리 통증</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="오심" onclick="getCheckboxValue()"><p>오심</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="우하복부 통증" onclick="getCheckboxValue()"><p>우하복부 통증</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="위계양" onclick="getCheckboxValue()"><p>위계양</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="위산의 역류" onclick="getCheckboxValue()"><p>위산의 역류</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="위염 위의 연동운동이 보임" onclick="getCheckboxValue()"><p>위염 위의 연동운동이 보임</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="위장관 출혈" onclick="getCheckboxValue()"><p>위장관 출혈</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="위장관 허혈" onclick="getCheckboxValue()"><p>위장관의 허혈</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="임신 2,3기의 오심" onclick="getCheckboxValue()"><p>임신 2,3기의 오심</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="임신 오조증" onclick="getCheckboxValue()"><p>임신 오조증</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="잔변감" onclick="getCheckboxValue()"><p>잔변감</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="장마비" onclick="getCheckboxValue()"><p>장마비</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="장폐색" onclick="getCheckboxValue()"><p>장폐색</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="초록색 구토" onclick="getCheckboxValue()"><p>초록색 구토</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="탈장" onclick="getCheckboxValue()"><p>탈장</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="탈장 돌출" onclick="getCheckboxValue()"><p>탈장 돌출</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="탈장 부위의 통증" onclick="getCheckboxValue()"><p>탈장 부위의 통증</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="토혈" onclick="getCheckboxValue()"><p>토혈</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="트림" onclick="getCheckboxValue()"><p>트림</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="포만감" onclick="getCheckboxValue()"><p>포만감</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="헛배" onclick="getCheckboxValue()"><p>헛배</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="흡수장애" onclick="getCheckboxValue()"><p>흡수장애</p></li>
			</ul>
		</div>
		
		<div class="tab-content2">
			<ul>
				<li class="disease_li2"><input type="checkbox" name="disease" value="관절통" onclick="getCheckboxValue()"><p>관절통</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="굽은 등" onclick="getCheckboxValue()"><p>굽은 등</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="뼈의 기형" onclick="getCheckboxValue()"><p>뼈의 기형</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="요통" onclick="getCheckboxValue()"><p>요통</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="자세이상" onclick="getCheckboxValue()"><p>자세이상</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="척추 측만" onclick="getCheckboxValue()"><p>척추 측만</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="척추 후만" onclick="getCheckboxValue()"><p>척추 후만</p></li>				
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="척추와 허리 디스크" onclick="getCheckboxValue()"><p>척추와 허리 디스크</p></li>				
			</ul>
		</div>
		
		<div class="tab-content2">
			<ul>
				<li class="disease_li2"><input type="checkbox" name="disease" value="괄약근 기능 이상" onclick="getCheckboxValue()"><p>괄약근 기능 이상</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="달걀 위에 앉아있는 느낌" onclick="getCheckboxValue()"><p>달걀 위에 앉아있는 느낌</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="대변에 벌레 관찰됨" onclick="getCheckboxValue()"><p>대변에 벌레 관찰됨</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="배변습관의 변화" onclick="getCheckboxValue()"><p>배변습관의 변화</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="배변장애" onclick="getCheckboxValue()"><p>배변장애</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="변비" onclick="getCheckboxValue()"><p>변비</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="변실금 " onclick="getCheckboxValue()"><p>변실금</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="설사" onclick="getCheckboxValue()"><p>설사</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="악취가 나는 설사" onclick="getCheckboxValue()"><p>악취가 나는 설사</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="엉덩이 비대칭 주름" onclick="getCheckboxValue()"><p>엉덩이 비대칭 주름</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="엉덩이 통증" onclick="getCheckboxValue()"><p>엉덩이 통증</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="점액변" onclick="getCheckboxValue()"><p>점액변</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="지방변" onclick="getCheckboxValue()"><p>지방변</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="치핵의 탈출" onclick="getCheckboxValue()"><p>치핵의 탈출</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="항문 통증" onclick="getCheckboxValue()"><p>항문 통증</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="항문주위 염증" onclick="getCheckboxValue()"><p>항문주위 염증</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="항문출혈" onclick="getCheckboxValue()"><p>항문출혈</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="허리, 둔부 중심형 비만" onclick="getCheckboxValue()"><p>허리, 둔부 중심형 비만</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="혈변" onclick="getCheckboxValue()"><p>혈변</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="회색변" onclick="getCheckboxValue()"><p>회색변</p></li>				
				<li class="disease_li2_last"><input type="checkbox"><p>흑색변</p></li>				
			</ul>
		</div>
		
		<div class="tab-content2">
			<ul>
				<li class="disease_li2"><input type="checkbox" name="disease" value="가늘어지는 팔다리" onclick="getCheckboxValue()"><p>가늘어지는 팔다리</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="관절 운동성 감소" onclick="getCheckboxValue()"><p>관절 운동성 감소</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="관절의 경직" onclick="getCheckboxValue()"><p>관절의 경직</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="관절통" onclick="getCheckboxValue()"><p>관절통</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="다발성 관절염" onclick="getCheckboxValue()"><p>다발성 관절염</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="동정맥루 잡음 약화" onclick="getCheckboxValue()"><p>동정맥루 잡음 약화</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="말초부종" onclick="getCheckboxValue()"><p>말초부종</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="말초의 허혈" onclick="getCheckboxValue()"><p>말초의 허혈</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="무감각" onclick="getCheckboxValue()"><p>무감각</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="무맥" onclick="getCheckboxValue()"><p>무맥</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="반신마비" onclick="getCheckboxValue()"><p>반신마비</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="방사통" onclick="getCheckboxValue()"><p>방사통</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="뼈의 변형" onclick="getCheckboxValue()"><p>뼈의 변형</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="사지 마비" onclick="getCheckboxValue()"><p>사지 마비</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="사지 변형" onclick="getCheckboxValue()"><p>사지 변형</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="사지의 창백한 현상" onclick="getCheckboxValue()"><p>사지의 창백한 현상</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="상지 마비" onclick="getCheckboxValue()"><p>상지 마비</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="손상 부위 출혈" onclick="getCheckboxValue()"><p>손상 부위 출혈</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="손상부위 촉각 소실" onclick="getCheckboxValue()"><p>손상부위 촉각 소실</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="압통" onclick="getCheckboxValue()"><p>압통</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="어깨 움직임의 제한" onclick="getCheckboxValue()"><p>어깨 움직임의 제한</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="어깨 잡음" onclick="getCheckboxValue()"><p>어깨 잡음</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="어깨근육 약화" onclick="getCheckboxValue()"><p>어깨근육 약화</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="어깨의 통증" onclick="getCheckboxValue()"><p>어깨의 통증</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="옷 액와 부분 변색" onclick="getCheckboxValue()"><p>옷 액와 부분 변색</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="저림" onclick="getCheckboxValue()"><p>저림</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="파열부위 오목해짐" onclick="getCheckboxValue()"><p>파열부위 오목해짐</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="팔의 길이가 달라짐" onclick="getCheckboxValue()"><p>팔의 길이가 달라짐</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="팔의 통증" onclick="getCheckboxValue()"><p>팔의 통증</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="편마비" onclick="getCheckboxValue()"><p>편마비</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="편측 사지의 감각소실" onclick="getCheckboxValue()"><p>편측 사지의 감각소실</p></li>
			</ul>
		</div>
		
		<div class="tab-content2">
			<ul>
				<li class="disease_li2"><input type="checkbox" name="disease" value="O자 다리" onclick="getCheckboxValue()"><p>O자 다리</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="X자 다리" onclick="getCheckboxValue()"><p>X자 다리</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="가늘어지는 팔다리" onclick="getCheckboxValue()"><p>가늘어지는 팔다리</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="관절 불안정증" onclick="getCheckboxValue()"><p>관절 불안정증</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="관절 운동성 감소" onclick="getCheckboxValue()"><p>관절 운동성 감소</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="관절염" onclick="getCheckboxValue()"><p>관절염</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="관절의 경직" onclick="getCheckboxValue()"><p>관절의 경직</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="관절잡음" onclick="getCheckboxValue()"><p>관절잡음</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="관절통" onclick="getCheckboxValue()"><p>관절통</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="다리 외상" onclick="getCheckboxValue()"><p>다리 외상</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="다리 통증" onclick="getCheckboxValue()"><p>다리 통증</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="다리가 잘 안 벌어짐" onclick="getCheckboxValue()"><p>다리가 잘 안 벌어짐</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="다리변형" onclick="getCheckboxValue()"><p>다리변형</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="다리의 길이가 틀림" onclick="getCheckboxValue()"><p>다리의 길이가 틀림</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="다발성 관절염" onclick="getCheckboxValue()"><p>다발성 관절염</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="말초부종" onclick="getCheckboxValue()"><p>말초부종</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="말초의 허혈" onclick="getCheckboxValue()"><p>말초의 허혈</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="무감각" onclick="getCheckboxValue()"><p>무감각</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="무릎 부위 부종" onclick="getCheckboxValue()"><p>무릎 부위 부종</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="무릎 부위 통증" onclick="getCheckboxValue()"><p>무릎 부위 통증</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="무맥 반신마비" onclick="getCheckboxValue()"><p>무맥 반신마비</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="방사통" onclick="getCheckboxValue()"><p>방사통</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="보행이상" onclick="getCheckboxValue()"><p>보행이상</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="비강,목,폐 건조" onclick="getCheckboxValue()"><p>비강,목,폐 건조</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="뻣뻣함" onclick="getCheckboxValue()"><p>뻣뻣함</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="뼈의 기형" onclick="getCheckboxValue()"><p>뼈의 기형</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="뼈의 변형" onclick="getCheckboxValue()"><p>뼈의 변형</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="사지 마비" onclick="getCheckboxValue()"><p>사지 마비</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="사지 변형" onclick="getCheckboxValue()"><p>사지 변형</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="사지 부종" onclick="getCheckboxValue()"><p>사지 부종</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="사지의 창백한 현상" onclick="getCheckboxValue()"><p>사지의 창백한 현상</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="손상 부위 출혈" onclick="getCheckboxValue()"><p>손상 부위 출혈</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="손상부위 촉각 소실" onclick="getCheckboxValue()"><p>손상부위 촉각 소실</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="압통" onclick="getCheckboxValue()"><p>압통</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="양무릎사이 벌어짐" onclick="getCheckboxValue()"><p>양무릎사이 벌어짐</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="양반다리로 앉기 힘듬" onclick="getCheckboxValue()"><p>양반다리로 앉기힘듬</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="오리걸음" onclick="getCheckboxValue()"><p>오리걸음</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="저림" onclick="getCheckboxValue()"><p>저림</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="정맥혈전" onclick="getCheckboxValue()"><p>정맥혈전</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="좁은 보폭의 걸음걸이" onclick="getCheckboxValue()"><p>좁은 보폭의 걸음걸이</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="종아리 근육의 비대" onclick="getCheckboxValue()"><p>종아리 근육의 비대</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="파열부위의 오목해짐" onclick="getCheckboxValue()"><p>파열부위의 오목해짐</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="파열음" onclick="getCheckboxValue()"><p>파열음</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="파행" onclick="getCheckboxValue()"><p>파행</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="편마비" onclick="getCheckboxValue()"><p>편마비</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="편측 사지의 감각소실" onclick="getCheckboxValue()"><p>편측 사지의 감각소실</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="하지 마비" onclick="getCheckboxValue()"><p>하지 마비</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="하지부종" onclick="getCheckboxValue()"><p>하지부종</p></li>
				<li class="disease_li2"><input type="checkbox" name="disease" value="하지의 근력약화" onclick="getCheckboxValue()"><p>하지의 근력약화</p></li>
				<li class="disease_li2_last"><input type="checkbox" name="disease" value="해파리에 쏘였어요" onclick="getCheckboxValue()"><p>해파리에 쏘였어요</p></li>
			</ul>
		</div>
	</div>
	
	<div class="Result">
	<ul class="testResult">
	<li>
		<span class="testResultSpan">내가 선택한 증상</span>
		<span id='result1'></span>	
	</li>
	<li>
		<span class="testResultSpan">테스트한 결과</span>
	    <span id='result'></span>
    </li>
   </ul>	
	<span class="startTest">
       <a href="#none" id="testStart">테스트 시작</a>
   	</span>
   	<span class="startTest">
       <a href="javascript:location.reload()">초기화</a>
   	</span>
	<span class="IwannaBack">
		<a href="javascript:history.back(-1)">뒤로가기</a>
	</span>
	</div>
	
	</div>
		
</article>
