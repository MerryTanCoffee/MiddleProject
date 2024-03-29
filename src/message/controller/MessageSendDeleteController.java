package message.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import message.service.IMessageService;
import message.service.MessageService;
import message.service.IMessageService;
import message.service.MessageService;
import message.vo.MessageVO;

@WebServlet("/message/Senddelete.do")
public class MessageSendDeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				// 1. 파라미터 정보 가져오기
				String msgNo = req.getParameter("msgNo");
				
				// 2. 서비스 객체 생성하기
				IMessageService msgService = MessageService.getInstance();
				
				int cnt = msgService.removeMessage(msgNo);
				
				String msg = "";
				if(cnt > 0) {
//					resp.addAttribute("msg", "메시지"); 
//					resp.addAttribute("url", "alert.jsp");
					
					msg = "성공";
					
				}else {
					msg = "실패";
				}
				HttpSession session = req.getSession();
				session.setAttribute("msg", msg);
				
				resp.sendRedirect( // Redirect 주소 재설정
						req.getContextPath() + "/message/alert2.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);

	}

}
