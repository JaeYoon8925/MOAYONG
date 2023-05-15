package main;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.GoFirstPageCon;
import controller.GoMainCon;
import controller.controller;
import controller.firstpage_JoinCon;
import controller.firstpage_LoginCon;
import controller.firstpage_SearchInfoCon;
import controller.mainpage_GoMypageCon;
import controller.mainpage_GoWritePostCon;
import controller.mainpage_ListBoardCon;
import controller.mainpage_SearchPost;
import controller.mainpage_ViewPostContent;
import controller.mainpage_WritePostCon;


@WebServlet("/.do")
public class MainController extends HttpServlet {
	
	private HashMap<String, controller> mappings;
	public void init() throws ServletException{
		mappings = new HashMap<String, controller>();
		
		mappings.put("/login.do", new firstpage_LoginCon());
		mappings.put("/join.do", new firstpage_JoinCon());
		mappings.put("/goFirstpage.do", new GoFirstPageCon());
		mappings.put("/goMain.do",new GoMainCon());
		mappings.put("/searchInfo.do", new firstpage_SearchInfoCon());
		mappings.put("/goWritePost.do", new mainpage_GoWritePostCon());
		mappings.put("/writePost.do", new mainpage_WritePostCon());
		mappings.put("/ListBoard.do", new mainpage_ListBoardCon());
		mappings.put("/goMypage.do", new mainpage_GoMypageCon());
		mappings.put("/searchPost.do", new mainpage_SearchPost());
		mappings.put("/viewPostContent.do",new mainpage_ViewPostContent());

		
	}
	
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		String cpath=request.getContextPath();
		
		String command = uri.substring(cpath.length());
		
		String nextView=null;
		controller con=null;
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