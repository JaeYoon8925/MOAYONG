<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



   <style>
/* 게시판 컨테이너 */
.spotlight {
  background-color: #f5f5f5;
  padding: 20px;
  border-radius: 5px;
}

/* 게시판 내용 */
.spotlight .content {
  margin-bottom: 20px;
}

/* 게시판 제목 */
.spotlight h2 {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 10px;
}

/* 테이블 스타일 */
.spotlight table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 10px;
}

.spotlight table th,
.spotlight table td {
  padding: 10px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

.spotlight table th {
  font-weight: bold;
}

/* 게시판 링크 */
.spotlight table td a {
  color: #337ab7;
  text-decoration: none;
}

.spotlight table td a:hover {
  text-decoration: underline;
}

/* 단두대 라디오 버튼 */
.spotlight p {
  margin-bottom: 10px;
}

.spotlight input[type="radio"] {
  margin-right: 5px;
}

/* 업로드 버튼 */
.spotlight button {
  padding: 10px 20px;
  background-color: #337ab7;
  color: #fff;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

.spotlight button:hover {
  background-color: #23527c;
}


    </style>



<form action="">
    <div class="spotlight">
        <div class="content">
            <h2>산출물</h2>

            <table>
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>산출물</th>
                        <th>게시자</th>
                        <th>단두대</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td><a href="/posts/1">첫 번째 게시물</a></td>
                        <td>작성자1</td>
                        <td>
                        <input type="radio" name="scaffold" value="approve">승인
                        <input type="radio" name="scaffold" value="reject">거절<br>
                        </td>
                    </tr>
                </tbody>
            </table>

            <div style="text-align: right;">
            <button id="regibtn">업로드하기</button>
        </div>
    </div>
</form>






    <script>

var registerbtn = document.getElementById("regibtn");
        registerbtn.addEventListener('click', () => {
            alert("업로드 완료")
        })

    </script>






</body>
</html>