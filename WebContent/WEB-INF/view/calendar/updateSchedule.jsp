<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <div class="w3-modal-content w3-light-grey w3-card-4" style="max-width: 400px;">
     <div class="w3-container w3-center w3-teal">
       <h6><b>일정 수정</b></h6>
      </div>
      <div class="w3-container w3-padding" >
        <span onclick="document.getElementById('message').style.display='none'; document.getElementById('startdate').value=''; document.getElementById('enddate').value=''; " class="w3-button w3-display-topright">&times;</span>
       
<div class="calendarForm w3-center  w3-container w3-padding" id="modal">
	<form id="updateinput" >
	<ul class="w3-ul w3-light-grey"><li><label>제목</label><input type="text" id="title" name="title" class="w3-input w3-border" value="${calendar.title }"></li>
	<li><label>장소</label><input type="text" id="place" name="place" class="w3-input w3-border" value="${calendar.place }"></li>
	<li><label>시작일</label><input type="text" id="startdate" name="startdate" placeholder="YYYY-MM-DD"  value="${calendar.startdate}" class="w3-input w3-border" ></li>
	<li><label>종료일</label><input type="text" id="enddate" name="enddate" placeholder="YYYY-MM-DD" value="${calendar.enddate }" class="w3-input w3-border"></li>
	<li><label>내용</label><input type="text" id="description" name="description" value="${calendar.description }" class="w3-input w3-border"></li>
	<li><button class="w3-button" id="commitbtn" onclick="checkUpdateValue();">전송</button><input type="reset" class="w3-button" value="다시쓰기"></li>
	
	
	</ul> 
	<input type="hidden" name="id" value="${calendar.num }">
	<input type="hidden" name="studynum" value="${calendar.studynum }">
	</form>

</div>
   </div>
    </div>
    
   