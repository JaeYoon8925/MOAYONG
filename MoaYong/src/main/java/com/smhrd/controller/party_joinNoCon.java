package com.smhrd.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.JoinPartyDAO;
import com.smhrd.entity.JoinParty;

public class party_joinNoCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int p_seq = Integer.parseInt(request.getParameter("p_seq"));
		int prj_seq = Integer.parseInt(request.getParameter("prj_seq"));
		String t_id = request.getParameter("t_id");
		
		System.out.println("참가거절 t_id: "+t_id);
		System.out.println("참가거절 prj_seq : "+prj_seq);
		System.out.println("참가거절 p_seq : "+p_seq);
		
		JoinParty dto = new JoinParty();
		dto.setP_seq(p_seq);
		dto.setPrj_seq(prj_seq);
		dto.setT_id(t_id);
		
		JoinPartyDAO dao = new JoinPartyDAO();
		int row = dao.joinNo(dto);
		
		if(row>0) {
			System.out.println("참가NO 반영됨");			
		}else {
			System.out.println("참가NO 반영안됨");	
		}
		return null;
	}

}
