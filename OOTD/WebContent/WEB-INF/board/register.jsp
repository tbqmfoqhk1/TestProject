<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container" style="padding-right: 35%;">
<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form action="joinResult.mvc" name="joinForm" method="post"
			id="joinForm" class="detail-box" style="width : 750px;">
			<h2>회원가입 </h2>
			<hr class="colorgraph">
				<div class="form-group">
					<input type="text" name="m_name" id="name" 
						class="form-control input-lg" placeholder="Name" 
						tabindex="1">
				</div>
				
				<input type="hidden" name="isIdCheck" id="isIdCheck" value="false"/>
				<div class="form-group">
					<input type="text" name="m_id" id="m_id" 
						class="form-control input-lg" placeholder="ID" 
						tabindex="2">
					<input type="button" class="form-group" value="중복확인" id="btnOverlapId"/>
						<!-- style="color : #333;
								   background-color : #fff;
								   border-color : #ccc;
								   cursor : pointer;
								   "/> -->
				</div>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="password" name="m_pass" id="pass1" class="form-control input-lg" placeholder="Password" tabindex="3">
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="password" name="m_pass_confirmation" id="pass2" class="form-control input-lg" placeholder="Confirm Password" tabindex="4">
					</div>
				</div>
			</div>
				<div class="form-group">
					<input type="text" name="m_phone" id="phone" 
						class="form-control input-lg" placeholder="Phone" 
						tabindex="5">
				</div>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
                        <input type="text" name="m_age" id="age" 
                        	class="form-control input-lg" placeholder="Age" 
                        	tabindex="6" >
					</div>
				</div>			
				<div class="col-xs-12 col-sm-6 col-md-6" tabindex="7">
					<select class="form-control input-lg" name="m_gender" id="gender">
					  <option selected >Gender</option>
					  <option value="남자">Male</option>
					  <option value="여자">Female</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-4 col-sm-3 col-md-3">
					<span class="button-checkbox">
						<button type="button" class="btn" data-color="info" tabindex="10">동의하기</button>
                        <input type="checkbox" name="t_and_c" id="t_and_c" class="hidden" value="1">
					</span>
				</div>
				<div class="col-xs-8 col-sm-9 col-md-9">
					 <strong class="label label-primary">확인</strong>
					 를 클릭하시면 당사의 쿠키 사용을 포함하여 본 사이트에서 정한 
					 <a href="#" data-toggle="modal" data-target="#t_and_c_m">약관 및 이용정책</a>
					  에 동의하게 됩니다.
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
					<input type="submit" value="회원가입" class="btn btn-primary btn-block btn-lg" tabindex="11"
						style="background-color : white;
									  border-radius : 28.5px;
									   border-color : #696969;
									  color : rgb(187, 187, 187);">
				</div>
			</div>
		</form>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="t_and_c_m" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">약관 및 개인정책</h4>
			</div>
			<div class="modal-body">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>
