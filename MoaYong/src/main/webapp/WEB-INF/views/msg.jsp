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
/* 폼 스타일 */
form {
  margin-bottom: 20px;
}

/* 테이블 스타일 */
table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

table th,
table td {
  padding: 10px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

table th {
  font-weight: bold;
}

table td input[type="checkbox"] {
  margin: 0;
}

/* 텍스트영역 스타일 */
textarea {
  width: 100%;
  resize: vertical;
}

/* 버튼 스타일 */
button {
  padding: 10px 20px;
  background-color: #337ab7;
  color: #fff;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

button:hover {
  background-color: #23527c;
}

/* 폼 레이아웃 스타일 */
.spotlight {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.spotlight .content {
  flex-grow: 1;
  margin-right: 20px;
}

.spotlight .content h2 {
  margin-bottom: 10px;
}

.spotlight .content table {
  margin-bottom: 10px;
}

.spotlight .content textarea {
  height: 200px;
}

</style>


<form action="">
    <div class="spotlight">
      <div class="content">
        <h2>받은 쪽지함</h2>
        <table>
          <thead>
            <tr>
              <th>No.</th>
              <th>제목</th>
              <th>발신인</th>
              <th>삭제</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>집가
                고싶다</td>
              <td>김</td>
              <td><input type="checkbox" name="del" value="del"></td>
              <td>1</td>
              <td>집가고싶다</td>
              <td>김</td>
              <td><input type="checkbox" name="del" value="del"></td>
            </tr>
            
          </tbody>
        </table>
      </div>
      <div class="content">
        <h2>ID 선택</h2>
        <input type="radio" name="message" value="teammsg"> gfgfew<br>
        <input type="radio" name="message" value="teammsg"> asdf<br>
        <input type="radio" name="message" value="teammsg"> asef<br>
      </div>
      <div class="content">
        <h2>메시지 작성</h2>
        <textarea name="recipient" cols="30" rows="10"></textarea>
      </div>
    </div>
    <div style="text-align: right;">
      <button>전송</button>
    </div>
  </form>

<script>

</script>


</body>
</html>