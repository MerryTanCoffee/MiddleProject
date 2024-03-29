package message.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import message.service.IMessageService;
import message.service.MessageService;
import message.vo.MessageVO;

@WebServlet("/message/write.do")
public class MessageWriteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/message/messageWrite.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		String memNick = (String) session.getAttribute("memNick");
		String memId = (String) session.getAttribute("loginCode");
//		String receiverId = (String) session.getAttribute("receiverId");
		
		String receiverId = req.getParameter("receiverId");
		String receiverNick = req.getParameter("receiverNick"); 
		String msgCon = req.getParameter("msgCon"); 
		
		IMessageService msgService = MessageService.getInstance();
		
		MessageVO msgv = new MessageVO();
		msgv.setMemId(memId);
		msgv.setReceiverId(receiverId);
		msgv.setMemNick(memNick);
		msgv.setReceiverNick(receiverNick);
		msgv.setMsgCon(msgCon);

		
		int cnt = msgService.registMessage(msgv);
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
//		HttpSession session = req.getSession();
//		session.setAttribute("msg", msg);
		
		resp.sendRedirect(
				req.getContextPath() + "/message/write.do");	
	}
	
}
