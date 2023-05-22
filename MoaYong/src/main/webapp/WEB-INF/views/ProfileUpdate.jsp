<%@ page import="com.smhrd.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<!--
	Stellar by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>

<head>
<title>프로필 수정</title>
<meta charset="utf-8" />
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
<!-- 프리셋 html로 작업 후 변경 필요-->
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>

</head>
<%
User user = (User) session.getAttribute("user");
System.out.println(user);
%>


<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<h1>프로필 수정 페이지</h1>
		</header>

		<!-- Main -->
		<div id="main">

			<!-- Content -->
			<section id="content" class="main">

				<div class="spotlight">
					<div class="content">
						<h2>수정하기</h2>
						<form action="ProfileUpdate.do" method="POST">
							<div class="row gtr-uniform">
								<div class="col-5 col-12-xsmall">
									비밀번호 변경 : <input type="password" name="password" id="password"
										value="<%=user.getPw()%>" placeholder="변경할 password을 입력하세요" />
								</div>
								<br>
								<div class="col-5">
									닉네임 변경 : <input type="text" name="nickname" id="nickname"
										value="<%=user.getNickname()%>" />
								</div>
								<div class="col-10">
									<textarea name="self_intro" id="self_intro"
										rows="6"><%=user.getSelf_intro()%>
										</textarea>
								</div>

								<div class="col-12">
									<ul class="actions">


										<li><input type="submit" value="수정하기" class="primary" /></li>
										<!-- 수정하기 버튼을 눌렀을때 닉네임 중복체크?-->
						</form>

						<!-- 메인으로 -->
						<li><input type="reset" value="변경취소" /></li>
						
						<div>
							<input type="file" value="이미지 업로드" class="primary" />
						</div>
						
						</ul>
					</div>
				</div>
		</div>
		<!-- 프로필 사진 클래스명 image에서 photo로 변경(css파일 선택자도 함께) 변경 -->
		<!-- 일단 이미지 크기는 높이 폭 모두 16em-->
		<div class="image">
			<img src="images/pic01.jpg" alt="" />
		</div>
	</div>

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