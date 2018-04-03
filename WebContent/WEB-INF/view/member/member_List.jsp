<%@page import="dao.MemberDAO"%>
<%@page import="java.util.List"%> 
<%@page import="model.MemberVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% String listid = request.getParameter("listid");
	if (listid==null) listid = "1"; %>
<%
	int pageSize= 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null || pageNum =="") {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;  
	
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	List memberList = null;
	MemberDAO dbPro = MemberDAO.getInstance();
	count = dbPro.getMemberCount(listid);
	//�Խ��ǿ� �ִ� �� �� count
	if (count > 0) {
		memberList = dbPro.getMembers(startRow, endRow, listid); 
	}
	number = count - (currentPage - 1) * pageSize;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<title>��������Ʈ</title>
	<style type="text/css">
	.bgimg {
		
		    min-height: 100%;
		    background-position: center;
		    background-size: cover;		
		}
	</style>
	
</head>
<body class="bgimg">
<div>&nbsp;
	<div class="w3-container" style="margin-top:54px; margin-left: 10%;">
	       <%
	       if(count==0){
	       %>
	       <div class="w3-container w3-white w3-round w3-margin">
	       		
	          	<h3 class="w3-center"><%=listid%>(��ü ȸ�� ��:<%=count %>)</h3>

	        <div class="w3-center w3-container">
	       		<p class="w3-grey">ȸ���� �����ϴ�....</p>
	       	</div>	
	       
	       
	       </div>
	       
	       <% }else{ %>
	       <div class="w3-container w3-margin w3-white w3-round">
	       		<h3 class="w3-center">ȸ������Ʈ(��ü ȸ�� ��:<%=count %>)</h3>
	       
	       <table class="w3-table w3-bordered" width="900">
	       <tr class="w3-grey w3-center">
	       <td align="center" width="50">��ȣ</td>
	       <td align="center" width="100">ȸ�� ���̵�</td>
	       <td align="center" width="100">ȸ�� ��й�ȣ</td>
	       <td align="center" width="100">ȸ�� �г���</td>
	       
	 
	       <td align="center" width="100">������</td>
	       <td align="center" width="100">����������</td>
	       <td align="center" width="100">����/����</td>
	       </tr>
	 
	       
	       <% for (int i=0;i<memberList.size();i++){
	         MemberVO member=(MemberVO) memberList.get(i);%>
	          <tr height="30">
	          <td align="center" width="50"><%=number-- %></td>
	        	    <td align="center" width="100"><%=member.getMemberid() %></td>
	        	    <td align="center" width="100"><%=member.getPasswd() %></td>
	          		<td align="center" width="100"><%=member.getNickname() %></td>
	             	<td align="center" width="100"><%=sdf.format(member.getJoindate())%></td>
	             	<td align="center" width="100"><%=sdf.format(member.getLastdate())%></td>
	               	<td align="center" width="100">
	               		<!-- ���� ���� �����  -->
	               		<form method="post" action="<%=request.getContextPath() %>/admin/updateUserForm.jsp">
		  					<input type="submit" class="w3-button w3-w3-grey w3-hover-black" value="����">
		  					<input type="hidden" name="id" value="<%= member.getMemberid() %>">
							<input type="hidden" name="passwd" value="<%= member.getPasswd() %>">
						</form>
	  					
						
						<form method="post" action="<%=request.getContextPath() %>/admin/deleteUserPro.jsp">
							<input type="submit" class="w3-button w3-w3-pale-red w3-hover-black" value="����">
							
							<!-- hidden���� id, pwd��������  -->
		               		<input type="hidden" name="id" value="<%=member.getMemberid() %>">
		               		<input type="hidden" name="pwd" value="<%=member.getPasswd() %>">
		               		<!--  -->
	               		</form>
	               	</td>
	          </tr>
	          <%} %>
	           
	       </table>
	       
	       <div class = "w3-center w3-white w3-margin">
				<% int bottomLine = 3; 
					if(count > 0) {
						int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
						int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine; //����, ����������.
						int endPage = startPage + bottomLine -1;
						if (endPage > pageCount) endPage = pageCount;
						if (startPage > bottomLine) { %>
						<a href="member_List.jsp?pageNum=<%= startPage - bottomLine %>">[����]</a>
						<% } %>
						<% for (int i = startPage; i <= endPage; i++) { %>
						<a href="member_List.jsp?pageNum=<%=i%>"> <%
						if (i != currentPage) out.print("["+i+"]");
						else out.print("<font color='grey'>["+i+"]</font>");%></a>
						<% }
							if(endPage < pageCount) {	%>
							<a href="member_List.jsp?pageNum=<%=startPage + bottomLine %>">[����]</a>
							<% 
						}
					}
					
				%>
			</div>
			
	     </div>
	     <%} %>
	           
	</div>
</div>
<a href="../main.jsp">��������</a>

</body>
</html>