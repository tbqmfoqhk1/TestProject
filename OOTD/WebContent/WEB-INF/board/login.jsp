<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container" style="padding-right: 35%;">
<div class="row" style="margin-top:20px">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form action="login.mvc" id="formLogin"
				name="loginForm" method="post">
			<fieldset class="detail-box" style="width : 750px;">
				<h2>로그인</h2>
				<hr class="colorgraph">
				<div class="form-group">
                    <input type="text" name="m_id" id="m_id" class="form-control input-lg" placeholder="ID">
				</div>
				<div class="form-group">
                    <input type="password" name="m_pass" id="m_pass" class="form-control input-lg" placeholder="Password">
				</div>
				<span class="button-checkbox">
					<input type="checkbox" name="remember_me" id="remember_me" checked="checked" class="hidden">
					<a href="" id="passchk" class="btn btn-link pull-right" style="color : black;">비밀번호 찾기</a>
				</span>
				<hr class="colorgraph"><br/>
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
                        <input type="submit" class="btn btn-lg btn-success btn-block" value="로그인"
                        	style="background-color : rgb(187, 187, 187);
           							  border-radius : 28.5px;
           							  border-color : #696969;">
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6">
						<a href="joinForm.mvc" class="btn btn-lg btn-primary btn-block"
							style="background-color : white;
									  border-radius : 28.5px;
									   border-color : #696969;
									  color : rgb(187, 187, 187);">회원가입</a>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</div>

</div>
