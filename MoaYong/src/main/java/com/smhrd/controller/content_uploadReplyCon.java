package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.ReplyDAO;
import com.smhrd.entity.Reply;

public class content_uploadReplyCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String t_id = request.getParameter("t_id");
		String reply_comment = request.getParameter("reply_comment");
		int prj_seq = Integer.parseInt(request.getParameter("prj_seq"));

		Reply dto = new Reply();
		dto.setT_id(t_id);
		dto.setPrj_seq(prj_seq);
		dto.setReply_comment(reply_comment);

		ReplyDAO dao = new ReplyDAO();
		int row = dao.uploadReply(dto);
		System.out.println("담김");
		
		request.getSession().setAttribute("prj_seq", prj_seq);
		return "redirect:/afterReply.do";
		

	}

}
