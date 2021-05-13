<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container" style="padding-right: 35%;">
<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form action="registerUpdateResult.mvc" name="joinForm" method="post"
			id="registerUpdateForm" class="detail-box" style="width : 750px;">
			<h2>회원정보 수정 </h2><br/>
			<h5>${ sessionScope.m_id }님의 회원정보</h5>
			<hr class="colorgraph">
				<div class="form-group">
					<input type="text" name="updateMembername" id="updateMembername" 
						class="form-control input-lg" placeholder="Name" 
						tabindex="1" value="${ sessionScope.m_name }"/>
				</div>				
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="password" name="updateMemberPass" id="updateMemberPass" class="form-control input-lg" placeholder="Password" tabindex="3">
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="password" name="updateMemberPass2" id="updateMemberPass2" class="form-control input-lg" placeholder="Confirm Password" tabindex="4">
					</div>
				</div>
			</div>
				<div class="form-group">
					<input type="text" name="updateMemberPhone" id="updateMemberPhone" 
						class="form-control input-lg" placeholder="Phone" 
						tabindex="5" value="${ sessionScope.m_phone }"/>
				</div>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
                        <input type="text" name="updateMemberAge" id="updateMemberAge" 
                        	class="form-control input-lg" placeholder="Age" 
                        	tabindex="6" value="${ sessionScope.m_age }" >
					</div>
				</div>			
				<div class="col-xs-12 col-sm-6 col-md-6" tabindex="7">
					<select class="form-control input-lg" name="updateMemberGender" id="updateMemberGender">
					  <option selected >Gender</option>
					  <option value="남자" ${ sessionScope.m_gender.equals("남자")  ? "selected" : ""}>Male</option>
					  <option value="여자" ${ sessionScope.m_gender.equals("여자")  ? "selected" : ""}>Female</option>
					</select>
				</div>
			</div>
			<hr class="colorgraph"><br/>
			<div class="row">
				<div class="col-xs-12 col-md-6">
					<input type="reset"  class="btn btn-success btn-block btn-lg" value="다시쓰기"
						style="background-color : rgb(187, 187, 187);
           							  border-radius : 28.5px;
           							  border-color : #696969;">
					<!--  <a href="#" class="btn btn-success btn-block btn-lg">다시쓰기</a>-->
				</div>
				<div class="col-xs-12 col-md-6">
					<input type="submit" value="수정하기" class="btn btn-primary btn-block btn-lg" tabindex="11"
						id="btn_registerUpdate_submit" style="background-color : white;
									  border-radius : 28.5px;
									   border-color : #696969;
									  color : rgb(187, 187, 187);">
				</div>
			</div>
		</form>
	</div>
</div>
</div>
