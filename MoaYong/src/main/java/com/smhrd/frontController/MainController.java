package com.smhrd.frontController;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.controller.mypage_goProfileUpdateCon;
import com.smhrd.controller.mypage_ProfileUpdate;
import com.smhrd.controller.ProjectManageCon;
import com.smhrd.controller.content_uploadReplyCon;
import com.smhrd.controller.controller;
import com.smhrd.controller.firstpage_GoFirstPageCon;
import com.smhrd.controller.firstpage_GoMainCon;
import com.smhrd.controller.firstpage_JoinCon;
import com.smhrd.controller.firstpage_LoginCon;
import com.smhrd.controller.firstpage_NoticePwCon;
import com.smhrd.controller.firstpage_SearchInfoCon;
import com.smhrd.controller.mainpage_GoListPageCon;
import com.smhrd.controller.mainpage_GoModifyPostCon;
import com.smhrd.controller.mainpage_GoMypageCon;
import com.smhrd.controller.mainpage_GoViewPostContent;
import com.smhrd.controller.mainpage_GoWritePostCon;
import com.smhrd.controller.mainpage_LogoutCon;
import com.smhrd.controller.mainpage_SaveModifiedPostCon;
import com.smhrd.controller.mainpage_SearchPost;
import com.smhrd.controller.mainpage_WritePostCon;
import com.smhrd.controller.mainpage_deletePostCon;
import com.smhrd.controller.party_joinPartyCon;
import com.smhrd.controller.reply_viewPostContent_afterReplyCon;

@WebServlet("*.do")
public class MainController extends HttpServlet {

	private HashMap<String, controller> mappings;

	public void init() throws ServletException {
		System.out.println("생성됨");

		mappings = new HashMap<String, controller>();

		// fistpage
		mappings.put("/goFirstpage.do", new firstpage_GoFirstPageCon()); // 첫 화면 가는거.
		mappings.put("/login.do", new firstpage_LoginCon()); // 로그인
		mappings.put("/join.do", new firstpage_JoinCon()); // 회원가입
		mappings.put("/searchInfo.do", new firstpage_SearchInfoCon()); // 비밀번호? 아이디 찾기 ?
		mappings.put("/noticePw.do", new firstpage_NoticePwCon());
		mappings.put("/goMain.do", new firstpage_GoMainCon()); // 로그인 누르면 메인으로 넘어감
		// mainpage_게시글 부분
		mappings.put("/goWritePost.do", new mainpage_GoWritePostCon()); // 글쓰기 클릭
		mappings.put("/writePost.do", new mainpage_WritePostCon()); // 글쓰기
		mappings.put("/searchPost.do", new mainpage_SearchPost()); // 게시글 검색
		mappings.put("/viewPostContent.do", new mainpage_GoViewPostContent()); // 클릭하면 게시글 내용 보이기
		mappings.put("/deletePost.do", new mainpage_deletePostCon());
		mappings.put("/goModifyPost.do", new mainpage_GoModifyPostCon()); // 게시글 수정 누르면 작동
		mappings.put("/savePost.do", new mainpage_SaveModifiedPostCon());
		mappings.put("/GoListPage.do", new mainpage_GoListPageCon());
		// mainpage_기타
		mappings.put("/goMypage.do", new mainpage_GoMypageCon()); // 마이페이지가기
		mappings.put("/logout.do", new mainpage_LogoutCon()); // 로그아웃
		mappings.put("/goPrj.do", new ProjectManageCon());
		// 마이페이지 내부 기능
		mappings.put("/goProfileUpdate.do", new mypage_goProfileUpdateCon());
		mappings.put("/ProfileUpdate.do", new mypage_ProfileUpdate());
		// 댓글기능
		mappings.put("/uploadReply.do", new content_uploadReplyCon());
		mappings.put("/afterReply.do", new reply_viewPostContent_afterReplyCon());
		// 참가기능
		mappings.put("/joinParty.do", new party_joinPartyCon());
	}

	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String cpath = request.getContextPath();

		String command = uri.substring(cpath.length());

		String nextView = null;
		controller con = null;
		con = mappings.get(command);

		if (con != null) {
			nextView = con.execute(request, response);

		}
		if (nextView != null) {
			if (nextView.contains("redirect:/")) {
				response.sendRedirect(nextView.split(":/")[1]);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/" + nextView + ".jsp");
				rd.forward(request, response);
			}
		}
	}

}