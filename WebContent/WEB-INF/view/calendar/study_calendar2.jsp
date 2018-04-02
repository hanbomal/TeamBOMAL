<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>

<style type="text/css">
    body {
        margin :40px 10px;
        padding : 0;
        
    }
    #calendar {
      
        margin : 0 auto;
    }
  

</style>
<link href="../api/fullcalendar-3.9.0/fullcalendar.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="../api/fullcalendar-3.9.0/fullcalendar.print.css" rel="stylesheet" media="print"/>
<script type="text/javascript" src="../api/fullcalendar-3.9.0/lib/moment.min.js"></script>
<script type="text/javascript" src="../api/fullcalendar-3.9.0/lib/jquery.min.js"></script>
<script type="text/javascript" src="../api/fullcalendar-3.9.0/fullcalendar.js"></script>
<script type="text/javascript" src="../api/fullcalendar-3.9.0/locale-all.js"></script>
<script type="text/javascript" src="../api/fullcalendar-3.9.0/gcal.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/api/httpRequest.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 달력 출력 자바스크립트 -->

<script type="text/javascript">
var dataset = [
    <c:forEach var="list" items="${list}" varStatus="status">
            {"id":'<c:out value="${list.num}" />'
            ,"title":'<c:out value="${list.title}" />'
            ,"start":'<c:out value="${list.startdate}" />'
                ,"end":'<c:out value="${list.enddate}" />'
                ,"place":'<c:out value="${list.place}"/>'
                ,"description":'<c:out value="${list.description}"/>'
                ,"studynum":'<c:out value="${list.studynum}"/>'
            } 
            <c:if test="${!status.last}">,</c:if>
       
    </c:forEach> 
];



jQuery(document).ready(function(){
    jQuery("#calendar").fullCalendar({
    	customButtons: {
    	    addButton: {
    	      text: '일정등록',
    	      click: function() {
    	    	  document.getElementById('title').value='';
    	    	  document.getElementById('place').value='';
    	    	  document.getElementById('description').value='';
    	    	  document.getElementById('addDay').style.display='block';
    	      }
    	    }
    	  }
    	 ,selectable: true,
    	    header: {
    	      left: 'prev,next today ',
    	      center: 'title',
    	      right: 'month,agendaWeek,agendaDay listWeek,addButton'
    	    }
         , defaultDate : new Date()
         , nowIndicator: true
         ,now: new Date()
        ,height:'parent'
        	 ,aspectRatio: 2
        ,handleWindowResize:true
        , locale : 'ko'
        , editable : true
        ,eventResize: function(event, delta, revertFunc) {


            if (!confirm(event.title+"의 종료일을 "+event.end.format()+"로 변경합니다.")) {
              revertFunc();
            }else{
            	  
        		  var data='title='+event.title+'&place='+event.place+'&studynum='+event.studynum+'&id='+event.id+'&description='+event.description+"&startdate="+event.start.format()+"&enddate="+event.end.format();
        		  update(data);};
            }
        , eventLimit : true
       
        , events: dataset
        , eventClick: 
        	
        	function(calEvent, jsEvent, view) {
        	
  		 	 contentView(calEvent.id);
  		   document.getElementById('addDay').style.display='none';
  		   document.getElementById('message').style.display='block';
  		
        	
        	
        }

        ,eventDrop: function(event, delta, revertFunc) {
           
            if (!confirm(event.title + "을(를) " + event.start.format() + "로 이동합니다.")) {	
                 revertFunc(); 
            }else{
  
      		  var data='title='+event.title+'&place='+event.place+'&studynum='+event.studynum+'&id='+event.id+'&description='+event.description+"&startdate="+event.start.format()+"&enddate="+event.end.format();
      		  update(data);};
      		  
        
        }
        , navLinks: true
       /*  , windowResize: function(view) {
            alert('The calendar has adjusted to a window resize');
        } */
       /* ,allDay:true  각 스케쥴에 map으로 넣기*/
       , select: function(startDate, endDate) {
    	   document.getElementById('title').value='';
	    	  document.getElementById('place').value='';
	    	  document.getElementById('description').value='';
           document.getElementById('startdate').value=startDate.format();
       		document.getElementById('enddate').value=endDate.format();
      		 document.getElementById('addDay').style.display='block';
      		
       }

    });
});


    

</script>

<body class="w3-padding ui-widget-content">


<!-- 달력 출력 모달 -->
    <div class="w3-container  " id="calendar" style="height:600px;"></div>
    
     <!-- 메시지 모달 -->
       <div id="message" class="w3-modal" >
<div id="messageContent" class="w3-center  w3-container w3-padding">
</div>  </div>
    
    
    <!-- 일정 등록 모달 -->
     <div id="addDay" class="w3-modal" >
     
    <div class="w3-modal-content w3-light-grey w3-card-4" style="max-width: 400px;">
     <div class="w3-container w3-center w3-teal">
       <h6><b>일정 등록</b></h6>
      </div>
      <div class="w3-container w3-padding" >
        <span onclick="document.getElementById('addDay').style.display='none'; document.getElementById('startdate').value=''; document.getElementById('enddate').value=''; " class="w3-button w3-display-topright">&times;</span>
       
<div class="calendarForm w3-center  w3-container w3-padding" id="modal">
	<form id="userinput" method="post" >
	<ul class="w3-ul w3-light-grey">
	<li><label>제목</label><input type="text" id="title" name="title" class="w3-input w3-border"></li>
	<li><label>장소</label><input type="text" id="place" name="place" class="w3-input w3-border"></li>
	<li><label>시작일</label>
	<input type="text" id="startdate" name="startdate" placeholder="YYYY-MM-DD"  value="" class="w3-input w3-border"></li>
	<li><label>종료일</label>
	<input type="text" id="enddate" name="enddate" placeholder="YYYY-MM-DD" value="" class="w3-input w3-border"></li>
	<li><label>내용</label>
	<input type="text" id="description" name="description" class="w3-input w3-border"></li>
	<li><button class="w3-button" id="commitbtn" onclick="checkValue('add');">전송</button>
	<input type="reset" class="w3-button" value="다시쓰기"></li>
	
	</ul>
	</form>

</div>
   </div>
    </div>
  </div>
  
  
<script>
function checkValue(){
	
	var input=eval("document.userinput");
	var thisform=document.userinput;
	if(!userinput.title.value){
		alert("일정 제목을 입력하세요");
		event.preventDefault(); 
		return userinput.title.focus();
	}else
	if(!userinput.startdate.value){
		alert("시작일을 입력하세요");
		event.preventDefault(); 
		return userinput.startdate.focus();
	}else
	if(!userinput.enddate.value){
		alert("종료일을 입력하세요");
		event.preventDefault(); 
		return userinput.enddate.focus();
	}else

	if(userinput.startdate.value>userinput.enddate.value){
		alert("종료일을 시작일보다 이전으로 선택할 수 없습니다.");
		event.preventDefault(); 
		return userinput.enddate.focus();
	}else{ 
		$('#userinput').submit(function(event){
		 
		  var data=$(this).serialize();
		  addSchedule(data);
		   document.getElementById('addDay').style.display='none';
		   document.getElementById('message').style.display='block';
			  
			  event.preventDefault(); } //기본 폼의 submit이 발생되지 않게 막기
		); 

	};
		
}

    function checkUpdateValue(){
    	
    	var input=eval("document.updateinput");
    	var thisform=document.updateinput;
    	if(!updateinput.title.value){
    		alert("일정 제목을 입력하세요");
    		event.preventDefault(); 
    		return updateinput.title.focus();
    	}else
    	if(!updateinput.startdate.value){
    		alert("시작일을 입력하세요");
    		event.preventDefault(); 
    		return updateinput.startdate.focus();
    	}else
    	if(!updateinput.enddate.value){
    		alert("종료일을 입력하세요");
    		event.preventDefault(); 
    		return updateinput.enddate.focus();
    	}else

    	if(updateinput.startdate.value>updateinput.enddate.value){
    		alert("종료일을 시작일보다 이전으로 선택할 수 없습니다.");
    		event.preventDefault(); 
    		return updateinput.enddate.focus();
    	}else{ 
    		$('#updateinput').submit(function(event){
    		 
    		  var data=$(this).serialize();
    		  update(data);
    		   document.getElementById('addDay').style.display='none';
    		   document.getElementById('message').style.display='block';
    			  
    			  event.preventDefault(); } //기본 폼의 submit이 발생되지 않게 막기
    		); 

    	};
    		
    }

function toUpdatePage(data){
	
	var id="id="+data;
		sendRequest("<%=request.getContextPath()%>/calcontroller/updateForm",id,fromServer,"POST");	
		event.preventDefault(); 	
	}

	function addSchedule(data){
		sendRequest("<%=request.getContextPath()%>/calcontroller/addPro1",data,fromServer,"POST");
	}

	function fromServer(){
		if(httpRequest.readyState==4){
			if(httpRequest.status==200){
				document.getElementById("messageContent").innerHTML=httpRequest.responseText;
			}
		}	
	}
	
	function contentView(data){
		var id="id="+data;
		sendRequest("<%=request.getContextPath()%>/calcontroller/contents",id,fromServer,"POST");
		
	}
	
	
function update(data){
		
		sendRequest("<%=request.getContextPath()%>/calcontroller/updatePro",data,fromServer,"POST");
		
	}
function deleteSchedule(data){
	var id="id="+data;
	
	sendRequest("<%=request.getContextPath()%>/calcontroller/deleteCalendar",id,fromServer,"POST");
	
}


var menuClick = function(url){
	if(url == '/'){
		location.reload(true);
		return;
	}
	$.ajax({
		type: 'POST',
		url: url,
		async:false,
		data: "",
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			$('#messageContent').html(data);
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
};

</script>

</body>
</html>
