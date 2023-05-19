
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 내용</title>
</head>

<body>



	<h1>게시글 내용</h1>
	<table>
		<tr>
			<td>글번호:</td>
			<td>${viewPostContent.prj_seq}</td>
		</tr>
		<tr>
			<td>제목:</td>
			<td>${viewPostContent.prj_name}</td>
		</tr>
		<tr>
			<td>상태:</td>
			<td >${viewPostContent.status}</td>
		</tr>
		<tr>
			<td>게시자:</td>
			<td >${viewPostContent.t_id}</td>
		</tr>
		<tr>
			<td>마감일:</td>
			<td>${viewPostContent.end_dt}</td>
		</tr>
		<tr>
			<td>모집현황:</td>
			<td>${viewPostContent.join_count} /
				${viewPostContent.recruit_count}</td>
		</tr>
	</table>

	<br>

	<p>내용:</p>
	<p id="post">${viewPostContent.post}</p>

	<br>

	<!-- <p>작성자: ${viewPostContent.t_id} 님</p> -->



	<!-- 작성자 본인에게만 보이게  -->
    <form action="">
	<textarea name="post" placeholder="내용을 입력해주세요."></textarea>
	<br>
	<button type="submit" id="register">댓글달기</button>
    </form>

	<form action="goModifyPost.do">
    <input type="hidden" name="prj_seq" value="${viewPostContent.prj_seq}">
    <input type="hidden" name="prj_name" value="${viewPostContent.prj_name}">
    <input type="hidden" name="recruit_count" value="${viewPostContent.recruit_count }">
    <input type="hidden" name="end_dt" value="${viewPostContent.end_dt }">
    <input type="hidden" name="post" value="${viewPostContent.post }">
	<button type="submit" id="btn">수정</button>
	</form>
	
	<form action="deletePost.do">
	<input type="hidden" name="prj_seq" value="${viewPostContent.prj_seq}">
	<button type="submit" id="deletebtn">삭제</button>
	</form>

	<!-- 스크립트 태그 -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript">
        //var escBtn = document.getElementById("esc");
        //escBtn.addEventListener('click', () => {
          //alert("취소 완료");
        //});        
    </script>

</body>
</html>