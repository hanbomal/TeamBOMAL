<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%	String name = request.getParameter("name");
	if (name == null) 		name = "무명";
	String group = request.getParameter("group");
	if (group == null)		group = "우리끼리";
		%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>Testing websockets</title>
</head>
<style>
#me {
	position: relative;
	left: 100px;
}

#you {
	position: relative;
	left: 10px;
}
</style>
<body>

 <!--  대화내용 div  -->
  <div class="w3-container " style="margin:0; padding:0;">
      <div class="w3-container" style="height:500px; overflow:auto; background: rgba(241, 241, 241, 0.75);" id="messageWindow">
        
     <br>
      </div>
      
<!-- 전송창부분   -->    
      <div class="w3-container w3-white w3-padding">
     
      <div class="w3-panel w3-round-large w3-border w3-padding w3-margin-left" >
  
  <table style="width: 100%;"><tr><td style="width: 90%;">
  
  <textarea  id="inputMessage" class="w3-input"  style="border:0; display: inline-block;" 
  onkeydown="if(event.keyCode==13){send();}"></textarea> </td><td>
  	<button class="w3-button  w3-teal" type="submit" onclick="send()">전송</button></td>
  </table>
   </div>
   
  </div>
  </div>
  <!-- 전송창부분 끝 -->

</body>
<script type="text/javascript">
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket(
    'ws://211.238.142.35:8080<%=request.getContextPath()%>/webGroup?name='
    		+encodeURIComponent('<%=name%>')+'&group='+encodeURIComponent('<%=group%>'));
        var inputMessage = document.getElementById('inputMessage');
    
    webSocket.onerror = function(event) {     onError(event)   };
    webSocket.onopen = function(event) {     onOpen(event)    };
    webSocket.onmessage = function(event) {   onMessage(event) };
    
    function testProcess(data){
    	
		var tmp=data.substr(1,data.length-2);
    	var cutTmp = tmp.split('][');

		return cutTmp;


    }
    function onMessage(event) {
    	

     var texts=testProcess(event.data);

    textarea.innerHTML +="<ul class='w3-ul'><li class='w3-large' style='border:none; max-width:80%;'> "+texts[0]
    +"<span class='w3-small'>&nbsp;"+texts[2]+"</span>"
    +" <div class='w3-panel w3-round-large w3-padding' style='margin:0; max-width:80%;background: rgba(0, 150, 136, 0.75);'>"
    +" <span class='w3-medium'><font color='white'>"+texts[1]+"</font></span>"
  +" </div></li></ul>";

    
    
         textarea.scrollTop=textarea.scrollHeight;
         }
    function onOpen(event) {
       textarea.innerHTML += "연결 성공<br>";
       
       
    }
    function onError(event) {     alert(event.data);   }
    function send() {

    	 var now = new Date();
    	 var nowText="";
         var nowHour = now.getHours();
         var nowMt = now.getMinutes();
         if(nowMt<10){
        	 nowMt='0'+nowMt;
         }
       
         if ( nowHour <12   ) {
        

           nowText='오전 ' + nowHour + ':' + nowMt;

         } else if (  nowHour >= 12   ) {
		
        	 if(nowHour>=13){
        		 nowHour=nowHour-12;
        	 }
        	 nowText='오후 ' + nowHour + ':' + nowMt;
        	 
         	}
        
        
        textarea.innerHTML +="<ul class='w3-ul w3-margin-bottom' style='display:block; '><li class='w3-large' style='border:none;' align='right'>"
          +"<span class='w3-small'>"+nowText+"</span>&nbsp;&nbsp;"
         +"<div class='w3-panel w3-round-large w3-padding w3-right '  style='margin:0; max-width:80%; background: rgba(255, 193, 7, 0.75);'>"
          +"<span class='w3-medium'>"+inputMessage.value+"</span></div></li></ul>";
       
         
          
        
        
        textarea.scrollTop=textarea.scrollHeight;
        webSocket.send(inputMessage.value);
		inputMessage.value = "";
	}
</script>
</html>





    
