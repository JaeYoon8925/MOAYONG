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
            margin-top: 50px;
        }

        button:hover {
            background-color: #3e8e41;
        }

        #category {
            font-weight: bold;
            margin-top: 20px;
            margin-bottom: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        #writer,
        #date {
            display: inline-block;
            width: 33.33%;
        }

        #recruit {
            font-weight: bold;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        #incomment {
            display: inline-block;
            width: 50%;
            margin-bottom: 10px;
        }

        #comment {
            font-weight: bold;
            display: inline-block;
            width: 50%;
            margin-bottom: 40px;
        }
   



        #incom {
            margin-right: 3px;
        }
    </style>



<form action="">

        <div id="category">카테고리 :
            <div id="wirter">작성자 : </div>
            <div id="date">날짜 : </div>
        </div>


        <div id="recruit">모집인원 : </div>

        <br>
        <br>

        <textarea placeholder="내용을 입력해주세요."></textarea><br>


        <div id="comment">댓글</div>
        <div id="incomment">참가댓글</div>
        <button>댓글</button>
        <button id="incom">참가댓글</button>
    </form>



    <script>
    
    
    </script>

</body>
</html>