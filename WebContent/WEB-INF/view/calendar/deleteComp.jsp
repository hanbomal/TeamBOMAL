<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="w3-modal-content w3-light-grey w3-card-4" style="max-width: 400px;">
     <div class="w3-container w3-center w3-teal">
       <h6><b>완료</b></h6>
      </div>
      <div class="w3-container w3-padding" >
        <span onclick="document.getElementById('message').style.display='none'; document.getElementById('startdate').value=''; document.getElementById('enddate').value=''; $('#content').load('<%=request.getContextPath()%>/calcontroller/test');" class="w3-button w3-display-topright">&times;</span>
       
<div class=" w3-center  w3-container w3-padding" id="modal">
	<p>삭제가 완료되었습니다.</p>
<p><button onclick="document.getElementById('message').style.display='none'; document.getElementById('startdate').value=''; document.getElementById('enddate').value=''; $('#content').load('<%=request.getContextPath()%>/calcontroller/test');" class="w3-button">닫기</button> </p>
</div>
    
</div></div>