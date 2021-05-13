<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<form name="writeForm" id="writeForm" enctype="multipart/form-data" >
	<input type="hidden" name="no" value="${ board.list_no }"/>	
	<input type="hidden" name="pageNum"  value="${pageNum }"/>
	<input type="hidden" name="keyword"  value="${ keyword }"/>
	<section class="writebox1" >
			<div class="wirtebox2">
			   	<div>
					<small><span class="text"><i class="icon ion-md-pin"></i> <br/><br/>
						Today's Weather :  <input type="text" id="write_weather" name="write_weather" class="clothes"  /></span></small><br/><br/><br/>
					<small><span><i class="icon ion-md-temp"></i> 
						Temp : <input type="text" id="write_temp" name="write_temp" class="temp"  /></span></small><br/><br/><br/>
					<small><span><i class="icon ion-md-time"></i> 
						Date : <input type="text" id="write_date"  value="YYMMDD" 
						onfocus="if(this.value=='YYMMDD'){this.value=''}" onblur="if(this.value==''){this.value='YYMMDD'}" name="write_date" class="write_date" /></span></small><br/><br/><br/>
		   		</div>
		   		
				<div class="write2" >						
					Clothes & | : <br/>
					<textarea id="write_clothes" name="write_clothes" class="write_clothes"  rows="15" cols="70" /></textarea><br/><br/><br/>
					hashtag : <br/>
					<input type="checkbox" name="write_chk_1" value="#클래식">#클래식&nbsp;
					<input type="checkbox" name="write_chk_2" value="#미니멀리즘">#미니멀리즘&nbsp;
					<input type="checkbox" name="write_chk_3" value="#컨템포러리">#컨템포러리&nbsp;
					<input type="checkbox" name="write_chk_4" value="#아메리칸캐주얼">#아메리칸캐주얼&nbsp;
					<input type="checkbox" name="write_chk_5" value="#아메카지">#아메카지&nbsp;
					<input type="checkbox" name="write_chk_6" value="#스트릿">#스트릿&nbsp;<br>
					<input type="checkbox" name="write_chk_7" value="#캐주얼">#캐주얼&nbsp;
					<input type="checkbox" name="write_chk_8" value="#모던">#모던&nbsp;
					<input type="checkbox" name="write_chk_9" value="#매니쉬">#매니쉬&nbsp;
					<input type="checkbox" name="write_chk_10" value="#레트로">#레트로<br/><br/><br/>
						Img : <input type="file" id="write_img" name="write_img" size="70" class="write_img" 
												maxlength="50" style="border: 1px solid #999999"  /><br/><br/><br/>						
				
				</div> 
				<div class="write3">
		 			<i id="btn_writeSubmit" class="far fa-edit" style="font-size: 30px; color: black;"/></i>
			 	</div>   		
			</div>
			<!--far fa-save  -->
		</section>
 </form>
</article>