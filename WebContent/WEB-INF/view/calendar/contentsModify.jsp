<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="w3-modal-content w3-light-grey w3-card-4" style="max-width: 400px;">
     <div class="w3-container w3-center w3-teal">
       <h6><b>일정 보기</b></h6>
      </div>
      <div class="w3-container w3-padding" >
        <span onclick="document.getElementById('addDay').style.display='none'; document.getElementById('startdate').value=''; document.getElementById('enddate').value=''; location.reload();" class="w3-button w3-display-topright">&times;</span>
       
<div class="calendarForm w3-center  w3-container w3-padding" id="modal">
	<form id="userinput" >
	<ul class="w3-ul w3-light-grey"><li><label>제목</label><input type="text" id="title" name="title" class="w3-input w3-border " value="${calendar.title}"></li>
	<li><label>장소</label><input type="text" id="place" name="place" class="w3-input w3-border" value="${calendar.place}"></li>
	<li><label>시작일</label><input type="text" id="startdate" name="startdate" placeholder="YYYY-MM-DD"  value="${calendar.startdate}" class="w3-input w3-border"></li>
	<li><label>종료일</label><input type="text" id="enddate" name="enddate" placeholder="YYYY-MM-DD" value="${calendar.enddate}" class="w3-input w3-border"></li>
	<li><label>내용</label><input type="text" id="description" name="description" class="w3-input w3-border" value="${calendar.description}"></li>
	<li><button class="w3-button" id="commitbtn" onclick="checkValue();">수정</button><input type="reset" class="w3-button" value="삭제"></li>
	
	</ul>
	</form>

</div>
    
</div></div>