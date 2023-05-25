package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.BoardDAO;
import com.smhrd.dao.ProjectDAO;
import com.smhrd.entity.Board;
import com.smhrd.entity.Project;
import com.smhrd.entity.User;
import com.smhrd.entity.Board;

public class prj_PrjRaidEndCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("user");

		String t_id = user.getT_id();

		ProjectDAO dao = new ProjectDAO();

		System.out.println("리퀘프젝시퀀스:" + request.getParameter("prj_seq"));
		int prj_seq = Integer.parseInt(request.getParameter("prj_seq"));
		System.out.println("프로젝트 엔드" + prj_seq);

		int endUp = dao.raidEnd(prj_seq);

		if (endUp > 0) {
			System.out.println("레이드 종료 완료");

			List<Project> partinList = dao.partin(t_id);
			request.setAttribute("partinList", partinList);

			List<Project> ingList = dao.ing(t_id);
			request.setAttribute("ingList", ingList);

			List<Project> endList = dao.end(t_id);
			request.setAttribute("endList", endList);

			List<Project> recruiting = dao.recruiting(t_id);
			request.setAttribute("recruitingList", recruiting);
		}

		return "mypagePrjList";
	}

}
