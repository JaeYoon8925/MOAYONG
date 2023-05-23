package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.JoinPartyDAO;
import com.smhrd.entity.JoinParty;

public class party_joinDisCountCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
		
		int prj_seq = Integer.parseInt(request.getParameter("prj_seq"));
		String t_id = request.getParameter("t_id");
		String join_ok=request.getParameter("join_ok");
		
		System.out.println("discount join_ok"+join_ok);
		JoinParty dto = new JoinParty();
		dto.setP_seq(prj_seq);
		dto.setT_id(t_id);
		dto.setJoin_ok(join_ok);
		
		JoinPartyDAO dao = new JoinPartyDAO();
		int row = dao.joinDisCount(dto);
		
		if(row>0) {
			System.out.println("참가거절count 반영됨");
		}else {
			System.out.println("참가거절count 반영안됨");
		}
		
		return null;
	}

}