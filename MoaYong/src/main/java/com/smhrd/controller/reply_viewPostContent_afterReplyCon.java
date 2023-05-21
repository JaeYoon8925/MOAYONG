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

public class reply_viewPostContent_afterReplyCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int prj_seq = (int) session.getAttribute("prj_seq");
		
		Board dto = new Board();
		dto.setPrj_seq(prj_seq);
		
		BoardDAO dao = new BoardDAO();
		Board info = dao.viewPostContent(dto);

		request.setAttribute("viewPostContent", info);
		
		HttpSession session_2= request.getSession();
		User user = (User) session_2.getAttribute("user");
		session.setAttribute("user", user);
		
		Reply dtoo = new Reply();
		dtoo.setPrj_seq(prj_seq);
		
		ReplyDAO daoo = new ReplyDAO();
		List<Reply> list =daoo.viewReplyList(dtoo);
		request.setAttribute("viewReply", list);
		
		return "viewPostContent";
	}

}
