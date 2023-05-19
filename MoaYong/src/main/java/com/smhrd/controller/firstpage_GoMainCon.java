package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.BoardDAO;
import com.smhrd.entity.Board;

public class firstpage_GoMainCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardDAO dao=new BoardDAO();
		List<Board> list = dao.list();
		request.setAttribute("list", list);
		
		return "main";// <- 메인화면 주소 적기(.jsp)
	}

}
