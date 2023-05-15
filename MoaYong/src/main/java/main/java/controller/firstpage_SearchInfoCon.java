package main.java.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.dao.UserDAO;
import main.java.entity.User;



public class firstpage_SearchInfoCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		
		UserDAO dao = new UserDAO();
		User check = dao.serchInfo(email);
		
		PrintWriter out = response.getWriter();
		
		String res="";
		
		if(check==null) {
			res="true";
		}else {
			res="false";
		}
		
		out.print(res);
		
		return null;
	}

}