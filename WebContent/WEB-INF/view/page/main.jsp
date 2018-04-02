<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- content -->
<div class="bgimg-1 w3-display-container w3-grayscale-min" id="home">
	<br><br><br><br>
	<!--개설된 방  검색 결과 추가 -->
	<div class="w3-cell-row">
		<div class="w3-third"></div>
		<div class="w3-container w3-cell" style="width: 50%">
		<c:if test="${group.size()!=null}">
				<div class="w3-card-4 w3-light-grey w3-leftbar w3-border-grey" >
				<font >&nbsp;검색결과: ${group.size()}</font>	
			<!-- 
				필터 넣어야되는데 귀찮다...
			<select class="w3-right" onchange="window.location='mainPage?pageId='+this.value">
  			  <option  value="">&nbsp;정열&nbsp;</option>
			</select>
				 -->
				</div>
		</c:if>		
		 <c:forEach var="room" items="${group}">
				<div class="w3-card-4 w3-light-grey ">
					<div class="w3-cell-row">
						<div class="w3-cell w3-cell-middle w3-center" style="width:15%">
						<!--그룹 프로필  --> 
						<c:if test="${room.study_pro==null }">
							<img src="<%=request.getContextPath()%>/imgs/defaultprofile.png"
								class="w3-bar-item w3-hide-small" style="width: 90px;height:70px" >
						</c:if> 
						
						<c:if test="${room.study_pro!=null }">
							<img
								src="<%=request.getContextPath()%>/fileSave/${room.study_pro}"
								class="w3-bar-item w3-hide-small" style="width: 90px;height:70px">
						</c:if>
						</div>
						<div class="w3-cell w3-cell-middle w3-center" style="width:75%">
						<div class="w3-bar-item">
							<span class="w3-large"><a href="#" onclick="studyIntro('${room.num}')">${room.studyName}</a>
							</span>	<span>(멤버수: ${room.peopleCount})</span> 
						
						</div> 
						</div>
						<div class="w3-cell w3-cell-middle w3-center w3-hide-small" style="width:20%;padding:10px">
						<c:if test="${room.relation.status==null}">
							<form action="requestJoin" method="post" >
								<input type="hidden" name="reqNum" value="1" /> 
								<input type="hidden" name="correctName" value="${room.studyName}" />
								<input type="hidden" name="studyName" value="${studyName}" />
								<input type="hidden" name="leader" value="${room.leader}" />
								<input class="w3-button w3-white w3-border w3-border-red w3-round-large" type="submit"
									value="가입"  /> 
							</form>
						</c:if> 
						<c:if test="${room.relation.status==1}">
						<div class="w3-dropdown-hover w3-round-large">
						  <div class="w3-button w3-white w3-border w3-border-blue w3-round-large">대기
						  </div>	
							<div class="w3-dropdown-content w3-bar-block w3-border" >
							 <form action="cancelJoin" method="post">
								<input type="hidden" name="delNum" value="1" /> 
								<input type="hidden" name="correctName" value="${room.studyName}" />
								<input type="hidden" name="studyName" value="${studyName}" />
								<input class="w3-button w3-bar-item w3-center" type="submit" 
									value="요청 취소" />
							</form> 
							</div>
						</div>
						
						</c:if>
						</div> 
					</div>
		<div id="${room.num }" 
		 class="w3-hide w3-light-grey w3-leftbar w3-border-grey">
        <div class="w3-border-top w3-border-right"><strong>&nbsp;<font size="3.8">[그룹정보]</font></strong><br></div>
        	<div class="w3-cell-row w3-border-right">
        		<div class="w3-cell w3-half" >&nbsp;&nbsp;&nbsp;&nbsp;⦁방장:&nbsp; ${room.leader}</div>
        		<div class="w3-cell w3-half">&nbsp;&nbsp;&nbsp;&nbsp;⦁개설일:&nbsp; ${room.openDate}</div>
        	</div>
        	<div class="w3-border-right">&nbsp;&nbsp;&nbsp;&nbsp;⦁방소개: <span>&nbsp;${room.study_intro} </span></div>
        	
           		
        </div>	
					
				</div>
			</c:forEach> 
		</div>
	</div>


	<div class="w3-display-bottomleft w3-text-grey w3-large"
		style="padding: 24px 48px">
		<i class="fa fa-facebook-official w3-hover-opacity"></i> <i
			class="fa fa-instagram w3-hover-opacity"></i> <i
			class="fa fa-snapchat w3-hover-opacity"></i> <i
			class="fa fa-pinterest-p w3-hover-opacity"></i> <i
			class="fa fa-twitter w3-hover-opacity"></i> <i
			class="fa fa-linkedin w3-hover-opacity"></i>
	</div>
</div>
<script>
// Accordion
function studyIntro(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-theme-d1";
    } else { 
        x.className = x.className.replace("w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-theme-d1", "");
    }
}

</script>

</html>