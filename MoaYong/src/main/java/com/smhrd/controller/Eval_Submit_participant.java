package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.JoinPartyDAO;
import com.smhrd.entity.JoinParty;

public class Eval_Submit_participant implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String t_id=request.getParameter("t_id");
		int p_seq = Integer.parseInt(request.getParameter("p_seq"));
		int prj_seq = Integer.parseInt(request.getParameter("prj_seq"));
		int prj_rating=Integer.parseInt(request.getParameter("prj_rating"));
		
		System.out.println(t_id);
		System.out.println(p_seq);
		System.out.println(prj_seq);
		System.out.println(prj_rating);
		
		JoinParty dto = new JoinParty();
		dto.setT_id(t_id);
		dto.setP_seq(p_seq);
		dto.setPrj_seq(prj_seq);
		dto.setPrj_rating(prj_rating);
		
		System.out.println("=== DTO 값 확인 ===");
		System.out.println("T_id: " + dto.getT_id());
		System.out.println("P_seq: " + dto.getP_seq());
		System.out.println("Prj_seq: " + dto.getPrj_seq());
		System.out.println("Prj_rating: " + dto.getPrj_rating());
		
		JoinPartyDAO dao = new JoinPartyDAO();
		int row =dao.eval_submit_participant(dto);
		
		if(row>0) {
			System.out.println("점수등록완료");
		}else {
			System.out.println("점수등록실패");
		}
		
		return null;
	}

}
