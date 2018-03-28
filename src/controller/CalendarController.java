package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import dao.CalendarDAO;
import model.CalendarVO;

@Controller
@RequestMapping("/calcontroller")
public class CalendarController {

	@RequestMapping("/listview")
	public String listview(HttpServletRequest req, HttpServletResponse res) throws Throwable {

		CalendarDAO cpro = CalendarDAO.getInstance();

		List li = null;

		li = cpro.getCalendarList(1); // 임의로 1로 해놓음

		req.setAttribute("list", li);

		return "calendar/study_calendar";
	}

	@RequestMapping("/test")
	public String test(HttpServletRequest req, HttpServletResponse res) throws Throwable {

		CalendarDAO cpro = CalendarDAO.getInstance();

		List li = null;

		li = cpro.getCalendarList(1); // 임의로 1로 해놓음

		System.out.println(li);

		req.setAttribute("list", li);

		return "calendar/study_calendar2";
	}

	@RequestMapping("/addPro1")
	public String addPro1(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		CalendarDAO cpro=CalendarDAO.getInstance();
    	CalendarVO calendar=new CalendarVO();
    	
    	calendar.setTitle(req.getParameter("title"));
    	if(req.getParameter("description")!=null) {
    	calendar.setDescription(req.getParameter("description"));
    	}else {
    		calendar.setDescription("");
    	}
    	if(req.getParameter("place")!=null) {
    		calendar.setPlace(req.getParameter("place"));
        	}else {
        		calendar.setPlace("");
        	}
        	
    	calendar.setStartdate(req.getParameter("startdate"));
    	calendar.setEnddate(req.getParameter("enddate"));
    	calendar.setStudynum(1);	//임의로 1로 해놓음
    	
    	cpro.addCalendar(calendar);
    	System.out.println(calendar);
    	
        

		return "calendar/addComp";
	}

	@RequestMapping("/deleteCalendar")
	public String deleteCalendar(HttpServletRequest req, HttpServletResponse res) throws Throwable {

		CalendarDAO cpro=CalendarDAO.getInstance();
    	String num=req.getParameter("id");
    	
    	cpro.deleteCalendar(num);
    	
        System.out.println("스케쥴 삭제");
       
		return "calendar/deleteComp";
	}

	@RequestMapping("/contents")
	public String contents(HttpServletRequest req, HttpServletResponse res) throws Throwable {


  	  String id = req.getParameter("id");
  	  CalendarDAO cpro=CalendarDAO.getInstance();
  	  CalendarVO calendar=cpro.getCalendar(id);
  	  req.setAttribute("calendar",calendar); 
  	

		return "calendar/contentsView";

	}

	@RequestMapping("/updateForm")
	public String updateForm(HttpServletRequest req, HttpServletResponse res) throws Throwable {

		
		  String id = req.getParameter("id");
		  CalendarDAO cpro=CalendarDAO.getInstance();
		  CalendarVO calendar=cpro.getCalendar(id);
		  req.setAttribute("calendar",calendar); 
		
		return "calendar/updateSchedule";

	}

	@RequestMapping("/updatePro")
	public String updatePro(HttpServletRequest req, HttpServletResponse res) throws Throwable {


		  CalendarDAO cpro=CalendarDAO.getInstance();
		  CalendarVO calendar=new CalendarVO();
		  
		  calendar.setDescription(req.getParameter("description"));
		  calendar.setEnddate(req.getParameter("enddate"));
		  calendar.setStartdate(req.getParameter("startdate"));
		  calendar.setNum(Integer.parseInt(req.getParameter("id")));
		  calendar.setPlace(req.getParameter("place"));
		  calendar.setStudynum(Integer.parseInt(req.getParameter("studynum")));
		  calendar.setTitle(req.getParameter("title"));
		  
		cpro.updateCalendar(calendar);
	  
		return "calendar/updateComp";

	}

	@RequestMapping("/test1")
	public String test1(HttpServletRequest req, HttpServletResponse res) throws Throwable {

		return "calendar/addComp";

	}
}
