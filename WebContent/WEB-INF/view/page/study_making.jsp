<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- content -->
<div class="w3-container bgimg-1" style="padding:128px 16px; " id="about">
  
  
<div class="w3-section w3-row-padding">


  <div class="w3-container w3-half">
  <div class="w3-container w3-white">
      
       <h6>방 만들기</h6>
      </div>
    <div class="w3-card-4">
      <div class="w3-container " style="overflow:auto; background: rgba(241, 241, 241, 0.75); ">
			     
			     <form action="makingPro" enctype="multipart/form-data"  method="post">
			     <input type="hidden" name=/>
				 <p> 
				   방 이름:&nbsp;&nbsp; <input type="text" name="studyName"/><br><br>
				    방 소개:&nbsp;&nbsp;<br>
				    <textarea name="study_intro" style="margin-left:60px"></textarea>
			     <p>
				    프로필 설정:&nbsp;&nbsp;
				    <input type="file" size="40" name="study_pro" style="color: red;">
			  		<p>
				    배경 설정:&nbsp;&nbsp;
				    <input type="file" size="40" name="study_back" style="color: red;">
				    <p>
			      <p><input class="w3-button w3-blue w3-section" type="submit" value="만들기"></p>
			    </form>
      </div>
    </div>
  </div>
  
  
  
</div>
</div>
</html>