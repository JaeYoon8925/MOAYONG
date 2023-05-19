package main.java.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.java.dao.UserDAO;
import main.java.entity.User;



public class firstpage_LoginCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String t_id = request.getParameter("t_id");
		String pw = request.getParameter("pw");
		User dto = new User();
		dto.setT_id(t_id);
		dto.setPw(pw);

		UserDAO dao = new UserDAO();
		User user = dao.login(dto);

		PrintWriter out = response.getWriter();
		String nextView=null;
		if (user != null) {
			HttpSession session=request.getSession();
			session.setAttribute("user", user);
			nextView="redirect:/goMain.do";
			System.out.println("로그인성공");
		} else {
			nextView="firstpage";
			System.out.println("로그인실패");
		}
		return nextView;
	}

}