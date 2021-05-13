<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container" style="padding-right: 35%;">
<div class="row" style="margin-top:20px">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form action="delete.mvc" id="formDelete"
				name="deleteForm" method="post">
			<fieldset class="detail-box" style="width : 750px;">
				<h2>회원 탈퇴</h2>
				<hr class="colorgraph">
				<div class="form-group">
                    <input type="password" name="m_pass" id="m_pass" class="form-control input-lg" placeholder="Password">
				</div>
				<span class="button-checkbox">
					<input type="checkbox" name="remember_me" id="remember_me" checked="checked" class="hidden">
					<a href="" class="btn btn-link pull-right" style="color : black;">비밀번호 찾기</a>
				</span>
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
                        <input type="submit" class="btn btn-lg btn-success btn-block" value="탈퇴하기"
                        	style="background-color : rgb(187, 187, 187);
           							  border-radius : 28.5px;
           							  border-color : #696969;">
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</div>

</div>
