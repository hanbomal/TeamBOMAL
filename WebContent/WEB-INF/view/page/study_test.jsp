<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="../api/fullcalendar-3.9.0/lib/jquery.min.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(document).ready(function(){    $('#content').load('<%=request.getContextPath()%>/calcontroller/test');
$('#chat').load('<%=request.getContextPath()%>/chatcontroller/intro');

}

);


  
  $( function() {
	    $( "#draggable" ).draggable({ handle: "h6" });
	    $( "#draggable2" ).draggable({ handle: "h6" });
	    $( "#resizable" ).resizable({
	    	
	         minHeight: 600,
	         minWidth: 500
	    });
	  } );
  
 
  </script>


<link href="../api/fullcalendar-3.9.0/fullcalendar.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
 
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
<style>
 
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
</style>
<!-- content -->
<div class="w3-container bgimg-1" style="padding:128px 16px; " >
  
  
<div class="w3-section w3-row-padding">


<div class="w3-third w3-container "  id="draggable" >
   
      <div class="w3-container w3-white">
      <h6 style="display: inline-block;">실시간 토론</h6> 
      <span class=" w3-tag w3-white w3-middle w3-margin-top" style="float: right; "><font style="font-color:grey; font-size:12px;" id="curMember" ></font></span>
      </div>
     <div class="w3-card-4">
 <!-- 채팅 div -->
  <div class="w3-container ui-widget-content" id="chat" style="padding:0; margin:0; overflow:auto; background: rgba(241, 241, 241, 0.75); ">

      </div>
  
      </div>
    </div>


  <div class="w3-twothird w3-container resizable1" id="draggable2" >
  <div class="w3-container w3-white">
      
       <h6>달력</h6>
      </div>
    <div class="w3-card-4" >
      
      <!-- 내용 div -->
      <div class="w3-container" id="content" style=" background: rgba(241, 241, 241, 1); ">

      </div>
      
      <!-- 내용끝 -->
      
      <div class="w3-container w3-light-grey ">
      <span class="w3-right w3-margin-right"><p>스터디 관리</p></span><span class="w3-right w3-margin-right"><p>스터디 정보</p></span> 
      
      </div>
    </div>
  </div>
  
  
  

  
</div>

<!-- <div id="resizable" class="ui-widget-content">
  <h3 class="ui-widget-header">Resizable</h3>
</div>  -->


</div>
</html>