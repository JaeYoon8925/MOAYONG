<%@page import="com.smhrd.entity.Project"%>
<%@page import="java.util.List"%>
<%@ page import="com.smhrd.entity.User"%>
<!-- page import="main.java.entity.Board" -->
<!-- import="main.java.entity.캘린더 데이터 엔터티"%> -->
<!-- import="main.java.entity.쪽지테이블 엔터티"%> -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>

<html>

<head>
<title>Stellar by HTML5 UP</title>
<meta charset="utf-8" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- 캘린더 api -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js'></script>
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
<%
User user = (User) session.getAttribute("user");
System.out.println(user);
%>

<!-- 맨 위에 있는, 이동하는 네비게이션 -->
<nav id="nav">
	<ul>
		<li><a href="goMain.do">게시판</a></li>
		<li><a href="GomypagePrjList.do" class="active">프로젝트 리스트</a></li>
		<li><a href="goMypage.do">마이페이지</a></li>
		<%
		if (user != null) {
		%>
		<button type="submit" id="logout-btn">
			<a href="logout.do">로그아웃</a>
		</button>
		<span class="image"><img src="images/pic01.jpg" alt="" /></span>
		<%
		}
		%>
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
				<ul class="features"
					style="text-align: center; display: flex; flex-wrap: wrap; justify-content: center; align-items: flex-start; list-style: none; padding: 0;">
					<li style="margin: 10px; width: 300px;">
						<h3>참가신청 한 프로젝트</h3>
						<ul class="alt" style="height: 350px; overflow: auto; padding: 0;">
							<%
							List<Project> partinList = (List<Project>) request.getAttribute("partinList");
							%>
							<%
							for (Project vo : partinList) {
							%>
							<li style="margin-bottom: 10px;"><a
								href="viewPostContent.do?prj_seq=<%=vo.getPrj_seq()%>"><%=vo.getPrj_name()%></a></li>
							<%
							}
							%>
						</ul>
					</li>
					<li style="margin: 10px; width: 300px;">
						<h3>진행 중인 프로젝트</h3>
						<ul class="alt" style="height: 350px; overflow: auto; padding: 0;">
							<%
							List<Project> ingList = (List<Project>) request.getAttribute("ingList");
							%>
							<%
							for (Project vo : ingList) {
							%>
							<li style="margin-bottom: 10px;"><a
								href="GoPrjDetails.do?prj_seq=<%=vo.getPrj_seq()%>"><%=vo.getPrj_name()%></a>
							</li>
							<%
							}
							%>
						</ul>
					</li>
					<li style="margin: 10px; width: 300px;">
						<h3>모집 중인 프로젝트</h3>
						<ul class="alt" style="height: 350px; overflow: auto; padding: 0;">
							<%
							List<Project> recruitingList = (List<Project>) request.getAttribute("recruitingList");
							%>
							<%
							for (Project vo : recruitingList ) {
							%>
							<li style="margin-bottom: 10px;"><a
								href="GoPrjDetails.do?prj_seq=<%=vo.getPrj_seq()%>"><%=vo.getPrj_name()%></a>
							</li>
							<button
								onclick='location.href="joinList.do?prj_seq=<%=vo.getPrj_seq()%>"'>참가신청현황보기</button>

							<%
							}
							%>
						</ul>
					</li>

					<li style="margin: 10px; width: 300px;">
						<h3>완료된 프로젝트</h3>
						<ul class="alt" style="height: 350px; overflow: auto; padding: 0;">
							<%
							List<Project> endList = (List<Project>) request.getAttribute("endList");
							%>
							<%
							for (Project vo : endList) {
							%>
							<!-- 이것도 뷰포스트 말고 세부프로젝트 페이지로 이동가능하게끔? -->
							<li style="margin-bottom: 10px;"><a
								href="GoPrjDetails.do?prj_seq=<%=vo.getPrj_seq()%>"><%=vo.getPrj_name()%></a>
								<button
									onclick='location.href="eval_leader.do?prj_seq=<%=vo.getPrj_seq()%>"'>팀장평가</button>
								<button
									onclick='location.href="eval_participant.do?prj_seq=<%=vo.getPrj_seq()%>"'>팀원평가</button>
							</li>
							<%
							}
							%>
						</ul>
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