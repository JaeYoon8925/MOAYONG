package smhrd5.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoMainCon implements Controller {
	// 로그인 화면에서 로그인 누르면 메인화면으로 감
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return "firstPage";// <- 메인화면 주소 적기(.jsp)
	}

}
