package main.java.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.java.dao.BoardDAO;
import main.java.entity.Board;
import main.java.entity.User;


public class mainpage_WritePostCon implements controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
//		values(prj_seq.nextval,id ?,#{prj_category},#{prj_name},#{post},#{status},#{deadline_dt},
//				#{start_dt},#{end_dt},#{recuruit_count),join_count,post_dt(sysdate))
		String prj_category = request.getParameter("prj_category");
		String prj_name = request.getParameter("prj_name");
		String post = request.getParameter("post");
		String status = request.getParameter("status");
		String deadline_dt=request.getParameter("deadline_dt");
		String start_dt = request.getParameter("start_dt");
		String end_dt = request.getParameter("end_dt");
		int recruit_count = Integer.parseInt(request.getParameter("recruit_count"));
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		Board dto = new Board();
		dto.setPrj_category(prj_category);
		dto.setId(user.getNickname());
		dto.setPrj_name(prj_name);
		dto.setPost(post);
		dto.setStatus(status);
		dto.setDeadlind_dt(deadline_dt);
		dto.setStart_dt(start_dt);
		dto.setEnd_dt(end_dt);
		dto.setRecruit_count(recruit_count);
		
		BoardDAO dao = new BoardDAO();
		
		dao.write(dto);
		
		return "redirect:/mainpage.do";
	}

}
