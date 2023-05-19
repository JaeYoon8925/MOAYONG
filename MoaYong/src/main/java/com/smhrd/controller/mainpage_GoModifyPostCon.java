package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.BoardDAO;
import com.smhrd.entity.Board;

public class mainpage_GoModifyPostCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int prj_seq = Integer.parseInt(request.getParameter("prj_seq"));
		String prj_name = request.getParameter("prj_name");
		int recruit_count=Integer.parseInt(request.getParameter("recruit_count"));
		String post = request.getParameter("post");
		
		request.setAttribute("prj_name", prj_name);
		request.setAttribute("prj_seq", prj_seq);
		request.setAttribute("recruit_count", recruit_count);
		request.setAttribute("post", post);
		return "rewrite"; // <-수정화면으로 이동
	}

}
