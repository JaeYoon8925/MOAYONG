<%@page import="com.smhrd.entity.JoinParty"%>
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
	<%
	List<JoinParty> joinList = (List<JoinParty>) request.getAttribute("joinList");
	%>

	<table border="1">
		<thead>
			<tr>
				<td>참가자 아이디</td>
				<td>평가하기</td>
			</tr>
		</thead>
		<tbody>
			<%
			if (joinList != null) {
			%>
			<%
			for (JoinParty vo : joinList) {
			%>
			<tr>
				<td><%=vo.getT_id()%></td>
				<td>
					<button class="eval_btn">평가하기</button>
					<form class="eval_form" action="submit_eval_participant.do" method="POST"
						style="display: none;">
						<select name="prj_rating">
							<%
							for (int i = 1; i <= 5; i++) {
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
							}
							%>
						</select> <input type="hidden" name="t_id" value="<%=vo.getT_id()%>">
						<input type="hidden" name="prj_seq" value="<%=vo.getPrj_seq()%>">
						<input type="hidden" name="p_seq" value="<%=vo.getP_seq()%>">
						<button type="submit">제출</button>
					</form>
				</td>
			</tr>
			<%
			}
			%>
			<%
			} else {
			%>
			<tr>
				<td>데이터가 없습니다.</td>
			</tr>
			<%
			}
			%>
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
					$.ajax({
						url : form.attr('action'),
						method : form.attr('method'),
						data : form.serialize(),
						success : function(response) {
							console.log(response);
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