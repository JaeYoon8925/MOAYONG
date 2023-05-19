package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.UserDAO;
import com.smhrd.entity.User;



public class firstpage_SearchInfoCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String t_id = request.getParameter("t_id");
		String email = request.getParameter("email");
		
		User dto = new User();
		dto.setT_id(t_id);
		dto.setEmail(email);
		System.out.println(t_id);
		System.out.println(email);
		UserDAO dao = new UserDAO();
		User user = dao.searchInfo(dto);
		
		PrintWriter out = response.getWriter();
		
		String res="";
		if(user!=null) {
			res="있음";
			System.out.println("아이디 이메일 찾음");
		}else {
			res="없음";
			System.out.println("아이디 이메일 못찾음");
		}
		
	
		
		
		return "firstpage";
	}

}