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
<script src="assets/js/index.js"></script>
<!-- 프리셋 -->
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<style>
body {
	background-color: #935d8c;
	background-image: url("images/overlay.png"),
		-moz-linear-gradient(45deg, #e37682 15%, #5f4d93 85%);
	background-image: url("images/overlay.png"),
		-webkit-linear-gradient(45deg, #e37682 15%, #5f4d93 85%);
	background-image: url("images/overlay.png"),
		-ms-linear-gradient(45deg, #e37682 15%, #5f4d93 85%);
	background-image: url("images/overlay.png"),
		linear-gradient(45deg, #e37682 15%, #5f4d93 85%);
	background-repeat: no-repeat;
}

.main2 {
	/* rgba(0~255, 0~255, 0~255, 0~1)
		   a : 1에 가까워질수록 색깔이 선명해진다 */
	background-color: rgb(255, 255, 255, 0.4) !important;
	height: 550px !important;
	width: 400px !important;
	padding: 50px !important;
	border-radius: 50px !important;
	/* div요소 가운데 정렬 */
	position: absolute !important;
	left: 50% !important;
	top: 50% !important;
	transform: translate(-50%, -50%) !important;
	/* 내부 가운데 정렬 */
	text-align: center !important;
}

.main2>h1 {
	margin-top: 0;
}

.user-input {
	width: 200px;
	height: 30px;
	border: 0;
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 10px;
}

#login-button {
	background-color: rgb(255, 255, 255);
	width: 200px;
	height: 50px;
}

#sign-button {
	background-color: rgb(255, 255, 255);
}

#reset-button {
	background-color: rgb(255, 255, 255);
}

#sign-button {
	background-color: rgb(95, 18, 18);
	transition: background-color 0.5s ease-in-out;
}

#sign-button:hover {
	background-color: rgb(25, 40, 126);
}

#login-button {
	background-color: rgb(255, 255, 255);
	transition: background-color 0.5s ease-in-out;
}

#login-button:hover {
	background-color: rgb(200, 200, 200);
}

#reset-button {
	background-color: rgb(255, 255, 255);
	transition: background-color 0.5s ease-in-out;
}

#reset-button:hover {
	background-color: rgb(200, 200, 200);
}

#close-modal {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
}

#reset {
	position: relative;
}

#close-modal {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
}
</style>
</head>

<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<div>
				<h1 style="text-align: center;">MoaYong</h1>
				<!-- <p style="text-align: center;">레이드형 구인구직 프로젝트</p> -->
			</div>
		</header>





		<body>
			<!-- Main -->
			<div id="main">

				<!-- Content -->
				<section id="content" class="main" style="margin-top: 100%;">
					<!--modal-->
					<!-- sign modal-->
					<dialog id="sign"> <span id="close-modal"
						onclick="document.getElementById('sign').close()">X</span> <!-- Close icon -->
					<form action="join.do" method="post">
						<label for="username">ID:</label> <input type="text" id="username"
							name="t_id" required><br>
						<button type="submit">중복검사</button>
						<br> <label for="password">Pw:</label> <input type="password"
							id="password" name="pw" required><br> <label
							for="email">email:</label> <input type="text" id="email"
							name="email" required><br> <label for="nickname">Nick:</label>
						<input type="text" id="nickname" name="nickname" required><br>

						<button type="submit">Submit</button>
					</form>
					</dialog>


					</dialog>
					<!-- reset modal-->

					<dialog id="reset">
					<form action="searchInfo.do" method="post">
						<span id="close-modal"
							onclick="document.getElementById('reset').close()">X</span>
						<!-- Close icon -->

						<label for="reset-id">ID:</label> <input type="text" id="id"
							name="t_id" required><br> <label for="reset-email">Email:</label>
						<input type="email" id="reset-email" name="email" required><br>

						<button type="submit">Submit</button>
					</form>
					</dialog>


					<div class="main2">
						<h1>Login</h1>


						<form action="login.do" method="post">
							<div id="result-area">ID</div>
							<input type="text" class="user-input" name="t_id">

							<div id="chance-area">Password</div>
							<input type="text" class="user-input" name="pw">

							<div class="button-area" style="height: 150px;">
								<button type="submit" id="login-button">Login</button>
								<br>
								<br>

								<button type="button" id="sign-button"
									style="min-width: unset; width: 140px !important; display: inline-block !important;">회원가입</button>
								<button type="button" id="reset-button"
									style="min-width: unset; width: 140px !important; display: inline-block !important;">회원찾기</button>
							</div>
							<!-- <button id="sign-button" style="display:flex;">회원가입</button>
								<button id="reset-button" style="display:flex;">회원찾기</button> -->
						</form>


					</div>


				</section>

			</div>



		</body>

	</div>

	<!-- Footer -->


	<!--  
		top_btn
		바로는 안보이고 아래로 어느정도 스크롤을 내려야 버튼이 표시됌 
	-->
	<!-- <div>
					<a href="#header" id="top_btn"><img src="/images/icon_to_top.png" title="위로 가기"></a>
				</div> -->


	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script>
		var joinCom = '${joinComplete}';
		if (joinCom === "회원가입 완료!") {
			alert("회원가입 완료!");
		}

		$('#sign-button').on('click', function() {
			sign.showModal();
		});

		$('#reset-button').on('click', function() {
			reset.showModal();
		});
	</script>

</body>

</html>