package com.smhrd.frontController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.controller.controller;
import com.smhrd.dao.ProjectDAO;
import com.smhrd.entity.Project;
import com.smhrd.entity.User;

public class mainNav_GoMypagePrjList implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("user");
		
		String t_id = user.getT_id();
		
		ProjectDAO dao=new ProjectDAO();
		
		List<Project> partinList = dao.partin(t_id);
		request.setAttribute("partinList", partinList);
		/*
		 * List<Project> mytest = (List<Project>)request.getAttribute("partinList");
		 * System.out.println(mytest.size() + "---------------------------");
		 */

		List<Project> ingList = dao.ing(t_id);
		request.setAttribute("ingList", ingList);
		
		
		List<Project> mytest = (List<Project>)request.getAttribute("ingList");
		System.out.println("ingList 테스트");
		System.out.println(mytest.size() + "---------------------------");
		
		
		List<Project> endList = dao.end(t_id);
		request.setAttribute("endList", endList);
		
		List<Project> mytest2 = (List<Project>)request.getAttribute("endList");
		System.out.println("endList 테스트");
		System.out.println(mytest2.size()+ "=====================");
		
		System.out.println("Cex");
		
		return "mypagePrjList";
	}

}
