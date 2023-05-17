package main.java.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class mainpage_SaveModifiedPostCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
//		HttpSession session = response.get
		String prj_name=request.getParameter("prj_name");
		String post = request.getParameter("post");
		String status = request.getParameter("status");
		String deadline_dt = request.getParameter("deadline_dt");
		String start_dt = request.getParameter("start_dt");
		String end_dt=request.getParameter("end_dt");
		int recruit_count = Integer.parseInt(request.getParameter("recruit_count"));
		
		
		return null;
	}

}
