package main.java.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.dao.BoardDAO;
import main.java.entity.Board;



public class mainpage_ViewPostContent implements controller {
// 게시글 클릭하면 해당 게시글 데이터 불러오기.
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int post = Integer.parseInt(request.getParameter("viewPostContent"));
		
		BoardDAO dao = new BoardDAO();
		Board dto = dao.viewPostContent(post);
		
		request.setAttribute("viewPostContent", dto);
		
		
		return "viewPostContent"; //<= 게시글 보이는 jsp
	}

}
