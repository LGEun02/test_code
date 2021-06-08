<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<section>
		<div>
			<h2>회원목록조회/수정</h2>
		</div>
		<div>
			<table style="margin: 0 auto;" border="1" width="700">
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>가입일자</th>
					<th>고객등급</th>
					<th>거주지역</th>
				</tr>
	<%
		sql=" select custno,custname,phone,address,";
		sql+=" to_char(joindate,'yyyy-mm-dd') joindate,";
		sql+=" decode(grade, 'A','VIP','B','일반','C','직원') grade,city";
		sql+=" from member_tbl_02";
		rs=stmt.executeQuery(sql);
		
		while(rs.next()){
	%>
				<tr>
					<td><a href="update.jsp?custno=<%=rs.getString("custno") %>"><%=rs.getString("custno") %></a></td>
					<td><%=rs.getString("custname") %></td>
					<td><%=rs.getString("phone") %></td>
					<td><%=rs.getString("address") %></td>
					<td><%=rs.getString("joindate") %></td>
					<td><%=rs.getString("grade") %></td>
					<td><%=rs.getString("city") %></td>
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