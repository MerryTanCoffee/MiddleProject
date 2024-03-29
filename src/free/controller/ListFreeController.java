package free.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import free.service.FreeServiceImpl;
import free.service.IFreeService;
import free.vo.FreeVO;
import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;


@WebServlet(value = "/free/list.do")
public class ListFreeController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int currentPage = 1; //현재 페이지
		currentPage = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
		
		//서비스객체 - 메소드연결 - list데이터 가져오기
		IFreeService freeService = FreeServiceImpl.getInstance();
		
		//전체 글 갯수 가져오기
		int countList = freeService.countFree(); //20

		//한 화면에 출력할 페이지 수
		int perPage = 5;
		
		//한 페이지에 출력할 글 갯수
		int perList = 5;
		
		
		//◆전체 페이지 수 = 전체 글 갯수 / 페이지 당 글 갯수
		//double형변환으로 정확한 값을 도출해야 함
		int totalPage = (int)Math.ceil((double)countList / (double)perList);  
		
		//◆페이지에 표시될 게시글 start~end범위 값
		int start = (currentPage - 1) * perList + 1; //1

		int end = start + perList - 1; //5
		if(end > countList) end = countList; //전체 글 갯수를 넘어서는 end값을 조절
		

		int startPage = ((currentPage - 1) / perPage * perPage) + 1; //1

		int endPage = startPage + totalPage - 1; //4
	
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", start);
		map.put("end", end);
		
		//start~end범위 값을 담은 map전달하기
		List<FreeVO> freeList = freeService.freeList(map);
		
		//=================board정보(리스트 읽어오기)가져오기 end
		
		//결과데이터 request에 담아서 페이지로 전달
		req.setAttribute("freeList", freeList);
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("cPage", currentPage);
		req.setAttribute("ttPage", totalPage);
		
		req.getRequestDispatcher("/f_boa/f_list.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 아이디 값 받아오는 세션
	   	
		HttpSession session = req.getSession();
		IMemberService service = MemberServiceImpl.getInstance();
		String memId = (String) session.getAttribute("loginCode");
		MemberVO mv = new MemberVO();
		mv = service.getMember(memId);
	   	
		
		
		doGet(req, resp);
	}
}
