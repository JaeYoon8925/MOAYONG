package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.JoinPartyDAO;
import com.smhrd.entity.JoinParty;

public class party_joinPartyCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		int prj_seq = Integer.parseInt(request.getParameter("prj_seq"));
		String t_id = request.getParameter("t_id");
		
		JoinParty dto = new JoinParty();
		dto.setPrj_seq(prj_seq);
		dto.setT_id(t_id);
		
		JoinPartyDAO dao = new JoinPartyDAO();
		int row = dao.joinParty(dto);
		
		
		PrintWriter out = response.getWriter();
		if(row>0) {
			out.print("참가신청완료");
			System.out.print("참가신청됨");
		}else {
			out.print("참가신청안됨");
		}
		
		
		return null ;
	}

}
