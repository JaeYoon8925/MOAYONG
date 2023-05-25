<!-- 필요한 엔터티들 주석 풀면 될듯합니다 -->
<%@ page import="com.smhrd.entity.User"%>
<%@ page import="com.smhrd.entity.Board"%>
<!-- import="com.smhrd.entity.캘린더 데이터 엔터티"%> -->
<!-- import="com.smhrd.entity.쪽지테이블 엔터티"%> -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE HTML>
<!--
	Stellar by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
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
<script src="index.js"></script>
<!-- 프리셋 -->
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/main.css" />
</noscript>
</head>

<body class="is-preload">

	<!-- 유저정보 받아오기-->
	<%
	User user = (User) session.getAttribute("user");
	System.out.println(user);
	%>
	<!-- 맨 위에 있는, 이동하는 네비게이션 -->
	<nav id="nav">
		<ul>
			<li><a href="goMain.do">게시판</a></li>
			<li><a href="GomypagePrjList.do">프로젝트 리스트</a></li>
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

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header" style="padding-top: 6em;">
			<h1 style="margin-top: 40px; font-weight: 600">MOAYONG</h1>
			<p>세부 게시판</p>
		</header>



		<!-- 이동하지 않는 서브 네비  -->
		<nav id="nav">
			<ul>
				<!-- 각자 페이지로 이동하는 기능  -->
				<li><a
					href="GoPrjDetails.do?prj_seq=${viewPostContent.prj_seq}"
					class="active">세부임무</a></li>
				<li><a href="GoPrjGant.do?prj_seq=${viewPostContent.prj_seq}">간트차트</a></li>
				<li><a href="GoPrjOutput.do?prj_seq=${viewPostContent.prj_seq}">산출물</a></li>
				<li style="float: right;"><a
					href="viewPostContent.do?prj_seq=${viewPostContent.prj_seq}"><img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnxA7tm7xkKByRkkmlzNfZWvgfytkw-OYN_A&usqp=CAU"
						width=40px; height=40px></a></li>
			</ul>

		</nav>
		<!-- Main -->
		<div id="main">

			<!-- Content -->
			<section id="content" class="main">

				<!-- Content -->
				<section id="content" class="main">
					<div class="spotlight">
						<div class="content">

							<form method="post" action="#">
								<h3>${viewPostContent.prj_name}</h3>
								<br>
								<!-- 윗줄 시작-->
								<div class="row gtr-uniform" style="display: flex;">
									<div class="col-3 col-12-xsmall">
										프로젝트 시작일 : <input type="date" name="start_dt"
											value="${viewPostContentDt1}">
									</div>
									<br>
									<div class="col-3">
										인원모집 마감일 : <input type="date" name="deadline_dt"
											value="${viewPostContentDt3}">
									</div>
									<div class="col-3">
										프로젝트 종료일 : <input type="date" name="end_dt"
											value="${viewPostContentDt2}">
									</div>
									<div></div>

									<div class="col-5" style="display: flex;">
										<label for="join_count"
											style="padding: 0px 8px 0px 0px; width: 200px; padding: 10px 8px 0px 0px;">
											모집 완료인원 : </label> <input name="join_count" type="text"
											value="${viewPostContent.join_count}" readonly>
									</div>
									<div class="col-5" style="display: flex;">
										<label for="join_count"
											style="padding: 0px 8px 0px 0px; width: 200px; padding: 10px 8px 0px 0px;">
											목표 모집인원 : </label> <input name=recruit_count type="text"
											value="${viewPostContent.recruit_count}">
									</div>
									<div class="col-2" style="display: flex;">
										<label for="status"
											style="padding: 0px 8px 0px 0px; width: 150px; padding: 10px 8px 0px 0px;">상태
											:</label><select name="status" class="col-8" style="display: flex;">
											<option name="status" value="${viewPostContent.status}"
												selected disabled>${viewPostContent.status}</option>
											<option name="status" value="모집중" type="text">모집중</option>
											<option name="status" value="모집완료" type="text">모집완료</option>
											<option name="status" value="진행중" type="text">진행중</option>
											<option name="status" value="종료" type="text">종료</option>
										</select>
									</div>
								</div>
								<!-- 윗줄 끝 -->

								<!--  -->
								<br> <br>
								<div align="right">
									<button>지도첨부</button>
									<button style="margin-inline: 15px;">이미지첨부</button>
								</div>
								<br>
								<table style="margin-left: auto; margin-right: auto;">
									<td style="overflow-y: scroll;">${viewPostContent.post}</td>
								</table>
								<div align="right">
									<button align="right" style="float: right;">수정하기</button>
								</div>
							</form>
							<%
							Board viewPostContent = (Board) request.getAttribute("viewPostContent");
							String status = viewPostContent.getStatus();
							%>

							<%
							if (!status.equals("종료")) {
							%>
							<form method="post"
								action="PrjRaidEnd.do?prj_seq=${viewPostContent.prj_seq}">
								<button align="right" id="RaidEnd"
									style="margin-inline: 15px; float: right; background-color: red; opacity: 0.7; color: white !important;">
									레이드 종료</button>
							</form>
							<%
							}
							%>

							<!-- 폼 끝 -->


						</div>
					</div>
					<section></section>
				</section>


			</section>

		</div>

		<!-- Footer -->
		<footer id="footer">
			<section>
				<h2>Aliquam sed mauris</h2>
				<p>Sed lorem ipsum dolor sit amet et nullam consequat feugiat
					consequat magna adipiscing tempus etiam dolore veroeros. eget
					dapibus mauris. Cras aliquet, nisl ut viverra sollicitudin, ligula
					erat egestas velit, vitae tincidunt odio.</p>
				<ul class="actions">
					<li><a href="#" class="button">Learn More</a></li>
				</ul>
			</section>
			<section>
				<h2>Etiam feugiat</h2>
				<dl class="alt">
					<dt>Address</dt>
					<dd>1234 Somewhere Road &bull; Nashville, TN 00000 &bull; USA</dd>
					<dt>Phone</dt>
					<dd>(000) 000-0000 x 0000</dd>
					<dt>Email</dt>
					<dd>
						<a href="#">information@untitled.tld</a>
					</dd>
				</dl>
				<ul class="icons">
					<li><a href="#" class="icon brands fa-twitter alt"><span
							class="label">Twitter</span></a></li>
					<li><a href="#" class="icon brands fa-facebook-f alt"><span
							class="label">Facebook</span></a></li>
					<li><a href="#" class="icon brands fa-instagram alt"><span
							class="label">Instagram</span></a></li>
					<li><a href="#" class="icon brands fa-github alt"><span
							class="label">GitHub</span></a></li>
					<li><a href="#" class="icon brands fa-dribbble alt"><span
							class="label">Dribbble</span></a></li>
				</ul>
			</section>
			<p class="copyright">
				&copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.
			</p>
		</footer>

	</div>

	<!--  
		top_btn
		바로는 안보이고 아래로 어느정도 스크롤을 내려야 버튼이 표시됌 
	-->
	<div>
		<a href="#header" id="top_btn"><img src="/images/icon_to_top.png"
			title="위로 가기"></a>
	</div>


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