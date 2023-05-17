package main.java.main;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.controller.firstpage_GoFirstPageCon;
import main.java.controller.firstpage_GoMainCon;
import main.java.controller.mainpage_LogoutCon;
import main.java.controller.mainpage_SaveModifiedPostCon;
import main.java.controller.GoFirstPageCon;
import main.java.controller.GoMainCon;
import main.java.controller.controller;
import main.java.controller.firstpage_JoinCon;
import main.java.controller.firstpage_LoginCon;
import main.java.controller.firstpage_SearchInfoCon;

import main.java.controller.firstpage_NoticePwCon;
import main.java.controller.mainpage_GoMypageCon;
import main.java.controller.mainpage_GoModifyPostCon;

import main.java.controller.mainpage_GoBoardCon;

import main.java.controller.mainpage_GoWritePostCon;
import main.java.controller.mainpage_ListBoardCon;
import main.java.controller.mainpage_SearchPost;
import main.java.controller.mainpage_ViewPostContent;
import main.java.controller.mainpage_WritePostCon;
import main.java.controller.mainpage_deletePostCon;




@WebServlet("*.do")
public class MainController extends HttpServlet {
	
	private HashMap<String, controller> mappings;
	public void init() throws ServletException{
		mappings = new HashMap<String, controller>();
		

		// fistpage
		mappings.put("/goFirstpage.do", new firstpage_GoFirstPageCon()); // 첫 화면 가는거. 
		mappings.put("/login.do", new firstpage_LoginCon()); // 로그인
		mappings.put("/join.do", new firstpage_JoinCon()); // 회원가입
		mappings.put("/searchInfo.do", new firstpage_SearchInfoCon()); // 비밀번호? 아이디 찾기 ?
		mappings.put("/noticePw.do", new firstpage_NoticePwCon());
		mappings.put("/goMain.do",new firstpage_GoMainCon()); // 로그인 누르면 메인으로 넘어감
		// mainpage_게시글 부분
		mappings.put("/goWritePost.do", new mainpage_GoWritePostCon()); // 글쓰기 클릭
		mappings.put("/writePost.do", new mainpage_WritePostCon()); // 글쓰기
		mappings.put("/searchPost.do", new mainpage_SearchPost()); // 게시글 검색
		mappings.put("/viewPostContent.do",new mainpage_ViewPostContent()); // 클릭하면 게시글 내용 보이기
		mappings.put("deletePost.do", new mainpage_deletePostCon());
		mappings.put("/goModifyPost.do", new mainpage_GoModifyPostCon()); // 게시글 수정 누르면 작동
		mappings.put("/savePost.do", new mainpage_SaveModifiedPostCon());
		// mainpage_기타
		mappings.put("/goMypage.do", new mainpage_GoMypageCon()); // 마이페이지가기
		mappings.put("/logout.do", new mainpage_LogoutCon()); // 로그아웃

		mappings.put("/login.do", new firstpage_LoginCon());
		mappings.put("/join.do", new firstpage_JoinCon());
		mappings.put("/goFirstpage.do", new GoFirstPageCon());
		mappings.put("/goMain.do",new GoMainCon());
		mappings.put("/searchInfo.do", new firstpage_SearchInfoCon());
		mappings.put("/goWritePost.do", new mainpage_GoWritePostCon());
		mappings.put("/writePost.do", new mainpage_WritePostCon());
		mappings.put("/ListBoard.do", new mainpage_ListBoardCon());
		mappings.put("/goMypage.do", new mainpage_GoBoardCon()); // GoMypageCon()으로
		// mappings.put("/goSetprofile.do", new goSetprofileCon ()); // 이거 필요할듯 함다.
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