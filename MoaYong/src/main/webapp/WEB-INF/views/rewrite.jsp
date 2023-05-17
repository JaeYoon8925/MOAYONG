<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        input[type=text],
        select {
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

        #title,
        #date,
        #recruit,
        #image,
        #map {
            font-weight: bold;
            margin-bottom: 10px;
        }

        #title,
        #date,
        #recruit {
            margin-top: 20px;
        }

        .col-6 {
            float: right;
        }

        #font,
        #font_size,
        #color {
            font-weight: bold;
            width: 195.54px;
            margin-bottom: 10px;
        }
        #chanbtn{
            margin-right: 2%;
        }
    </style>
    <!-- 폼 태그 -->
    <form action="">
        <table>
            <tr>
                <td>
                    <select id="search_category">
                        <option value="category">카테고리 검색</option>
                        <option value="develop">개발</option>
                        <option value="translation">번역</option>
                        <option value="design">그림/디자인</option>
                        <option value="video_editing">영상/편집</option>
                        <option value="planning_marketing">기획/마케팅</option>
                        <option value="others">기타</option>
                    </select>
                    <input type="text" name="search_keyword" placeholder="검색어를 입력하세요">
                </td>
            </tr>
        </table>

        <div id="title">제목 :</div>
        <input type="text" placeholder="제목을 입력하세요">

        <div id="date" class="row gtr-uniform">날짜정보입력
            <div class="col-6 col-12-xsmall">
                시작일 : <input type="date">
            </div>
            <div class="col-6">
                마감일 : <input type="date">
            </div>
        </div>

        <br>

        <div id="">모집인원 :</div>
        <input type="text" placeholder="모집인원을 입력하세요">

        <table>
            <tr>
                <td>
                    <select id="font">
                        <option value="default">글씨체</option>
                        <option value="serif">Serif</option>
                        <option value="sans-serif">Sans-serif</option>
                        <option value="monospace">Monospace</option>
                    </select>

                    <select id="font_size">
                        <option value="default">글씨 크기</option>
                        <option value="small">작게</option>
                        <option value="medium">보통</option>
                        <option value="large">크게</option>
                    </select>

                    <select id="color">
                        <option value="default">색상</option>
                        <option value="red">빨강</option>
                        <option value="green">초록</option>
                        <option value="blue">파랑</option>
                    </select>
                </td>
            </tr>
        </table>

        <div>이미지 첨부 :</div>
        <input type="file">

        <div>지도 첨부 :</div>
        <input type="file">

        <br>
        <br>
        <textarea placeholder="내용을 입력해주세요."></textarea><br>
        <button id="regibtn">게시</button>
        
        <button id="chanbtn">수정</button>


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