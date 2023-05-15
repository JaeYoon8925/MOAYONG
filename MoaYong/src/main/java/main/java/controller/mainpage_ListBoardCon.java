package main.java.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.java.dao.BoardDAO;
import main.java.entity.Board;





public class mainpage_ListBoardCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		List<Board> list = dao.list();
		HttpSession session = request.getSession();
		request.setAttribute("list", list);
		return "listBoard";
	}

}
