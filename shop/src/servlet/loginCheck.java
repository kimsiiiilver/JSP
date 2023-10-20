package servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.MemberDAO;
import dto.MemberDTO;
public class loginCheck extends HttpServlet {
	
	MemberDAO dao;
	
	@Override
	public void init() throws ServletException {
		
		dao = new MemberDAO();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberDTO dto = dao.getMemberDTO(id, password);
		
		String memberName = dto.getName();
		if(memberName != null) {
			session.setAttribute("user_id", dto.getId());
			session.setAttribute("user_name", dto.getName());
			session.setAttribute("user_pw", dto.getPassword());
			request.setAttribute("result", memberName+"님 환영합니다");
		} else {
			request.setAttribute("result", "귀하는 회원이 아닙니다.");
		}
		
		request.getRequestDispatcher("/loginProcess2.jsp").forward(request, response);
		
	}
	
	@Override
	public void destroy() {
		
		dao.close();
		
	}

	

	

}
