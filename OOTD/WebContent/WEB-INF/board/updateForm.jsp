<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<article>
<form name="updateForm" id="updateForm" enctype="multipart/form-data" >
	<input type="hidden" name="no" value="${ board.list_no }"/>	
	<input type="hidden" name="pageNum"  value="${pageNum }"/>
	<input type="hidden" name="keyword"  value="${ keyword }"/>
	<section class="writebox" >
         <div class="wirtebox2">
                  <div >
                  	<span  name="id" class="id" >${ board.m_id }</span>
                     <small><span><i class="icon ion-md-pin"></i> <br/><br/>
                        Today's Weather :  <input type="text" name="update_weather" class="update_weather" id="update_weather" value="${ board.list_weather }"/></span></small><br/><br/><br/>
                     <small><span><i class="icon ion-md-temp"></i> 
                        Temp : <input type="text" name="update_temp" class="update_temp" id="update_temp"value="${ board.list_temp }"  /></span></small><br/><br/><br/>
                     <small><span><i class="icon ion-md-time"></i> 
                        Date : <input type="text" name="update_date"  id="update_date" value="${ b.regDate }" /></span></small><br/><br/><br/>
                  </div>
                    
               <div class="write2" >                  
                     Clothes & | : <br/>
                     <textarea  name="update_content" class="update_content"  rows="15" cols="70"  id="update_content" value="${ board.list_content }"/>${ board.list_content }</textarea><br/><br/><br/>
                     
                     hash<br/>      
                     <input type="checkbox" name="update_chk_1" value="#클래식" ${b.list_hash1.include(클래식)}? selected:"">#클래식&nbsp;
					<input type="checkbox" name="update_chk_2" value="#미니멀리즘">#미니멀리즘&nbsp;
					<input type="checkbox" name="update_chk_3" value="#컨템포러리">#컨템포러리&nbsp;
					<input type="checkbox" name="update_chk_4" value="#아메리칸캐주얼">#아메리칸캐주얼&nbsp;
					<input type="checkbox" name="update_chk_5" value="#아메카지">#아메카지&nbsp;
					<input type="checkbox" name="update_chk_6" value="#스트릿">#스트릿&nbsp;<br>
					<input type="checkbox" name="update_chk_7" value="#캐주얼">#캐주얼&nbsp;
					<input type="checkbox" name="update_chk_8" value="#모던">#모던&nbsp;
					<input type="checkbox" name="update_chk_9" value="#매니쉬">#매니쉬&nbsp;
					<input type="checkbox" name="update_chk_10" value="#레트로">#레트로<br/><br/><br/>
                     
                     Img : <input type="file" name="update_img" id="update_img" size="70" class="update_img" 
                                    maxlength="50" style="border: 1px solid #999999;" value="${ board.list_img }" /><br/><br/><br/>                  
               </div> 
               
                <div class="write3">
               	 	<i id="btn_updateSubmit"class="far fa-edit" style="font-size: 30px; color: black;"></i>
                </div>           
         </div>
	</section>
 </form>
</article>