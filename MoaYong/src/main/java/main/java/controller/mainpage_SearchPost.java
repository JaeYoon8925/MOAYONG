package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import entity.Board;

public class mainpage_SearchPost implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String prj_category = request.getParameter("prj_category");
		String prj_name = request.getParameter("prj_name");
		
		Board dto = new Board();
		dto.setPrj_category(prj_category);
		dto.setPrj_name("prj_name");
		
		BoardDAO dao = new BoardDAO();
		List<Board> searchPost = dao.searchPost(dto);
		
		return "listBoard";
	}

}
