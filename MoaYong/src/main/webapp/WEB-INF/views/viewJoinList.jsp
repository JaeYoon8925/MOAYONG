<%@page import="com.smhrd.entity.JoinParty"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
	<%
	List<JoinParty> joinList = (List<JoinParty>) request.getAttribute("joinList");
	%>

	<table border="1">
		<thead>
			<tr>
				<td>참가자 아이디</td>
				<td>참가 상태</td>
				<td>수락</td>
				<td>거절</td>
			</tr>
		</thead>
		<tbody>
			<%if (joinList != null) {%>
				<% for (JoinParty vo: joinList) {%>
			<tr>
				<td><%=vo.getT_id()%></td>
				<td><span id="join_ok_<%=vo.getT_id()%>"><%=vo.getJoin_ok()%></span></td>
				<td><button
						onclick="joinOk(<%=vo.getP_seq()%>, <%=vo.getPrj_seq()%>, '<%=vo.getT_id()%>');">수락</button></td>
				<td><button
						onclick="joinNo(<%=vo.getP_seq()%>, <%=vo.getPrj_seq()%>, '<%=vo.getT_id()%>');">거절</button></td>
			</tr>
			<% }%>
			<% } else { %>
			<tr>
				<td >데이터가 없습니다.</td>
			</tr>
			<%}	%>
		</tbody>





		<script>
		function joinOk(p_seq, prj_seq, t_id,join_ok) {
			var tq = new XMLHttpRequest();
			var url = 'joinCount.do';
			
			var data = 'prj_seq=' + encodeURIComponent(prj_seq) +
			  		   '&t_id=' + encodeURIComponent(t_id) +
			  		   '$join_ok' + + encodeURIComponent(join_ok);
			console.log(data);
			tq.open('POST', url, true);
			tq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			tq.onreadystatechange = function() {
				if (tq.readyState === XMLHttpRequest.DONE) {
			      if (tq.status === 200) {
			    	console.log("join_count 업데이트 성공");
			        callJoinOk(p_seq, prj_seq, t_id);
			        } else {
			        	console.log("join_count 업데이트 실패");
			        }
				}
			};
			tq.send(data);
		}
		

			function callJoinOk(p_seq, prj_seq, t_id) {
				var tq = new XMLHttpRequest();
				var url = 'joinOk.do';

				var data = 'p_seq=' + encodeURIComponent(p_seq) +
		  		           '&prj_seq=' + encodeURIComponent(prj_seq) +
			               '&t_id=' + encodeURIComponent(t_id);

				tq.open('POST', url, true);
				tq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				tq.onreadystatechange = function() {
					if (tq.readyState === XMLHttpRequest.DONE) {
						if (tq.status === 200) {
							document.getElementById('join_ok_' + t_id).innerText = '참가수락';
							console.log("joinOk.do 호출 성공");
						} else {
						  console.log("joinOk.do 호출 실패");
						}
					}
				};
				tq.send(data);
			}

			function joinNo(p_seq, prj_seq, t_id) {
				var tq = new XMLHttpRequest();
				var url = 'joinDisCount.do'; 

				var data = 'prj_seq=' + encodeURIComponent(prj_seq);
				           '&t_id=' + encodeURIComponent(t_id);

				tq.open('POST', url, true);
				tq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				tq.onreadystatechange = function() {
					if (tq.readyState === XMLHttpRequest.DONE) {
						if (tq.status === 200) {
							console.log("join_count 업데이트 성공");
							callJoinNo(p_seq, prj_seq, t_id);
						}else{
							console.log("join_count 업데이트 실패");
						}
					}
				};
				tq.send(data);
			}

			function callJoinNo(p_seq, prj_seq, t_id) {
				var tq = new XMLHttpRequest();
				var url = 'joinNo.do'; 

				var data = 'p_seq=' + encodeURIComponent(p_seq) +
						   '&prj_seq=' + encodeURIComponent(prj_seq) +
						   '&t_id=' + encodeURIComponent(t_id);

				tq.open('POST', url, true);
				tq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				tq.onreadystatechange = function() {
					if (tq.readyState === XMLHttpRequest.DONE) {
						if (tq.status === 200) {
							document.getElementById('join_ok_' + t_id).innerText = '참가거절';
							console.log("joinNo.do 호출 성공");
						} else {
							console.log("joinNo.do 호출 실패");
						}
					}
				};
				tq.send(data);
				}
		</script>

</body>
</html>