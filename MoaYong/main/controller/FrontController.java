package main.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import smhrd5.controller.Controller;
import smhrd5.controller.GoMainCon;
import smhrd5.controller.fisrpage_JoinCon;
import smhrd5.controller.firstpage_LoginCon;
import smhrd5.controller.firstpage_SearchInfoCon;


@WebServlet("/.do")
public class FrontController extends HttpServlet {
	private HashMap<String, Controller> mappings;
	public void init() throws ServletException{
		mappings = new HashMap<String, Controller>();
		
		mappings.put("/login.do", new firstpage_LoginCon());
		mappings.put("/join.do", new fisrpage_JoinCon());
		mappings.put("/goMain.do",new GoMainCon());
		mappings.put("/searchInfo.do", new firstpage_SearchInfoCon());

		
	}
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		String cpath=request.getContextPath();
		
		String command = uri.substring(cpath.length());
		
		String nextView=null;
		Controller con=null;
		con= mappings.get(command);
		
		if(con!=null) {
			nextView=con.execute(request, response);
		
		}
		if(nextView!=null) {
			if(nextView.contains("redirect:/")) {
				response.sendRedirect(nextView.split(":/")[1]);
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/"+nextView+".jsp");
				rd.forward(request, response);
			}
		}
	}

}