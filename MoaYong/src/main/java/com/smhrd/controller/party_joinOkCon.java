package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.JoinPartyDAO;
import com.smhrd.entity.JoinParty;

public class party_joinOkCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int p_seq = Integer.parseInt(request.getParameter("p_seq"));
		int prj_seq = Integer.parseInt(request.getParameter("prj_seq"));
		String t_id = request.getParameter("t_id");
		
		JoinParty dto = new JoinParty();
		dto.setP_seq(p_seq);
		dto.setPrj_seq(prj_seq);
		dto.setT_id(t_id);
		
		JoinPartyDAO dao = new JoinPartyDAO();
		int row = dao.joinOk(dto);
		
		return null;
	}

}
