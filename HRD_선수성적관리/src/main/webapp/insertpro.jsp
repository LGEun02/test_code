<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp" %>
<%
	try{
		sql="insert into player_tbl_09 values(?,?,?,?,?,?,?)";
		ps=con.prepareStatement(sql);
		ps.setString(1, request.getParameter("player_no"));
		ps.setString(2, request.getParameter("player_name"));
		ps.setString(3, request.getParameter("team_no"));
		ps.setString(4, request.getParameter("player_phone"));
		ps.setString(5, request.getParameter("player_birth"));
		ps.setString(6, request.getParameter("player_email"));
		ps.setString(7, request.getParameter("back_no"));
		ps.executeUpdate();
%>
	<script>
		alert("선수정보등록이 완료 되었습니다.");
		location="insert.jsp";
	</script>
<%
	}catch(Exception e){
%>
	<script>
		alert("선수정보등록이 완료 되지않았습니다.");
		history.back();
	</script>
<%
	}finally{
		try{
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(stmt != null) stmt.close();
			if(con != null) con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

%>