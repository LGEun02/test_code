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
			<h2>경기결과조회</h2>
		</div>
		<div>
			<table style="margin: 0 auto;" border="1" width="700">
				<tr>
					<th>경기번호</th>
					<th>득점</th>
					<th>경고수</th>
					<th>퇴장수</th>
				</tr>
	<%
		sql=" select match_no, sum(player_score) player_score,";
		sql+=" sum(yellow_card) yellow_card, sum(red_card) red_card";
		sql+=" from record_tbl_09";
		sql+=" group by match_no";
		sql+=" order by 1";
		rs=stmt.executeQuery(sql);
		
		while(rs.next()){
	%>
				<tr>
					<td><%=rs.getString("match_no") %></td>
					<td><%=rs.getString("player_score") %></td>
					<td><%=rs.getString("yellow_card") %></td>
					<td><%=rs.getString("red_card") %></td>
				</tr>
	<%
		}
	%>			
			</table>
		</div>
			<table style="margin: 0 auto;" width="700">
	<%
		sql=" select player_no, player_name, player_score||'골' player_score";
		sql+=" from player_tbl_09 natural join (select player_no, sum(player_score) player_score,";
				sql+=" rank() over(order by sum(player_score) desc,";		
						sql+=" sum(yellow_card),sum(red_card)) rank";		
				sql+=" from record_tbl_09";		
				sql+=" group by player_no)";		
		sql+=" where rank=1";
		rs=stmt.executeQuery(sql);
		
		while(rs.next()){
	%>
				<tr>
					<td>최우수 순서 <%=rs.getString("player_no") %></td>
					<td><%=rs.getString("player_name") %></td>
					<td><%=rs.getString("player_score") %></td>
				</tr>
	<%
		}
	%>					
			</table>
		
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>