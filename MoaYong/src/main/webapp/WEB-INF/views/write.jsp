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

#esc {
	margin-right: 3px;
}

#title {
	font-weight: bold;
	margin-top: 20px;
	margin-bottom: 10px;
}

#title input[type=text] {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
</style>
	<!-- 폼 태그 -->
	<form action="writePost.do" method="post">
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
			제목 : <input name="prj_name" type="text" placeholder="제목을 입력하세요">
		</div>

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

		<div>
			모집인원 : <input name="recruit_count" type="text"
				placeholder="모집인원을 입력하세요">
		</div>

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
		<input type="file"> <br>

		
		<div>
			<input type="text" id="mapSearch" placeholder="지도 검색어를 입력하세요">
			<button id="mapBtn" type="button">검색</button>
		</div>

		<div id="map" style="width: 300px; height: 200px;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66b7264945f08eec5af71755a23a6285&libraries=services"></script>
		<script>
      var mapContainer = document.getElementById('map'); // 지도를 표시할 div
      var mapOption = {
        center: new kakao.maps.LatLng(37.5665, 126.9780), // 지도 중심좌표 (서울시청)
        level: 8 // 지도 확대 레벨
      };
    
      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
    
      var geocoder = new kakao.maps.services.Geocoder();
    
      var searchKeyword = document.getElementById('mapSearch');
      var searchButton = document.getElementById('mapBtn');
    
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
    
      function displayMarker(coords) {
        var marker = new kakao.maps.Marker({
          map: map,
          position: coords
        });
      }
    </script>






		<br> <br>
		<textarea name="post" placeholder="내용을 입력해주세요."></textarea>
		<br> <a><c items="${user}" var="user">${user.nickname}님</a>
		<button type="submit" id="register">게시</button>
		<button id="esc">취소</button>


	</form>



	<!-- 스크립트 태그 -->
	<script>
       // var registerbtn = document.getElementById("register");
        // registerbtn.addEventListener('click', () => {
           // alert("게시 완료")
       // })
        var registerbtn = document.getElementById("esc");
        registerbtn.addEventListener('click', () => {
            alert("취소 완료")
        })



    </script>











</body>
</html>