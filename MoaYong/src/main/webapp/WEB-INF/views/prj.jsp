<%@ page import="main.java.entity.User"%>
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


<nav id="nav">
	<ul>
		<!-- <div class="logo"><img src="/images/pic01.jpg" alt="" /></div> -->
		<li><a href="goMain.do" class="active">게시판</a></li>
		<li><a href="go(프로젝트메인가칭).do">프로젝트 관리</a></li>

		<!-- 로그인한 계정의 마이페이지로 이동이 되어야함. -->
		<li><a href="goMypage.do">마이페이지</a></li>

		<%
		if (user != null) {
		%>
		<button type="submit" id="logout-btn">
			<a href="logout.do">로그아웃</a>
		</button>
		<!-- 원래는 개인별 db에 저장된 이미지의 경로로 개인의 프로필 사진을 불러와야하지만 일단 이미지 절대경로로 로드-->
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

		<!-- Header -->
		<header id="header" class="alt">
			로고 <span class="logo"><img src="images/logo.svg" alt="" /></span>
			built by <a href="https://twitter.com/ajlkn">@ajlkn</a> for <a
				href="https://html5up.net">HTML5 UP</a>.
		</header>


		<!-- Nav -->
		<nav id="nav">
			<ul>
				<li><a href="#intro" class="active">Introduction</a></li>
				<li><a href="#first">Project</a></li>
				<li><a href="#second">Calendar</a></li>
				<li><a href="#cta">Profile</a></li>
				<li><a href="#Alert">Alert</a></li>
				<!--  -->
			</ul>
		</nav>

		<!-- Main -->
		<div id="main">

			<!-- Introduction -->
			<section id="intro" class="main">
				<div class="spotlight">
					<div class="content">
						<header class="major">
							<!-- 로그인 한 사람의 정보가 아니라 내가 보고싶은 계정의 정보들을 불러와야함. -->
							<!-- 어떻게? 세션을 하나 더 받나? -->
							<!-- 칭호 닉네임인데 일단 이렇게 -->
							<h2>
								(<%=user.getNickname()%>)
								<%=user.getT_id()%>
							</h2>
						</header>
						<p>
							<%=user.getSelf_intro()%><br> self_intro가 아니라 comment로
							회원테이블에 컬럼추가 요망 이후 위 스트립을 user.getComment() 로 변경
						</p>

						<ul class="actions">
							<!-- class="" 칭호 리스트 페이지로 or 모달로 구현 // 일단 아래는 모달로 구상 -->
							<li>
								<!-- Modal -->
								<button type="button" class="button" data-toggle="modal"
									data-target="#myModal">칭호 조회</button> <!-- Modal -->
								<div class="modal" id="myModal">
									<div class="modal-dialog">
										<div class="modal-content">

											<!-- Modal Header -->


											<!-- 칭호 리스트 없어서 보류 -->
											<div class="modal-header">
												<h4 class="modal-title">칭호 리스트</h4>
												<!-- <button type="button" class="close"
																data-dismiss="modal">&times;</button> -->
											</div>

											<!-- Modal body -->
											<div class="modal-body">
												칭호1 이름
												<div class="btn-group btn-group-sm">
													<button type="button" class="btn btn-outline-primary">선택</button>
												</div>
												<br> 칭호2 이름
												<div class="btn-group btn-group-sm">
													<button type="button" class="btn btn-outline-primary">선택</button>
												</div>
											</div>

											<!-- Modal footer -->
											<div class="modal-footer">
												<button type="button" class="btn btn-danger"
													data-dismiss="modal">Close</button>
											</div>

										</div>
									</div>
								</div> <!-- /Modal --> <a href="goMypage">
									<button type="button" class="button primary"
										href="goSetprofile">수정하기</button>
							</a>

							</li>
							<!-- class="" 수정하기 페이지로? -->
							<!-- 대충 if문 씌우고 내 로그인 세션id == 페이지id 일때만 버튼 출력-->
					</div>
					<!-- 프로필 사진 클래스명 image에서 photo로 변경(css파일 선택자도 함께) 변경 -->
					<!-- 일단 이미지 크기는 높이 폭 모두 14em-->
					<span class="image"><img src="images/pic01.jpg" alt="" /></span>
				</div>
			</section>

			<!-- 프로젝트 리스트 -->
			<section id="first" class="main special">
				<header class="major">
					<h2>Project</h2>
				</header>
				<ul class="features">
					<li><span class="icon solid major style1 fa-code"></span>
						<h3>게시한 프로젝트</h3>
						<p>이 사람이 올린 프로젝트 들이에용.</p>
						<ul class="alt">
							<li>Dolor pulvinar magna etiam.</li>
							<li>Sagittis sed lorem adipiscing.</li>
							<li>Felis enim etiam feugiat.</li>
						</ul></li>
					<li><span class="icon major style3 fa-copy"></span>
						<h3>참여 중 프로젝트</h3>
						<p>이 사람이 참여 중 프로젝트들이에용.</p>
						<ul class="alt">
							<li>Dolor pulvinar magna etiam.</li>
							<li>Sagittis sed lorem adipiscing.</li>
							<li>Felis enim etiam feugiat.</li>
						</ul> <!-- 이 사람의 진행 중 프로젝트 리스트 전부 보기 --></li>
					<li><span class="icon major style5 fa-gem"></span>
						<h3>완료 프로젝트</h3>
						<p>이 사람이 완료한 프로젝트들이에용.</p>
						<ul class="alt">
							<li>Dolor pulvinar magna etiam.</li>
							<li>Sagittis sed lorem adipiscing.</li>
							<li>Felis enim etiam feugiat.</li>
						</ul> <!-- 이 사람의 완료 프로젝트 리스트 전부 보기 --></li>
				</ul>
				<footer class="major">
					<h3>빈 공간이에용</h3>
				</footer>


			</section>

			<!-- Second Section -->
			<section id="second" class="main special">
				<header class="major">
					<h2>Calendar</h2>
					<p>개인 일정이에용</p>
				</header>

				<!-- 캘린더 API -->

				<div id='calendar'></div>

				<br>

				<p class="content">캘린더 아래에 메모를 적을 수 있어용</p>
				<footer class="major">
					<ul class="actions special">
						<li><a href="generic.html" class="button">메모하기</a></li>
						<li><a href="calendarfix.html" class="button primary">일정추가</a></li>
					</ul>
				</footer>
			</section>

			<!-- Get Started -->
			<section id="cta" class="main special">
				<header class="major">
					<h2>자기소개란</h2>
					<p>
						<%=user.getSelf_intro()%>
					</p>
				</header>
				<footer class="major">
					<ul class="actions special">
						<!-- 자기 소개를 수정할 수 있는 새로운 페이지로? 아니면 그냥 여기서 처리? / goSelf_intro -->
						<li><a href="generic.html" class="button"></a></li>
						<li><a href="generic.html" class="button primary">Learn
								More</a></li>
					</ul>
				</footer>
			</section>


			<!-- 알람 -->
			<section id="Alert" class="main special">
				<header class="major">
					<h2>알람 / 쪽지 등이 나올 공간이에용</h2>


					<!-- if문으로 출력할거라 코드가 압축될거에용-->
					<table>
						<thead>
							<tr>
								<th>보낸 사람</th>
								<th>제목</th>
								<th>보낸 일자(년월일까지만?)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Item One</td>
								<td><a href="viewmessage.html">Ante turpis integer
										aliquet porttitor.</a></td>
								<td>29.99</td>
							</tr>
							<tr>
								<td>Item Two</td>
								<td>Vis ac commodo adipiscing arcu aliquet.</td>
								<td>19.99</td>
							</tr>
							<tr>
								<td>Item Three</td>
								<td>Morbi faucibus arcu accumsan lorem.</td>
								<td>29.99</td>
							</tr>
							<tr>
								<td>Item Four</td>
								<td>Vitae integer tempus condimentum.</td>
								<td>19.99</td>
							</tr>
							<tr>
								<td>Item Five</td>
								<td>Ante turpis integer aliquet porttitor.</td>
								<td>29.99</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2"></td>
								<td>100.00</td>
							</tr>
						</tfoot>
					</table>



				</header>
				<footer class="major">
					<ul class="actions special">
						<li><a href="sendmessage.html" class="button">쪽지 보내기</a></li>
						<li><a href="generic.html" class="button primary">모두 읽음처리</a></li>
					</ul>
				</footer>
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
					<li><a href="generic.html" class="button">Learn More</a></li>
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