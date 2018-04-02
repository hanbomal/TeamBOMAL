<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- content -->
<div class="w3-container bgimg-1" style="padding:64px 16px; " id="about">
  
  
<div class="w3-section w3-row-padding">
	<div class="w3-quarter">&nbsp;</div>

  <div class="w3-half w3-container ">
  <div class="w3-container w3-white">
      
       <h6>Request List</h6>
      </div>
    <div class="w3-card-4">
      <div class="w3-container " style="overflow:auto; background: rgba(241, 241, 241, 0.75); ">
     
<div class="w3-container">
  <table class="w3-table  ">
    <tr>
      <th>Date</th>
      <th>Group Name</th>
      <th>Status</th>
    </tr>
  	<c:if test="${resList.size()==0}">
    <tr>
      <td colspan="3" class="w3-center">No impormation</td>
    </tr>
  	</c:if>
  	
  	<c:if test="${resList.size()!=0}">
  	<c:forEach var="group" items="${resList}">
     <tr>
      <td>${group.joinDate }</td>
      <td>${group.studyName}</td>
      <td>${group.status }</td>
    </tr>
    </c:forEach>	
  	</c:if>
  </table>
</div>


  <!-- Pagination -->
  <div class="w3-center w3-padding-16">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
      <a href="#" class="w3-bar-item w3-black w3-button">1</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
    </div>
  </div>
      </div>
    </div>
  </div>
  
  
</div>
</div>
</html>