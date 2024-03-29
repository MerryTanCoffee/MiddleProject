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
import ask.vo.AskVO;

@WebServlet(value = "/ask/insert.do")
public class InsertAskController extends HttpServlet{
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   
      req.getRequestDispatcher("/ask/insertAsk.jsp")
      .forward(req,resp);
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      

      AskVO av = new AskVO();
      
      String askTitle = req.getParameter("askTitle"); 
      String askCon = req.getParameter("askCon"); 
      String askNick = req.getParameter("askNick"); 
      String memId = req.getParameter("memId");
      
      IAskService askService = AskServiceImpl.getInstance();
      
      av.setAskTitle(askTitle);
      av.setAskCon(askCon);
      av.setAskNick(askNick);
      av.setMemId(memId);
      
      int cnt = askService.registerAsk(av);
      
      String msg = "";
      if(cnt > 0) {
         msg = "성공";
      }else {
         msg = "실패";
      }
      System.out.println(msg);
      
      
      HttpSession session = req.getSession();
	  session.setAttribute("msg", msg);
		
      
      resp.sendRedirect(
            req.getContextPath() + "/ask/list.do");   
   }
      
}