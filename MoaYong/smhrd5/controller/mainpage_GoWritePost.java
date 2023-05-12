package smhrd5.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import smhrd5.entity.User;

public class mainpage_GoWritePost implements Controller {
	// 글쓰기 버튼 누르면 글쓰기 화면으로 넘어감
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String nextView="redirect:/writePost.do";
		
		return nextView;
	}

}
