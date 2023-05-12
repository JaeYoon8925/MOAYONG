package smhrd5.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import smhrd5.dao.UserDAO;
import smhrd5.entity.User;

public class firstpage_LoginCon implements Controller {
	//로그인 정보 확인 후 메인페이지로 넘겨줌
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

		if (user != null) {
			HttpSession session=request.getSession();
			session.setAttribute("user", user);
		} else {

		}
		String nextView="redirect:/goMain.do";
		
		return nextView;
	}

}
