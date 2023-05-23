package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.BoardDAO;
import com.smhrd.entity.Board;

public class mainpage_SaveModifiedPostCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		int prj_seq = Integer.parseInt(request.getParameter("prj_seq"));
		String prj_category = request.getParameter("prj_category");
		String prj_name=request.getParameter("prj_name");
		String post = request.getParameter("post");
		String status = request.getParameter("status");
		
		Date deadline_dt;
		try {
		    deadline_dt = dateFormat.parse(request.getParameter("deadline_dt"));
		} catch (ParseException e) {
		    e.printStackTrace();
		    deadline_dt = new Date();
		}
		Date start_dt;
		try {
		    start_dt = dateFormat.parse(request.getParameter("start_dt"));
		} catch (ParseException e) {
		    e.printStackTrace();
		    start_dt = new Date();
		}
		Date end_dt;
		try {
		    end_dt = dateFormat.parse(request.getParameter("end_dt"));
		} catch (ParseException e) {
		    e.printStackTrace();
		    end_dt = new Date(); 
		}
		int recruit_count = Integer.parseInt(request.getParameter("recruit_count"));
		
		Board dto = new Board();
		dto.setPrj_seq(prj_seq);
		dto.setPrj_category(prj_category);
		dto.setPrj_name(prj_name);
		dto.setPost(post);
		dto.setStatus(status);
		dto.setDeadline_dt(deadline_dt);
		dto.setStart_dt(start_dt);
		dto.setEnd_dt(end_dt);
		dto.setRecruit_count(recruit_count);
		
		BoardDAO dao = new BoardDAO();
		int row = dao.updatePost(dto);
		
		String nextView=null;
		if(row>0) {
			nextView="redirect:/goMain.do";
		}else {
			nextView="화면유지";
		}
		
		return nextView;
	}

}
