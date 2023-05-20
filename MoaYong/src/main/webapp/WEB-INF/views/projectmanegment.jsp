<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문서</title>
</head>

<body>

    <style>
        /* CSS 스타일 */

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
            margin-right: 5px;
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

        #comment {
            font-weight: bold;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        #incomment {
            font-weight: bold;
            margin-bottom: 10px;
        }

        #incom {
            background-color: purple;
        }

        .comment-wrapper {
            margin-bottom: 5px;
        }
        
        .comment-options {
            display: inline-block;
            margin-left: 5px;
        }
        
        .edit-comment {
            color: blue;
            cursor: pointer;
        }
        
        .delete-comment {
            color: red;
            cursor: pointer;
        }
    </style>

    <form action="">
        <div id="category">카테고리 :
            <div id="writer">작성자 : </div>
            <div id="date">날짜 : </div>
        </div>

        <div id="comment">댓글</div>

        <div id="recruit">모집인원 : </div>

        <br>
        <br>

        <textarea placeholder="내용을 입력해주세요."></textarea><br>
        <button>댓글</button>
        <button id="incom">레이드 참가</button>

        <div id="incomment">댓글</div><br>
        <div id="incomment-section">
        </div><br><br><br><br>
        <input type="text" id="incomment-input" placeholder="댓글을 입력하세요."><br>
        <button id="incomment-btn">댓글 등록</button>
        
        <!-- 여기에 댓글이 동적으로 추가됩니다 -->

        <br><br>

    </form>

    <script>
        // 자바스크립트 코드
        const incommentBtn = document.getElementById("incomment-btn");
        const incommentInput = document.getElementById("incomment-input");
        const incommentSection = document.getElementById("incomment-section");

        incommentBtn.addEventListener("click", addIncomment);

        function addIncomment(event) {
            event.preventDefault();
            const incomment = incommentInput.value;
            const incommentWrapper = createCommentWrapper("사용자", incomment);
            incommentSection.appendChild(incommentWrapper);
            incommentInput.value = "";
        }

        function createCommentWrapper(username, comment) {
            const wrapper = document.createElement("div");
            wrapper.classList.add("comment-wrapper");

            const userLabel = document.createElement("span");
            userLabel.innerText = username + ": ";
            wrapper.appendChild(userLabel);

            const commentText = document.createElement("span");
            commentText.innerText = comment;
            wrapper.appendChild(commentText);
            
            const optionsDiv = document.createElement("div");
            optionsDiv.classList.add("comment-options");
            wrapper.appendChild(optionsDiv);

            const editLink = document.createElement("span");
            editLink.innerText = "수정";
            editLink.classList.add("edit-comment");
            editLink.addEventListener("click", () => editComment(commentText));
            optionsDiv.appendChild(editLink);

            const deleteLink = document.createElement("span");
            deleteLink.innerText = "삭제";
            deleteLink.classList.add("delete-comment");
            deleteLink.addEventListener("click", () => deleteComment(wrapper));
            optionsDiv.appendChild(deleteLink);

            return wrapper;
        }
        
        function editComment(commentText) {
            const newComment = prompt("댓글을 수정하세요:", commentText.innerText);
            if (newComment !== null && newComment !== "") {
                commentText.innerText = newComment;
            }
        }
        
        function deleteComment(commentWrapper) {
            if (confirm("정말로 이 댓글을 삭제하시겠습니까?")) {
                commentWrapper.parentNode.removeChild(commentWrapper);
            }
        }
    </script>
</body>

</html>


</body>
</html>