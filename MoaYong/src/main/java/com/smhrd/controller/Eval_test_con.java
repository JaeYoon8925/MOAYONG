package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.JoinPartyDAO;
import com.smhrd.entity.JoinParty;

public class Eval_test_con implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int prj_seq = Integer.parseInt(request.getParameter("prj_seq"));

		JoinParty dto = new JoinParty();
		dto.setPrj_seq(prj_seq);

		JoinPartyDAO dao = new JoinPartyDAO();
		List<JoinParty> joinList = dao.joinList(dto);
		request.setAttribute("joinList", joinList);

		if (!joinList.isEmpty()) {
			JoinParty firstJoinParty = joinList.get(0);
			String firstJoinOk = firstJoinParty.getJoin_ok();
			System.out.println("First join_ok: " + firstJoinOk);
		} else {
			System.out.println("joinList is empty.");
		}
		return "eval_participant";
	}

}