package main.java.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.dao.UserDAO;
import main.java.entity.User;



public class firstpage_JoinCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id=request.getParameter("id");
		String pw = request.getParameter("pw");
		String nickname = request.getParameter("nickname");
		String person_type = request.getParameter("person_type");
		String email = request.getParameter("email");

		User dto= new User();
		dto.setId(id);
		dto.setPw(pw);
		dto.setNickname(nickname);
//		dto.setPerson_type(person_type);
		dto.setEmail(email);

		UserDAO dao= new UserDAO();
		int row = dao.join(dto);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String nextView=null;
		
		if(row>0) {
			nextView="firstPage"; // <- 가입 공시 띄워줄 jsp
			out.print("회원가입성공");
		}else {
			nextView="firstPage"; // <- 가입 실패시 띄워줄 회원가입창
			out.print("회원가입실패");
		}
		
		return nextView;
	}

}