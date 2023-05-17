package main.java.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.dao.BoardDAO;
import main.java.entity.Board;

public class mainpage_deletePostCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int prj_seq = Integer.parseInt(request.getParameter("prj_seq"));
		
		Board dto = new Board();
		dto.setPrj_seq(prj_seq);
		BoardDAO dao = new BoardDAO();
//		int row = dao.deletePost(dto);
		
		String nextView = "redirect:/goMain.do";
		return nextView;
	}
	

}
