package ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CalendarDAO;
import model.CalendarVO;

public class TestTest extends HttpServlet{

		 private static final long serialVersionUID = 1L;

		 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  responseAjax(request,response);
		 }

		 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  responseAjax(request,response);

		 }

		 private void responseAjax(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			 
		  String title = (String)request.getParameter("title");
		  String place=(String)request.getParameter("place");
		  String startdate=(String)request.getParameter("startdate");
		  String enddate=(String)request.getParameter("enddate");
		  String description=(String)request.getParameter("description");
		 
		  
		  
		  CalendarDAO cpro=CalendarDAO.getInstance();
	    	CalendarVO calendar=new CalendarVO();
	    	
	    	calendar.setTitle(title);
	    	if(description!=null) {
	    	calendar.setDescription(description);
	    	}else {
	    		calendar.setDescription("");
	    	}
	    	if(place!=null) {
	    		calendar.setPlace(place);
	        	}else {
	        		calendar.setPlace("");
	        	}
	        	
	    	calendar.setStartdate(startdate);
	    	calendar.setEnddate(enddate);
	    	calendar.setStudynum(1);	//임의로 1로 해놓음
	    	
	    	cpro.addCalendar(calendar);
	    	System.out.println(calendar);
		  
		  
		  
		  response.setCharacterEncoding("utf-8");
		  PrintWriter out = response.getWriter();
		  	
		  out.print("<p>등록이 완료되었습니다</p>");

		 }

		}
		

