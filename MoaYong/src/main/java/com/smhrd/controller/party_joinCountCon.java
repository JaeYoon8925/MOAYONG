package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.JoinPartyDAO;
import com.smhrd.entity.JoinParty;

public class party_joinCountCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int prj_seq = Integer.parseInt(request.getParameter("prj_seq"));
		String t_id = request.getParameter("t_id");
		String join_ok=request.getParameter("join_ok");
		
		System.out.println("count_join_ok prjseq : "+ prj_seq);
		System.out.println("count_join_ok tid :" + t_id);
		System.out.println("count join_ok :" + join_ok);
		
		JoinParty dto = new JoinParty();
		dto.setPrj_seq(prj_seq);
		dto.setT_id(t_id);
		dto.setJoin_ok(join_ok);
		
		System.out.println("DTO_prj_seq: " + dto.getPrj_seq());
		System.out.println("DTO_t_id: " + dto.getT_id());
		System.out.println("DTO_Join_ok : " + join_ok);
		
		JoinPartyDAO dao = new JoinPartyDAO();
		int row = dao.joinCount(dto);
		
		if(row>0) {
			System.out.println("joincount참가수락 반영됨");
		}else {
			System.out.println("joincount참가수락 반영안됨");
		}
		
		return null;
	}

}
