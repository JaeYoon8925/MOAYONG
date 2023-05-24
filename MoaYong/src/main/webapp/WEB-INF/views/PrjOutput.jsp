<!-- 필요한 엔터티들 주석 풀면 될듯합니다 -->
<%@ page import="com.smhrd.entity.User"%>
<%@page import="com.smhrd.entity.Project"%>
<%@page import="java.util.List"%>
<!-- page import="com.smhrd.entity.Board" -->
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
<style>
/* 게시판 컨테이너 */
.spotlight {
	background-color: #f5f5f5;
	padding: 20px;
	border-radius: 5px;
}

/* 게시판 내용 */
.spotlight .content {
	margin-bottom: 20px;
}

/* 게시판 제목 */
.spotlight h2 {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 10px;
}

/* 테이블 스타일 */
.spotlight table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 10px;
}

.spotlight table th, .spotlight table td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

.spotlight table th {
	font-weight: bold;
}

/* 게시판 링크 */
.spotlight table td a {
	color: #337ab7;
	text-decoration: none;
}

.spotlight table td a:hover {
	text-decoration: underline;
}

/* 단두대 라디오 버튼 */
.spotlight p {
	margin-bottom: 10px;
}

.spotlight input[type="radio"] {
	margin-right: 5px;
}

/* 업로드 버튼 */
.spotlight button {
	padding: 10px 20px;
	background-color: #337ab7;
	color: #fff;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

.spotlight button:hover {
	background-color: #23527c;
}
</style>

<head>

<title>프로젝트 상세 - 간트 페이지</title>


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

<body class="is-preload">
	<%
	List<Project> partinList = (List<Project>) request.getAttribute("partinList");
	%>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header" style="padding-top: 6em;">
			<h1 style="margin-top: 40px; font-weight: 800">MOAYONG</h1>
		</header>


		<!-- 이동하지 않는 서브 네비  -->
		<nav id="nav">
			<ul>
				<!-- 각자 페이지로 이동하는 기능  -->
				<li><a
					href="GoPrjDetails.do?prj_seq=${viewPostContent.prj_seq}"
					>세부임무</a></li>
				<li><a href="GoPrjGant.do?prj_seq=${viewPostContent.prj_seq}">간트차트</a></li>
				<li><a href="GoPrjOutput.do?prj_seq=${viewPostContent.prj_seq}" class="active" >산출물</a></li>
				<li style="float: right;"><a href="viewPostContent.do?prj_seq=${viewPostContent.prj_seq}"><img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnxA7tm7xkKByRkkmlzNfZWvgfytkw-OYN_A&usqp=CAU"
						width=40px; height=40px></a></li>
			</ul>

		</nav>

		<!-- Main -->
		<div id="main">

			<!-- Content -->
			<section id="content" class="main">

				<body>


					<form action="">
						<div class="spotlight">
							<div class="content">
								<h2>산출물</h2>

								<table>
									<thead>
										<tr>
											<th>No.</th>
											<th>산출물</th>
											<th>게시자</th>
											<th>단두대</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td><a href="/posts/1">첫 번째 게시물</a></td>
											<td>작성자1</td>
											<td><input type="radio" name="scaffold" value="approve">승인
												<input type="radio" name="scaffold" value="reject">거절<br>
											</td>
										</tr>
									</tbody>
								</table>

								<div style="text-align: right;">
									<button id="regibtn">업로드하기</button>
								</div>
							</div>
					</form>






					<script>
											
											var registerbtn = document.getElementById("regibtn");
													registerbtn.addEventListener('click', () => {
														alert("업로드 완료")
													})
											
												</script>

				</body>
		</div>


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

	<script>
						document.getElementById("evaluateLink").addEventListener("click", function (event) {
							event.preventDefault(); // 기존 링크 동작 취소
							var select = document.querySelector("select");
							var selectedOption = select.options[select.selectedIndex];
							var prjSeq = selectedOption.value;
							var href = this.getAttribute("href");
							var modifiedHref = href + "?prj_seq=" + prjSeq;
							window.location.href = modifiedHref; // 페이지 이동
						});
					</script>
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

</body>

</html>