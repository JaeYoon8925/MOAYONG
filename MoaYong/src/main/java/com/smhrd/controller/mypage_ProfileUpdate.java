package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.MessageDAO;
import com.smhrd.dao.ProjectDAO;
import com.smhrd.dao.UserDAO;
import com.smhrd.entity.Message;
import com.smhrd.entity.Project;
import com.smhrd.entity.User;

public class mypage_ProfileUpdate implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 데이터 수집
		request.setCharacterEncoding("UTF-8");

		String pw = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		String self_intro = request.getParameter("self_intro");

		// +) session으로부터 email 값 꺼내오기.
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String t_id = user.getT_id();

		User dto = new User();
		dto.setT_id(t_id);
		dto.setPw(pw);
		dto.setNickname(nickname);
		dto.setSelf_intro(self_intro);

		// 2. 기능구현
		UserDAO dao = new UserDAO();
		int row = dao.profileUpdate(dto);

		// 3. VIEW 선택
		String nextView = "";
		if (row > 0) {
			System.out.println("업데이트 성공");
			nextView = "mypage";

			ProjectDAO dao2 = new ProjectDAO();

			List<Project> partinList = dao2.partin(t_id);
			request.setAttribute("partinList", partinList);

			List<Project> ingList = dao2.ing(t_id);
			request.setAttribute("ingList", ingList);

			List<Project> mytest = (List<Project>) request.getAttribute("ingList");
			List<Project> endList = dao2.end(t_id);
			request.setAttribute("endList", endList);
			List<Project> mytest2 = (List<Project>) request.getAttribute("endList");

			// session에 저장된 데이터 업데이트
			session.setAttribute("user", dto);
		} else {
			nextView = "goProfileUpdate";
			System.out.println("업데이트 실패");
		}

//		MessageList 불러오는 기능
		MessageDAO dao2 = new MessageDAO();

		Message dto2 = new Message();
		dto2.setReceiver_id(t_id);
		System.out.println("t_id값 : " + t_id);

		List<Message> MessageList = dao2.MessageList(dto2);

		System.out.println("받아온 데이터 메시지 리스트 :" + MessageList);

		request.setAttribute("MessageList", MessageList);

		return nextView;

	}

}
