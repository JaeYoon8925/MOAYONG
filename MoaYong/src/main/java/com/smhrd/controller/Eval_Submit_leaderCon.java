package com.smhrd.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.EvaluationDAO;
import com.smhrd.entity.Evaluation;

public class Eval_Submit_leaderCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int ev_rating = Integer.parseInt(request.getParameter("ev_rating"));
		String t_id = request.getParameter("t_id");
		int prj_seq = Integer.parseInt(request.getParameter("prj_seq"));
		String leader_id=request.getParameter("leader_id");
		
		Evaluation dto = new Evaluation();
		dto.setEv_rating(ev_rating);
		dto.setT_id(t_id);
		dto.setPrj_seq(prj_seq);
		dto.setLeader_id(leader_id);
		
		System.out.println("dto data"+dto);
		
		EvaluationDAO dao = new EvaluationDAO();
		int row = dao.submit_eval_leader(dto);
		
		if(row>0) {
			System.out.println("팀장평가 제출완료");
		}else {
			System.out.println("팀장평가 안됨");
		}
		
		return null;
	}

}
