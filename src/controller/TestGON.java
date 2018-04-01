package controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.RelationDAO;
import dao.StudyDAO;
import model.StudyVO;

@Controller
@RequestMapping("/page")
public class TestGON {

	// autoComplete Method
	public void autoComplete(HttpServletRequest req) throws Throwable {
		StudyDAO studyDB = StudyDAO.getInstance();
		// auto_complete
		List<StudyVO> allList = studyDB.getAllStudy();
		String nameList = "";
		for (StudyVO study : allList) {
			nameList += "\"" + study.getStudyName() + "\",";
		}
		req.setAttribute("nameList", nameList);
	}

	// get Session ID Method
	public String getSessionId(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String memberid = (String) session.getAttribute("memberid");
		if (memberid == null) {
			memberid = "";
		}
		return memberid;
	}

	@RequestMapping("/main")
	public String main(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		autoComplete(req);
		StudyDAO studyDB = StudyDAO.getInstance();
		String studyName = req.getParameter("studyName");
		if (studyName == null) {
			studyName = "defaultName";
		}
		// 검색 결과에따라서 리스트가 달라지게끔
		String memberid = getSessionId(req);
		List<StudyVO> group = studyDB.resultList(studyName, memberid);
		req.setAttribute("group", group);
		req.setAttribute("studyName", studyName);
		return "page/main";
	}

	@RequestMapping("/requestJoin")
	public String requestJoin(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		RelationDAO dbPro = RelationDAO.getInstance();
		String reqNum = req.getParameter("reqNum");
		String studyName = req.getParameter("studyName");
		String correctName = req.getParameter("correctName");
		String leader = req.getParameter("leader");
		if (reqNum == null) {
			reqNum = "";
		}
		if (reqNum.equals("1")) {
			dbPro.requestJoin(getSessionId(req), correctName, "member_nick", "회원", leader);
			studyName = URLEncoder.encode(studyName, "UTF-8");
			res.sendRedirect(req.getContextPath() + "/page/main?studyName=" + studyName);
		}
		return null;
	}

	@RequestMapping("/cancelJoin")
	public String cancelJoin(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		RelationDAO dbPro = RelationDAO.getInstance();
		String delNum = req.getParameter("delNum");
		String studyName = req.getParameter("studyName");
		String correctName = req.getParameter("correctName");
		if (delNum == null) {
			delNum = "";
		}
		if (delNum.equals("1")) {
			dbPro.cancelJoin(getSessionId(req), correctName);
			studyName = URLEncoder.encode(studyName, "UTF-8");
			res.sendRedirect(req.getContextPath() + "/page/main?studyName=" + studyName);
		}
		return null;
	}

	@RequestMapping("/makingPro")
	public String makingPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {

		String realFolder = "";
		String encType = "utf-8";
		int maxSize = 10 * 1024 * 1024;
		ServletContext context = req.getServletContext();
		realFolder = context.getRealPath("fileSave");
		MultipartRequest multi = null;
		multi = new MultipartRequest(req, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();

		String[] filename = new String[2];
		File[] file = new File[2];
		int index = 0;

		while (files.hasMoreElements()) {
			String name = (String) files.nextElement();
			System.out.println(index + ";" + name);

			filename[index] = multi.getFilesystemName(name);
			System.out.println(multi.getContentType(name));
			file[index] = multi.getFile(name);
			index++;
		}

		StudyVO room = new StudyVO();
		room.setStudyName(multi.getParameter("studyName"));
		room.setPeopleCount(1);
		room.setLeader(getSessionId(req));
		room.setStudy_intro(multi.getParameter("study_intro"));

		if (file[0] != null) {
			room.setStudy_pro(filename[0]);
			room.setProSize((int) file[0].length());
		} else {
			room.setStudy_pro("");
			room.setProSize(0);
		}
		if (file[1] != null) {
			room.setStudy_back(filename[1]);
			room.setBackSize((int) file[1].length());
		} else {
			room.setStudy_back("");
			room.setBackSize(0);
		}

		// filename =0이 background
		// =1 은 profile

		StudyDAO dbPro = StudyDAO.getInstance();
		dbPro.makingStudy(room);
		res.sendRedirect(req.getContextPath() + "/page/main");
		return null;
	}

	@RequestMapping("/about")
	public String about(HttpServletRequest req, HttpServletResponse res) throws Throwable {

		return "page/about";
	}

	@RequestMapping("/study_board")
	public String study_board(HttpServletRequest req, HttpServletResponse res) throws Throwable {

		return "page/study_board";
	}

	@RequestMapping("/study_album")
	public String study_album(HttpServletRequest req, HttpServletResponse res) throws Throwable {

		return "page/study_album";
	}

	@RequestMapping("/study_making")
	public String study_making(HttpServletRequest req, HttpServletResponse res) throws Throwable {

		return "page/study_making";
	}
	
	@RequestMapping("/test")
	public String test(HttpServletRequest req, HttpServletResponse res) throws Throwable {

		return "page/study_test";
	}

}
