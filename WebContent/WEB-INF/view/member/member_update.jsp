<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO" %>
<%@ page import="model.MemberVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	/* int num = Integer.parseInt(request.getParameter("num")); */
	String memberid=request.getParameter("memberid");
	String passwd=request.getParameter("passwd");
	
	try {
		MemberDAO dbpro = MemberDAO.getInstance();
		MemberVO member = dbpro.getmember(memberid,passwd);
	 
%>
<!-- -하다말았음. -->
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<title>Insert title here</title>
	<style type="text/css">
		.bgimg {
			    background-color : "w3-pale-red"
			    min-height: 100%;
			    background-position: center;
			    background-size: cover;		
			}
	</style>
</head>
<body class=bgimg>
<div>&nbsp;
	<div class="w3-container" style="margin-top:54px; margin-left: 10%;">
		<div class="w3-container w3-center w3-white w3-round" style="margin: 16px;">
			<h3 class="w3-center">회 원 수 정</h3>
			<form method="post" action="<%=request.getContextPath() %>/admin/updateUserPro.jsp" onsubmit="return checkValue()"
			style="padding: 3%;">
			
				<div class="w3-button w3-pink w3-right" onclick="location.href='accountList.jsp'" style="margin-bottom: 10px;">목록</div>
				
			
			   
				<div class="w3-row w3-section">
				  <div class="w3-col" style="width:100px">아이디</div>
				    <div class="w3-rest">
				      <input class="w3-input w3-border"  name="id" type="text" value ="<%=request.getParameter("id")%>">
				    </div>
				</div>
		
				<div class="w3-row w3-section">
				  <div class="w3-col" style="width:100px">이름</div>
				    <div class="w3-rest">
				      <input class="w3-input w3-border"  name="name" type="text" value="<%=member.getMemberid()%>">
				    </div>
				</div>
		
				<div class="w3-row w3-section">
				  <div class="w3-col" style="width:100px">비밀번호</div>
				    <div class="w3-rest">
				      <input class="w3-input w3-border"  name="passwd" type="text" value="<%=member.getPasswd() %>">
				    </div>
				</div>
		
				
		
				<div class="w3-row w3-section">
				  <div class="w3-col" style="width:100px">주소</div>
				    <div class="w3-rest">
				      <input class="w3-input w3-border"  name="addr" type="text" value="<%=member.getListid()%>">
				    </div>
				</div>
				
				<%	String pageNum = request.getParameter("pageNum");
						if (pageNum == null || pageNum == "") { 
							pageNum = "1"; 
				} %>
				
				<div class="w3-right">
				
					<input type="hidden" name="id" value="<%= member.getMemberid() %>">
					<input type="hidden" name="passwd" value="<%=member.getNickname() %>">
					<input type="hidden" name="pageNum" value="<%=member.getPasswd()%>">
					<input type="hidden" name="num" value="<%=member.getNum() %> %>">
					
					<input type="submit" value="Send" class="w3-button w3-large w3-pink">
				</div>
			 
			   
		     
		</form>
		</div>
	</div>
</div>



<% } catch (Exception e) {} %>
</body>
</html>