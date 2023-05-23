package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.BoardDAO;
import com.smhrd.dao.MessageDAO;
import com.smhrd.dao.ProjectDAO;
import com.smhrd.entity.Board;
import com.smhrd.entity.Message;
import com.smhrd.entity.Project;
import com.smhrd.entity.User;

public class mainpage_GoMypageCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String t_id = user.getT_id();
		
		if (user != null) {

			ProjectDAO dao = new ProjectDAO();

			List<Project> partinList = dao.partin(t_id);
			request.setAttribute("partinList", partinList);
			/*
			 * List<Project> mytest = (List<Project>)request.getAttribute("partinList");
			 * System.out.println(mytest.size() + "---------------------------");
			 */

			List<Project> ingList = dao.ing(t_id);
			request.setAttribute("ingList", ingList);

			List<Project> mytest = (List<Project>) request.getAttribute("ingList");
			System.out.println("ingList 테스트");
			System.out.println(mytest.size() + "---------------------------");

			List<Project> endList = dao.end(t_id);
			request.setAttribute("endList", endList);

			List<Project> mytest2 = (List<Project>) request.getAttribute("endList");
			System.out.println("endList 테스트");
			System.out.println(mytest2.size() + "=====================");

			System.out.println("Cex");

//			MessageList 불러오는 기능
			MessageDAO dao2 = new MessageDAO();
			
			Message dto2 = new Message();
			dto2.setReceiver_id(t_id);
			System.out.println("t_id값 : "+t_id);
			
			List<Message> MessageList = dao2.MessageList(dto2);
			
			System.out.println( "받아온 데이터 메시지 리스트 :" + MessageList);

			request.setAttribute("MessageList", MessageList);

			
		}
		/* request.setAttribute("test", "test"); */
		// 마이페이지 누르면 마이페이지로 넘어감
		return "mypage";
	}

}
