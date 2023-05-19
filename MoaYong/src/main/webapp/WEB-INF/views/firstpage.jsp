<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- ajax 비동기 통신에 필요-->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<noscript>
	<link rel="stylesheet" href="../assets/css/noscript.css" />
</noscript>



<title>Firstpage</title>

</head>

<body>




	<style>
body {
	background-image:
		url("https://ts2.mm.bing.net/th?q=%EC%97%B0%ED%95%9C%20%EB%B3%B4%EB%9D%BC%EC%83%89&w=154&h=288");
	background-repeat: no-repeat;
	background-size: cover;
}

.main {
	/* rgba(0~255, 0~255, 0~255, 0~1)
               a : 1에 가까워질수록 색깔이 선명해진다 */
	background-color: rgb(255, 255, 255, 0.4);
	width: 400px;
	padding: 50px;
	border-radius: 50px;
	/* div요소 가운데 정렬 */
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	/* 내부 가운데 정렬 */
	text-align: center;
}

.main>h1 {
	margin-top: 0;
}

.user-input {
	width: 200px;
	height: 30px;
	border: 0;
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 10px;
}

#login-button {
	background-color: rgb(255, 255, 255);
	width: 200px;
	height: 50px;
}

#sign-button {
	background-color: rgb(255, 255, 255);
}

#reset-button {
	background-color: rgb(255, 255, 255);
}

#sign-button {
	background-color: rgb(95, 18, 18);
	transition: background-color 0.5s ease-in-out;
}

#sign-button:hover {
	background-color: rgb(25, 40, 126);
}

#login-button {
	background-color: rgb(255, 255, 255);
	transition: background-color 0.5s ease-in-out;
}

#login-button:hover {
	background-color: rgb(200, 200, 200);
}

#reset-button {
	background-color: rgb(255, 255, 255);
	transition: background-color 0.5s ease-in-out;
}

#reset-button:hover {
	background-color: rgb(200, 200, 200);
}
</style>
</head>

<body>

	<!--modal-->

	<!-- sign modal-->
	<dialog id="sign">
	<form action="join.do" method="post">
		<label for="username">ID:</label> <input type="text" id="username"
			name="t_id" required><br>

		<button type="submit">중복검사</button>
		<br> <label for="password">Pw:</label> <input type="password"
			id="password" name="pw" required><br> <label for="email">email:</label>
		<input type="text" id="email" name="email" require><br>

		<labelfor="nickname">Nick:</label> <input type="text" id="nickname"
			name="nickname" required> <br>

		<button type="submit">Submit</button>
	</form>
	</dialog>


	<!-- reset modal-->
	<dialog id="reset">
	<form action="searchInfo.do" method="post">

		<label for="reset-id ">ID::</label> <input type="text" id="id"
			name="t_id" required><br> <label for="reset-email">Email:</label>
		<input type="email" id="reset-email" name="email" required><br>

		<button type="submit">Submit</button>

	</form>
	</dialog>


	<div class="main">
		<h1>Login</h1>


		<form action="login.do" method="post">
			<div id="result-area">ID</div>
			<input type="text" class="user-input" name="t_id">

			<div id="chance-area">Password</div>
			<input type="text" class="user-input" name="pw">

			<div class="button-area">
				<button id="login-button">Login</button>
		</form>


		<br> <br>


	</div>
	<button id="sign-button">회원가입</button>

	<button id="reset-button">회원찾기</button>

	<script>
		var joinCom = '${joinComplete}';
		if (joinCom === "회원가입 완료!") {
			alert("회원가입 완료!");
		}

		$('#sign-button').on('click', function() {
			sign.showModal();
		});

		$('#reset-button').on('click', function() {
			reset.showModal();
		});
	</script>
</body>

</html>