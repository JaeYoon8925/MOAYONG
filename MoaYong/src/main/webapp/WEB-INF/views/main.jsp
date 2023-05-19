<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="main.java.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 태그라이브러리 추가★★★★★★★★ -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>

<head>
<title>Generic - Stellar by HTML5 UP</title>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
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
<!-- ajax 비동기 통신에 필요-->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="/assets/css/noscript.css" />
</noscript>


</head>


<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<div id="topheader">
			<a><c items="${user}" var="user">${user.nickname}님</a>
			<form action="logout.do">
				<!-- 수정해야함 href -->
				<button type="submit" id="logout-btn">로그아웃</button>
			</form>
			<form action="goMypage.do">
				<!-- 수정해야함 href -->
				<button type="submit" id="mypage-btn">마이페이지</button>
				<a href="index.html">
			</form>
			<div class="image">
				<img src="/images/pic01.jpg" alt="" />
			</div>
			</a>
		</div>

		<!-- Header -->
		<header id="header">
			<h1>Generic</h1>
			<p>Ipsum dolor sit amet nullam</p>
		</header>

		<!-- Main -->
		<div id="main">

			<!-- Content -->
			<section id="content" class="main">
				<form action="searchPost.do" methond="post">
					<table border="1">
						<tr>
							<td><select name="prj_category" class="col-6">
									<option value="" selected disabled>카테고리 검색</option>
									<option value="모두" type="text">모두보기</option>
									<option value="프로그래밍" type="text">프로그래밍</option>
									<option value="전시회" type="text">전시회</option>
									<option value="게임" type="text">게임</option>
									<option value="스터디" type="text">스터디</option>
							</select> <input type="text" name="prj_name" class="col-6"></td>
						</tr>
					</table>
					<!--      <button type="submit" id="open">최신순</button> -->
					<!--      <button type="submit" id="close">마감임박순</button> -->
					<button type="submit" id="search">검색</button>
				</form>
				<br>
				<table border="1">
					<thead>
						<tr>
							<th>No.</th>
							<th>카테고리</th>
							<th>모집중</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>마감일</th>
							<th>모집인원</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty searchPost}">
								<c:forEach items="${searchPost}" var="searchPost">
									<tr>
										<td>${searchPost.prj_seq }</td>
										<td>${searchPost.prj_category }</td>
										<td>${searchPost.status }</td>
										<td><a
											href="viewPostContent.do?prj_seq=${searchPost.prj_seq}">${searchPost.prj_name}</a></td>
										<td>${searchPost.t_id}</td>
										<td>${searchPost.post_dt}</td>
										<td>${searchPost.end_dt}</td>
										<td>${searchPost.recruit_count}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="list">
									<tr>
										<td>${list.prj_seq }</td>
										<td>${list.prj_category }</td>
										<td>${list.status }</td>
										<td><a href="viewPostContent.do?prj_seq=${list.prj_seq}">${list.prj_name}</a></td>
										<td>${list.t_id}</td>
										<td>${list.post_dt}</td>
										<td>${list.end_dt}</td>
										<td>${list.recruit_count}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>

						<!-- 이하 생략 -->
					</tbody>
				</table>
				<br> <br> <a href="goWritePost.do"><button id="writer">글쓰기</button></a>

				<%
				BoardDAO paging = new BoardDAO();
				int count = paging.getBoardCount(); //게시판 전체 글 개수 가져오기
				int pageSize = 10; //한 페이지 보여줄 글 개수 설정

				//현페이지 번호 가져오기
				String pageNum = request.getParameter("pageNum");
				//파라미터가 없으면 "1"로 설정
				if (pageNum == null) {
					pageNum = "1";
				}

				int currentPage = Integer.parseInt(pageNum);
				int startRow = (currentPage - 1) * pageSize + 1;
				int endRow = currentPage * pageSize;
				%>
				<h1>
					boarder/list.jsp [전체 글개수 :
					<%=count%>]
				</h1>

				<!-- 페이지 이동 버튼 -->
				<div>
					<%
					int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
					int pageBlock = 10;
					int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
					int endPage = Math.min(startPage + pageBlock - 1, pageCount);
					%>
					<%
					if (startPage > pageBlock) {
					%>
					<form action="GoListPage.do" methond="post">
						<a href="GoListPage.do?pageNum=<%=startPage - pageBlock%>">[이전]</a>
					</form>
					<%
					}
					%>

					<%
					for (int i = startPage; i <= endPage; i++) {
					%>
					<%
					if (i == currentPage) {
					%>
					<%=i%>
					<%
					} else {
					%>
					<form action="GoListPage.do" method="post">
						<input type="hidden" name="pageNum" value="<%=i%>">
						<button type="submit"><%=i%></button>
					</form>
					<%
					}
					%>
					<%
					}
					%>

					<%
					if (endPage < pageCount) {
					%>
					<form action="GoListPage.do" methond="post">
						<a href="GoListPage.do?pageNum=<%=startPage + pageBlock%>">[다음]</a>
					</form>
					<%
					}
					%>
				</div>


				<!-- ================================	  -->



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

	<script>
		function logInputValue() {
			var inputValue = document.getElementsByName("prj_name"[0].value);
			console.log(inputValue);
		};
		const form = document.querySelector('form');
		const rgisBtn = document.getElementById('rgis');
		const openBtn = document.getElementById('open');
		const closeBtn = document.getElementById('close');
		const aplBtn = document.getElementById('apl');

		// 이벤트 리스너 등록
		openBtn.addEventListener('click', function(e) {
			e.preventDefault();
			form.action = '/list?sort=open';
			form.submit();
		});

		closeBtn.addEventListener('click', function(e) {
			e.preventDefault();
			form.action = '/list?sort=close';
			form.submit();
		});

		aplBtn.addEventListener('click', function(e) {
			e.preventDefault();
			form.action = '/list?sort=apl';
			form.submit();
		});
	</script>

</body>

</html>