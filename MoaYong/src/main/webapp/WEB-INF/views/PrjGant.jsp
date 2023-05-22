<!-- 필요한 엔터티들 주석 풀면 될듯합니다 -->
<%@ page import="com.smhrd.entity.User" %>
	<%@page import="com.smhrd.entity.Project" %>
		<%@page import="java.util.List" %>
			<!-- page import="com.smhrd.entity.Board" -->
			<!-- import="com.smhrd.entity.캘린더 데이터 엔터티"%> -->
			<!-- import="com.smhrd.entity.쪽지테이블 엔터티"%> -->
			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


				<!DOCTYPE HTML>
				<!--
	Stellar by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
				<html>
				<style>
					.wrapper {
						display: grid;
						grid-template-columns: auto repeat(12, 1fr);
						grid-gap: 10px;
						font-family: Arial, sans-serif;
					}

					.header {
						grid-column: 1 / -1;
						text-align: center;
						margin-bottom: 20px;
					}

					.gantt {
						grid-column: 1 / -1;
					}

					.gantt__row {
						display: block;
						position: relative;
						grid-template-columns: repeat(13, 1fr);
						align-items: center;
						border-bottom: 1px solid #ccc;
						padding: 10px 0 10px 100px;
					}

					.gantt__row>* {
						display: inline-block;
						font-size: 16px;
					}

					.gantt__row>* {
						display: inline-block;
					}

					.gantt__row-first {
						position: absolute;
						top: 22%;
						left: 0;
						font-weight: bold;
					}

					.gantt__row-bars {
						list-style: none;
						padding: 0;
						margin: 0;
						display: grid;
						grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
						/*
		  align-items: center;
		  justify-content: flex-start;
		  grid-template-columns: 100%;
		  justify-content: space-between;
		  */
					}

					.gantt__row-bars li {
						margin-right: 5px;
						height: 20px;
						color: #fff;
						font-size: 12px;
						border-radius: 3px;
					}

					.stripes {
						background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.2) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.2) 50%, rgba(255, 255, 255, 0.2) 75%, transparent 75%, transparent);
						background-size: 8px 8px;
					}

					.gantt__row--months {
						font-size: 0;
						font-weight: bold;
						color: white;
						background-color: #0a3444;
					}

					.gantt__row--months .span_wrap {
						width: 100%;
						font-size: 0;
					}

					.gantt__row--months .span_wrap span {
						display: inline-block;
						width: 8.33%;
						font-size: 16px;
						text-align: center;
					}

					.gantt__row--lines span {
						border-left: 1px dashed #ccc;
						height: 100%;
						display: block;
					}

					.gantt__row-first {
						flex-shrink: 0;
						width: 100px;
						text-align: center;

					}

					.marker {
						background-color: #000;
						width: 10px;
						height: 10px;
						border-radius: 50%;
						margin: 0 auto;
					}

					.gantt__row-bars li {
						position: relative;
						text-align: center;
					}

					.gantt__row-bars li:hover:after {
						content: "차트 순번: " attr(data-seq) "\A중요도: " attr(data-importance) "\A비고 알림: " attr(data-notice) "\A진행도: " attr(data-status) "%";
						position: absolute;
						left: 0;
						top: 100%;
						white-space: pre-wrap;
						background-color: #ccc;
						padding: 5px;
						border-radius: 5px;
						font-size: 12px;
						z-index: 9999;
					}
				</style>

				<head>
					<title>프로젝트 상세 - 간트 페이지</title>
					<meta charset="utf-8" />
					<link rel="stylesheet"
						href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
					<link rel="stylesheet"
						href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
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
					<script src="index.js"></script>
					<!-- 프리셋 -->
					<link rel="stylesheet" href="assets/css/main.css" />
					<noscript>
						<link rel="stylesheet" href="assets/css/noscript.css" />
					</noscript>
				</head>

				<!-- 유저정보 받아오기-->
				<% User user=(User) session.getAttribute("user"); System.out.println(user); %>
					<!-- 맨 위에 있는 이동하는 네비게이션 -->
					
					<nav id="nav">
						<ul>
							<!-- <div class="logo"><img src="/images/pic01.jpg" alt="" /></div> -->
							<li><a href="goMain.do" classs="active">게시판</a></li>
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

					<body class="is-preload">

						<!-- Wrapper -->
						<div id="wrapper">

							<!-- Header -->
							<header id="header" style="padding-top: 6em;">
								<h1 style="margin-top: 40px;">MoaYong</h1>
								<p>프로젝트 게시판이에용</p>
							</header>


							<!-- 이동하지 않는 서브 네비  -->
							<nav id="nav">
								<ul>
									<!-- 각자 페이지로 이동하는 기능  -->
									<li><a href="간트차트로" class="active">간트차트</a></li>
									<li><a href="세부임무로">세부임무</a></li>
									<li><a href="산출물로">산출물</a></li>
									<li><a href="쪽지로">쪽지</a></li>
								</ul>
							</nav>

							<!-- Main -->
							<div id="main">

								<!-- Content -->
								<section id="content" class="main">

									<body>
										<div class="wrapper">
											<button id="addPersonButton">인원추가</button>
											<div class="header">
												<h2>레이드</h2>
											</div>
											<div class="gantt">
												<div class="gantt__row gantt__row--months">
													<div class="gantt__row-first"></div>
													<div class="span_wrap">
														<span>Jan</span><span>Feb</span><span>Mar</span>
														<span>Apr</span><span>May</span><span>Jun</span>
														<span>Jul</span><span>Aug</span><span>Sep</span>
														<span>Oct</span><span>Nov</span><span>Dec</span>
													</div>

												</div>
												<div class="gantt__row gantt__row--lines" data-month="5">
													<span></span><span></span><span></span>
													<span></span><span></span><span></span>
													<span></span><span class="marker"></span><span></span>
													<span></span><span></span><span></span>
												</div>
												<div class="gantt__row">
													<div class="gantt__row-first">
														가
													</div>
													<ul class="gantt__row-bars">
														<li style="grid-column: 2/7; background-color: #2ecaac;">아주아주 긴
															내용</li>
													</ul>
												</div>
												<div class="gantt__row gantt__row--empty">
													<div class="gantt__row-first">
														나
													</div>
													<ul class="gantt__row-bars">
														<li style="grid-column: 2/6; background-color: #2ecaac;">긴 내용
														</li>
													</ul>
												</div>
												<div class="gantt__row">
													<div class="gantt__row-first">
														다
													</div>
													<ul class="gantt__row-bars">
														<li style="grid-column: 3/7; background-color: #2ecaac;">내용</li>
													</ul>
												</div>
												<div class="gantt__row gantt__row--empty">
													<div class="gantt__row-first">
														라
													</div>
													<ul class="gantt__row-bars">
														<li style="grid-column: 4/8; background-color: #2ecaac;">내용</li>
													</ul>
												</div>
												<div class="gantt__row gantt__row--empty">
													<div class="gantt__row-first">
														마
													</div>
													<ul class="gantt__row-bars">
														<li style="grid-column: 5/9; background-color: #2ecaac;">내용</li>
													</ul>
												</div>
												<div class="gantt__row">
													<div class="gantt__row-first">
														바
													</div>
													<ul class="gantt__row-bars">
														<li style="grid-column: 6/10; background-color: #2ecaac;">내용내용
														</li>
													</ul>
												</div>
												<div class="gantt__row">
													<div class="gantt__row-first">
														사
													</div>
													<ul class="gantt__row-bars">
														<li style="grid-column: 7/11; background-color: #54c6f9;">대충 긴내용
														</li>
													</ul>
												</div>

												<div class="gantt__row">
													<div class="gantt__row-first">
														아
													</div>
													<ul class="gantt__row-bars">
														<li style="grid-column: 8/12; background-color: #ff6252;">소재고갈
														</li>
													</ul>
												</div>
											</div>
										</div>
										<script>
											let seq = 0;

											document.addEventListener('DOMContentLoaded', function () {
												const addPersonButton = document.getElementById('addPersonButton');
												addPersonButton.addEventListener('click', function () {
													seq++;
													const personName = prompt('이름을 입력하세요');
													if (!personName) return;
													const value = prompt('내용을 입력해 주세요');
													if (!value) return;
													const start_Date = Number(prompt('시작월을 선택하세요 : (1 ~ 12)'));
													if (!start_Date || isNaN(start_Date) || start_Date < 1 || start_Date > 12) {
														alert('잘못된 시작일 입니다.');
														return;
													}
													const end_Date = Number(prompt('종료월을 기입하세요: (1 ~12)'));
													if (!end_Date || isNaN(end_Date) || end_Date < 1 || end_Date > 12) {
														alert('잘못된 종료일 입니다.');
														return;
													}


													// 기능추가
													const importance = prompt('중요도를 입력하세요 (상, 중, 하)');
													const notice = prompt('비고 알림을 입력하세요');
													const status = Number(prompt('진행도를 입력하세요 (0 ~ 100)'));

													const gantt = document.querySelector('.gantt');
													const newRow = document.createElement('div');
													newRow.className = 'gantt__row';
													newRow.innerHTML = `
							  <div class="gantt__row-first">${personName}</div>
							  <ul class="gantt__row-bars">
								<li style="grid-column: ${start_Date}/${end_Date + 1}; background-color: #2ecaac;" data-seq="${seq}" data-importance="${importance}" data-notice="${notice}" data-status="${status}">${value}</li grid row;>
							  </ul>
							`;
													gantt.appendChild(newRow);
												});
												document.addEventListener('DOMContentLoaded', function () {
													const nameElements = document.querySelectorAll('.gantt__row-text');

													nameElements.forEach(function (nameElement) {
														nameElement.addEventListener('click', function () {
															const name = this.textContent;
															const value = prompt('내용을 입력해 주세요');
															if (!value) return;
															const start_Date = Number(prompt('시작월을 선택하세요 : (1 ~ 12)'));
															if (!start_Date || isNaN(start_Date) || start_Date < 1 || start_Date > 12) {
																alert('잘못된 시작일 입니다.');
																return;
															}
															const end_Date = Number(prompt('종료월을 선택하세요: (1 ~12)'));
															if (!end_Date || isNaN(end_Date) || end_Date < 1 || end_Date > 12) {
																alert('잘못된 종료일 입니다.');
																return;
															}

															// 기능추가
															const importance = prompt('중요도를 입력하세요 (상, 중, 하)');
															const notice = prompt('비고 알림을 입력하세요');
															const status = Number(prompt('진행도를 입력하세요 (0 ~ 100)'));

															const ganttRow = document.querySelector(`.gantt__row[data-row="${name}"] .gantt__row-bars`);
															const newGraph = document.createElement('li');
															newGraph.style.gridColumn = `${start_Date}/${end_Date + 1}`;
															newGraph.style.backgroundColor = '#2ecaac';
															newGraph.setAttribute('data-seq', '새 그래프');
															newGraph.setAttribute('data-importance', importance);
															newGraph.setAttribute('data-notice', notice);
															newGraph.setAttribute('data-status', status);
															newGraph.textContent = value;
															ganttRow.appendChild(newGraph);
														});
													});
												});

												document.addEventListener('click', function (event) {
													if (event.target.matches('.gantt__row-bars li')) {
														const bar = event.target;
														const currentContent = bar.textContent;
														const currentStart = parseInt(bar.style.gridColumnStart);
														const currentEnd = parseInt(bar.style.gridColumnEnd);

														const currentImportance = bar.getAttribute('data-importance');
														const currentNotice = bar.getAttribute('data-notice');
														const currentStatus = parseInt(bar.getAttribute('data-status'));

														const newContent = prompt('내용을 수정하세요:', currentContent);
														if (newContent !== null) {
															bar.textContent = newContent;
														}

														const newStart = Number(prompt('시작월을 수정하세요: (1 ~ 12)', currentStart));
														if (!newStart || isNaN(newStart) || newStart < 1 || newStart > 12) {
															alert('잘못된 기입입니다.');
															return;
														}

														const newEnd = Number(prompt('종료월을 수정하세요: (1 ~ 12)', currentEnd));
														if (!newEnd || isNaN(newEnd) || newEnd < 1 || newEnd > 12) {
															alert('잘못된 기입입니다.');
															return;
														}

														// 중요도 비고 진행도 기입
														const newImportance = prompt('중요도를 수정하세요 (상, 중, 하):', currentImportance);
														if (newImportance !== null) {
															bar.setAttribute('data-importance', newImportance);
															const color = newImportance === '상' ? '#ff6252' : newImportance === '중' ? '#54c6f9' : '#2ecaac';
															bar.style.backgroundColor = color;
														}

														const newNotice = prompt('비고알림을 수정하세요:', currentNotice);
														if (newNotice !== null) {
															bar.setAttribute('data-notice', newNotice);
														}

														const newStatus = Number(prompt('진행도를 수정하세요 (0 ~ 100):', currentStatus));
														if (!newStatus || isNaN(newStatus) || newStatus < 0 || newStatus > 100) {
															alert('잘못된 기입입니다.');
															return;
														}
														bar.setAttribute('data-status', newStatus);

														bar.style.gridColumn = `${newStart} / ${newEnd + 1}`;
													}

												});
											});




										</script>

							</div>

							<!-- Footer -->
							<footer id="footer">
								<section>
									<h2>Aliquam sed mauris</h2>
									<p>Sed lorem ipsum dolor sit amet et nullam consequat feugiat consequat magna
										adipiscing
										tempus etiam
										dolore veroeros. eget dapibus mauris. Cras aliquet, nisl ut viverra
										sollicitudin, ligula
										erat
										egestas velit, vitae tincidunt odio.</p>
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
										<dd><a href="#">information@untitled.tld</a></dd>
									</dl>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-twitter alt"><span
													class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f alt"><span
													class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-instagram alt"><span
													class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-github alt"><span
													class="label">GitHub</span></a>
										</li>
										<li><a href="#" class="icon brands fa-dribbble alt"><span
													class="label">Dribbble</span></a></li>
									</ul>
								</section>
								<p class="copyright">&copy; Untitled. Design: <a href="https://html5up.net">HTML5
										UP</a>.</p>
							</footer>

						</div>

						<!--  
		top_btn
		바로는 안보이고 아래로 어느정도 스크롤을 내려야 버튼이 표시됌 
	-->
						<div>
							<a href="#header" id="top_btn"><img src="/images/icon_to_top.png" title="위로 가기"></a>
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