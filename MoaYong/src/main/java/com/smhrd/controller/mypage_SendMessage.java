package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.MessageDAO;
import com.smhrd.dao.ProjectDAO;
import com.smhrd.entity.Message;
import com.smhrd.entity.Project;
import com.smhrd.entity.User;

public class mypage_SendMessage implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String t_id = user.getT_id();

		String SENDER_ID = user.getT_id();
		String RECEIVER_ID = request.getParameter("RECEIVER_ID");
		String MSG_CONTENT = request.getParameter("MSG_CONTENT");

		Message dto = new Message();
		dto.setSender_id(SENDER_ID);
		dto.setReceiver_id(RECEIVER_ID);
		dto.setMsg_content(MSG_CONTENT);

		System.out.println("Message dto에 담긴 내용 : " + dto.getSender_id());
		System.out.println("Message dto에 담긴 내용 : " + dto.getReceiver_id());
		System.out.println("Message dto에 담긴 내용 : " + dto.getMsg_content());

		MessageDAO dao = new MessageDAO();
		int row = dao.send(dto);
		String nextView = "";

		if (row == 1) {

			ProjectDAO dao2 = new ProjectDAO();

			List<Project> partinList = dao2.partin(t_id);
			request.setAttribute("partinList", partinList);

			List<Project> ingList = dao2.ing(t_id);
			request.setAttribute("ingList", ingList);

			List<Project> mytest = (List<Project>) request.getAttribute("ingList");
			List<Project> endList = dao2.end(t_id);
			request.setAttribute("endList", endList);
			List<Project> mytest2 = (List<Project>) request.getAttribute("endList");

			nextView = "mypage";

		} else {
			nextView = "sendmessage";
		}

		return nextView;
	}

}
