package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.BoardDAO;
import com.smhrd.entity.Board;

public class mainpage_GoListPageCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.err.println(" 고리스트페이지컨 호출됌");
		
		
		// mainpage_GoListPageCon?pageNum=<%=i%> 의 i 값 받아서 리퀘스트에 set 하기.
		String pageNumString = request.getParameter("pageNum");
		int pageNum = Integer.parseInt(pageNumString);
		
		System.out.println("페이지넘 값 = "+pageNum);
		
		Board dto = new Board();
		dto.setPrj_seq(pageNum);
		
		
		BoardDAO dao=new BoardDAO();
		List<Board> ListPage = dao.ListPage(dto);
		request.setAttribute("list", ListPage);
		
		return "main";// <- 메인화면 주소 적기(.jsp)
		
	
	}

}
