<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기성적관리</title>
</head>
<script>
	function check(){
		if(f.player_name.value==""){
			alert("선수이름이 입력되지 않았습니다.");
			return f.player_name.focus();
		}
		if(f.player_phone.value==""){
			alert("연락처가 입력되지 않았습니다.");
			return f.player_phone.focus();
		}
		if(f.player_birth.value==""){
			alert("생년월일이 입력되지 않았습니다.");
			return f.player_birth.focus();
		}
		f.submit();
	}
</script>
<body>
	<%@ include file="header.jsp" %>
	<%
		sql=" select player_no,player_name,team_no,player_phone,";
		sql+=" to_char(player_birth,'yy/mm/dd') player_birth,player_email,back_no";
		sql+=" from player_tbl_09";
		sql+=" where player_no=?";
		ps=con.prepareStatement(sql);
		ps.setString(1, request.getParameter("player_no"));
		rs=ps.executeQuery();
		rs.next();
	%>
	<section>
		<div>
			<h2>선수 수정</h2>
		</div>
		<form action="updatepro.jsp" method="post" name="f">
			<table style="margin: 0 auto;" border="1" width="400">
				<tr>
					<th>선수번호</th>
					<td><input type="text" name="player_no" value="<%=rs.getString("player_no") %>" size="15" maxlength=""></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="player_name" value="<%=rs.getString("player_name") %>" size="15" maxlength="20"></td>
				</tr>
				<tr>
					<th>소속팀번호</th>
					<td><input type="text" name="team_no" value="<%=rs.getString("team_no")!=null?rs.getString("team_no"):"" %>" size="15" maxlength=""></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="player_phone" value="<%=rs.getString("player_phone") %>" size="15" maxlength="14"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" name="player_birth" value="<%=rs.getString("player_birth") %>" size="15"></td>
				</tr>
				<tr>
					<th>메일주소</th>
					<td><input type="text" name="player_email" value="<%=rs.getString("player_email")!=null?rs.getString("player_email"):"" %>" size="15" maxlength="50"></td>
				</tr>
				<tr>
					<th>등번호</th>
					<td><input type="text" name="back_no" value="<%=rs.getString("back_no")!=null?rs.getString("back_no"):"" %>" size="15"></td>
				</tr>
			</table>
			<center>
				<input type="submit" value="수정" onclick="check(); return false">&nbsp;
				<input type="button" value="조회" onclick="location='select.jsp'">
			</center>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>