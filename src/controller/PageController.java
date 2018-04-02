package controller;

import java.io.FileOutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dao.RelationDAO;
import dao.StudyDAO;
import model.RelationVO;
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
	public String makingPro(MultipartHttpServletRequest req,  
			String studyName, String study_intro) throws Throwable {
		StudyVO  study = new StudyVO();
		MultipartFile multi1 = req.getFile("study_pro");
		MultipartFile multi2 = req.getFile("study_back");
		String pro_name = multi1.getOriginalFilename();
		String back_name = multi2.getOriginalFilename();
		if (pro_name != null && !pro_name.equals("")) {
			String uploadPath = req.getRealPath("/") + "fileSave";
			FileCopyUtils.copy(multi1.getInputStream(),
					new FileOutputStream(uploadPath + "/" + multi1.getOriginalFilename()));
			study.setStudy_pro(pro_name);
			study.setProSize((int) multi1.getSize());
		} else {
			study.setStudy_pro("");
			study.setProSize(0);
		}
		if (back_name != null && !back_name.equals("")) {
			String uploadPath = req.getRealPath("/") + "fileSave";
			FileCopyUtils.copy(multi2.getInputStream(),
					new FileOutputStream(uploadPath + "/" + multi2.getOriginalFilename()));
			study.setStudy_back(back_name);
			study.setBackSize((int) multi2.getSize());
		} else {
			study.setStudy_back("");
			study.setBackSize(0);
		}
		study.setStudyName(studyName);
		study.setStudy_intro(study_intro);
		study.setPeopleCount(1);
		study.setLeader(getSessionId(req));
		StudyDAO dbPro = StudyDAO.getInstance();
		System.out.println(study);
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
	@RequestMapping("/RequestPage")
	public String RequestPage(Model mv,HttpServletRequest req) throws Throwable {
		autoComplete(mv);
		RelationDAO relationDB = RelationDAO.getInstance();
		String memberid = getSessionId(req);
		List<RelationVO> reqList = relationDB.requestList(memberid);
		mv.addAttribute("reqList", reqList);
		return "page/RequestPage";
	}
	
	@RequestMapping("/ResponsePage")
	public String ResponsePage(Model mv,HttpServletRequest req) throws Throwable {
		autoComplete(mv);
		RelationDAO relationDB = RelationDAO.getInstance();
		String memberid = getSessionId(req);
		List<RelationVO> resList = relationDB.responseList(memberid);
		mv.addAttribute("resList", resList);
		return "page/ResponsePage";
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
