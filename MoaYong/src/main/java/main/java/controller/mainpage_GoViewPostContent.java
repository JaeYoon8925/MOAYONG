package main.java.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.dao.BoardDAO;
import main.java.entity.Board;

public class mainpage_GoViewPostContent implements controller {
// 게시글 클릭하면 해당 게시글 데이터 불러오기.
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int prj_seq = Integer.parseInt(request.getParameter("prj_seq"));
		
		Board dto = new Board();
		dto.setPrj_seq(prj_seq);
		
		BoardDAO dao = new BoardDAO();
		
		Board info = dao.viewPostContent(dto);
		        
        request.setAttribute("viewPostContent", info);
        return "viewPostContent"; // 게시글 보여주는 JSP 파일의 경로
        
        
	}

}
