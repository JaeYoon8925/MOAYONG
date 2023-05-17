<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Insert title here</title>
</head>
<body>


	<style>
#rgis, #open, #close, #apl {
	background-color: rgb(0, 123, 255);
	color: white;
	border: none;
	padding: 10px 20px;
	margin-right: 10px;
	cursor: pointer;
}

#rgis:hover, #open:hover, #close:hover, #apl:hover {
	background-color: rgb(0, 103, 215);
}
</style>
</head>

<body>

	<form actiong="" >
       <table>


       </table>
        <table>
            <tr>
                <td>
                    <select name="search_category">
                        <option value="category">카테고리 검색</option>
                        <option value="reg_date">등록일</option>
                        <option value="expire_date">마감일</option>
                        <option value="end_date">종료일</option>
                        <option value="end_date">작성자</option>
                    </select>
                    <input type="text" name="search_keyword">
                    <button type="submit">검색</button>
                </td>
            </tr>
        </table>
        <div class="image">
			<img src="images/pic01.jpg" alt="" />
		</div>
        <button type="submit" id="open">최신순</button>
        <button type="submit" id="close">마감임박순</button>
        <br>
        <table>
            <thead>
              <tr>
                <th>No.</th>
                <th>모집중</th>
                <th>제목</th>
                <th>작성자</th>
                <th>등록일</th>
                <th>마감일</th>
                <th>조회수</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td><a href="/posts/1">첫 번째 게시물</a></td>
                <td>작성자1</td>
                <td>2023-05-15</td>
                <td>2023-05-17</td>
                <td>10</td>
              </tr>
              <tr>
                <td>2</td>
                <td><a href="/posts/2">두 번째 게시물</a></td>
                <td>작성자2</td>
                <td>2023-05-14</td>
                <td>2023-05-16</td>
                <td>7</td>
              </tr>
              <tr>
                <td>3</td>
                <td><a href="/posts/3">세 번째 게시물</a></td>
                <td>작성자3</td>
                <td>2023-05-13</td>
                <td>2023-05-16</td>
                <td>5</td>
              </tr>
              <!-- 이하 생략 -->
            </tbody>
          </table>
        <br><br>
        <button type="submit" id="rgis">글쓰기</button>
    </form>
    <script>
					const form = document.querySelector('form');
					const rgisBtn = document.getElementById('rgis');
					const openBtn = document.getElementById('open');
					const closeBtn = document.getElementById('close');
					const aplBtn = document.getElementById('apl');

					// 이벤트 리스너 등록
					rgisBtn.addEventListener('click', function(e) {
						e.preventDefault();
						form.action = '/register';
						form.submit();
					});

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