package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.ProjectDAO;
import com.smhrd.entity.Project;
import com.smhrd.entity.User;

public class ProjectManageCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		if (user != null) {
			String t_id = user.getT_id();

			ProjectDAO dao = new ProjectDAO();
			List<Project> partinList = dao.partin(t_id);

			request.setAttribute("partinList", partinList);
			List<Project> ingList = dao.ing(t_id);
			
			request.setAttribute("ingList", ingList);
			List<Project> endList = dao.end(t_id);
			
			request.setAttribute("partinList", endList);
			System.out.println("Cex");

		}
		
		return "prj";
	}
}
