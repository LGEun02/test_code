<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기성적관리</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<section>
		<div>
			<h2>선수 조회/수정</h2>
		</div>
		<div>
			<table style="margin: 0 auto;" border="1" width="700">
				<tr>
					<th>선수번호</th>
					<th>이름</th>
					<th>소속팀번호</th>
					<th>연락처</th>
					<th>등번호</th>
					<th>생년월일</th>
				</tr>
	<%
		sql=" select player_no,player_name,team_no,player_phone,back_no,";
		sql+=" to_char(player_birth,'mm/dd') player_birth";
		sql+=" from player_tbl_09";
		sql+=" order by 5";
		rs=stmt.executeQuery(sql);
		
		while(rs.next()){
	%>
				<tr>
					<td><%=rs.getString("player_no") %></td>
					<td><a href="update.jsp?player_no=<%=rs.getString("player_no") %>"><%=rs.getString("player_name") %></a></td>
					<td><%=rs.getString("team_no")!=null?rs.getString("team_no"):"" %></td>
					<td><%=rs.getString("player_phone") %></td>
					<td><%=rs.getString("back_no")!=null?rs.getString("back_no"):"" %></td>
					<td><%=rs.getString("player_birth") %></td>
				</tr>
	<%
		}
	%>			
			</table>
		</div>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>