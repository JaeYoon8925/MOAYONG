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
<title>Stellar by HTML5 UP</title>
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
<script src="assets/js/index.js"></script>
<!-- 프리셋 html로 작업 후 변경 필요-->
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>


</head>

<body class="is-preload">

	<!-- 유저정보 받아오기-->
	<%
	User user = (User) session.getAttribute("user");
	System.out.println(user);
	%>



	<!-- 맨 위에 있는 이동하는 네비게이션 -->
	<nav id="nav">
		<ul>
			<!-- <div class="logo"><img src="/images/pic01.jpg" alt="" /></div> -->
			<li><a href="goMain.do" classs="active">게시판</a></li>
			<li><a href="GoPrjGant.do">프로젝트 관리</a></li>

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

	<header id="header">
		<p></p>
	</header>

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">



			<!-- Content -->
			<section id="content" class="main">




				<!-- 폼 태그 -->
				<form action="writePost.do" method="post">
					<table>
						<tr>
							<td>
								<div style="float: left; max-width: none; width: 15%;">
									<select name="prj_category" class="col-12"
										style="display: flex;">
										<option value="" selected disabled>카테고리 선택</option>
										<option value="프로그래밍" type="text">프로그래밍</option>
										<option value="전시회" type="text">전시회</option>
										<option value="게임" type="text">게임</option>
										<option value="스터디" type="text">스터디</option>
									</select>
									<!-- <input type="text" name="search_keyword" placeholder="검색어를 입력하세요"> -->
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div id="date">날짜정보입력</div>
								<div style="float: left; max-width: none;">
									인원모집 마감일 : <input type="date" name="deadline_dt"
										value="${viewPostContentDt3}">
								</div>
								<div style="float: left; max-width: none;">
									프로젝트 시작일 : <input type="date" name="start_dt"
										value="${viewPostContentDt1}">
								</div>
								<div style="float: left; max-width: none;">
									프로젝트 종료일 : <input type="date" name="end_dt"
										value="${viewPostContentDt2}">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div
									style="float: left; max-width: none; margin: 12.5px 38px 0px 0px; padding-right: 15px;">
									제목 :</div> <input name="prj_name" type="text"
								value="${viewPostContent.prj_name}"
								style="float: left; width: 70%;">
							</td>
						</tr>
						<tr>
							<td>
								<div
									style="float: left; max-width: none; margin-top: 12.5px; padding-right: 15px;">
									모집인원 :</div> <input name="recruit_count" type="text"
								value="${viewPostContent.recruit_count}"
								style="float: left; width: 22.5%;">
								<div
									style="float: right; max-width: none; margin-top: 12.5px; padding-right: 15px;">
									이미지 첨부 : <input type="file" style="float: right;"> <br>
								</div>
								<div
									style="float: right; max-width: none; margin-top: 12.5px; padding-right: 15px;">
									지도 첨부 :
									<button id="mapinsert" type="button">지도 첨부</button>
								</div>
							</td>
						</tr>
					</table>

					<!-- <table>
						<tr>
							<td><select id="font">
									<option value="default">글씨체</option>
									<option value="serif">Serif</option>
									<option value="sans-serif">Sans-serif</option>
									<option value="monospace">Monospace</option>
								</select> <select id="font_size">
									<option value="default">글씨 크기</option>
									<option value="small">작게</option>
									<option value="medium">보통</option>
									<option value="large">크게</option>
								</select> <select id="color">
									<option value="default">색상</option>
									<option value="red">빨강</option>
									<option value="green">초록</option>
									<option value="blue">파랑</option>
								</select></td>
						</tr>
					</table> -->

					<div id="mapContainer" style="display: none;">
						<div>
							<input type="text" id="mapSearch" placeholder="지도 검색어를 입력하세요">
							<button id="mapBtn" type="button">검색</button>
						</div>

						<div id="map" style="width: 300px; height: 200px;"></div>
					</div>



					<br> <br>
					<textarea name="post">${viewPostContent.post}</textarea>
					<br>
					<button type="submit" id="chanbtn"
						style="float: right; max-width: none;">수정완료</button>
					<br>
					<!-- <a> <c items="${user}" var="user">${user.nickname}님</a> -->

				</form>



	




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

			<!-- 스크립트 태그 -->
				<script>
									var registerbtn = document.getElementById("regibtn");
									registerbtn.addEventListener('click', () => {
										alert("게시 완료")
									})
									var registerbtn = document.getElementById("chanbtn");
									registerbtn.addEventListener('click', () => {
										alert("수정 완료")
									})

			</script>	
			<script>	
      var mapOption = {
        center: new kakao.maps.LatLng(37.5665, 126.9780), // 지도 중심좌표 (서울시청)
        level: 8 // 지도 확대 레벨
      };
  
      var map = new kakao.maps.Map(document.getElementById('map'), mapOption); // 지도 생성
  
      var geocoder = new kakao.maps.services.Geocoder();
  
      var searchKeyword = document.getElementById('mapSearch');
      var searchButton = document.getElementById('mapBtn');
      var mapInsertButton = document.getElementById('mapinsert');
      var mapContainer = document.getElementById('mapContainer');
  
      searchButton.addEventListener('click', function() {
        var keyword = searchKeyword.value;
        geocoder.addressSearch(keyword, function(result, status) {
          if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            map.setCenter(coords);
            displayMarker(coords);
          }
        });
      });
  
      mapInsertButton.addEventListener('click', function() {
        if (mapContainer.style.display === 'none') {
          mapContainer.style.display = 'block';
          map.relayout();
        } else {
          mapContainer.style.display = 'none';
        }
      });
  
      function displayMarker(coords) {
        var marker = new kakao.maps.Marker({
          map: map,
          position: coords
        });
      }
    </script>


</body>

</html>