<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>STUDY ROOM</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}

body, html {
	height: 100%;
	line-height: 1.8;
}
/* Full height image header */
.bgimg-1 {
	background-position: center;
	background-size: cover;
	background-image: url("<%=request.getContextPath()%>/imgs/back.jpg");
	min-height: 100%;
}

.w3-bar .w3-button {
	padding: 16px;
}

.autocomplete-items div:hover {
	/*when hovering an item:*/
	background-color: #e9e9e9;
}

.autocomplete-items div {
	font-size: 17px;
	padding-left: 10px;
}
/* style="overflow:hidden;" */

</style>
<script type="text/javascript">
           // 로그아웃 담당 JSP로 이동
           function logoutPro(){
               location.href="${pageContext.request.contextPath}/member/logoutPro";
               alert('LOGOUT');
              }
          
           
       </script>
</head>
<body>

	<!-- Navbar (sit on top) -->
	<div class="w3-top">
		<div class="w3-bar w3-white w3-card" id="myNavbar">
			<a href="main" class="w3-bar-item w3-button w3-wide">HANBOMAL</a>

			<!-- autoComplete Form-->
			<div class="w3-left" style="margin-top: 11px;">

				<form action="main" autocomplete="off" method="post">
					<input type="text" style="outline: none; width: 300px"
						class="w3-round" placeholder="Search..." name="studyName"
						id="myInput">
					<button type="submit" class="w3-button w3-blue w3-round"
						style="margin-left: -4px; padding: 8px; margin-bottom: 2px">
						<i class="fa fa-search w3-large"></i>
					</button>

				</form>
			</div>

			<!-- Right-sided navbar links -->
			<div class="w3-right w3-hide-small">
				<a href="about" class="w3-bar-item w3-button">ABOUT</a>

				<div class="w3-dropdown-hover">
					<button class="w3-button">
						<i class="fa fa-globe"></i> NOTICE
					</button>
					<div class="w3-dropdown-content w3-bar-block w3-border">
						<a href="RequestPage" class="w3-bar-item w3-button">REQUEST
						<span class="w3-badge w3-small w3-blue">3</span>
						</a> 
						<a href="#" class="w3-bar-item w3-button">RESPONSE
						<span class="w3-badge w3-small w3-blue">2</span>
						</a>
					</div>
				</div>
				
		
				
				
		
				<c:if test="${sessionScope.memberid==null}">
            <a href="javascript:void(0)" class="w3-bar-item w3-button"
               onclick="document.getElementById('login').style.display='block'"><i
               class="fa fa-user"></i> MYPAGE</a>
               </c:if>
            <c:if test="${sessionScope.memberid!=null}"> 
            <div class="w3-dropdown-hover">
					<button class="w3-button">
						<i class="fa fa-user"></i> ${sessionScope.memberid} 님
					</button>
					<div class="w3-dropdown-content w3-bar-block w3-border">
						<a href="updatePage" class="w3-bar-item w3-button">MY PAGE
						
						</a> 
						<a href="RequestPage" class="w3-bar-item w3-button">WAITING
						
						</a>
						<input class="w3-bar-item w3-button" value="LOGOUT" onclick="logoutPro()"/>
						
						
						
						
					
					</div>
				</div>
            
            
            
            
            
            
            
            <!-- 
            
            
            <a href="javascript:void(0)" class="w3-bar-item w3-button"
               onclick="document.getElementById('iflogin').style.display='block'"><i
               class="fa fa-user"></i>${sessionScope.memberid} 님</a>
               </c:if>   	
               -->
            
					
				<div class="w3-dropdown-hover">
					<button class="w3-button">
						<i class="fa fa-th"></i> WORKSPACE
					</button>
					<div class="w3-dropdown-content w3-bar-block w3-border">
						<a href="study_making" class="w3-bar-item w3-button">개설하기</a> <a
							href="study_board" class="w3-bar-item w3-button">STUDY 1</a> <a
							href="study_album" class="w3-bar-item w3-button">STUDY 2</a> <a
							href="test" class="w3-bar-item w3-button">TEST</a>
					</div>
				</div>

			</div>

			<!-- Hide right-floated links on small screens and replace them with a menu icon -->

			<a href="javascript:void(0)"
				class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium"
				onclick="w3_open()"> <i class="fa fa-bars"></i>
			</a>
		</div>
		<div class="w3-cell-row">
			<div class="w3-cell w3-hide-small" style="width: 150px"></div>
			<div id="aaa" class="w3-white w3-card" style="width: 300px;"></div>
		</div>
	</div>

	<!-- Sidebar on small screens when clicking the menu icon -->
	<nav
		class="w3-sidebar w3-bar-block w3-black w3-card w3-animate-left w3-hide-medium w3-hide-large"
		style="display:none" id="mySidebar"> <a
		href="javascript:void(0)" onclick="w3_close()"
		class="w3-bar-item w3-button w3-large w3-padding-16">Close ×</a> <a
		href="about" onclick="w3_close()" class="w3-bar-item w3-button">ABOUT</a>
	<a href="#team" onclick="w3_close()" class="w3-bar-item w3-button">MYPAGE</a>
	<a href="study_board" onclick="w3_close()"
		class="w3-bar-item w3-button">WORKSPACE</a> </nav>





	<!-- login Modal -->


	<div id="login" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom w3-small"
			style="max-width: 600px">

			<div class="w3-center">
				<br> <span
					onclick="document.getElementById('login').style.display='none'"
					class="w3-button w3-xlarge w3-hover-red w3-display-topright"
					title="Close Modal">&times;</span>

			</div>

			<form class="w3-container" method="post" action="../member/loginPro" onsubmit="return checkValue()">
				<div class="w3-section">
			
					<label><b>ID</b></label> <input
						class="w3-input w3-border w3-margin-bottom" type="text"
						style="display: block; width: 100%;" placeholder="아이디를 입력하세요."
						name="memberid" required> <label><b>PASSWORD</b></label> <input
						class="w3-input w3-border" style="display: block; width: 100%;"
						type="password" placeholder="비밀번호를 입력하세요." name="passwd" required>
					<button class="w3-button w3-block w3-black w3-section w3-padding"
						type="submit">로그인</button>
					<input class="w3-check w3-margin-top" type="checkbox"
						checked="checked">로그인 기억하기
				</div>
			</form>

			<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
				<button
					onclick="document.getElementById('login').style.display='none'"
					type="button" class="w3-button w3-black">취소</button>
					
				<span class="w3-right w3-padding w3-hide-small"><a
					href="../member/join">회원가입</a>&nbsp;&nbsp;&nbsp; <a href="#">비밀번호</a>를
					잊으셨나요?</span>
					
					
					
			</div>

		</div>
	</div>






</body>

<script>
		function autocomplete(inp, arr) {
			/*the autocomplete function takes two arguments,
			the text field element and an array of possible autocompleted values:*/
			var currentFocus;
			/*execute a function when someone writes in the text field:*/
			inp
					.addEventListener(
							"input",
							function(e) {
								var a, b, i, val = this.value;
								/*close any already open lists of autocompleted values*/
								closeAllLists();
								if (!val) {
									return false;
								}
								currentFocus = -1;
								/*create a DIV element that will contain the items (values):*/
								a = document.createElement("DIV");
								a.setAttribute("id", this.id
										+ "autocomplete-list");
								a.setAttribute("class", "autocomplete-items");
								a.setAttribute("style","position:relative;z-index:5")
								/*append the DIV element as a child of the autocomplete container:*/
								var p = this.parentNode;
								var body = document.getElementById("aaa");
								body.appendChild(a);
								/*for each item in the array...*/
								for (i = 0; i < arr.length; i++) {
									/*check if the item starts with the same letters as the text field value:*/
									if (arr[i].substr(0, val.length)
											.toUpperCase() == val.toUpperCase()) {
										/*create a DIV element for each matching element:*/
										b = document.createElement("DIV");
										/*make the matching letters bold:*/
										b.innerHTML = "<strong>"
												+ arr[i].substr(0, val.length)
												+ "</strong>";
										b.innerHTML += arr[i]
												.substr(val.length);
										/*insert a input field that will hold the current array item's value:*/
										b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
										/*execute a function when someone clicks on the item value (DIV element):*/
										b
												.addEventListener(
														"click",
														function(e) {
															/*insert the value for the autocomplete text field:*/
															inp.value = this
																	.getElementsByTagName("input")[0].value;
															/*close the list of autocompleted values,
															(or any other open lists of autocompleted values:*/
															closeAllLists();
														});
										a.appendChild(b);
									}
								}
							});
			/*execute a function presses a key on the keyboard:*/
			inp.addEventListener("keydown", function(e) {
				var x = document.getElementById(this.id + "autocomplete-list");
				if (x)
					x = x.getElementsByTagName("div");
				if (e.keyCode == 40) {
					/*If the arrow DOWN key is pressed,
					increase the currentFocus variable:*/
					currentFocus++;
					/*and and make the current item more visible:*/
					addActive(x);
				} else if (e.keyCode == 38) { //up
					/*If the arrow UP key is pressed,
					decrease the currentFocus variable:*/
					currentFocus--;
					/*and and make the current item more visible:*/
					addActive(x);
				} else if (e.keyCode == 13) {
					/*If the ENTER key is pressed, prevent the form from being submitted,*/
					e.preventDefault();
					if (currentFocus > -1) {
						/*and simulate a click on the "active" item:*/
						if (x)
							x[currentFocus].click();
					}
				}
			});
			function addActive(x) {
				/*a function to classify an item as "active":*/
				if (!x)
					return false;
				/*start by removing the "active" class on all items:*/
				removeActive(x);
				if (currentFocus >= x.length)
					currentFocus = 0;
				if (currentFocus < 0)
					currentFocus = (x.length - 1);
				/*add class "autocomplete-active":*/
				x[currentFocus].classList.add("autocomplete-active");
			}
			function removeActive(x) {
				/*a function to remove the "active" class from all autocomplete items:*/
				for (var i = 0; i < x.length; i++) {
					x[i].classList.remove("autocomplete-active");
				}
			}
			function closeAllLists(elmnt) {
				/*close all autocomplete lists in the document,
				except the one passed as an argument:*/
				var x = document.getElementsByClassName("autocomplete-items");
				for (var i = 0; i < x.length; i++) {
					if (elmnt != x[i] && elmnt != inp) {
						x[i].parentNode.removeChild(x[i]);
					}
				}
			}
			/*execute a function when someone clicks in the document:*/
			document.addEventListener("click", function(e) {
				closeAllLists(e.target);
			});
		}

		/*An array containing all the country names in the world:*/
		var countries = [${nameList}];

		/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
		autocomplete(document.getElementById("myInput"), countries);
	</script>
<script type="text/javascript">
	var mySidebar = document.getElementById("mySidebar");

	function w3_open() {
		if (mySidebar.style.display === 'block') {
			mySidebar.style.display = 'none';
		} else {
			mySidebar.style.display = 'block';
		}
	}

	function w3_close() {
		mySidebar.style.display = "none";
	}
</script>
</html>