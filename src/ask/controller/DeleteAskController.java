package ask.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ask.service.AskServiceImpl;
import ask.service.IAskService;

@WebServlet("/ask/delete.do")
public class DeleteAskController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 파라미터 정보 가져오기
		int askNo = Integer.parseInt(req.getParameter("askNo"));
		
		// 2. 서비스 객체 생성하기
		IAskService askService = AskServiceImpl.getInstance();
		
		int cnt = askService.removeAsk(askNo);
		
		String msg = "";
		
		if(cnt > 0 ) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);
		
		
		resp.sendRedirect(req.getContextPath() + "/ask/list.do");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
