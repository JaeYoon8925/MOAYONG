package smhrd5.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	// 추상메소드로 사용할 인터페이스
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException;

}
