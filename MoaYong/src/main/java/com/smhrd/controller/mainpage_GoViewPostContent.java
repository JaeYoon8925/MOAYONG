package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.BoardDAO;
import com.smhrd.dao.ReplyDAO;
import com.smhrd.entity.Board;
import com.smhrd.entity.Reply;
import com.smhrd.entity.User;

public class mainpage_GoViewPostContent implements controller {
// 게시글 클릭하면 해당 게시글 데이터 불러오기.
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String prjSeqStr = request.getParameter("prj_seq");
		
		int prj_seq = Integer.parseInt(request.getParameter("prj_seq"));
		
		
		
		Board dto = new Board();
		dto.setPrj_seq(prj_seq);
		
		BoardDAO dao = new BoardDAO();
		
		Board info = dao.viewPostContent(dto);
		        
        request.setAttribute("viewPostContent", info);
        
        HttpSession session= request.getSession();
        
		Reply dtoo = new Reply();
		dtoo.setPrj_seq(prj_seq);
		
		ReplyDAO daoo = new ReplyDAO();
		List<Reply> list =daoo.viewReplyList(dtoo);
		request.setAttribute("viewReply", list);
		
		
        return "viewPostContent"; // 게시글 보여주는 JSP 파일의 경로
        
        
	}

}
