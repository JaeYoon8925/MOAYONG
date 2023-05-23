<%@page import="com.smhrd.entity.Project"%>
<%@page import="java.util.List"%>
<%@ page import="com.smhrd.entity.User"%>
<%@ page import="com.smhrd.entity.Message"%>
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
		<li><a href="goMain.do" >게시판</a></li>
		<li><a href="GomypagePrjList.do">프로젝트 리스트</a></li>
		<li><a href="goMypage.do" class="active">마이페이지</a></li>
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

		<!-- Header -->
		<header id="header" class="alt">
			로고 <span class="logo"><img src="images/logo.svg" alt="" /></span>
			built by <a href="https://twitter.com/ajlkn">@ajlkn</a> for <a
				href="https://html5up.net">HTML5 UP</a>.
		</header>


		<!-- Nav -->
		<nav id="nav">
			<ul>
				<li><a href="#intro" class="active">소개</a></li>
				<li><a href="#first">프로젝트</a></li>
				<li><a href="#second">캘린더</a></li>
				<li><a href="#cta">프로필</a></li>
				<li><a href="#Alert">쪽지</a></li>
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
							<%=user.getSelf_intro()%><br>
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
								</div> <!-- /Modal --> <a href="goProfileUpdate.do">
									<button type="button" class="button primary">수정하기</button>
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
					<li><span stlye="width:196px height:196px "></span>
						<h3>참가신청 한 프로젝트</h3>

						<ul class="alt" style="height: 300px; overflow: auto">
							<%
							List<Project> partinList = (List<Project>) request.getAttribute("partinList");
							%>
							<%
							for (Project vo : partinList) {
							%>
							<li><a
								href="viewPostContent.do?prj_seq=<%=vo.getPrj_seq()%>"><%=vo.getPrj_name()%></a></li>
							<%
							}
							%>
						</ul>
					<li><span stlye="width:196px height:196px "></span>
						<h3>진행 중인 프로젝트</h3>
						<ul class="alt" style="height: 300px; overflow: auto">
							<%
							List<Project> ingList = (List<Project>) request.getAttribute("ingList");
							%>
							<%
							for (Project vo : ingList) {
							%>
							<!-- 뷰포스트 말고 세부프로젝트 페이지로 이동가능하게끔 -->
							<li><a href="viewPostContent.do?prj_seq=${vo.prj_seq}"><%=vo.getPrj_name()%></a></li>
							<button
								onclick='location.href="joinList.do?prj_seq=<%=vo.getPrj_seq()%>"'>참가신청현황보기</button>
							<%
							}
							%>

						</ul> <!-- 이 사람의 진행 중 프로젝트 리스트 전부 보기 --></li>
					<li><span stlye="width:196px height:196px "></span>
						<h3>완료된 프로젝트</h3>

						<ul class="alt" style="height: 300px; overflow: auto">
							<%	List<Project> endList = (List<Project>) request.getAttribute("endList");%>
							<%	for (Project vo : endList) {%>
							<!-- 이것도 뷰포스트 말고 세부프로젝트 페이지로 이동가능하게끔? -->
							<li><a href="viewPostContent.do?prj_seq=${vo.prj_seq}"><%=vo.getPrj_name()%></a></li>
							<button onclick='location.href="eval_leader.do?prj_seq=<%=vo.getPrj_seq() %>"'>팀장평가</button>
							<button onclick='location.href="eval_participant.do?prj_seq=<%=vo.getPrj_seq() %>"'>팀원평가</button>
							<%}	%>
							
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
						상세 정보<br> 상세 경력<br> 대충 엄청 대단한 경력1<br> 대충 엄청난 경력2<br>
						대충 멋진 경력3<br>
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
					<h2>알람 / 쪽지</h2>

					<ul style="height: 500px; overflow: auto">
						<table>
							<thead>
								<tr>
									<th>보낸 사람</th>
									<th>내용</th>
									<th>보낸 일자</th>
								</tr>
							</thead>
								<%
								List<Message> MessageList = (List<Message>) request.getAttribute("MessageList");
								%>
								<%
								for (Message vo : MessageList) {
								%>
							<tbody>
								<td colspan="2"><%=vo.getSender_id()%></td>
								<td colspan="7"><a href="ViewMessage.do?msg_seq=<%=vo.getMsg_seq()%>"><%=vo.getMsg_content()%></a></td>
								<td colspan="3"><%=vo.getMsg_dt()%></td>
							</tbody>
								<%
								}
								%>
							<tfoot>
								<tr>
									<td colspan="2"></td>
								</tr>
							</tfoot>
						</table>
					</ul>


				</header>
				<footer class="major">
					<ul class="actions special">
						<li><a href="goSendMessage.do" class="button">쪽지 보내기</a></li>
						<li><a href="generic.html" class="button primary">읽음처리(안됌)</a></li>
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
