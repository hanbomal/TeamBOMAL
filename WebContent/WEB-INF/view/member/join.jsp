<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	
	<title></title>
	
	<style type="text/css">
		body,h1 {font-family: "consolas", sans-serif}
		body, html {height: 100%}
		.bgimg {
		    background-color:w3-grey;
		    min-height: 100%;
		    background-position: center;
		    background-size: cover;
		}
		.formpad {
			padding: 10% 10% 10% 10%;
			
		} 
	  
	</style>
	<script type="text/javascript">
/*비밀번호체크*/
    function checkValue()
    {
      
        if(!document.memberInfo.nickname.value){
            alert("닉네임을 입력하세요.");
            return false;
        }
        
      
        if(!document.memberInfo.passwd.value){
            alert("비밀번호를 입력하세요.");
            return false;
        }
        
        if(document.memberInfo.passwd.value != document.memberInfo.passchk.value){
        	alert("비밀번호 확인란에 비밀번호를 동일하게 입력하세요.");
            return false;
        } 
        else {
        	alert("가입이 완료되었습니다.");
        }

    }
    /* end. 이메일, 비번 체크 */
function confirmId() {
		if (document.userInfo.email.value == "") {
			alert("아이디를 입력하세요. (중복확인)");
			return;
		}
		url = "confirmId?memberid=" + document.memberInfo.memberid.value;
		open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizeble=no, width=400, height=150");
	}
</script>


</head>
<body>
<div class="bgimg formpad">
<form method="post" name="memberInfo" class="w3-container w3-card-4 w3-white w3-text-black w3-margin w3-animate-bottom w3-round" 
action="joinPro" onsubmit="return checkValue()">
<input type="hidden" name="listid" value="${listid }">
<h2 class="w3-center">회원가입화면..나중에 modal로 수정할게..</h2>
<%----<h6 class="w3-right">*는 필수 입력입니다.</h6> --%>

<!-- 아이디 -->
<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"></div>
    <div class="w3-rest">
      <input class="w3-input w3-border"  name="memberid" type="text" placeholder="ID ">
    </div>
</div>

<!-- 닉네임  -->
<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"></div>
    <div class="w3-rest">
      <input class="w3-input w3-border"  name="nickname" type="text" placeholder="nickName*">
    </div>
</div>

<!-- 패스워드 -->
<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"></div>
    <div class="w3-rest">
      <input class="w3-input w3-border"  name="passwd" type="password" placeholder="Password*">
    </div>
</div>

<!-- 패스워드 확인  -->
<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"></div>
    <div class="w3-rest">
      <input class="w3-input w3-border"  name="passchk" type="password" placeholder="Password Check*">
    </div>
</div>


<p class="w3-center">
<input type="submit" value="Send" class="w3-button w3-pink"  OnClick="view/index.jsp">
<input type="button" value="Back" class="w3-button w3-red" OnClick="view/index.jsp">  

</p>
</form>
</div>

</body>
</html>