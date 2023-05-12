package smhrd5.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import smhrd5.entity.Board;

public class mainpage_WritePost implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
//		values(prj_seq.nextval,id ?,#{prj_category},#{prj_name},#{post},#{status},#{deadline_dt},
//				#{start_dt},#{end_dt},#{recuruit_count),,sysdate)
		String prj_category = request.getParameter("prj_category");
		String prj_name = request.getParameter("prj_name");
		String post = request.getParameter("post");
		String deadline_dt=request.getParameter("deadline_dt");
		String start_dt = request.getParameter("start_dt");
		String end_dt = request.getParameter("end_dt");
		int recruit_count = Integer.parseInt(request.getParameter("recruit_count"));
		
		
		Board dto = new Board();
		dto.set
		
		
		
		
		
		return null;
	}

}
