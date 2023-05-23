<%@page import="com.smhrd.entity.Project"%>
<%@page import="com.smhrd.entity.Evaluation"%>
<%@page import="com.smhrd.entity.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% User user = (User) session.getAttribute("user"); %>
	<% Project view_leader = (Project) request.getAttribute("view_leader");	%>

	<table border="1">
		<thead>
			<tr>
				<td>팀장 아이디</td>
				<td>평가하기</td>
			</tr>
		</thead>
		<tbody>

			<tr>
				<td><%=view_leader.gett_Id()%></td>
				<% if(view_leader.gett_Id()!=null){ %>
				<td>
					<button class="eval_btn">평가하기</button>
					<form class="eval_form" action="submit_eval_leader.do" method="POST"
						style="display: none;">
						<select name="ev_rating">
							<%
							for (int i = 1; i <= 5; i++) {
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
							}
							%>
						</select> <input type="hidden" name="t_id" value="<%=user.getT_id()%>">
						<input type="hidden" name="prj_seq" value="<%=view_leader.getPrj_seq()%>">
						<input type="hidden" name="leader_id" value="<%=view_leader.gett_Id() %>">
						<button type="submit">제출</button>
					</form>
				</td>
			</tr>
<%}else{ %>
			<tr>
				<td>데이터가 없습니다.</td>
			</tr>
			<%} %>

		</tbody>
	</table>

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.eval_btn').on('click', function() {
				var form = $(this).next('.eval_form');
				form.css('display', 'block');
				form.find('select').focus();
			});

			$('.eval_form').on('submit', function(e) {
				e.preventDefault();
				var form = $(this);
				var confirmMessage = "평가 완료";
				if (confirm(confirmMessage)) {
					var ev_rating = form.find('select[name=ev_rating]').val();
				      var t_id = form.find('input[name=t_id]').val();
				      var prj_seq = form.find('input[name=prj_seq]').val()
				      var leader_id = form.find('input[name=leader_id]').val()
				      console.log(ev_rating);
				      console.log(t_id);
				      console.log(prj_seq);
				      console.log(leader_id);
					$.ajax({
						url : form.attr('action'),
						method : form.attr('method'),
						data : form.serialize(),
						success : function(response) {
							console.log("전송완료");
							form.css('display', 'block');
							form.find('select').focus();
						},
						error : function(e) {
							console.error("띠바");
						}
					});
				}
				return false;
			});
		});
	</script>
</body>
</html>