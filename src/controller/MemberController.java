package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MemberDAO;
import model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@RequestMapping("/join")
	public String join(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		int num = 0;
		String listid = request.getParameter("listid");

		if (listid == null)
			listid = "1";

		if (request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		request.setAttribute("num", num);
		request.setAttribute("listid", listid);

		return "member/join";
	}

	@RequestMapping("/joinPro")
	public String joinPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		String listid = request.getParameter("listid");
		if (listid == null)
			listid = "1";

		MemberVO member = new MemberVO();
		MemberDAO dbpro = MemberDAO.getInstance();

		member.setListid(listid);
		member.setMemberid(request.getParameter("memberid"));
		member.setNickname(request.getParameter("nickname"));
		member.setPasswd(request.getParameter("passwd"));
		dbpro.insertMember(member);

		response.sendRedirect(request.getContextPath() + "/page/main");

		return null;
	}

	@RequestMapping("/loginPro")
	public String loginPro(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String memberid = req.getParameter("memberid");
		String passwd = req.getParameter("passwd");
		MemberDAO dbPro = MemberDAO.getInstance();
		int pwcheck = dbPro.login(memberid, passwd);
		if (pwcheck == 1) {
			// MemberVO mVO= dbPro.getMember(memberid);
			HttpSession session = req.getSession();
			session.setAttribute("memberid", memberid);
			// session.setAttribute("nickname",mVO.getNickname());
			session.setAttribute("passwd", passwd);
			res.sendRedirect(req.getContextPath() + "/page/main");
		} else {
			req.setAttribute("pwcheck", pwcheck);
			return "member/loginPro";
		}
		return null;
	}

}
