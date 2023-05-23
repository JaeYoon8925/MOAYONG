package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.EvaluationDAO;
import com.smhrd.entity.Evaluation;
import com.smhrd.entity.Project;
import com.smhrd.entity.User;

public class Eval_leaderCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int prj_seq = Integer.parseInt(request.getParameter("prj_seq"));
		
		EvaluationDAO dao = new EvaluationDAO();
		Project view_leader =dao.view_leader(prj_seq);
		System.out.println(view_leader.getPrj_seq());
				
		
		request.setAttribute("view_leader", view_leader);
		
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("user");
		session.setAttribute("user", user);
		
		
		return "eval_leader";
	}

}
