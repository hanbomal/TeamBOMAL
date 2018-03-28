<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<div id="addDay" class="w3-modal" >
    <div class="w3-modal-content" style="max-width: 400px;">
      <div class="w3-container" >
        <span onclick="document.getElementById('addDay').style.display='none'" class="w3-button w3-display-topright">&times;</span>
       
<div class="calendarForm">
	<form action="addPro" name="userinput" 
	method="post" onsubmit="return checkValue()">
	<ul>
	<li>
	일정제목:<input type="text" name="title">
	</li>
	<li>
	장소:<input type="text" name="place">
	</li>
	<li>시작일<input type="text" name="startdate" id="sdate" value="">
</li>


	<li>종료일<input type="text" name="enddate" id="edate" value="">
	</li>
	
	<li>내용:<input type="text" name="description"></li>
	</ul>
	<ul><li><input type="submit" value="전송"></li>
	<li><input type="reset" value="취소"></li>
	</ul>
	
	
	</form>

</div>

<script>
function checkValue(){
	var input=eval("document.userinput");
	if(!userinput.title.value){
		alert("일정 제목을 입력하세요");
		return false;
	}
	if(!userinput.startdate.value){
		alert("시작일을 입력하세요");
		return false;
	}
	if(!userinput.enddate.value){
		alert("종료일을 입력하세요");
		return false;
	}

	if(userinput.startdate.value>userinput.enddate.value){
		alert("종료일을 시작일보다 이전으로 선택할 수 없습니다.");
		return false;
	}
}

</script>
      </div>
    </div>
  </div>
</body>
</html>