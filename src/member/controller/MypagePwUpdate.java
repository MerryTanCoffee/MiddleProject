package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;

@WebServlet("/MypagePwUpdate")
public class MypagePwUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MypagePwUpdate() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO mv = new MemberVO();
		IMemberService service = MemberServiceImpl.getInstance();
		String memId = (String) session.getAttribute("loginCode");
		mv = service.getMember(memId);
		
		request.setAttribute("memPw", mv.getMemPw());
		request.setAttribute("pwPost","no");
		request.getRequestDispatcher("mypagepwupdate.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO mv = new MemberVO();
		IMemberService service = MemberServiceImpl.getInstance();
		String memId = (String) session.getAttribute("loginCode");
		mv = service.getMember(memId);
		
		
		
		String memPw1 = request.getParameter("memPw1");
		String memPw2 = request.getParameter("memPw2");
		String memPw3 = request.getParameter("memPw3");
		
		System.out.println(memPw3);
		System.out.println(memPw1);
		System.out.println(mv.getMemPw());
		if(memPw1.equals(mv.getMemPw()) ) {
			request.setAttribute("equalsCode1", "yes" );
			}else {
				request.setAttribute("equalsCode1", "no" );
			}
		
		if(memPw2.equals(memPw3) ) {
			request.setAttribute("equalsCode2", "yes");
		}else {
			request.setAttribute("equalsCode2", "no");
		}
		
		request.setAttribute("pwPost","yes");
		request.setAttribute("memId",memId );
		request.setAttribute("memPw", memPw2 );
		request.getRequestDispatcher("mypagepwupdate.jsp").forward(request, response);
	
	}

}
