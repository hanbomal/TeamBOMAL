<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	String name = "aaa";
	
	String group = "1";
	
		%>
<!DOCTYPE html>
<!--  -->
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<meta charset="UTF-8">
<title>Testing websockets</title>

<script>
$( function() {
   
    $( "#resizable" ).resizable({
    	
    });
  } );
  
$(document).ready(function(){
	  var fileTarget = $('.filebox .upload-hidden');

	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            var filename = $(this)[0].files[0].name;
	        } else {
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        }
	
	        $('.upload-name').val(filename);
	    document.getElementById('upload-name').style.display='block';
	       
	    });
	}); 


function sendEvent(){
	
	$('#sendinput').submit(function(event){
		 
		  var data=$(this).serialize();
		  update(data);
		   document.getElementById('addDay').style.display='none';
		   document.getElementById('message').style.display='block';
			  
			  event.preventDefault();} );
}
</script>
<style type="text/css">

.filebox input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
    
}


/* named upload */
.filebox .upload-name {
    display: inline-block;
    padding: .5em .75em;
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}


</style>
</head>



<body>

 <!--  대화내용 div  -->

  <div class="w3-container "  style="margin:0; padding:0;">
 
      <div class="w3-container w3-padding" style="height:500px; overflow:auto; background: inherit;" id="messageWindow">
   
      </div>
      
<!-- 전송창부분   -->    

      <div class="w3-container w3-white " >
     
      <div class="w3-panel w3-round-large w3-border w3-padding " >
  <span  class="w3-tag w3-white " style="font-size:12px;">  
  <input class="upload-name" id="upload-name" value="파일선택" disabled="disabled" style="display: none;"></span>
  <table style="width: 100%;"><tr><td style="width: 90%;">
  
  <textarea  id="inputMessage" class="w3-input" style="border:0; display: inline-block; " 
  onkeydown="if(event.keyCode==13){send();}" ></textarea></td><td>
  	<button class="w3-button  w3-teal" type="submit" onclick="send()">전송</button></td>
  </table>
   </div> <div class="filebox bs3-primary">
    
     <div class="w3-bar " style="margin-bottom: 7px; margin-left:10px; margin-right:20px;">
   
    <label for="ex_filename"><i class="fa fa-file-image-o" style="font-size:24px;" ></i></label> 
  <input type="file" id="ex_filename" class="upload-hidden"> 

<button class="w3-button w3-padding-small"><i class="fa fa-file-text-o" style="font-size:24px"></i></button>
<button class="w3-button w3-padding-small"><i class="fa fa-hashtag" style="font-size:24px"></i></button>&nbsp;&nbsp;
<label><i class="fa fa-search w3-margin-left" style="font-size:20px"></i></label>&nbsp;
<input type="text" class="w3-input  w3-hover-light-grey" style="display: inline-block; width: 140px; " placeholder="검색어 입력">
<span class="w3-right w3-margin-right w3-tag w3-white w3-border" ><font color="w3-grey" style="font-size:12px;" id="curCount"></font></span>
</div>

 </div>
  </div>

  </div>
  <!-- 전송창부분 끝 -->

</body>
<script type="text/javascript">

  
  var chatdata = [
	    <c:forEach var="list" items="${chatdata}" varStatus="status">
	            {"name":'<c:out value="${list.name}" />'
	            ,"date":'<c:out value="${list.date}" />'
	            ,"content":'<c:out value="${list.content}" />'	               
	            } 
	            <c:if test="${!status.last}">,</c:if>
	       
	    </c:forEach> 
	];
  
  
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket(
    'ws://211.238.142.35:8080<%=request.getContextPath()%>/webGroup?name='
    		+encodeURIComponent('<%=name%>')+'&group='+encodeURIComponent('<%=group%>'));
        var inputMessage = document.getElementById('inputMessage');
    
    webSocket.onerror = function(event) {     onError(event)   };
    webSocket.onopen = function(event) {     onOpen(event)    };
    webSocket.onmessage = function(event) {   onMessage(event) };
    
    function testProcess(data){
    	
    	var t=data.trim();
		var tmp=t.substr(t.indexOf('[')+1,t.lastIndexOf(']')-1);
		/* alert(tmp); */
    	var cutTmp = tmp.split('] [');

    	for(var i=0;i<cutTmp.length;i++){
    		cutTmp[i].trim();
    	}
		return cutTmp;


    }
    function onMessage(event) {
    	 if(event.data.substr(0,16)=='===fromServer==='){
      		var serverMessage=event.data.substr(16,event.data.length);
      		var fromServer=serverMessage.split(',');
      		document.getElementById("curCount").innerHTML ='현재 접속자 : '+fromServer[fromServer.length-1]+'명'; 
      		
      		var curmem="";
      		for(var i=0; i<fromServer.length-1;i++){
      			curmem+=fromServer[i]+",";
      		}
      		document.getElementById("curMember").innerHTML =curmem.substr(0,curmem.length-1)+'님이 참여 중'; 
      		
      		 textarea.scrollTop=textarea.scrollHeight;
      		return;
      	}

     var texts=testProcess(event.data);

    textarea.innerHTML +="<ul class='w3-ul' style='display:block;' ><li class='w3-large' style='border:none; max-width:80%;'>"+texts[0]
    +"<span class='w3-small'>&nbsp;"+texts[1]+"</span>"
    +" <div class='w3-panel w3-round-large w3-padding' style='margin:0; max-width:80%;background: rgba(0, 150, 136, 0.75);'>"
    +" <span class='w3-medium'><font color='white'>"+texts[2]+"</font></span>"
  +" </div></li></ul>";

    
    
         textarea.scrollTop=textarea.scrollHeight;
         
        
         }
    function onOpen(event) {
      /*  textarea.innerHTML += "연결 성공<br>"; */
     
         
	for(var i=0;i<chatdata.length;i++){
		
		  var l0=chatdata[i].name;
		  var l1=chatdata[i].date;
		  var l2=chatdata[i].content.replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&amp;/g, "&"); 
		/*   var l2=chatdata[i].content.replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&amp;/g, "&").replace(/&quot;/g, "\"");  */
		  
		  if(l0=='<%=name%>'){
			  textarea.innerHTML +="<table align='right' width='100%'><tr><td><ul class='w3-ul w3-margin-bottom' style='display:block; '>"
			  +"<li class='w3-large' style='border:none;' align='right'>"
		          +"<span class='w3-small'>"+l1+"</span>&nbsp;"
		         +"<span class='w3-panel w3-round-large w3-padding w3-right '  style='margin:0; max-width:80%; background: rgba(255, 193, 7, 0.75);'>"
		          +"<span class='w3-medium'>"+l2+"</span></span></li></ul></td></tr></table>";
			  
		  }else{

	        textarea.innerHTML +="<ul class='w3-ul' style='display:block;' ><li class='w3-large' style='border:none; max-width:80%;'> "
	        +l0+
	        "<span class='w3-small'>&nbsp;"+l1+"</span>"
	        +" <div class='w3-panel w3-round-large w3-padding' style='margin:0; max-width:80%;background: rgba(0, 150, 136, 0.75);'>"
	        +" <span class='w3-medium'><font color='white'>"+l2+"</font></span>"
	      +" </div></li></ul>";}
		
	}
      
        
             textarea.scrollTop=textarea.scrollHeight;
       
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
        
        
     
         
		  textarea.innerHTML +="<table align='right' width='100%'><tr><td><ul class='w3-ul w3-margin-bottom' style='display:block; '>"
			  +"<li class='w3-large' style='border:none;' align='right'>"
		          +"<span class='w3-small'>"+nowText+"</span>&nbsp;"
		         +"<span class='w3-panel w3-round-large w3-padding w3-right '  style='margin:0; max-width:80%; background: rgba(255, 193, 7, 0.75);'>"
		          +"<span class='w3-medium'>"+inputMessage.value+"</span></span></li></ul></td></tr></table>";
          
        
        
       
		          textarea.scrollTop=textarea.scrollHeight;
        
       
             webSocket.send(inputMessage.value.trim());
  			  
  		
       
        inputMessage.value = "";
      
			
	}
</script>
</html>





    
