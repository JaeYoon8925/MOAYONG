package com.smhrd.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.BoardDAO;
import com.smhrd.entity.Board;
import com.smhrd.entity.User;

public class mainpage_GoModifyPostCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String prjSeqStr = request.getParameter("prj_seq");
		
		int prj_seq = Integer.parseInt(request.getParameter("prj_seq"));

		Board dto = new Board();
		dto.setPrj_seq(prj_seq);

		BoardDAO dao = new BoardDAO();

		Board info = dao.viewPostContent(dto);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String start_dt_another = info.getStart_dt();
		String start_dt = dateFormat.format(start_dt_another);
		String end_dt_another = info.getEnd_dt();
		String end_dt = dateFormat.format(end_dt_another);
		String deadline_dt_another = info.getDeadline_dt();
		String deadline_dt = dateFormat.format(deadline_dt_another);
		
		
		request.setAttribute("viewPostContentDt1", start_dt);
		request.setAttribute("viewPostContentDt2", end_dt);
		request.setAttribute("viewPostContentDt3", deadline_dt);
		request.setAttribute("viewPostContent", info);
		
		return "rewrite"; // 게시글 보여주는 JSP 파일의 경로

	}

}
