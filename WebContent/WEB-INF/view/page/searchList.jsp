<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/common/httpRequest.js"></script>

<script type="text/javascript">
	function helloToServer(){
		var params ="reqNum="+encodeURIComponent(document.req.reqNum.value)
		+"&studyName="+encodeURIComponent(document.req.studyName.value)+"&leader="
		+encodeURIComponent(document.req.leader.value);
		sendRequest("requestJoin",params,helloFromServer,"POST");
	}
	
	function helloFromServer(){
		if(httpRequest.readyState==4){
			if(httpRequest.status==200){
				alert("요청완료");
			}
		}
	}
</script> --%>

<!-- content -->
<div class="bgimg-1 w3-display-container w3-grayscale-min" id="home">
	<br> <br> <br>
	<!--개설된 방  검색 결과 추가 -->
	<div class="w3-cell-row">
		<div class="w3-third"></div>
		<div class="w3-container w3-cell" style="width: 60%">
		
		
		 <c:forEach var="room" items="${group}">
				<ul class="w3-ul w3-card-4 w3-light-grey">
					<li class="w3-bar">
						<!--그룹 프로필  --> 
						<c:if test="${room.study_pro==null }">
							<img src="<%=request.getContextPath()%>/imgs/defaultprofile.png"
								class="w3-bar-item w3-circle w3-hide-small" style="width: 85px">
						</c:if> 
						
						<c:if test="${room.study_pro!=null }">
							<img
								src="<%=request.getContextPath()%>/fileSave/${room.study_pro}"
								class="w3-bar-item w3-circle w3-hide-small" style="width: 85px">
						</c:if>


						<div class="w3-bar-item">
							<span class="w3-large">${room.studyName}</span><br> <span>
								${room.study_intro }</span>
						</div> 
					
						<c:if test="${room.relation.status==null}">
							<form action="searchList" class="w3-right" name="req">
								<input type="hidden" name="reqNum" value="1" /> 
								<input type="hidden" name="corretName" value="${room.studyName}" />
								<input type="hidden" name="leader" value="${room.leader}" />
								<input class="w3-button w3-blue w3-round " type="submit"
									value="가입" /> 
							<!-- 	<input type="button" class="w3-button w3-blue w3-round"
								value="가입" onclick="helloToServer()" /> -->
							</form>
						</c:if> 
						<!-- <form name="f">
							 <input type="text" name="name" />
							<input type="button" value="입력" onclick="helloToServer()" />
							</form>
							<div id="aaa"></div> -->
						<c:if test="${room.relation.status==1}">
							<form action="cancelJoin" class="w3-right">
								<input type="hidden" name="delNum" value="1" /> <input
									type="hidden" name="studyName" value="${room.studyName}" />
								<input class="w3-button w3-red w3-round " type="submit"
									value="취소" />
							</form>
						</c:if>
					</li>
				</ul>

			</c:forEach> 
		</div>
		<div class="w3-third"></div>
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


</html>