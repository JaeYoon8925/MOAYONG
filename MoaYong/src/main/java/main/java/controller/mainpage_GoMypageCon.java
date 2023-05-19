package main.java.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.java.dao.UserDAO;
import main.java.entity.User;

public class mainpage_GoMypageCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	
		// 원래코드
		// User user = dao.login(dto);
		
		// 테스트 데이터 생성
		User user = new User();
		user.setId("test");
		user.setEmail("joat@naver.com");
		user.setNickname("좆");
		user.setSelf_intro("좆같다");
		
		HttpSession session=request.getSession();
		session.setAttribute("user", user);
		
		
		// 마이페이지 누르면 마이페이지로 넘어감
		return "mypage";
	}

}
