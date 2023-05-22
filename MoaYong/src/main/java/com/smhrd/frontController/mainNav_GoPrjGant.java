package com.smhrd.frontController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.controller.controller;

public class mainNav_GoPrjGant implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 현재 내가 모든 프로젝트 진행 리스트로?
		
		
		return "PrjGant";
	}

}
