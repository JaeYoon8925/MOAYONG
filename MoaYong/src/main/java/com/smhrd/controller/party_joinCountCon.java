package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class party_joinCountCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int prj_seq = Integer.parseInt(request.getParameter("prj_seq"));
		String t_id = request.getParameter("t_id");
		
		
		return null;
	}

}
