package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import entity.User;

public class firstpage_LoginCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		User dto = new User();
		dto.setId(id);
		dto.setPw(pw);

		UserDAO dao = new UserDAO();
		User user = dao.login(dto);

		PrintWriter out = response.getWriter();
		String nextView=null;
		if (user != null) {
			HttpSession session=request.getSession();
			session.setAttribute("user", user);
			nextView="redirect:/goMain.do";
		} else {
			out.print("비밀번호 또는 아이디를 다시 확인하세요.");
		}
		return nextView;
	}

}