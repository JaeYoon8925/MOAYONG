package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.MessageDAO;
import com.smhrd.entity.Board;
import com.smhrd.entity.Message;

public class mypage_goViewMessage implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String prjSeqStr = request.getParameter("msg_seq");
		
		int msg_seq = Integer.parseInt(request.getParameter("msg_seq"));
		
		Message dto = new Message();
		dto.setMsg_seq(msg_seq);
		
		MessageDAO dao = new MessageDAO();
		Message row = dao.viewmessage(dto);
		
		
		
		
		return "viewmessage";
	}

}
