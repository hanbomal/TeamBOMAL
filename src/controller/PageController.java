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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.RelationDAO;
import dao.StudyDAO;
import model.StudyVO;

@Controller
@RequestMapping("/page")
public class PageController {
	// autoComplete Method
	public void autoComplete(Model mv) throws Throwable {
		StudyDAO studyDB = StudyDAO.getInstance();
		// auto_complete
		List<StudyVO> allList = studyDB.getAllStudy();
		String nameList = "";
		for (StudyVO study : allList) {
			nameList += "\"" + study.getStudyName() + "\",";
		}
		mv.addAttribute("nameList", nameList);
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
	public String main(Model mv, String studyName,HttpServletRequest req) throws Throwable {
		autoComplete(mv);
		StudyDAO studyDB = StudyDAO.getInstance();
		if (studyName == null) {
			studyName = "defaultName";
		}
		String memberid = getSessionId(req);
		List<StudyVO> group = studyDB.resultList(studyName, memberid);
		mv.addAttribute("group", group);
		mv.addAttribute("studyName", studyName);
		return "page/main";
	}

	@RequestMapping("/requestJoin")
	public String requestJoin(String reqNum,String correctName,
			HttpServletRequest req,String studyName,String leader) throws Throwable {
		RelationDAO dbPro = RelationDAO.getInstance();
		if (reqNum == null) {
			reqNum = "";
		}
		if (reqNum.equals("1")) {
			dbPro.requestJoin(getSessionId(req), correctName, "member_nick", "회원", leader);
			studyName = URLEncoder.encode(studyName, "UTF-8");
			return "redirect:/page/main?studyName="+ studyName;
		}
		return null;
	}

	@RequestMapping("/cancelJoin")
	public String cancelJoin(HttpServletRequest req, HttpServletResponse res,
			String studyName, String correctName) throws Throwable {
		RelationDAO dbPro = RelationDAO.getInstance();
		String delNum = req.getParameter("delNum");
		if (delNum == null) {
			delNum = "";
		}
		if (delNum.equals("1")) {
			dbPro.cancelJoin(getSessionId(req), correctName);
			studyName = URLEncoder.encode(studyName, "UTF-8");
			return "redirect:/page/main?studyName="+ studyName;
		}
		return null;
	}

	@RequestMapping("/makingPro")
	public String makingPro(MultipartHttpServletRequest req, StudyVO study, Model model) throws Throwable {
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
		
		study.setStudyName(multi.getParameter("studyName"));
		study.setPeopleCount(1);
		study.setLeader(getSessionId(req));
		study.setStudy_intro(multi.getParameter("study_intro"));

		if (file[0] != null) {
			study.setStudy_pro(filename[0]);
			study.setProSize((int) file[0].length());
		} else {
			study.setStudy_pro("");
			study.setProSize(0);
		}
		
		
		if (file[1] != null) {
			study.setStudy_back(filename[1]);
			study.setBackSize((int) file[1].length());
		} else {
			study.setStudy_back("");
			study.setBackSize(0);
		}

		// filename =0이 background
		// =1 은 profile

		StudyDAO dbPro = StudyDAO.getInstance();
		dbPro.makingStudy(study);
		
		return "redirect:/page/main";
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
