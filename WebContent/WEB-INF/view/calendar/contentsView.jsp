<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="w3-modal-content w3-light-grey w3-card-4" style="max-width: 400px;">
     <div class="w3-container w3-center w3-teal">
       <h6><b>일정 보기</b></h6>
      </div>
      <div class="w3-container w3-padding" >
        <span onclick="document.getElementById('message').style.display='none'; document.getElementById('startdate').value=''; document.getElementById('enddate').value=''; " class="w3-button w3-display-topright">&times;</span>
       
<div class="calendarForm w3-center  w3-container w3-padding" id="modal">
	<form id="userinput" >
	<table class="w3-table w3-bordered">
	<tr ><td style="width:30%;"><label>제목</label></td><td>${calendar.title}</td></tr>
	<tr><td><label>장소</label></td><td>${calendar.place}</td></tr>
	<tr><td><label>시작일</label></td><td>${calendar.startdate}</td></tr>
	<tr><td><label>종료일</label></td><td>${calendar.enddate}</td></tr>
	<tr><td><label>내용</label></td><td>${calendar.description}</td></tr>
	
	</table>
	<button class="w3-button"  onclick="toUpdatePage(${calendar.num});">수정</button>
	<input type="reset" class="w3-button" onclick="deleteSchedule(${calendar.num});" value="삭제">
	<%-- <ul class="w3-ul w3-light-grey"><li>
	<table class="w3-table"><tr ><td><label>제목</label></td><td>${calendar.title}</td></tr></table></li>
	<li><table class="w3-table"><tr><td><label>장소</label></td><td>${calendar.place}</td></tr></table></li>
	<li><label>시작일</label>${calendar.startdate}</li>
	<li><label>종료일</label>${calendar.enddate}</li>
	<li><label>내용</label>${calendar.description}</li>
	<li><button class="w3-button"  onclick="toUpdatePage(${calendar.num});">수정</button><input type="reset" class="w3-button" onclick="deleteSchedule(${calendar.num});" value="삭제"></li>
	
	</ul> --%>
	</form>
</div></div></div>
