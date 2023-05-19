<%@page import="com.smhrd.entity.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 스타일 태그 -->
	<style>
body {
	font-family: Arial, sans-serif;
	font-size: 16px;
	color: #333;
}

form {
	max-width: 600px;
	margin: 0 auto;
}

table {
	margin-bottom: 20px;
}

input[type=text], select {
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-bottom: 10px;
	width: 100%;
}

input[type=date] {
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-bottom: 10px;
	width: 45%;
}

textarea {
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-bottom: 10px;
	width: 100%;
	height: 200px;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 8px 16px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: right;
}

button:hover {
	background-color: #3e8e41;
}

#title, #date, #recruit, #image, #map {
	font-weight: bold;
	margin-bottom: 10px;
}

#title, #date, #recruit {
	margin-top: 20px;
}

.col-6 {
	float: right;
}

#font, #font_size, #color {
	font-weight: bold;
	width: 195.54px;
	margin-bottom: 10px;
}

#chanbtn {
	margin-right: 2%;
}
</style>
	<!-- 폼 태그 -->
	<form action="savePost.do" method="post">
		<input type="hidden" name="prj_seq" value="${prj_seq }">
		<table>
			<tr>
				<td><select name="prj_category">
						<option value="" selected disabled>카테고리 검색</option>
						<option value="프로그래밍">프로그래밍</option>
						<option value="전시회">전시회</option>
						<option value="게임">게임</option>
						<option value="스터디">스터디</option>
				</select> <!-- <input type="text" name="search_keyword" placeholder="검색어를 입력하세요"> -->
				</td>
			</tr>
		</table>
		<div id="title">
			제목 : <input name="prj_name" type="text" value="${prj_name}">
		</div>

		<div id="status">프로젝트 상태여부</div>
		<select name="status">
			<option value="" selected disabled>프로젝트 상태 골라</option>
			<option value="모집중">모집중</option>
			<option value="모집완료">모집완료</option>
			<option value="진행중">진행중</option>
			<option value="완료">완료</option>
		</select>
		<div id="date" class="row gtr-uniform">
			날짜정보입력
			<div class="col-6 col-12-xsmall">
				모집마감일 : <input name="deadline_dt" type="date">
			</div>
			<div class="col-6">
				프로젝트시작일 : <input name="start_dt" type="date">
			</div>
			<div class="col-6">
				프로젝트종료일 : <input name="end_dt" type="date">
			</div>
		</div>

		<br>

		<div id="">모집인원 : <input name="recruit_count" type="text" value="${recruit_count}"></div>
			

		<table>
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
		</table>

		<div>이미지 첨부 :</div>
		<input type="file">

		<div>지도 첨부 :</div>
		<input type="file"> <br> <br>
		<textarea name="post" placeholder="내용을 입력해주세요.">${post}</textarea>
		<br> <br>

		<button type="submit">수정완료</button>
	</form>



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
</body>



</body>
</html>