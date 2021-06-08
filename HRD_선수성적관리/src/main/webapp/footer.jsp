<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
</head>
<body>
	<footer>
		HRDKOREA Copyright &copy; 2016 All right reserved. Human resources Development Service of Korea. 
	</footer>
</body>
</html>
<%
	try{
		if(rs != null) rs.close();
		if(ps != null) ps.close();
		if(stmt != null) stmt.close();
		if(con != null) con.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>