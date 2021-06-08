<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리</title>
</head>
<script>
	function check(){
		if(f.custno.value==""){
			alert("회원번호가 입력되지 않았습니다.");
			return f.custno.focus();
		}
		if(f.custname.value==""){
			alert("회원성명이 입력되지 않았습니다.");
			return f.custname.focus();
		}
		if(f.phone.value==""){
			alert("회원전화가 입력되지 않았습니다.");
			return f.phone.focus();
		}
		if(f.address.value==""){
			alert("회원주소가 입력되지 않았습니다.");
			return f.address.focus();
		}
		if(f.grade.value==""){
			alert("회원등급이 입력되지 않았습니다.");
			return f.grade.focus();
		}
		if(f.city.value==""){
			alert("회원코드가 입력되지 않았습니다.");
			return f.city.focus();
		}
		f.submit();
	}
</script>
<body>
	<%@ include file="header.jsp" %>
	<%
		sql="select nvl(max(custno),100000)+1 custno, to_char(sysdate,'yyyymmdd') joindate from member_tbl_02";
		rs = stmt.executeQuery(sql);
		rs.next();
	%>
	<section>
		<div>
			<h2>홈쇼핑 회원 등록</h2>
		</div>
		<form action="insertpro.jsp" method="post" name="f">
			<table style="margin: 0 auto;" border="1" width="500">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" value="<%=rs.getString("custno") %>" size="15" maxlength="6" readonly></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" size="15" maxlength="20"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" size="20" maxlength="13"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" size="30" maxlength="60"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" value="<%=rs.getString("joindate") %>" size="15" readonly></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<td><input type="text" name="grade" size="15" maxlength="1"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" size="15" maxlength="2"></td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="등록" onclick="check(); return false">&nbsp;
						<input type="button" value="조회" onclick="location='select.jsp'">
					</th>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>