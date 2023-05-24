package com.smhrd.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.BoardDAO;
import com.smhrd.entity.Board;

public class mainNav_GoPrjGant implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 로그인정보 로드
		String prjSeqStr = request.getParameter("prj_seq");

		int prj_seq = Integer.parseInt(request.getParameter("prj_seq"));

		Board dto = new Board();
		dto.setPrj_seq(prj_seq);

		BoardDAO dao = new BoardDAO();

		Board info = dao.viewPostContent(dto);

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date start_dt_another = info.getStart_dt();
		String start_dt = dateFormat.format(start_dt_another);
		Date end_dt_another = info.getEnd_dt();
		String end_dt = dateFormat.format(end_dt_another);
		Date deadline_dt_another = info.getDeadline_dt();
		String deadline_dt = dateFormat.format(deadline_dt_another);

		request.setAttribute("viewPostContentDt1", start_dt);
		request.setAttribute("viewPostContentDt2", end_dt);
		request.setAttribute("viewPostContentDt3", deadline_dt);
		request.setAttribute("viewPostContent", info);

		request.setAttribute("viewPostContent", info);

		return "PrjGant";
	}

}
