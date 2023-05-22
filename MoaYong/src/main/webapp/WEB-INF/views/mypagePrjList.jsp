<%@page import="com.smhrd.entity.Project"%>
<%@page import="java.util.List"%>
<%@ page import="com.smhrd.entity.User" %>
	<!-- page import="main.java.entity.Board" -->
	<!-- import="main.java.entity.캘린더 데이터 엔터티"%> -->
	<!-- import="main.java.entity.쪽지테이블 엔터티"%> -->
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

		<!DOCTYPE HTML>

		<html>

		<head>
			<title>Stellar by HTML5 UP</title>
			<meta charset="utf-8" />
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
			<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
			<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
			<meta name="viewport"
				content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
			<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
			<!-- 캘린더 api -->
			<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js'></script>
			<!-- ajax 비동기 통신에 필요-->
			<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
			<!-- js파일 경로-->
			<script src="assets/js/calendar.js"></script>
			<!-- 프리셋 -->
			<link rel="stylesheet" href="assets/css/main.css" />
			<noscript>
				<link rel="stylesheet" href="assets/css/noscript.css" />
			</noscript>
		</head>

		<style>
		</style>
		<% User user=(User) session.getAttribute("user"); System.out.println(user); %>


			<nav id="nav">
				<ul>
					<!-- <div class="logo"><img src="/images/pic01.jpg" alt="" /></div> -->
					<li><a href="goMain.do" class="active">게시판</a></li>

					<!-- 프로젝트페이지의 gant.jsp로-->
					<li><a href="GoPrjGant.do">프로젝트 관리</a></li>

					<!-- 로그인한 계정의 마이페이지로 이동이 되어야함. -->
					<li><a href="goMypage.do">마이페이지</a></li>

					<% if (user !=null) { %>
						<button type="submit" id="logout-btn">
							<a href="logout.do">로그아웃</a>
						</button>
						<!-- 원래는 개인별 db에 저장된 이미지의 경로로 개인의 프로필 사진을 불러와야하지만 일단 이미지 절대경로로 로드-->
						<span class="image"><img src="images/pic01.jpg" alt="" /></span>
						<% } %>

				</ul>
			</nav>


			<!-- <button type="submit" id="mypage-btn">마이페이지</button> -->
			<!-- 일단 로그인 한 계정의 닉네임 출력 -->
			<h2>
				<%=user.getNickname()%>
			</h2>


			<body class="is-preload">



				<!-- Wrapper -->
				<div id="wrapper">
			
					<!-- Main -->
					<div id="main">

						<!-- 프로젝트 리스트 -->
						<section id="first" class="main special">
							<header class="major">
								<h2>Project</h2>
							</header>
							<ul class="features">
								<li><span stlye="width:196px height:196px "></span>
									<h3>참가신청 한 프로젝트</h3>
							
									<ul class="alt" style="height: 300px; overflow: auto">
										<% List<Project> partinList = (List<Project>)request.getAttribute("partinList"); %>
										<!-- ${vo.prj_seq}가 현재 null 값이 나옴 -->
										<%for(Project vo : partinList){ %>
										<li><a href="viewPostContent.do?prj_seq=<%=vo.getPrj_seq()%>"><%=vo.getPrj_name()%></a></li>
										<%} %>
									</ul>
								
								<li><span stlye="width:196px height:196px "></span>
									<h3>진행 중인 프로젝트</h3>
									<ul class="alt" style="height: 300px; overflow: auto">
										<% List<Project> ingList = (List<Project>)request.getAttribute("ingList");%>
										<%for(Project vo : ingList){ %>
										<!-- 뷰포스트 말고 세부프로젝트 페이지로 이동가능하게끔 -->
										<li><a href="viewPostContent.do?prj_seq=${vo.prj_seq}"><%=vo.getPrj_name() %></a></li>
										<button onclick='location.href="joinList.do?prj_seq=<%=vo.getPrj_seq() %>"'>참가신청현황보기</button>
										<%} %>
										
									</ul> <!-- 이 사람의 진행 중 프로젝트 리스트 전부 보기 -->
								</li>
								<li><span stlye="width:196px height:196px "></span>
									<h3>완료된 프로젝트</h3>
								
									<ul class="alt" style="height: 300px; overflow: auto">
										<% List<Project> endList = (List<Project>)request.getAttribute("endList");%>
										<%for(Project vo : endList){ %>
										<!-- 이것도 뷰포스트 말고 세부프로젝트 페이지로 이동가능하게끔? -->
										<li><a href="viewPostContent.do?prj_seq=<%=vo.getPrj_seq()%>"><%=vo.getPrj_name() %></a></li>
										<%} %>
									</ul> <!-- 이 사람의 완료 프로젝트 리스트 전부 보기 -->
								</li>
							</ul>

						</section>


				<!-- Scripts -->
				<script src="assets/js/jquery.min.js"></script>
				<script src="assets/js/jquery.scrollex.min.js"></script>
				<script src="assets/js/jquery.scrolly.min.js"></script>
				<script src="assets/js/browser.min.js"></script>
				<script src="assets/js/breakpoints.min.js"></script>
				<script src="assets/js/util.js"></script>
				<script src="assets/js/main.js"></script>
			</body>

		</html>