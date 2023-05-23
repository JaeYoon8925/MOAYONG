package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.BoardDAO;
import com.smhrd.dao.MessageDAO;
import com.smhrd.entity.Board;
import com.smhrd.entity.Message;
import com.smhrd.entity.User;

public class mypage_ViewMessage implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 메세지 정보
		int msg_seq = Integer.parseInt(request.getParameter("msg_seq"));

		Message dto = new Message();
		dto.setMsg_seq(msg_seq);
		
		MessageDAO dao = new MessageDAO();
		Message info = dao.viewmessage(dto);
		
		request.setAttribute("viewmessage", info);
		
		// 유저정보
		HttpSession session= request.getSession();
        User user = (User) session.getAttribute("user");
        
		session.setAttribute("user", user);
		
		
		
		
		return "viewmessage";
	}

}
