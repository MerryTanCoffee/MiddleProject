package free.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import free.service.FreeServiceImpl;
import free.service.IFreeService;
import free.vo.FreeVO;

@WebServlet(value="/free/insert.do")
@MultipartConfig
public class InsertFreeController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
//		req.setAttribute("mem_id", mem_id);
		
		req.getRequestDispatcher("/f_boa/f_write.jsp").forward(req, resp);
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		FreeVO fv = new FreeVO();
		
		String fTitle = req.getParameter("fTitle");
		String fCon = req.getParameter("fCon");
		String fNick = req.getParameter("fNick");
		String memId = req.getParameter("memId");
	
		IFreeService freeService = FreeServiceImpl.getInstance();
		
		fv.setfTitle(fTitle);
		fv.setfCon(fCon);
		fv.setfNick(fNick);
		fv.setMemId(memId);
		
		int cnt = freeService.registFree(fv);
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		System.out.println(msg);
		
		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/free/list.do");
	
		
	}

	
	
	
}
