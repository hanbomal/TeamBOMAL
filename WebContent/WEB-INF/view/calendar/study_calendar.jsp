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
        max-width : 900px;
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


<script type="text/javascript">
var dataset = [
    <c:forEach var="list" items="${list}" varStatus="status">
        <c:if test="${list.startdate != ''}">
            {"id":'<c:out value="${list.num}" />'
            ,"title":'<c:out value="${list.title}" />'
            ,"start":'<c:out value="${list.startdate}" />'
            <c:if test="${list.enddate != ''}">
                ,"end":'<c:out value="${list.enddate}" />'
            </c:if>
            } <c:if test="${!status.last}">,</c:if>
        </c:if>
    </c:forEach> 
];


    jQuery(document).ready(function() {
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
            , locale : 'ko'
            , editable : true
            , eventLimit : true
            // THIS KEY WON'T WORK IN PRODUCTION!!!
            // To make your own Google API key, follow the directions here:
            // http://fullcalendar.io/docs/google_calendar/나중에받아오기
            , googleCalendarApiKey: 'AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE'
            	, eventSources : [
                    // 대한민국의 공휴일
                    {
                          googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com"
                        , className : "koHolidays"
                        , color : "#009688"
                        , textColor : "#FFFFFF"
                    }]
          
            , events: dataset
            , eventClick: function(calEvent, jsEvent, view) {
            	 
            	$('#calt').html(calEvent.title);
                $('#calsdate').html(calEvent.start);
                document.getElementById('message').style.display='block';
            }

            ,eventDrop: function(event, delta, revertFunc) {
               
                if (!confirm(event.title + "을(를) " + event.start.format() + "로 이동합니다")) {	
                     revertFunc(); 
                }}
            , navLinks: true
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
<script>
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
<body>
    <div class="w3-container" id="calendar"></div>
    
     <div id="addDay" class="w3-modal" >
    <div class="w3-modal-content" style="max-width: 400px;">
      <div class="w3-container" >
        <span onclick="document.getElementById('addDay').style.display='none'; document.getElementById('startdate').value=''; document.getElementById('enddate').value='';  location.reload(false);" class="w3-button w3-display-topright">&times;</span>
       
<div class="calendarForm" id="modal">
	<form id="form1">
	<ul><li>일정제목:<input type="text" id="title" name="title"></li>
	<li>장소:<input type="text" id="place" name="place"></li>
	<li>시작일<input type="text" id="startdate" name="startdate" placeholder="YYYY-MM-DD"  value=""></li>
	<li>종료일<input type="text" id="enddate" name="enddate" placeholder="YYYY-MM-DD" value=""></li>
	<li>내용:<input type="text" id="description" name="description"></li></ul>
	<ul><li><button id="commitbtn">전송</button><input type="reset" value="취소"></li>
	
	</ul>
	</form>
	<button onclick="javascript: document.getElementById('addDay').style.display='none'; document.getElementById('message').style.display='block'; menuClick('<%=request.getContextPath() %>/calcontroller/test1');" >a버튼</button>

</div>

<script>
function checkValue(){
	var input=eval("document.userinput");
	if(!userinput.title.value){
		alert("일정 제목을 입력하세요");
		return false;
	}else
	if(!userinput.startdate.value){
		alert("시작일을 입력하세요");
		return false;
	}else
	if(!userinput.enddate.value){
		alert("종료일을 입력하세요");
		return false;
	}else

	if(userinput.startdate.value>userinput.enddate.value){
		alert("종료일을 시작일보다 이전으로 선택할 수 없습니다.");
		return false;
	}else{return true;}
}


</script>

<script>

 $(document).ready(function(){
  //폼아이디가 my 의 submit 이벤트 받음
  $('#form1').submit(function(event){
   var url = '<%=request.getContextPath()%>/TestAjax';  //서블릿 위치
	var data=$(this).serialize();
   $('#messageContent').load(url,data);   //jquery의 serialize 함수 이용하여 폼데이터들을 직렬화로 전송시키고 응답 받음
   document.getElementById('addDay').style.display='none';
   document.getElementById('message').style.display='block';
   event.preventDefault();  //기본 폼의 submit이 발생되지 않게 막기
  
  });

 });

</script>



      </div>
    </div>
  </div>
  
       <div id="message" class="w3-modal" >
    <div class="w3-modal-content" style="max-width: 400px;">
      <div class="w3-container" >
        <span onclick="document.getElementById('message').style.display='none'; location.reload(false);" class="w3-button w3-display-topright">&times;</span>
       
<div id="messageContent">
	<p id="calt"></p>
	<p id="calsdate"></p>
	
</div>


      </div>
    </div>
  </div>

<div id='wrap'>

</div>
</body>
</html>
